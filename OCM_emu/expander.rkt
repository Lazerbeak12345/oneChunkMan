#lang racket
(require ;(for-syntax syntax/parse)
         syntax/parse/define)
(provide ;ocm-asm
         ocm-asm-inst
         ocm-asm-dta
         ocm-asm-str
         ;(rename-out [ocm-asm-mb #%module-begin])
         )
(define-simple-macro (ocm-asm-dta num:nat pound:boolean dta:nat nl:boolean)
                     (list (cons num dta)))
(define-simple-macro (ocm-asm-inst num:nat colon:boolean inst:id nl:boolean)
                     (list (cons num (inst->num inst))))
#|(define-syntax-parser fn3
    [(fn3 x:id rhs:expr)
     #'(list )]
    [(fn3 x:id y:id rhs:expr)
     #'(lambda (x y) rhs)])|#
#|(define-syntax-parser
  ocm-asm-str
  [(ocm-asm-str num:nat data:str nl:boolean)
   #:fail-unless (= 1 (string-length (syntax-e data)))
   #`(list (cons num #,(char->integer (string-ref (syntax-e #'data) 0))))]
  [(ocm-asm-str start:nat sep:boolean end:nat data:str nl:boolean)
   ;#:fail-unless (= ((syntax-e end) . - . (syntax-e start))
   ;                 (string-length (syntax-e data)))
   #`(list #,@(for/list ([num (in-range (syntax-e #'start) (syntax-e #'end))])
                        #`(cons #,num #,(char->integer
                                          (string-ref (syntax-e #'data)
                                                      num)))))])|#
(define-syntax (ocm-asm-str syntax-object)
  (syntax-case syntax-object ()
               [(_ num data nl)
                #`(list (cons num
                              #,(char->integer
                                  (string-ref (syntax-e #'data) 0))))]
               [(_ num data nl)
                #`(list #,@(for/list ([num (in-range (syntax-e #'start)
                                                     (syntax-e #'end))])
                                     #`(cons #,num #,(char->integer
                                                       (string-ref
                                                         (syntax-e #'data)
                                                         num)))))]))

#|(define-macro (jsonic-mb PARSE-TREE)
  #'(#%module-begin
     (define result-string PARSE-TREE)
     (define validated-jsexpr (string->jsexpr result-string))
     (display result-string)))
(define-macro (jsonic-char CHAR-TOK-VALUE)
  #'CHAR-TOK-VALUE)
(define-macro (jsonic-program SEXP-OR-JSON-STR ...)
  #'(string-trim (string-append SEXP-OR-JSON-STR ...)))
(define-macro (jsonic-sexp SEXP-STR)
  (with-pattern ([SEXP-DATUM (format-datum '~a #'SEXP-STR)])
    #'(jsexpr->string SEXP-DATUM)))|#
