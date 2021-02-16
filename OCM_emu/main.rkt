#!/usr/bin/env racket
#lang racket/base
(require "reader.rkt")
(module+ reader
         (println "reader module")
         (provide read-syntax))
(module+ main
         (println "main module")
         (require "private/fileInfo.rkt")
         (eval-syntax (read-syntax arg-path arg-port)))

