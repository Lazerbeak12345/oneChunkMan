#lang brag
ocm-asm : (NEWLINE-TOK*|
           ocm-asm-inst|
           ocm-asm-dta |
           ocm-asm-str )+

; Instruction
ocm-asm-inst : COLON-TOK INSTRUCTION-TOK NEWLINE-TOK
; Data
ocm-asm-dta  : VALUE-TOK NUM-TOK NEWLINE-TOK
; String
ocm-asm-str  : LITERALS-TOK NEWLINE-TOK
