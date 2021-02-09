#!/usr/bin/env racket
#lang racket/base
(module reader racket/base
  (require "reader.rkt")
  (provide read-syntax))
(module main racket/base
  (require "reader.rkt" "private/fileInfo.rkt")
  (println (read-syntax arg-path arg-port)))

