#lang racket/base
(require racket/class
         racket/draw)
(define dump-memory
  ; TODO make this work
  (list "Dump memory" (make-object bitmap% 16 16) (lambda (drrwindow) (print "hi")) #f))
(provide buttons-ocm-asm)
(define buttons-ocm-asm
  (list
   #;dump-memory))
