#lang brag
ocm-asm : (NEWLINE-TOK*|
           ocm-asm-inst|
           ocm-asm-dta |
           ocm-asm-str )+

; Instruction
ocm-asm-inst : NUM-TOK COLON-TOK INSTRUCTION-TOK NEWLINE-TOK
; Data
ocm-asm-dta  : NUM-TOK VALUE-TOK NUM-TOK NEWLINE-TOK
; String
ocm-asm-str  : NUM-TOK (RANGE-SEP-TOK NUM-TOK)? LITERALS-TOK NEWLINE-TOK

