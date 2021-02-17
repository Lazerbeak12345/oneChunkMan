#!/usr/bin/env racket
#lang racket/base
(require "reader.rkt")
(module+ reader (provide read-syntax))
(module+ main
         (require "private/fileInfo.rkt")
         (eval-syntax (read-syntax arg-path arg-port)))

