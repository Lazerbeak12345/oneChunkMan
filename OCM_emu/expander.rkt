#lang debug racket
; use #R for #lang debug
(require syntax/parse/define
         (only-in "runtime.rkt"
                  ocm-asm-main-memorydump
                  ocm-asm-main-run
                  BITTAGE
                  RAM_SIZE
                  MAX_INT
                  should-use-ita?)
         (for-syntax qi
                     (only-in "runtime.rkt" symbol->num)
                     (only-in "encodings.rkt" encode-ITA_2)
                     #;(only-in debug/repl debug-repl)))
(module+ test
  (require rackunit))
(provide #%datum)
(provide ocm-asm-row)
(define-syntax-parse-rule (ocm-asm-dta pound dta:nat)
  (thunk (list (thunk dta))))
(provide ocm-asm-dta)
(define-for-syntax (ocm-asm-inst-fun inst)
  (with-syntax
      ([num
        (~>> (inst) syntax->datum symbol->string string->symbol symbol->num (datum->syntax inst))])
    #'(ocm-asm-dta #f num)))
(define-syntax (ocm-asm-inst stx)
  (syntax-case stx ()
    [[_ colon inst] (ocm-asm-inst-fun #'inst)]))
(provide ocm-asm-inst)
(define-syntax-parse-rule (ocm-asm-mb parse-tree:expr)
  (#%module-begin parse-tree))
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define labels (make-parameter (make-hash)))
(define-syntax-parse-rule (ocm-asm-ref percent name:id)
  (thunk (list (thunk (hash-ref (labels) 'name)))))
(provide ocm-asm-ref)
(define-syntax-parse-rule (ocm-asm-label atsign name:id nl ...)
  (lambda (line-no) (hash-set! (labels) 'name line-no)))
(provide ocm-asm-label)
(define-for-syntax (wrap-list-in-thunks l)
  (for/list ([num l])
    #`(thunk #,num)))
(define-syntax (ocm-asm-str stx)
  (syntax-case stx ()
    [(_ data)
     (with-syntax
         ([ITA_2-encoding
           (~>> (#'data) syntax->datum encode-ITA_2 wrap-list-in-thunks (datum->syntax #'data))]
          [UTF8?-encoding (~>> (#'data)
                               syntax->datum
                               string->list
                               sep
                               (>< char->integer)
                               collect
                               wrap-list-in-thunks
                               (datum->syntax #'data))])
       #'(thunk (if (should-use-ita?) (list . ITA_2-encoding) (list . UTF8?-encoding))))]))
(provide ocm-asm-str)
;(define-type Unclean-Rows (Listof Unclean-Row))
(define-syntax-parse-rule (ocm-asm-row label-list:expr ... data:expr)
  (ocm-asm-row-helper (list label-list ...) data))
#;(define-type Unclean-Row
               (-> (U (Exact-Nonnegative-Integer -> (-> Exact-Nonnegative-Integer)) Void)))
; - First call each row. -- Calling `data` here
; - Then call the lambdas for each rows
; - Then call the lambda for each word in memory
(define (ocm-asm-row-helper label-list data)
  (define remaining-data (void))
  ; Call to get next lambda, or void
  (thunk (if (null? remaining-data)
             (void)
             (let ([first (void? remaining-data)])
               (when first
                 (set! remaining-data (data)))
               ; We have to cast it after setting it for the first time
               (define old-car (car remaining-data))
               (set! remaining-data (cdr remaining-data))
               ; Call to get value
               (lambda (location)
                 (when first
                   (for ([label label-list])
                     (label location)))
                 old-car)))))
; TODO this code sucks. Figure out how it works and recreate it using only
; macros. Real macros. No thunks.
(define (call-the-rows-or-smth-idk-i-didnt-document-this-code rows)
  (define (next-row row return-val)
    (define row-result (row))
    (if (void? row-result) return-val (next-row row (cons row-result return-val))))
  (define memory-chunks
    (for/list ([row rows])
      (reverse (next-row row '()))))
  ; Each contains multiple words of memory, each word bundled within a thunk.
  (apply append memory-chunks))
;(: clean-rows : Unclean-Rows -> (Listof Exact-Nonnegative-Integer))
(define (clean-rows rows)
  ;Iterate over `rows` and append the results
  (define theItems (call-the-rows-or-smth-idk-i-didnt-document-this-code rows))
  (define len (length theItems))
  (let ([ram-size ((RAM_SIZE))])
    (when (len . > . ram-size)
      (raise-user-error
       (format "Max program length is ~a. The provided program is too long. was" ram-size)
       len)))
  (define max-int ((MAX_INT)))
  (define range-len (range len))
  (for/list ([item-func (for/list ([item theItems] [index range-len])
                          ; Iterate over results and call each item with the
                          ;   current memory value.
                          ; We pass the iteration-count so it can use references
                          (item index))]
             [index range-len])
    ; Get the values last so references work correctly
    (define number (item-func))
    (when (number . > . max-int)
      (raise-user-error (format "The item at ~a in memory is too large" index) number))
    number))
(define-for-syntax (resolve-row-data-funs data)
  (syntax-case data (ocm-asm-inst)
    [(ocm-asm-inst colon inst) (ocm-asm-inst-fun #'inst)]
    [else #'else]))
; 1. Evaluate all expandables (strings, others)
; 2. Evaluate all labels values
; 3. Evaluate all reference values
(define-for-syntax (resolve-row-data rows)
  (map (lambda (row)
         (syntax-case row ()
           [(ocm-asm-row labels ... data _)
            #`(ocm-asm-row labels ... #,(resolve-row-data-funs #'data))]))
       rows))
; Remove all #f from the list of rows.
(define-for-syntax clean-rows-remove-comments
                   (flow (~> sep
                             (pass (~> syntax->datum
                                       (not (equal? #f))))
                             collect)))
(define-syntax (better-clean-rows syntax-object) ; Did you know that you have rows?
  (syntax-case syntax-object ()
    [(_ unicode a ...)
     #`(list #,@(let ([rows #'(a ...)])
                  (~>> (rows)
                       syntax->list
                       clean-rows-remove-comments
                       resolve-row-data
                       ; Needs the original context when going back to syntax.
                       (datum->syntax rows))))]))
(module+ test
  (test-equal? "Test ocm-asm-inst"
               (for/list ([item ((ocm-asm-inst #f NEXT))])
                 (item))
               '(3))
  #;(: apply-over-list : (All (A) (Listof (-> A)) -> (Listof A)))
  (define (apply-over-list items)
    (for/list ([item items])
      (item)))
  (test-exn "Test ocm-asm-ref fail"
            exn:fail:contract?
            (parameterize ([labels (make-hash)])
              (let ([items ((ocm-asm-ref #f after-string))]) (thunk (apply-over-list items)))))
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
               (check-equal? ((ocm-asm-label #f begin-string) 3) (void) "return value")
               (check-equal? (labels) (make-hash '((begin-string . 3))) "modified hash")))
  (test-equal? "Test ocm-asm-str bittage 6"
               (parameterize ([BITTAGE 6]) (apply-over-list ((ocm-asm-str "ASDF"))))
               '(31 3 5 9 13))
  (test-equal? "Test ocm-asm-str bittage 8"
               (parameterize ([BITTAGE 8]) (apply-over-list ((ocm-asm-str "ASDF"))))
               '(65 83 68 70))
  #;(: wrap-nums : (Listof Exact-Nonnegative-Integer) -> (-> (Listof (-> Exact-Nonnegative-Integer))))
  (define ((wrap-nums nums))
    (for/list ([num nums])
      (thunk num)))
  (test-equal?
   "Test ocm-asm-row"
   (let ([get-item (ocm-asm-row (lambda _ (void)) (lambda _ (void)) (wrap-nums '(31 3 5 9 13)))])
     (apply-over-list
      (reverse
       (let loop ([item (get-item)] [index 0] [items '()])
         (if (void? item) items (loop (get-item) (index . + . 1) (cons (item index) items)))))))
   '(31 3 5 9 13))
  (test-case
   "Test ocm-asm-row on real data"
   (parameterize ([BITTAGE 8] [labels (make-hash)])
     (check-equal?
      (let ([get-item
             (ocm-asm-row (ocm-asm-label #f hi) (ocm-asm-label #f lol) (ocm-asm-str "ASDF"))])
        (apply-over-list
         (reverse
          (let loop ([item (get-item)] [index 0] [items '()])
            (if (void? item) items (loop (get-item) (index . + . 1) (cons (item index) items)))))))
      '(65 83 68 70)
      "return")
     (check-equal? (labels) (make-hash '((hi . 0) (lol . 0))) "labels")))
  (test-equal?
   "Test clean-rows execution order"
   (let ([order '()])
     (parameterize ([BITTAGE 6])
       ; - First call each row.
       ; - Then call the lambdas for each rows
       ; - Then call the lambda for
       ; each word in memory
       (clean-rows (list (ocm-asm-row (thunk (set! order (append order '(0)))
                                             (list (thunk (set! order (append order '(7))) 50)
                                                   (thunk (set! order (append order '(8))) 33))))
                         (ocm-asm-row (thunk (set! order (append order '(1)))
                                             (list (thunk (set! order (append order '(9))) 30)
                                                   (thunk (set! order (append order '(10))) 32))))
                         (ocm-asm-row (lambda _ (set! order (append order '(4))))
                                      (thunk (set! order (append order '(2)))
                                             (list (thunk (set! order (append order '(11))) 31)
                                                   (thunk (set! order (append order '(12))) 21))))
                         (ocm-asm-row (lambda _ (set! order (append order '(5))))
                                      (lambda _ (set! order (append order '(6))))
                                      (thunk (set! order (append order '(3)))
                                             (list (thunk (set! order (append order '(13))) 33)
                                                   (thunk (set! order (append order '(14))) 32)))))))
     order)
   (range 15))
  (test-case
   "Test clean-rows"
   (parameterize ([labels (make-hash)] [BITTAGE 6])
     (check-equal?
      (clean-rows (list (ocm-asm-row (ocm-asm-inst #f NEXT))
                        (ocm-asm-row (ocm-asm-ref #f after-string))
                        (ocm-asm-row (ocm-asm-label #f begin-string) (ocm-asm-str "ASDF"))
                        (ocm-asm-row (ocm-asm-label #f after-string) (ocm-asm-inst #f SWAP))))
      '(3 7 31 3 5 9 13 2)
      "return")
     (check-equal? (labels) (make-hash '((after-string . 7) (begin-string . 2))) "labels"))))
;(: ocm-asm-main : Unclean-Rows -> Void)
(define (ocm-asm-main unicode-items ita2-items)
  (define pre-args
    (let ([a (current-command-line-arguments)]) (if ((vector-length a) . = . 0) '#("help") a)))
  (define command (vector-ref pre-args 0))
  (define args (vector-drop pre-args 1))
  (define unicode-actualItems (thunk (clean-rows unicode-items)))
  (define ita2-actualItems (thunk (clean-rows ita2-items)))
  (define commandName (string-append (path->string (find-system-path 'run-file)) " " command))
  (case command
    [("run" "r") (ocm-asm-main-run commandName args unicode-actualItems ita2-actualItems)]
    [("memorydump" "dump" "md" "d")
     (ocm-asm-main-memorydump commandName args unicode-actualItems ita2-actualItems)]
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
    [else (raise-user-error (format "`~a` is an invalid command. try `help`" command))]))
(define-syntax (ocm-asm syntax-object)
  (syntax-case syntax-object ()
    [(_ items ...)
     #'(ocm-asm-main (better-clean-rows #t items ...) (better-clean-rows #f items ...))]))
(provide ocm-asm)
