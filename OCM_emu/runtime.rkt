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
; TODO test these being a different size
(define MAX_INT (make-parameter #b111111))
(define TAPE_SIZE (make-parameter (MAX_INT)))
; TODO make debugger output param/port that defautls to current input port
(define (run-ocm-asm #:numbers numbers
                     #:pgm-counter [pgm-counter 0]
                     #:reg-A [reg-A 0]
                     #:reg-B [reg-B 0]
                     #:direction [DIRECTION #t]
                     #:overflow [OVERFLOW #f])
  (define (pad-end-if-needed)
    (unless (or (pgm-counter . < . (length numbers))
                (pgm-counter . > . (TAPE_SIZE)))
      ;(displayln (format "padding...~a" (length numbers)))
      (set! numbers (append numbers
                            (build-list (- (+ pgm-counter 1)
                                           (length numbers))
                                        (lambda(a) 0))))
      ;(displayln (format "after padding ~a" (length numbers)))
      ))
  (pad-end-if-needed)
  ;(display (format "tape-loc: ~a" pgm-counter))
  (define inst-v (list-ref numbers pgm-counter))
  (define inst (num->instruction inst-v))
  ;(displayln (format (string-append "\t[@] ~a(~a)\t[A] ~a\t[B] ~a\t"
  ;                                  "{DIRECTION} ~a\t{OVERFLOW}~a")
  ;                   inst-v
  ;                   inst
  ;                   reg-A
  ;                   reg-B
  ;                   DIRECTION
  ;                   OVERFLOW))
  ;(displayln (format "memory dump: ~a" numbers))
  (define (wait-for-POWER)
    ;(displayln "{POWER}?")
    ;(displayln "{POWER} is on")
    (void))
  (define {PREPAREHOP}
    ;(displayln "{PREPAREHOP}")
    (set! pgm-counter (modulo ((if DIRECTION + -)
                               pgm-counter
                               (+ 1 reg-B))
                              (MAX_INT))))
  (define {GO}
    ;(displayln "{GO}")
    (wait-for-POWER)
    ;(displayln "next instruction")
    (run-ocm-asm #:numbers numbers
                 #:pgm-counter pgm-counter
                 #:reg-A reg-A
                 #:reg-B reg-B
                 #:direction DIRECTION
                 #:overflow OVERFLOW))
  (define {ROTF}
    ;(displayln "{ROTF}")
    (set! pgm-counter (modulo (+ 1 pgm-counter)
                              (MAX_INT))))
  (define {STEP}
    ;(displayln "{STEP}")
    {ROTF}
    {GO})
  (define {SETA}
    ;(displayln "{SETA}")
    (if (pgm-counter . < . (length numbers))
        (set! reg-A (list-ref numbers pgm-counter))
        (set! reg-A 0))
    (when (reg-A . > . (MAX_INT))
      (raise-argument-error
        'SETA-signal
        (format (string-append "register [A] should be set to a number no"
                               " higher than ~a, the (MAX_INT)")
                (MAX_INT))
        reg-A)))
  (define {UNHOPSTEP}
    ;(displayln "{UNHOPSTEP}")
    (set! DIRECTION (not DIRECTION))
    ;(println pgm-counter)
    {PREPAREHOP}
    (set! DIRECTION (not DIRECTION))
    ;(println pgm-counter)
    {STEP})
  ; TODO catch errors and do a memory dump
  (case inst
    [(NOP) {STEP}]
    ; This is mostly for debugging, but I suppose it could be useful
    [(HALT) (list numbers pgm-counter reg-A reg-B DIRECTION OVERFLOW)] 
    [(SWAP) (define tmp reg-A)
            (set! reg-A reg-B)
            (set! reg-B tmp)
            {STEP}]
    [(NEXT) {ROTF}
            {SETA}
            {STEP}]
    [(GET) {PREPAREHOP}
           {SETA}
           {UNHOPSTEP}]
    [(SET) {PREPAREHOP}
           (pad-end-if-needed)
           (set! numbers (list-set numbers pgm-counter reg-A))
           {UNHOPSTEP}]
    [(IFGOTO) (if OVERFLOW
               (begin {PREPAREHOP}
                      {GO})
               {STEP})]
    [(DIRF) (set! DIRECTION #t)
            ;(displayln (format "{DIRECTION} set to ~a" DIRECTION))
            {STEP}]
    [(DIRB) (set! DIRECTION #f)
            ;(displayln (format "{DIRECTION} set to ~a" DIRECTION))
            {STEP}]
    [(READIN) (set! reg-A (read-byte))
              {STEP}]
    [(SENDOUT) (display (integer->char reg-A))
               {STEP}]
    [(ADD) (set! reg-A (+ reg-A reg-B))
           (if (> reg-A (MAX_INT))
               (begin (set! reg-A (modulo reg-A (MAX_INT)))
                      (set! OVERFLOW #t))
               (set! OVERFLOW #f))
           {STEP}]
    [(SUBTRACT) (set! reg-A (- reg-A reg-B))
                (if (< reg-A 0)
                  (begin (set! reg-A (modulo reg-A (MAX_INT)))
                         (set! OVERFLOW #t))
                  (set! OVERFLOW #f))
                {STEP}]
    ; This code is actually just so it throws errors on test code if I change
    ; the ISA
    [else (raise-syntax-error inst "instruction not written yet!")]))
(module+ test
         (require racket/port)
         (define (test-pgm program)
           (run-ocm-asm #:numbers (for/list ([value program])
                                            (cond [(symbol? value)
                                                   (symbol->num value)]
                                                  [(number? value)
                                                   value]))))
         (test-equal? "Test HALT"
                      (test-pgm '(HALT))
                      '((1) 0 0 0 #t #f))
         (test-equal? "Test NOP"
                      (test-pgm '(NOP HALT))
                      '((0 1) 1 0 0 #t #f))
         (test-equal? "Test NEXT"
                      (test-pgm '(NEXT 10 HALT))
                      '((3 10 1) 2 10 0 #t #f))
         (test-equal? "Test basic SWAP"
                      (test-pgm '(NEXT 10 SWAP HALT))
                      '((3 10 2 1) 3 0 10 #t #f))
         (test-equal? "Test double SWAP"
                      (test-pgm '(NEXT 10 SWAP NEXT 39 SWAP HALT))
                      '((3 10 2 3 39 2 1) 6 10 39 #t #f))
         (test-equal? "Test that halt doesn't do anything afterwards"
                      (test-pgm '(NEXT 3 HALT SWAP))
                      '((3 3 1 2) 2 3 0 #t #f))
         (test-case
           "Tests for GET"
           (test-equal? "Test GET forwards"
                        (test-pgm '(NEXT 1 SWAP GET HALT 37))
                        '((3 1 2 4 1 37) 4 37 1 #t #f))
           (test-equal? "Test GET out of range forwards"
                        (test-pgm '(NEXT 19 SWAP NEXT 3 SWAP GET HALT))
                        '((3 19 2 3 3 2 4 1) 7 0 3 #t #f))
           (test-equal? "Test GET backwards"
                        (test-pgm '(NEXT 19 NEXT 4 SWAP DIRB GET HALT))
                        '((3 19 3 4 2 8 4 1) 7 19 4 #f #f))
           (test-equal? "Test GET out of range backwards"
                        (test-pgm '(NEXT 4 SWAP DIRB GET HALT))
                        '((3 4 2 8 4 1) 5 0 4 #f #f)))
         (test-case
           "Tests for SET"
           (test-equal? "Test SET forwards"
                        (test-pgm '(NEXT 1 SWAP NEXT 37 SET HALT 87))
                        '((3 1 2 3 37 5 1 37) 6 37 1 #t #f))
           (test-equal? "Test SET out of range forwards"
                        (test-pgm '(NEXT 3 SWAP NEXT 9 SET HALT))
                        '((3 3 2 3 9 5 1 0 0 9) 6 9 3 #t #f))
           (test-equal? "Test SET backwards"
                        (test-pgm '(NEXT 19 NEXT 6 SWAP NEXT 7 DIRB SET HALT))
                        '((3 7 3 6 2 3 7 8 5 1) 9 7 6 #f #f))
           (test-case
             "Test SET out of range backwards"
             (let ([d (- (TAPE_SIZE) 7)])
               (check-equal?
                 (test-pgm `(NEXT ,d SWAP NEXT 37 DIRB SET HALT))
                 `((3 ,d 2 3 37 8 5 1 0 0 0 0 37) 7 37 ,d #f #f)))))
         (test-case
           "Tests for IFGOTO and DIRF and DIRB"
           (test-equal? "Test IFGOTO no jump forwards"
                        (test-pgm '(IFGOTO HALT))
                        '((6 1) 1 0 0 #t #f))
           (test-equal? "Test IFGOTO no jump backwards"
                        (test-pgm '(DIRB IFGOTO HALT))
                        '((8 6 1) 2 0 0 #f #f))
           (test-equal? "Test IFGOTO forwards"
                        (test-pgm
                          '(NEXT 1 SWAP SUBTRACT NEXT 2 SWAP IFGOTO NEXT 97 HALT))
                        '((3 1 2 12 3 2 2 6 3 97 1) 10 1 2 #t #t))
           (test-equal? "Test IFGOTO backwards"
                        (test-pgm
                          '(NEXT HALT SWAP SUBTRACT NEXT 6 DIRB SWAP IFGOTO))
                        '((3 1 2 12 3 6 8 2 6) 1 1 6 #f #t))
           (test-equal?
             "Test IFGOTO overflow forwards"
             (test-pgm
               '(NEXT 5 SWAP NEXT HALT DIRB SET NEXT 1 SWAP SUBTRACT NEXT 3
                      SWAP DIRF IFGOTO))
             `(,(append '(1 5 2 3 1 8 5 3 1 2 12 3 3 2 7 6)
                        (build-list (- (TAPE_SIZE) 16)
                                    (lambda(a) 0)))
                0 1 3 #t #f))
           (test-equal?
             "Test IFGOTO overflow backwards"
             (test-pgm '(DIRB NEXT 5 SWAP NEXT HALT SET NEXT 14 SWAP IFGOTO))
             `(,(append '(1 3 5 2 3 1 5 3 14 2 6)
                        (build-list (- (TAPE_SIZE) 11)
                                    (lambda(a) 0)))
                0 5 14 #f #f)))
         (test-case
           "Tests for gpio"
           (test-equal? "Test readin"
                        (with-input-from-string
                          (list->string (list (integer->char 35)))
                          (thunk (test-pgm '(READIN HALT))))
                        '((9 1) 1 35 0 #t #f))
           (test-equal? 
             "test sendout"
             (with-output-to-string
               (thunk (check-equal? (test-pgm '(NEXT 23 SENDOUT HALT))
                                    '((3 23 10 1) 3 23 0 #t #f))))
             (list->string (list (integer->char 23)))))
         (test-case
           "Tests for math"
           (test-equal? "Standard addition"
                        (test-pgm '(NEXT 2 SWAP NEXT 7 ADD HALT))
                        '((3 2 2 3 7 11 1) 6 9 2 #t #f))
           (test-equal? "addition overflow"
                        (test-pgm `(NEXT ,(MAX_INT) SWAP NEXT 3 ADD HALT))
                        `((3 ,(MAX_INT) 2 3 3 11 1) 6 3 ,(MAX_INT) #t #t))
           (test-equal? "subtraction"
                        (test-pgm '(NEXT 2 SWAP NEXT 7 SUBTRACT HALT))
                        '((3 2 2 3 7 12 1) 6 5 2 #t #f))
           (test-equal? "subtraction underflow"
                        (test-pgm '(NEXT 9 SWAP NEXT 3 SUBTRACT HALT))
                        `((3 9 2 3 3 12 1) 6 ,(- (MAX_INT) 6) 9 #t #t)))
         ; TODO: test MAX_INT and TAPE_SIZE params
         )

