#lang racket
(require syntax/parse/define "runtime.rkt")
(provide #%datum)
(define-simple-macro (ocm-asm-dta num:nat pound dta:nat nl)
                     (list (cons num dta)))
(provide ocm-asm-dta)
(define-simple-macro (ocm-asm-inst num:nat colon inst:id nl)
                     ; inst is a reference to a number
                     (list (cons num (symbol->num (quote inst)))))
(provide ocm-asm-inst)
(define-simple-macro (ocm-asm-mb parse-tree:expr)
                     (#%module-begin parse-tree))
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define-syntax-parser
  ocm-asm-str
  [(_ num:nat data:string nl)
   #:fail-unless (= 1 (string-length (syntax-e #'data)))
   "string length is not one in implicit char"
   #`(list (cons num
                 #,(char->integer
                     (string-ref (syntax-e #'data) 0))))]
  [(_ start:nat range end:exact-positive-integer data:string nl)
   #:fail-unless (= ((syntax-e #'end)
                     . - .
                     (syntax-e #'start))
                    (string-length (syntax-e #'data)))
   "string ends are invalid"
   #`(list #,@(for/list ([num (in-range 0 ((syntax-e #'end)
                                           . - .
                                           (syntax-e #'start)))])
                        #`(cons #,num #,(char->integer
                                          (string-ref
                                            (syntax-e #'data)
                                            num)))))])
(provide ocm-asm-str)
(define-simple-macro
  (ocm-asm items:expr ...)
  (run-ocm-asm #:numbers (map cdr (apply append
                                         (for/list ([item (list items ...)]
                                                    #:when (list? item))
                                                   item)))))
(provide ocm-asm)

