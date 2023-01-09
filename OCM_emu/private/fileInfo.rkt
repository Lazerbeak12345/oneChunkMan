#lang racket/base
(provide arg-port
         arg-path)
(define args (vector->list (current-command-line-arguments)))
(define arg-path (car args))
(define arg-port (open-input-file arg-path))
