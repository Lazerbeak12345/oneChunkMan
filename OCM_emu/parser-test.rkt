#lang racket/base
(require rackunit "tokenizer.rkt" "parser.rkt")
(test-equal? "comments work"
             (parse-to-datum (__apt/mt "(comment)\n"))
             '(ocm-asm #f))
(test-equal? "instruction rows work"
             (parse-to-datum (__apt/mt ":NUM\n"))
             '(ocm-asm (ocm-asm-inst #f NUM #f)))
(test-equal? "instruction rows work with space in front"
             (parse-to-datum (__apt/mt "   :MUN\n"))
             '(ocm-asm (ocm-asm-inst #f MUN #f)))
(test-equal? "instruction rows work with tab in front"
             (parse-to-datum (__apt/mt "\t:MUN\n"))
             '(ocm-asm (ocm-asm-inst #f MUN #f)))
(test-equal? "newlines are squashed"
             (parse-to-datum (__apt/mt ":MANYENDS\n\n\n"))
             '(ocm-asm (ocm-asm-inst #f MANYENDS #f)))
(test-equal? "data rows work"
             (parse-to-datum (__apt/mt "#3\n"))
             '(ocm-asm (ocm-asm-dta #f 3 #f)))
(test-equal? "strings work"
             (parse-to-datum (__apt/mt "\"howdy!\"\n"))
             '(ocm-asm (ocm-asm-str "howdy!" #f)))
(test-equal? "strings with a size work"
             (parse-to-datum (__apt/mt "6\"howdy!\"\n"))
             '(ocm-asm (ocm-asm-str 6 "howdy!" #f)))
(test-equal? "mixed stuff works"
             (parse-to-datum
               (__apt/mt "(comment)\n:HI\n#14\n\n3\"crazy!\"\n"))
             '(ocm-asm
                #f
                (ocm-asm-inst #f HI #f)
                (ocm-asm-dta #f 14 #f)
                (ocm-asm-str 3 "crazy!" #f)))

