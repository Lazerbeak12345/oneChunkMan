#lang typed/racket
(require syntax/parse/define "encodings.rkt" "runtime.rkt")
;(module+ test (require typed/rackunit))
(provide #%datum)
(define-simple-macro (ocm-asm-row label-list:expr ... data:expr nl)
                     (cons (lambda (line-no)
                             (map (curryr apply (list line-no))
                                  (list label-list ...)))
                           data))
(provide ocm-asm-row)
(define-simple-macro (ocm-asm-dta pound dta:nat)
                     (thunk (list dta)))
(provide ocm-asm-dta)
(define-simple-macro (ocm-asm-inst colon inst:id)
                     ; inst is a reference to a number
                     (thunk (list (symbol->num (quote inst)))))
(provide ocm-asm-inst)
(define-simple-macro (ocm-asm-mb parse-tree:expr)
                     (#%module-begin parse-tree))
(define labels (make-hash))
(define-simple-macro (ocm-asm-ref percent name:id)
                     ; Can throw error. User needs to see it.
                     (thunk (list (hash-ref labels (quote name)))))
(provide ocm-asm-ref)
(define-simple-macro (ocm-asm-label atsign name:id nl ...)
                     (lambda (line-no)
                             (hash-set! labels (quote name) line-no)))
(provide ocm-asm-label)
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define (should-use-ita?)
  ((BITTAGE) . < . 7)) 
(define-syntax-parser
  ocm-asm-str
  [(_ data:string)
   #`(thunk (if (should-use-ita?)
                (encode-ITA_2 data)
                (list #,@(for/list ([char (string->list (syntax-e #'data))])
                                   #`(char->integer #,char)))))])
(provide ocm-asm-str)
(: clean-rows :
   (Listof (U #f (Pairof (Exact-Nonnegative-Integer -> (Listof Void))
                         (-> (Listof Exact-Nonnegative-Integer)))))
   -> (Listof Exact-Nonnegative-Integer))
(define (clean-rows rows) 
  (define theRows :
    (Listof (Pairof (Exact-Nonnegative-Integer -> (Listof Void))
                    (-> (Listof Exact-Nonnegative-Integer))))
    ;(filter pair? rows)
    (for/list ([row rows]
               #:when (pair? row))
              row))
  (define iteration-count -1)
  ; Add all labels to the hash
  (for {[a-row theRows]}
       (set! iteration-count (iteration-count . + . 1))
       ((car a-row) (cast iteration-count Exact-Nonnegative-Integer)))
  (define theItems : (Listof Exact-Nonnegative-Integer)
    ;(apply append (map (compose1 (curryr apply '()) cdr) theRows))
    (apply append
           (map #|(compose1
                  (curryr apply '())
                  cdr)|#
                (lambda
                  ([row : (Pairof Any
                                  (-> (Listof Exact-Nonnegative-Integer)))])
                  ((cdr row)))
                theRows)))
  (define len (length theItems))
  (define max-int ((MAX_INT)))
  (set! iteration-count -1)
  (if (len . > . ((RAM_SIZE)))
    (raise-user-error
      (format "The provided program is too long max ~a was" max-int)
      len)
    (for/list {[item : Exact-Nonnegative-Integer theItems]}
              (set! iteration-count (iteration-count . + . 1))
              ; Second pass - resolve the labels
              (when (item . > . max-int)
                (raise-user-error (format
                                    "The item at ~a in memory is too large"
                                    iteration-count)
                                  item))
              item)))
#|(module+ test
         (test-equal? "Test pointer after string"
                      (clean-rows (ocm-asm-row (ocm-asm-inst #f NEXT)
                                            #f)
                               (ocm-asm-row (ocm-asm-ref #f after-string)
                                            #f)
                               (osm-asm-row (osm-asm-label #f begin-string)
                                            (osm-asm-str "ASDF")
                                            #f)
                               (osm-asm-row (osm-asm-label #f after-string)
                                            (osm-asm-inst #f SWAP)
                                            #f))
                   '()))|#
(: ocm-asm-main-run :
   String
   (Mutable-Vectorof String)
   (-> (Listof Exact-Nonnegative-Integer))
   -> Void)
(define (ocm-asm-main-run commandName args actualItems)
     (define new-bittage : Exact-Nonnegative-Integer (BITTAGE))
     (define new-dbg-port (debugger-port))
     (command-line
       #:program commandName
       #:argv args
       #:once-each
       [("-B" "--bittage")
        => (lambda (flag arg)
             (set! new-bittage
               (cast (string->number (cast arg String))
                     Exact-Nonnegative-Integer)))
        '("Set the bittage of the emulator" "the bittage")]
       [("-v" "--verbose")
        "Send debug output to stderr"
        (set! new-dbg-port (current-error-port))])
     (parameterize ([BITTAGE new-bittage]
                    [debugger-port new-dbg-port])
       (run-ocm-asm #:numbers
                    (cast (list->vector (actualItems))
                          (Mutable-Vectorof Exact-Nonnegative-Integer))))
     ; Prevents printing when we don't need to
     (void))
(: ocm-asm-main-memorydump :
   String
   (Mutable-Vectorof String)
   (-> (Listof Exact-Nonnegative-Integer))
   -> Void)
(define (ocm-asm-main-memorydump commandName args actualItems)
     (define big-endian : Boolean #f)
     (define decimal : Boolean #f)
     (define new-bittage : Exact-Nonnegative-Integer (BITTAGE))
     (command-line
       #:program commandName
       #:argv args
       #:once-each
       [("-d" "--decimal")
        "Print decimal numbers instead of binary numbers. Ignores flags relating to binary"
        (set! decimal #t)]
       [("-b" "--big-endian")
        "Display in big endian form instead of little endian"
        (set! big-endian #t)]
       [("-B" "--bittage")
        => (lambda (flag arg)
             (set! new-bittage
               (cast (string->number (cast arg String))
                     Exact-Nonnegative-Integer)))
        '("Set the bittage of the memory dumper"
          "the bittage")])
     (define numbers : (Listof Exact-Nonnegative-Integer)
       (parameterize ([BITTAGE new-bittage])
         (actualItems)))
     (displayln
       (string-join
         (if decimal
           (map ~a numbers)
           (for/list : (Listof String)
                     ([number numbers])
                     (define binary
                       (~a (format "~b" number)
                           #:min-width new-bittage
                           #:align 'right
                           #:left-pad-string "0"))
                     (if big-endian
                       (list->string
                         (reverse (string->list binary)))
                       binary)))
         "\n")))
(: ocm-asm-main :
   (Listof (U #f (Pairof (Exact-Nonnegative-Integer -> (Listof Void))
                         (-> (Listof Exact-Nonnegative-Integer)))))
   -> Void)
(define (ocm-asm-main items)
  (define pre-args (let ([a (current-command-line-arguments)])
                     (if ((vector-length a) . = . 0)
                       '#("help")
                       a)))
  (define command (vector-ref pre-args 0))
  (define args (vector-drop pre-args 1))
  (define actualItems (thunk (clean-rows items)))
  (define commandName (string-append
                        (path->string (find-system-path 'run-file))
                        " "
                        command))
  (case command
    [("run" "r") (ocm-asm-main-run commandName args actualItems)]
    [("memorydump" "dump" "md" "d")
     (ocm-asm-main-memorydump commandName args actualItems)]
    [("help" "h" "?" "-h" "--help")
     ; TODO make this work
     (displayln (string-append "Try running the `run` or `memorydump`"
                               " subcommands.\n"
                               "Each of them also support the"
                               " `-h` flag for help\n"
                               "Lastly, the aliases are as folows.\n"
                               " help\n"
                               "\th\n"
                               "\t?\n"
                               "\t-h\n"
                               "\t--help\n"
                               " memorydump\n"
                               "\tdump\n"
                               "\tmd\n"
                               "\td\n"
                               " run\n"
                               "\tr\n"))]
    [else (raise-user-error (format "`~a` is an invalid command. try `help`"
                                    command))]))
(define-simple-macro (ocm-asm items:expr ...)
                     (ocm-asm-main (list items ...)))
(provide ocm-asm)
; TODO unit test this all
