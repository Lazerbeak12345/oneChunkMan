#lang racket/base
; NOTE because of parse this will be very hard to write as typed/racket
(require racket/contract
         syntax/strip-context
         "tokenizer.rkt"
         "parser.rkt")
(define/contract (read-syntax path port)
                 (-> any/c #|(or/c path-string? path?)|# input-port? syntax?)
                 (strip-context (with-syntax ([PT (parse path (make-tokenizer port))])
                                  #'(module ocm-asm-module OCM_emu/expander
                                      PT))))
(provide read-syntax)
