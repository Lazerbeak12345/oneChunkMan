#lang racket
(require syntax/parse/define "encodings.rkt" "runtime.rkt")
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
(provide ocm-asm-ref (rename-out [ocm-asm-mb #%module-begin]))
(define (should-use-ita?)
  ((BITTAGE) . < . 7)) 
(define-syntax-parser
  ocm-asm-str
  [(_ data:string)
   #`(ann (thunk
            (if (should-use-ita?)
                (encode-ITA_2 data)
                (list #,@(for/list ([char (string->list (syntax-e #'data))])
                                   #`(char->integer #,char)))))
          OCM-Val)])
(provide ocm-asm-str)
(define/contract (clean-rows rows) ((listof (or/c #f pair?))
                                    . -> . list?)
  (define theRows (filter pair? rows))
  (define iteration-count -1)
  ; Add all labels to the hash
  (for {[a-row theRows]}
       (set! iteration-count (iteration-count . + . 1))
       ((car a-row) iteration-count))
  (define theItems
    (apply append (map (compose1 (curryr apply '()) cdr) theRows)))
  (define len (length theItems))
  (define max-int ((MAX_INT)))
  (set! iteration-count -1)
  (if (len . > . ((RAM_SIZE)))
    (raise-user-error
      (format "The provided program is too long max ~a was" max-int)
      len)
    (for/list {[item theItems]}
              (set! iteration-count (iteration-count . + . 1))
              ; Second pass - resolve the labels
              (when (item . > . max-int)
                (raise-user-error (format
                                    "The item at ~a in memory is too large"
                                    iteration-count)
                                  item))
              item)))
(define (ocm-asm-main-run commandName args actualItems)
     (define new-bittage (BITTAGE))
     (define new-dbg-port (debugger-port))
     (command-line
       #:program commandName
       #:argv args
       #:once-each
       [("-B" "--bittage") => (lambda (flag arg)
                                (set! new-bittage (string->number arg)))
                           '("Set the bittage of the emulator"
                             "the bittage")]
       [("-v" "--verbose")
        "Send debug output to stderr"
        (set! new-dbg-port (current-error-port))])
     (parameterize ([BITTAGE new-bittage]
                    [debugger-port new-dbg-port])
       (run-ocm-asm #:numbers (list->vector (actualItems)))
       ; Prevents printing when we don't need to
       (void)))
(define (ocm-asm-main-memorydump commandName args actualItems)
     (define big-endian #f)
     (define decimal #f)
     (define new-bittage (BITTAGE))
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
       [("-B" "--bittage") => (lambda (flag arg)
                                (set! new-bittage (string->number arg)))
                           '("Set the bittage of the memory dumper"
                             "the bittage")])
     ; Read this from bottom to top
     ((compose1 displayln
                (curryr string-join "\n")
                (curry map
                       (if decimal
                         ~a
                         (compose1 (if big-endian
                                     (compose1 list->string
                                               reverse
                                               string->list)
                                     identity)
                                   (curryr ~a
                                           #:min-width new-bittage
                                           #:align 'right
                                           #:left-pad-string "0")
                                   (curry format "~b")))))
      (parameterize ([BITTAGE new-bittage])
        (actualItems))))
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
