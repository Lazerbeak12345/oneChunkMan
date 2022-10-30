#!/usr/bin/env racket
#lang racket/base
(require "reader.rkt")
(module+ reader
         (provide read-syntax get-info)
         (define (get-info port mod line col pos)
           (lambda (key default)
             (case key
               [(color-lexer)
                (dynamic-require 'OCM_emu/colorer 'color-ocm-asm)]
               [(drracket:indentation)
                (dynamic-require 'OCM_emu/indenter 'indent-ocm-asm)]
               [(drracket:default-filters)
                '(["OCM assembly" "*.asm.rkt;*.rkt;*.asm"])]
               [(drracket:opt-out-toolbar-buttons)
                '(drracket:syncheck ; TODO enable this later
                   debug-tool)]
               [(drracket:toolbar-buttons)
                (dynamic-require 'OCM_emu/buttons 'buttons-ocm-asm)]
               [else default]))))
(module+ main
         (require "private/fileInfo.rkt")
         (eval-syntax (read-syntax arg-path arg-port)))
