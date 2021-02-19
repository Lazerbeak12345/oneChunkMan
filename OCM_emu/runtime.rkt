#lang racket/base
(require racket/list racket/function)
(module+ test (require rackunit))
(provide symbol->num num->instruction run-ocm-asm)
(define (symbol->num sym)
  (case sym
    [(NOP)       0]
    [(HALT)      1]
    [(SWAP)      2]
    [(NEXT)      3]
    [(GET)       4]
    [(SET)       5]
    [(IFGOTO)    6]
    [(DIRF)      7]
    [(DIRB)      8]
    [(READIN)    9]
    [(SENDOUT)  10]
    [(ADD)      11]
    [(SUBTRACT) 12]
    [else (raise-syntax-error sym "unknown instruction!")]))
(define (num->instruction num)
  (case num
    [(0)  'NOP     ]
    [(1)  'HALT    ]
    [(2)  'SWAP    ]
    [(3)  'NEXT    ]
    [(4)  'GET     ]
    [(5)  'SET     ]
    [(6)  'IFGOTO  ]
    [(7)  'DIRF    ]
    [(8)  'DIRB    ]
    [(9)  'READIN  ]
    [(10) 'SENDOUT ]
    [(11) 'ADD     ]
    [(12) 'SUBTRACT]
    [else (raise-argument-error
            'ocm-asm
            "A number 0 through 7 that can be converted into an instruction"
            num)]))
(module+ test
         (check-exn
           exn:fail:syntax?
           (thunk (symbol->num 'fake-symbol)))
         (check-exn
           exn:fail:contract?
           (thunk (num->instruction 23)))
         (define (inst->inst sym)
           (num->instruction (symbol->num sym)))
         (for ([inst '(NOP HALT SWAP NEXT GET SET IFGOTO DIRF DIRB READIN
                           SENDOUT ADD SUBTRACT)])
              (check-eqv? inst (inst->inst inst)))
         (define (instnum->instnum instnum)
           (symbol->num (num->instruction instnum)))
         (for ([instnum (in-range 0 7)])
              (check-eqv? instnum (instnum->instnum instnum))))
; TODO turn these into params
; TODO test these being a different size
(define MAX_INT #b11111111)
(define TAPE_SIZE MAX_INT)
(define (run-ocm-asm #:numbers numbers
                     #:pgm-counter [pgm-counter 0]
                     #:reg-A [reg-A 0]
                     #:reg-B [reg-B 0]
                     #:direction [DIRECTION #t]
                     #:overflow [OVERFLOW #f])
  (define (pad-end-if-needed)
    (unless (or (pgm-counter . < . (length numbers))
                (pgm-counter . > . TAPE_SIZE))
      (displayln (format "padding...~a" (length numbers)))
      (set! numbers (append numbers
                            (build-list (- (+ pgm-counter 1)
                                           (length numbers))
                                        (lambda(a) 0))))
      (displayln (format "after padding ~a" (length numbers)))))
  (pad-end-if-needed)
  (display (format "tape-loc: ~a" pgm-counter))
  (define inst-v (list-ref numbers pgm-counter))
  (define inst (num->instruction inst-v))
  (displayln (format (string-append "\t[@] ~a(~a)\t[A] ~a\t[B] ~a\t"
                                    "{DIRECTION} ~a\t{OVERFLOW}~a")
                     inst-v
                     inst
                     reg-A
                     reg-B
                     DIRECTION
                     OVERFLOW))
  (displayln (format "memory dump: ~a" numbers))
  (define (wait-for-POWER)
    (displayln "{POWER}?")
    (displayln "{POWER} is on"))
  (define {PREPAREHOP}
    (displayln "{PREPAREHOP}")
    ;(displayln (format "before ph [B]~a\tcounter ~a" reg-B pgm-counter))
    (set! pgm-counter (modulo ((if DIRECTION + -)
                               pgm-counter
                               (+ 1 reg-B))
                              MAX_INT))
    ;(displayln (format "after ph [B]~a\tcounter ~a" reg-B pgm-counter))
    )
  (define {GO}
    (displayln "{GO}")
    (wait-for-POWER)
    (displayln "next instruction")
    (run-ocm-asm #:numbers numbers
                 #:pgm-counter pgm-counter
                 #:reg-A reg-A
                 #:reg-B reg-B
                 #:direction DIRECTION
                 #:overflow OVERFLOW))
  (define {ROTF}
    (displayln "{ROTF}")
    (set! pgm-counter (modulo (+ 1 pgm-counter)
                              MAX_INT)))
  (define {STEP}
    (displayln "{STEP}")
    {ROTF}
    {GO})
  (define {SETA}
    (displayln "{SETA}")
    (if (pgm-counter . < . (length numbers))
        (set! reg-A (list-ref numbers pgm-counter))
        (set! reg-A 0)))
  (define {UNHOPSTEP}
    (displayln "{UNHOPSTEP}")
    (set! DIRECTION (not DIRECTION))
    (println pgm-counter)
    {PREPAREHOP}
    (set! DIRECTION (not DIRECTION))
    (println pgm-counter)
    {STEP})
  ; TODO catch errors and do a memory dump
  (case inst
    [(SWAP) (define tmp reg-A)
            (set! reg-A reg-B)
            (set! reg-B tmp)
            {STEP}]
    [(IO) (display (format "new <OUT>: '~a' ~a\n set <IN>: "
                           (integer->char reg-A)
                           reg-A))
          (set! reg-B (char->integer (read-char)))
          {STEP}]
    [(SUBTRACT) (set! reg-A (- reg-A reg-B))
                (if (< reg-A 0)
                  (begin (set! reg-A (modulo reg-A MAX_INT))
                         (set! OVERFLOW #t))
                  (set! OVERFLOW #f))
                {STEP}]
    [(IFGOTO) (if OVERFLOW
               (begin {PREPAREHOP}
                      {GO})
               {STEP})]
    [(DIRF) (set! DIRECTION #t)
            (displayln (format "{DIRECTION} set to ~a" DIRECTION))
            {STEP}]
    [(DIRB) (set! DIRECTION #f)
            (displayln (format "{DIRECTION} set to ~a" DIRECTION))
            {STEP}]
    [(NEXT) {ROTF}
            {SETA}
            {STEP}]
    [(SET) {PREPAREHOP}
           (pad-end-if-needed)
           (set! numbers (list-set numbers pgm-counter reg-A))
           (displayln (format "numbers ~a" numbers))
           {UNHOPSTEP}]
    [(GET) {PREPAREHOP}
           {SETA}
           {UNHOPSTEP}]
    [(NOP) {STEP}]
    ; This is mostly for debugging, but I suppose it could be useful
    [(HALT) (list numbers pgm-counter reg-A reg-B DIRECTION OVERFLOW)] 
    ; This code is actually just so it throws errors on test code if I change
    ; the ISA
    [else (raise-syntax-error inst "instruction not written yet!")]))
(module+ test
         (define (test-pgm program)
           (run-ocm-asm #:numbers (for/list ([value program])
                                            (cond [(symbol? value)
                                                   (symbol->num value)]
                                                  [(number? value)
                                                   value]))))
         (check-equal? (test-pgm '(HALT))
                       '((1) 0 0 0 #t #f) "Test HALT")
         (check-equal? (test-pgm '(NOP HALT))
                       '((0 1) 1 0 0 #t #f) "Test NOP")
         (check-equal? (test-pgm '(NEXT 101 HALT))
                       '((3 101 1) 2 101 0 #t #f) "Test NEXT")
         (check-equal? (test-pgm '(NEXT 101 SWAP HALT))
                       '((3 101 2 1) 3 0 101 #t #f) "Test basic SWAP")
         (check-equal? (test-pgm '(NEXT 101 SWAP NEXT 39 SWAP HALT))
                       '((3 101 2 3 39 2 1) 6 101 39 #t #f)
                       "Test double SWAP")
         (check-equal? (test-pgm '(NEXT 3 HALT SWAP))
                       '((3 3 1 2) 2 3 0 #t #f)
                       "Test that halt doesn't do anything afterwards")
         (test-case
           "Tests for GET"
           (check-equal? (test-pgm '(NEXT 1 SWAP GET HALT 73))
                         '((3 1 2 4 1 73) 4 73 1 #t #f)
                         "Test GET forwards")
           (check-equal? (test-pgm '(NEXT 3 SWAP GET HALT))
                         '((3 3 2 4 1) 4 0 3 #t #f)
                         "Test GET out of range forwards")
           (check-equal? (test-pgm '(NEXT 291 NEXT 4 SWAP DIRB GET HALT))
                         '((3 291 3 4 2 8 4 1) 7 291 4 #f #f)
                         "Test GET backwards")
           (check-equal? (test-pgm '(NEXT 4 SWAP DIRB GET HALT))
                         '((3 4 2 8 4 1) 5 0 4 #f #f)
                         "Test GET out of range backwards"))
         (test-case
           "Tests for SET"
           (check-equal? (test-pgm '(NEXT 1 SWAP NEXT 73 SET HALT 87))
                         '((3 1 2 3 73 5 1 73) 6 73 1 #t #f)
                         "Test SET forwards")
           (check-equal? (test-pgm '(NEXT 3 SWAP NEXT 9 SET HALT))
                         '((3 3 2 3 9 5 1 0 0 9) 6 9 3 #t #f)
                         "Test SET out of range forwards")
           (check-equal? (test-pgm '(NEXT 291 NEXT 6 SWAP NEXT 7 DIRB SET HALT))
                         '((3 7 3 6 2 3 7 8 5 1) 9 7 6 #f #f)
                         "Test SET backwards")
           (check-equal? (test-pgm '(NEXT 248 SWAP NEXT 37 DIRB SET HALT))
                         '((3 248 2 3 37 8 5 1 0 0 0 0 37) 7 37 248 #f #f)
                         "Test SET out of range backwards"))
         (test-case
           "Tests for IFGOTO"
           (check-equal? (test-pgm '(IFGOTO HALT))
                         '((6 1) 1 0 0 #t #f)
                         "Test IFGOTO no jump forwards")
           (check-equal? (test-pgm '(DIRB IFGOTO HALT))
                         '((8 6 1) 2 0 0 #f #f)
                         "Test IFGOTO no jump backwards")
           (check-equal? (test-pgm
                           '(NEXT 1 SWAP SUBTRACT NEXT 2 SWAP IFGOTO NEXT 97 HALT))
                         '((3 1 2 12 3 2 2 6 3 97 1) 10 1 2 #t #t)
                         "Test IFGOTO forwards")
           (check-equal? (test-pgm
                           '(NEXT HALT SWAP SUBTRACT NEXT 6 DIRB SWAP IFGOTO))
                         '((3 1 2 12 3 6 8 2 6) 1 1 6 #f #t)
                         "Test IFGOTO backwards")
           (check-equal?
             (test-pgm
               '(NEXT 5 SWAP NEXT HALT DIRB SET NEXT 1 SWAP SUBTRACT NEXT 3
                      SWAP DIRF IFGOTO))
             `(,(append '(1 5 2 3 1 8 5 3 1 2 12 3 3 2 7 6)
                        (build-list (- TAPE_SIZE 16)
                                    (lambda(a)
                                      0)))
                0 1 3 #t #f)
             "Test IFGOTO overflow forwards")
           ; TODO Also allow for OOB backwwards
           )
         ; TODO things after IFGOTO
         )

