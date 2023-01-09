#lang racket/base
; NOTE as brag/support's lexer is a syntax this means that for the time being,
; using typed/racket in this file isn't an option
(require brag/support
         racket/function)
(module+ test
  (require rackunit))
(define (make-tokenizer port)
  (port-count-lines! port)
  (let ([the-lexer ; TODO allow comments inside comments
         (lexer [(from/to "(" ")") (token 'COMMENT #:skip? #t)]
                [(from/to "\"" "\"")
                 (token 'LITERALS-TOK
                        (trim-ends "\"" lexeme "\"")
                        #:position (+ (pos lexeme-start) 1)
                        #:line (line lexeme-start)
                        #:column (+ (col lexeme-start) 1)
                        #:span (- (pos lexeme-end) (pos lexeme-start) 2))]
                [(:: "\n" (:* whitespace))
                 (token 'NEWLINE-TOK
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span (- (pos lexeme-end) (pos lexeme-start)))]
                [(:+ whitespace) (token 'WHITESPACE #:skip? #t)]
                [(:+ numeric)
                 (token 'NUM-TOK
                        (string->number lexeme)
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span (- (pos lexeme-end) (pos lexeme-start)))]
                [(:+ upper-case)
                 (token 'INSTRUCTION-TOK
                        (string->symbol lexeme)
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span (- (pos lexeme-end) (pos lexeme-start)))]
                [(:+ (lower-case . union . "-"))
                 (token 'NAME-TOK
                        (string->symbol lexeme)
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span (- (pos lexeme-end) (pos lexeme-start)))]
                [":"
                 (token 'COLON-TOK
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span 1)]
                ["#"
                 (token 'VALUE-TOK
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span 1)]
                ["%"
                 (token 'REFERENCE-TOK
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span 1)]
                ["@"
                 (token 'LABEL-TOK
                        #:position (pos lexeme-start)
                        #:line (line lexeme-start)
                        #:column (col lexeme-start)
                        #:span 1)])])
    (thunk (the-lexer port))))
(provide make-tokenizer
         __apt/mt)
(define (__apt/mt val)
  (apply-tokenizer-maker make-tokenizer val))
(module+ main
  (require "private/fileInfo.rkt")
  (println (__apt/mt arg-port)))
(module+ test
  (test-equal? "Comments are skipped" (__apt/mt "(comment)") (list (token 'COMMENT #:skip? #t)))
  (test-equal? "Numbers and literals"
               (__apt/mt "42#4")
               (list (token 'NUM-TOK 42 #:position 1 #:line 1 #:column 0 #:span 2)
                     (token 'VALUE-TOK #f #:position 3 #:line 1 #:column 2 #:span 1)
                     (token 'NUM-TOK 4 #:position 4 #:line 1 #:column 3 #:span 1)))
  (test-exn "no floats" exn:fail:read? (lambda () (__apt/mt "4.2")))
  (test-equal?
   "literals"
   (__apt/mt "\"hi there\n\nhow are you?\"")
   (list (token 'LITERALS-TOK "hi there\n\nhow are you?" #:position 2 #:line 1 #:column 1 #:span 22)))
  (test-equal? "newlines"
               (__apt/mt "\n\"hi\n\"\n\n1\n")
               (list (token 'NEWLINE-TOK #:position 1 #:line 1 #:column 0 #:span 1)
                     (token 'LITERALS-TOK "hi\n" #:position 3 #:line 2 #:column 1 #:span 3)
                     (token 'NEWLINE-TOK #:position 7 #:line 3 #:column 1 #:span 2)
                     (token 'NUM-TOK 1 #:position 9 #:line 5 #:column 0 #:span 1)
                     (token 'NEWLINE-TOK #:position 10 #:line 5 #:column 1 #:span 1)))
  (test-equal? "commands"
               (__apt/mt "HI\n3:ASDF")
               (list (token 'INSTRUCTION-TOK 'HI #:position 1 #:line 1 #:column 0 #:span 2)
                     (token 'NEWLINE-TOK #:position 3 #:line 1 #:column 2 #:span 1)
                     (token 'NUM-TOK 3 #:position 4 #:line 2 #:column 0 #:span 1)
                     (token 'COLON-TOK #:position 5 #:line 2 #:column 1 #:span 1)
                     (token 'INSTRUCTION-TOK 'ASDF #:position 6 #:line 2 #:column 2 #:span 4)))
  (test-equal? "value"
               (__apt/mt "3#9")
               (list (token 'NUM-TOK 3 #:position 1 #:line 1 #:column 0 #:span 1)
                     (token 'VALUE-TOK #:position 2 #:line 1 #:column 1 #:span 1)
                     (token 'NUM-TOK 9 #:position 3 #:line 1 #:column 2 #:span 1)))
  (test-equal? "label in front of data"
               (__apt/mt ":NEXT\n@label\n#0")
               (list (token 'COLON-TOK #:position 1 #:line 1 #:column 0 #:span 1)
                     (token 'INSTRUCTION-TOK 'NEXT #:position 2 #:line 1 #:column 1 #:span 4)
                     (token 'NEWLINE-TOK #:position 6 #:line 1 #:column 5 #:span 1)
                     (token 'LABEL-TOK #:position 7 #:line 2 #:column 0 #:span 1)
                     (token 'NAME-TOK 'label #:position 8 #:line 2 #:column 1 #:span 5)
                     (token 'NEWLINE-TOK #:position 13 #:line 2 #:column 6 #:span 1)
                     (token 'VALUE-TOK #:position 14 #:line 3 #:column 0 #:span 1)
                     (token 'NUM-TOK 0 #:position 15 #:line 3 #:column 1 #:span 1)))
  (test-equal? "comment mixed with content"
               (__apt/mt "12:HI (comment\nthing)\n3")
               (list (token 'NUM-TOK 12 #:position 1 #:line 1 #:column 0 #:span 2)
                     (token 'COLON-TOK #:position 3 #:line 1 #:column 2 #:span 1)
                     (token 'INSTRUCTION-TOK 'HI #:position 4 #:line 1 #:column 3 #:span 2)
                     (token 'WHITESPACE #:skip? #t)
                     (token 'COMMENT #:skip? #t)
                     (token 'NEWLINE-TOK #:position 22 #:line 2 #:column 6 #:span 1)
                     (token 'NUM-TOK 3 #:position 23 #:line 3 #:column 0 #:span 1)))
  (test-equal? "strings mixed with content"
               (__apt/mt "   12:HI\n   \"hi\"\n  @asdf\n  %asdf")
               (list (token 'WHITESPACE #:skip? #t)
                     (token 'NUM-TOK 12 #:position 4 #:line 1 #:column 3 #:span 2)
                     (token 'COLON-TOK #:position 6 #:line 1 #:column 5 #:span 1)
                     (token 'INSTRUCTION-TOK 'HI #:position 7 #:line 1 #:column 6 #:span 2)
                     (token 'NEWLINE-TOK #:position 9 #:line 1 #:column 8 #:span 4)
                     (token 'LITERALS-TOK "hi" #:position 14 #:line 2 #:column 4 #:span 2)
                     (token 'NEWLINE-TOK #:position 17 #:line 2 #:column 7 #:span 3)
                     (token 'LABEL-TOK #:position 20 #:line 3 #:column 2 #:span 1)
                     (token 'NAME-TOK 'asdf #:position 21 #:line 3 #:column 3 #:span 4)
                     (token 'NEWLINE-TOK #:position 25 #:line 3 #:column 7 #:span 3)
                     (token 'REFERENCE-TOK #:position 28 #:line 4 #:column 2 #:span 1)
                     (token 'NAME-TOK 'asdf #:position 29 #:line 4 #:column 3 #:span 4))))
