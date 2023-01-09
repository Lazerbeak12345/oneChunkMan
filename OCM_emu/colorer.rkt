#lang racket/base
(require brag/support
         syntax-color/racket-lexer
         racket/contract)
(provide color-ocm-asm)
(define color-ocm-asm
  (lexer [(eof) (values lexeme 'eof #f #f #f)]
         [(from/to "(" ")") (values lexeme 'comment #f (pos lexeme-start) (pos lexeme-end))]
         [(from/to "\"" "\"") (values lexeme 'string #f (pos lexeme-start) (pos lexeme-end))]
         [(:+ whitespace) (values lexeme 'white-space #f (pos lexeme-start) (pos lexeme-end))]
         [(:+ numeric) (values lexeme 'constant #f (pos lexeme-start) (pos lexeme-end))]
         [(:+ (lower-case . union . "-"))
          (values lexeme 'hash-colon-keyword #f (pos lexeme-start) (pos lexeme-end))]
         [(:+ upper-case) (values lexeme 'symbol #f (pos lexeme-start) (pos lexeme-end))]
         [any-char (values lexeme 'no-color #f (pos lexeme-start) (pos lexeme-end))]))
