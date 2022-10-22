#lang racket
(require syntax/parse/define "encodings.rkt" "runtime.rkt")
(module+ test (require rackunit))
(provide #%datum)
(define-syntax-parse-rule (ocm-asm-row label-list:expr ... data:expr nl)
                          (ocm-asm-row-helper (list label-list ...)
                                              data))
#;(define-type Unclean-Row (-> (U (Exact-Nonnegative-Integer
                                  -> (-> Exact-Nonnegative-Integer))
                                Void)))
#;(: ocm-asm-row-helper
   : (Listof (Exact-Nonnegative-Integer -> Void))
   (-> (Listof (-> Exact-Nonnegative-Integer)))
   -> Unclean-Row)
(define (ocm-asm-row-helper label-list data)
  (define remaining-data ;: (U Void (Listof (-> Exact-Nonnegative-Integer)))
    (void))
  ; Call to get next lambda, or void
  (thunk (if (null? remaining-data)
           (void)
           (let ([first (void? remaining-data)])
             (when first (set! remaining-data (data)))
             ; We have to cast it after setting it for the first time
             (define old-car (car remaining-data))
             (set! remaining-data (cdr remaining-data))
             ; Call to get value
             (lambda (location)
               (when first
                 (for ([label label-list])
                      (label location)))
               old-car)))))
(provide ocm-asm-row)
(define-syntax-parse-rule (ocm-asm-dta pound dta:nat)
                          (thunk (list (thunk dta))))
(provide ocm-asm-dta)
(define-syntax-parse-rule (ocm-asm-inst colon inst:id)
                          ; inst is a reference to a number
                          (osm-asm-inst-func (quote inst)))
;(: osm-asm-inst-func : Symbol -> (-> (Listof (-> Exact-Nonnegative-Integer))))
(define ((osm-asm-inst-func inst))
  (list (thunk (symbol->num inst))))
(provide ocm-asm-inst)
(define-syntax-parse-rule (ocm-asm-mb parse-tree:expr)
                          (#%module-begin parse-tree))
(define labels
  ; TODO : (Parameterof (Mutable-HashTable Symbol Exact-Nonnegative-Integer))
  (make-parameter (make-hash)))
(define-syntax-parse-rule (ocm-asm-ref percent name:id)
                          (ocm-asm-ref-func (quote name)))
; Can throw error. User needs to see it.
;(: ocm-asm-ref-func : Symbol -> (-> (Listof (-> Exact-Nonnegative-Integer))))
(define ((ocm-asm-ref-func name))
  (list (thunk (hash-ref (labels) name))))
(provide ocm-asm-ref)
(define-syntax-parse-rule (ocm-asm-label atsign name:id nl ...)
                          (lambda (line-no)
                            (hash-set! (labels) 'name line-no)))
(provide ocm-asm-label)
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define (should-use-ita?)
  ((BITTAGE) . < . 7)) 
;(: ocm-asm-str : String -> (-> (Listof (-> Exact-Nonnegative-Integer))))
(define ((ocm-asm-str data))
    (for/list ([num (if (should-use-ita?)
                      (encode-ITA_2 data)
                      (map char->integer (string->list data)))])
              (thunk num)))
(provide ocm-asm-str)
;(define-type Unclean-Rows (Listof Unclean-Row))
;(: clean-rows : Unclean-Rows -> (Listof Exact-Nonnegative-Integer))
(define (clean-rows rows)
  ;Iterate over `rows` and append the results
  (define theItems
    (apply append
           (for/list ([row rows])
                     ; We don't know how long each row is.
                     ; For that matter, I have no idea what this code does
                     ; anymore. Why? Just Why?
                     (reverse (let next-row ([return-val '()])
                                (if row
                                  (let ([row-result (row)])
                                    (if (void? row-result)
                                      return-val
                                      (next-row (cons row-result return-val))))
                                  return-val))))))
  (define len (length theItems))
  (let ([ram-size ((RAM_SIZE))])
    (when (len . > . ram-size)
      (raise-user-error
        (format "The provided program is too long max ~a was" ram-size)
        len)))
  (define max-int ((MAX_INT)))
  (define range-len (range len))
  (for/list ([item-func
               (for/list ([item theItems]
                          [index range-len])
                         ; Iterate over results and call each item with the
                         ;   current memory value.
                         ; We pass the iteration-count so it can use references
                         (item index))]
             [index range-len])
            ; Get the values last so references work correctly
            (define number (item-func))
            (when (number . > . max-int)
              (raise-user-error
                (format "The item at ~a in memory is too large"
                        index)
                number))
            number))
(module+ test
         (test-equal? "Test ocm-asm-inst"
                      (for/list ([item ((ocm-asm-inst #f NEXT))])
                                (item))
                      '(3))
         #;(: apply-over-list : (All (A)
                                   (Listof (-> A))
                                   ->
                                   (Listof A)))
         (define (apply-over-list items)
           (for/list ([item items])
                     (item)))
         (test-exn "Test ocm-asm-ref fail"
                   exn:fail:contract?
                   (parameterize ([labels (make-hash)])
                     (let ([items ((ocm-asm-ref #f after-string))])
                       (thunk (apply-over-list items)))))
         (test-equal? "Test ocm-asm-ref pass"
                      (parameterize ([labels (make-hash '((after-string . 9)))])
                        (apply-over-list ((ocm-asm-ref #f after-string))))
                      '(9))
         (test-equal? "Test ocm-asm-ref pass out-of-order"
                      (parameterize ([labels (make-hash)])
                        (define ref (ocm-asm-ref #f after-string))
                        (hash-set! (labels) 'after-string 9)
                        (apply-over-list (ref)))
                      '(9))
         ; Is this actually something we want?
         #|(test-equal? "Test ocm-asm-ref pass out-of-order B"
                      (parameterize ([labels (make-hash)])
                        (for/list : (Listof Exact-Nonnegative-Integer)
                                  ([item ((ocm-asm-ref #f after-string))])
                                  (hash-set! (labels) 'after-string 9)
                                  (item)))
                      '(9))|#
         (test-case "Test ocm-asm-label"
                    (parameterize ([labels (make-hash)])
                      (check-equal? ((ocm-asm-label #f begin-string) 3)
                                    (void)
                                    "return value")
                      (check-equal? (labels)
                                    (make-hash '((begin-string . 3)))
                                    "modified hash")))
         (test-equal? "Test ocm-asm-str bittage 6"
                      (parameterize ([BITTAGE 6])
                        (apply-over-list ((ocm-asm-str "ASDF"))))
                      '(31 3 5 9 13))
         (test-equal? "Test ocm-asm-str bittage 8"
                      (parameterize ([BITTAGE 8])
                        (apply-over-list ((ocm-asm-str "ASDF"))))
                      '(65 83 68 70))
         #;(: wrap-nums : (Listof Exact-Nonnegative-Integer)
            -> (-> (Listof (-> Exact-Nonnegative-Integer))))
         (define ((wrap-nums nums))
           (for/list ([num nums])
                     (thunk num)))
         (test-equal?
           "Test ocm-asm-row"
           (let ([get-item (ocm-asm-row (lambda _ (void))
                                        (lambda _ (void))
                                        (wrap-nums '(31 3 5 9 13))
                                        #f)])
             (apply-over-list
               (reverse (let loop ([item (get-item)]
                           [index 0]
                           [items '()])
                          (if (void? item)
                            items
                            (loop (get-item)
                                  (index . + . 1)
                                  (cons (item index)
                                        items)))))))
           '(31 3 5 9 13))
         (test-case
           "Test ocm-asm-row on real data"
           (parameterize ([BITTAGE 8]
                          [labels (make-hash)])
             (check-equal?
               (let ([get-item (ocm-asm-row (ocm-asm-label #f hi)
                                            (ocm-asm-label #f lol)
                                            (ocm-asm-str "ASDF")
                                            #f)])
                 (apply-over-list
                   (reverse (let loop ([item (get-item)]
                                       [index 0]
                                       [items '()])
                              (if (void? item)
                                items
                                (loop (get-item)
                                      (index . + . 1)
                                      (cons (item index)
                                            items)))))))
               '(65 83 68 70)
                           "return")
             (check-equal? (labels) (make-hash '((hi . 0) (lol . 0))) "labels")))
         (test-equal?
           "Test clean-rows execution order"
           (let ([order '()])
             (parameterize ([BITTAGE 6])
               (clean-rows
                 (list (ocm-asm-row (thunk (set! order (append order '(0)))
                                           (list (thunk (set! order
                                                          (append order '(7)))
                                                        50)
                                                 (thunk (set! order
                                                          (append order '(8)))
                                                        33)))
                                    #f)
                       (ocm-asm-row (thunk (set! order (append order '(1)))
                                           (list (thunk (set! order
                                                          (append order '(9)))
                                                        30)
                                                 (thunk (set! order
                                                          (append order '(10)))
                                                        32)))
                                    #f)
                       (ocm-asm-row (lambda _ (set! order (append order '(4))))
                                    (thunk (set! order (append order '(2)))
                                           (list (thunk (set! order
                                                          (append order '(11)))
                                                        31)
                                                 (thunk (set! order
                                                          (append order '(12)))
                                                        21)))
                                    #f)
                       (ocm-asm-row (lambda _ (set! order (append order '(5))))
                                    (lambda _ (set! order (append order '(6))))
                                    (thunk (set! order (append order '(3)))
                                           (list (thunk (set! order
                                                          (append order '(13)))
                                                        33)
                                                 (thunk (set! order
                                                          (append order '(14)))
                                                        32)))
                                    #f))))
             order)
           (range 15))
         (test-case
           "Test clean-rows"
           (parameterize ([labels (make-hash)]
                          [BITTAGE 6])
             (check-equal?
               (clean-rows
                 (list (ocm-asm-row (ocm-asm-inst #f NEXT)
                                    #f)
                       (ocm-asm-row (ocm-asm-ref #f after-string) #f)
                       (ocm-asm-row (ocm-asm-label #f begin-string)
                                    (ocm-asm-str "ASDF")
                                    #f)
                       (ocm-asm-row (ocm-asm-label #f after-string)
                                    (ocm-asm-inst #f SWAP)
                                    #f)))
               '(3 7 31 3 5 9 13 2)
               "return")
             (check-equal? (labels)
                           (make-hash '((after-string . 7)
                                        (begin-string . 2)))
                           "labels"))))
(displayln (ocm-asm-row (ocm-asm-label #f hi)
                        (ocm-asm-label #f lol)
                        (ocm-asm-str "ASDF")
                        #f))
#;(: ocm-asm-main-run :
   String
   (Mutable-Vectorof String)
   (-> (Listof Exact-Nonnegative-Integer))
   -> Void)
(define (ocm-asm-main-run commandName args actualItems)
     (define new-bittage (BITTAGE))
     (define new-dbg-port (debugger-port))
     (command-line
       #:program commandName
       #:argv args
       #:once-each
       [("-B" "--bittage")
        => (lambda (flag arg)
             (set! new-bittage (string->number arg)))
        '("Set the bittage of the emulator" "the bittage")]
       [("-v" "--verbose")
        "Send debug output to stderr"
        (set! new-dbg-port (current-error-port))])
     (parameterize ([BITTAGE new-bittage]
                    [debugger-port new-dbg-port])
       (run-ocm-asm #:numbers (list->vector (actualItems))))
     ; Prevents printing when we don't need to
     (void))
#;(: ocm-asm-main-memorydump :
   String
   (Mutable-Vectorof String)
   (-> (Listof Exact-Nonnegative-Integer))
   -> Void)
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
       [("-B" "--bittage")
        => (lambda (flag arg)
             (set! new-bittage (string->number arg)))
        '("Set the bittage of the memory dumper"
          "the bittage")])
     (define numbers (parameterize ([BITTAGE new-bittage])
                       (actualItems)))
     (displayln
       (string-join
         (if decimal
           (map ~a numbers)
           (for/list ([number numbers])
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
;(: ocm-asm-main : Unclean-Rows -> Void)
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
(define-syntax-parse-rule (ocm-asm items:expr ...)
                          (ocm-asm-main (list items ...)))
(provide ocm-asm)
