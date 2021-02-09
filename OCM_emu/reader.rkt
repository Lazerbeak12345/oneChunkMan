#lang racket/base
(require racket/contract "tokenizer.rkt" "parser.rkt")
(define/contract (read-syntax path port)
                 (-> string? input-port? syntax?)
  #`(module ocm-asm-module OCM_emu/expander
            #,(parse path (make-tokenizer port))))
(provide read-syntax)
