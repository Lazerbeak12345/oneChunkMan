#lang racket
(require syntax/parse/define)
(provide ocm-asm
         ocm-asm-dta
         ocm-asm-inst
         ocm-asm-str
         (rename-out [ocm-asm-mb #%module-begin]))
(define-simple-macro (ocm-asm-dta num:nat pound dta:nat nl)
                     (list (cons num dta)))
(define-simple-macro (ocm-asm-inst num:nat colon inst:id nl)
                     ; inst is a reference to a number
                     (list (cons num inst)))
(define-simple-macro (ocm-asm-mb parse-tree:expr)
                     (#%module-begin parse-tree))
(define-syntax-parser
  ocm-asm-str
  [(ocm-asm-str num:nat data:string nl)
   #:fail-unless (= 1 (string-length (syntax-e #'data)))
   "string length is not one in implicit char"
   #`(list (cons num
                 #,(char->integer
                     (string-ref (syntax-e #'data) 0))))]
  [(ocm-asm-str start:nat range end:exact-positive-integer data:string nl)
   #:fail-unless (= ((syntax-e #'end) . - . (syntax-e #'start))
                    (string-length (syntax-e #'data)))
   "string ends are invalid"
   #`(list #,@(for/list ([num (in-range (syntax-e #'start)
                                        (syntax-e #'end))])
                        #`(cons #,num #,(char->integer
                                          (string-ref
                                            (syntax-e #'data)
                                            num)))))])
#|(define-for-syntax (num->instruction num)
                   (case num [else (lambda () #f)]))|#
(define-simple-macro
  (ocm-asm items:expr ...)
  (let loop
    ([numbers (map cdr (apply append (for/list ([item (list items ...)]
                                                #:when (list? item))
                                               item)))]
     [pgm-counter 0]
     [reg-A 0]
     [reg-B 0]
     [direction #t]
     [overflow #f])
    ((num->instruction (list-ref numbers pgm-counter))
     ; read-only args
     numbers pgm-counter reg-A reg-B direction overflow
     ; Loopback arg
     loop)))
