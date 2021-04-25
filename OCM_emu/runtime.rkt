#lang typed/racket/base
(require racket/function racket/vector)
(module+ test (require typed/rackunit))
(provide symbol->num num->instruction run-ocm-asm)
(define-type Instruction-Symbol (U 'NOP 'HALT 'SWAP 'NEXT 'GET 'SET 'IFGOTO
                                   'READIN 'SENDOUT 'ADD 'SUBTRACT))
(define-predicate instruction-symbol? Instruction-Symbol)
(: symbol->num (-> Instruction-Symbol Exact-Nonnegative-Integer))
(define (symbol->num sym)
  (case sym
    [(NOP)       0]
    [(HALT)      1]
    [(SWAP)      2]
    [(NEXT)      3]
    [(GET)       4]
    [(SET)       5]
    [(IFGOTO)    6]
    [(READIN)    7]
    [(SENDOUT)   8]
    [(ADD)       9]
    [(SUBTRACT) 10]
    ; We still need to raise the error because for some reason not having it
    ; makes typed/racket complain that this function sometimes returns Void,
    ; even though there's a contract to prevent such a thing
    [else (raise-syntax-error sym "unknown instruction!")]))
(: num->instruction (-> Exact-Nonnegative-Integer Instruction-Symbol))
(define (num->instruction num)
  (case num
    [(0)  'NOP     ]
    [(1)  'HALT    ]
    [(2)  'SWAP    ]
    [(3)  'NEXT    ]
    [(4)  'GET     ]
    [(5)  'SET     ]
    [(6)  'IFGOTO  ]
    [(7)  'READIN  ]
    [(8)  'SENDOUT ]
    [(9)  'ADD     ]
    [(10) 'SUBTRACT]
    [else (raise-argument-error
            'ocm-asm
            "A number 0 through 10 that can be converted into an instruction"
            num)]))
(module+ test
         (test-exn "Test for invalid integer instruction"
                   exn:fail:contract?
                   (thunk (num->instruction 23)))
         (test-case
           "Instructions to int and back"
           (for ([inst '(NOP HALT SWAP NEXT GET SET IFGOTO READIN SENDOUT ADD
                             SUBTRACT)])
                (check-eqv? inst
                            (num->instruction
                              (symbol->num
                                (assert inst instruction-symbol?))))))
         (test-case
           "Instruction to symbol and back"
           (for ([instnum (in-range 0 10)])
                (check-eqv?
                  instnum
                  (symbol->num
                    (num->instruction
                      (assert instnum exact-nonnegative-integer?)))))))
(define BITTAGE : (Parameterof Exact-Nonnegative-Integer)
  (make-parameter 6))
(provide BITTAGE)
; TODO make a type for this
(define MAX_INT : (Parameterof (-> Exact-Nonnegative-Integer))
  (make-parameter (thunk ((expt 2 (BITTAGE)) . - . 1))))
(provide MAX_INT)
(define RAM_SIZE : (Parameterof (-> Exact-Nonnegative-Integer))
  (make-parameter (MAX_INT)))
(provide RAM_SIZE)
(define debugger-port : (Parameterof Output-Port)
  (make-parameter (open-output-string)))
(provide debugger-port)
(define-type OCM-asm-ret
             (List (Vectorof Exact-Nonnegative-Integer)
                   Exact-Nonnegative-Integer
                   Exact-Nonnegative-Integer
                   Exact-Nonnegative-Integer
                   Boolean))
(: run-ocm-asm (-> #:numbers (Mutable-Vectorof Exact-Nonnegative-Integer)
                   [#:bank-# Exact-Nonnegative-Integer]
                   [#:reg-A Exact-Nonnegative-Integer]
                   [#:reg-B Exact-Nonnegative-Integer]
                   [#:overflow Boolean]
                   OCM-asm-ret))
(define (run-ocm-asm #:numbers numbers
                     #:bank-# [bank-# 0]
                     #:reg-A [reg-A 0]
                     #:reg-B [reg-B 0]
                     #:overflow [OVERFLOW #f])
  (: pad-end-if-needed (->* [] [Exact-Nonnegative-Integer] Void))
  (define (pad-end-if-needed [valueToCompare bank-#])
    (define start-len (vector-length numbers))
    (unless (or (valueToCompare . < . start-len)
                (valueToCompare . > . ((RAM_SIZE))))
      (displayln (format "padding...~a" start-len)
                 (debugger-port))
      (set! numbers (vector-append
                      numbers
                      (cast (make-vector (- (+ valueToCompare 1)
                                            start-len)
                                         0)
                            (Vectorof Exact-Nonnegative-Integer))))
      (displayln (format "after padding ~a" (vector-length numbers)) (debugger-port))))
  (pad-end-if-needed)
  (display (format "ram-loc: ~a\t" bank-#) (debugger-port))
  (define bank-@ (vector-ref numbers bank-#))
  (define inst (num->instruction bank-@))
  (displayln (format (string-append "[@] ~a(~a)\t[A] ~a\t[B] ~a\t"
                                    "{OVERFLOW}~a")
                     bank-@
                     inst
                     reg-A
                     reg-B
                     OVERFLOW) (debugger-port))
  (displayln (format "memory dump: ~a" numbers) (debugger-port))
  (define (wait-for-POWER)
    (displayln "{POWER}?" (debugger-port))
    (displayln "{POWER} is on" (debugger-port)))
  (define {GO}
    (displayln "{GO}" (debugger-port))
    (wait-for-POWER)
    (displayln "next instruction" (debugger-port))
    (run-ocm-asm #:numbers (cast numbers
                                 (Mutable-Vectorof Exact-Nonnegative-Integer))
                 #:bank-# (cast bank-# Exact-Nonnegative-Integer)
                 #:reg-A (cast reg-A Exact-Nonnegative-Integer)
                 #:reg-B (cast reg-B Exact-Nonnegative-Integer)
                 #:overflow OVERFLOW))
  (define {ROTATEONE}
    (displayln "{ROTATEONE}" (debugger-port))
    (set! bank-# (modulo (+ 1 bank-#)
                         ((RAM_SIZE)))))
  (define {STEP}
    (displayln "{STEP}" (debugger-port))
    {ROTATEONE}
    {GO})
  (define (check-if-reg-A-too-big)
    (when (reg-A . > . ((MAX_INT)))
      (raise-argument-error
        'NEXT-or-GET-signal
        (format (string-append "register [A] should be set to a number no"
                               " higher than ~a, the (MAX_INT)")
                ((MAX_INT)))
        reg-A)))
  (: SETA (-> Exact-Nonnegative-Integer Void))
  (define {SETA location}
    (displayln "{SETA}" (debugger-port))
    (set! reg-A (if (location . < . (vector-length numbers))
                    (vector-ref numbers location)
                    0))
    (check-if-reg-A-too-big))
  (case inst
    [(NOP) {STEP}]
    ; This is mostly for debugging, but I suppose it could be useful
    [(HALT) (list numbers
                  (cast bank-# Exact-Nonnegative-Integer)
                  (cast reg-A Exact-Nonnegative-Integer)
                  (cast reg-B Exact-Nonnegative-Integer)
                  OVERFLOW)] 
    [(SWAP) (define tmp reg-A)
            (set! reg-A reg-B)
            (set! reg-B tmp)
            (check-if-reg-A-too-big)
            {STEP}]
    [(NEXT) {ROTATEONE}
            (SETA (cast bank-# Exact-Nonnegative-Integer))
            {STEP}]
    [(GET) (SETA (cast reg-B Exact-Nonnegative-Integer))
           {STEP}]
    [(SET) (pad-end-if-needed (cast reg-B Exact-Nonnegative-Integer))
           (vector-set! numbers
                        reg-B
                        (cast reg-A Exact-Nonnegative-Integer))
           {STEP}]
    [(IFGOTO) (if OVERFLOW
               (begin (set! bank-# reg-B)
                      {GO})
               {STEP})]
    [(READIN) (set! reg-A (cast (read-byte) Exact-Nonnegative-Integer))
              {STEP}]
    [(SENDOUT) (display (integer->char reg-A))
               {STEP}]
    [(ADD) (set! reg-A (+ reg-A reg-B))
           (if (> reg-A ((MAX_INT)))
               (begin (set! reg-A (modulo reg-A ((MAX_INT))))
                      (set! OVERFLOW #t))
               (set! OVERFLOW #f))
           {STEP}]
    [(SUBTRACT) (set! reg-A (- reg-A reg-B))
                (if (< reg-A 0)
                  (begin (set! reg-A (modulo reg-A ((MAX_INT))))
                         (set! OVERFLOW #t))
                  (set! OVERFLOW #f))
                {STEP}]
    ; This code is actually just so it throws errors on test code if I change
    ; the ISA
    [else (raise-syntax-error inst "instruction not written yet!")]))
(module+ test
         (require racket/port)
         (: test-pgm (-> (Listof (U Instruction-Symbol
                                    Exact-Nonnegative-Integer))
                         OCM-asm-ret))
         (define (test-pgm program)
           (run-ocm-asm #:numbers
                        (for/vector : (Mutable-Vectorof Exact-Nonnegative-Integer)
                                    ([value program])
                                    (cond [(instruction-symbol? value)
                                           (symbol->num value)]
                                          [(exact-nonnegative-integer? value)
                                           value]))))
         (test-equal? "Test HALT"
                      (test-pgm '(HALT))
                      '(#(1) 0 0 0 #f))
         (test-equal? "Test NOP"
                      (test-pgm '(NOP HALT))
                      '(#(0 1) 1 0 0 #f))
         (test-equal? "Test NEXT"
                      (test-pgm '(NEXT 10 HALT))
                      '(#(3 10 1) 2 10 0 #f))
         (test-equal? "Test basic SWAP"
                      (test-pgm '(NEXT 10 SWAP HALT))
                      '(#(3 10 2 1) 3 0 10 #f))
         (test-equal? "Test double SWAP"
                      (test-pgm '(NEXT 10 SWAP NEXT 39 SWAP HALT))
                      '(#(3 10 2 3 39 2 1) 6 10 39 #f))
         (test-equal? "Test that halt doesn't do anything afterwards"
                      (test-pgm '(NEXT 3 HALT SWAP))
                      '(#(3 3 1 2) 2 3 0 #f))
         (test-case
           "Tests for GET"
           (test-equal? "Test GET"
                        (test-pgm '(NEXT 5 SWAP GET HALT 37))
                        '(#(3 5 2 4 1 37) 4 37 5 #f))
           (test-equal? "Test GET out of range"
                        (test-pgm '(NEXT 8 SWAP NEXT 19 GET HALT))
                        '(#(3 8 2 3 19 4 1) 6 0 8 #f)))
         (test-case
           "Tests for SET"
           (test-equal? "Test SET"
                        (test-pgm '(NEXT 7 SWAP NEXT 37 SET HALT 77))
                        '(#(3 7 2 3 37 5 1 37) 6 37 7 #f))
           (test-equal? "Test SET out of range"
                        (test-pgm '(NEXT 10 SWAP NEXT 9 SET HALT))
                        '(#(3 10 2 3 9 5 1 0 0 0 9) 6 9 10 #f)))
         (test-case
           "Tests for IFGOTO"
           (test-equal? "Test IFGOTO no jump"
                        (test-pgm '(IFGOTO HALT))
                        '(#(6 1) 1 0 0 #f))
           (test-equal? "Test IFGOTO"
                        (test-pgm
                          ; HALT has id of 1, and is also at 1
                          '(NEXT HALT SWAP SUBTRACT IFGOTO NEXT 37 HALT))
                        `(#(3 1 2 10 6 3 37 1) 1 ,(- ((MAX_INT)) 1) 1 #t))
           (test-equal?
             "Test IFGOTO overflow"
             (test-pgm
               '(NEXT 0 SWAP NEXT HALT SET SWAP SUBTRACT NEXT 13 SWAP IFGOTO))
             `(,(vector-append '#(1 0 2 3 1 5 2 10 3 13 2 6)
                               (make-vector (- ((RAM_SIZE)) 12) 0))
                0 1 13 #t)))
         (test-case
           "Tests for gpio"
           (test-equal? "Test readin"
                        (with-input-from-string
                          (list->string (list (integer->char 35)))
                          (thunk (test-pgm '(READIN HALT))))
                        '(#(7 1) 1 35 0 #f))
           (test-equal? 
             "test sendout"
             (with-output-to-string
               (thunk (check-equal? (test-pgm '(NEXT 23 SENDOUT HALT))
                                    '(#(3 23 8 1) 3 23 0 #f))))
             (list->string (list (integer->char 23)))))
         (test-case
           "Tests for math"
           (test-equal? "Standard addition"
                        (test-pgm '(NEXT 2 SWAP NEXT 7 ADD HALT))
                        '(#(3 2 2 3 7 9 1) 6 9 2 #f))
           (test-equal? "addition overflow"
                        (test-pgm `(NEXT ,((MAX_INT)) SWAP NEXT 3 ADD HALT))
                        `(#(3 ,((MAX_INT)) 2 3 3 9 1) 6 3 ,((MAX_INT)) #t))
           (test-equal? "subtraction"
                        (test-pgm '(NEXT 2 SWAP NEXT 7 SUBTRACT HALT))
                        '(#(3 2 2 3 7 10 1) 6 5 2 #f))
           (test-equal? "subtraction underflow"
                        (test-pgm '(NEXT 9 SWAP NEXT 3 SUBTRACT HALT))
                        `(#(3 9 2 3 3 10 1) 6 ,(- ((MAX_INT)) 6) 9 #t)))
         ; TODO: test MAX_INT and RAM_SIZE params
         )

