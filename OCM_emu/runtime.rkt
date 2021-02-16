#lang racket/base
(require racket/list racket/function)
(module+ test (require rackunit))
(provide symbol->num num->instruction run-ocm-asm)
(define (symbol->num sym)
  (case sym
    [(SW) 0]
    [(IO) 1]
    [(MATH) 2]
    [(IFG)  3]
    [(DIR)  4]
    [(NEX)  5]
    [(SET)  6]
    [(GET)  7]
    [else (raise-syntax-error sym "unknown instruction!")]))
(define (num->instruction num)
  (case num
    [(0) 'SW]
    [(1) 'IO]
    [(2) 'MATH]
    [(3) 'IFG]
    [(4) 'DIR]
    [(5) 'NEX]
    [(6) 'SET]
    [(7) 'GET]
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
         (for ([inst '(SW IO MATH IFG DIR NEX SET GET)])
              (check-eqv? inst (inst->inst inst)))
         (define (instnum->instnum instnum)
           (symbol->num (num->instruction instnum)))
         (for ([instnum (in-range 0 7)])
              (check-eqv? instnum (instnum->instnum instnum))))
(define (run-ocm-asm #:numbers numbers
                     #:pgm-counter [pgm-counter 0]
                     #:reg-A [reg-A 0]
                     #:reg-B [reg-B 0]
                     #:direction [DIRECTION #t]
                     #:overflow [overflow #f])
  (define inst-v (list-ref numbers pgm-counter))
  (display (format "tape-loc: ~a" pgm-counter))
  (define inst (num->instruction inst-v))
  (displayln (format "\t[@] ~a(~a)\t[A] ~a\t[B] ~a\t{DIRECTION} ~a"
                     inst-v
                     inst
                     reg-A
                     reg-B
                     DIRECTION))
  (displayln (format "memory dump: ~a" numbers))
  (define (wait-for-POWER)
    (displayln "{POWER}?")
    (displayln "{POWER} is on"))
  (define {PREPAREHOP}
    (displayln "{PREPAREHOP}")
    (set! pgm-counter (modulo ((if DIRECTION + -)
                               reg-B
                               pgm-counter)
                              (length numbers))))
  (define {GO}
    (displayln "{GO}")
    (wait-for-POWER)
    (displayln "next instruction")
    (run-ocm-asm #:numbers numbers
                 #:pgm-counter pgm-counter
                 #:reg-A reg-A
                 #:reg-B reg-B
                 #:direction DIRECTION
                 #:overflow overflow))
  (define {ROTF}
    (displayln "{ROTF}")
    (set! pgm-counter (modulo (+ 1 pgm-counter)
                              (length numbers))))
  (define {STEP}
    (displayln "{STEP}")
    {ROTF}
    {GO})
  (define {SETA}
    (displayln "{SETA}")
    (set! reg-A (list-ref numbers pgm-counter)))
  (define {UNHOPSTEP}
    (displayln "{UNHOPSTEP}")
    (set! DIRECTION (not DIRECTION))
    {PREPAREHOP}
    (set! DIRECTION (not DIRECTION))
    {STEP})
  ; TODO catch errors and do a memory dump
  (case inst
    [(SW) (define tmp reg-A)
          (set! reg-A reg-B)
          (set! reg-B tmp)
          {STEP}]
    [(IO) (display (format "new <OUT>: '~a' ~a\n set <IN>: "
                           (integer->char reg-A)
                           reg-A))
          (set! reg-B (char->integer (read-char)))
          {STEP}]
    [(MATH) (set! reg-A (+ 1 reg-A))
            (set! reg-B (- 1 reg-B))
            {STEP}]
    [(IFG) (if (= 0 reg-A)
               (begin {PREPAREHOP}
                      {GO})
               {STEP})]
    [(DIR) (set! DIRECTION (= 0 reg-A))
           (displayln (format "{DIRECTION} set to ~a" DIRECTION))
           {STEP}]
    [(NEX) {ROTF}
           {SETA}
           {STEP}]
    [(SET) {PREPAREHOP}
           (set! numbers (list-set numbers pgm-counter reg-A))
           {UNHOPSTEP}]
    [(GET) {PREPAREHOP}
           {SETA}
           {UNHOPSTEP}]
    [else (raise-syntax-error inst "instruction not written yet!")]))

