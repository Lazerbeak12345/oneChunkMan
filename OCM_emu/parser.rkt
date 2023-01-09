#lang brag






ocm-asm




:




(


NEWLINE-TOK


+


|


ocm-asm-row


)


+






ocm-asm-row




:




ocm-asm-label


*




(


ocm-asm-inst


|


























































ocm-asm-dta




|


























































ocm-asm-str




|


























































ocm-asm-ref




)




NEWLINE-TOK




  ; Label



ocm-asm-label




:




LABEL-TOK




NAME-TOK




NEWLINE-TOK


*




  ; Reference



ocm-asm-ref








:




REFERENCE-TOK




NAME-TOK




  ; Instruction



ocm-asm-inst






:




COLON-TOK




INSTRUCTION-TOK




  ; Data



ocm-asm-dta








:




VALUE-TOK




NUM-TOK




  ; String



ocm-asm-str








:




LITERALS-TOK
