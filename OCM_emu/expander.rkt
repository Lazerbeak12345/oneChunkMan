#lang racket
(require syntax/parse/define "runtime.rkt")
(provide #%datum)
(define-simple-macro (ocm-asm-dta num:nat pound dta:nat nl)
                     (list (cons num dta)))
(provide ocm-asm-dta)
(define-simple-macro (ocm-asm-inst num:nat colon inst:id nl)
                     ; inst is a reference to a number
                     (list (cons num (symbol->num (quote inst)))))
(provide ocm-asm-inst)
(define-simple-macro (ocm-asm-mb parse-tree:expr)
                     (#%module-begin parse-tree))
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define-syntax-parser
  ocm-asm-str
  [(_ num:nat data:string nl)
   #:fail-unless (= 1 (string-length (syntax-e #'data)))
   "string length is not one in implicit char"
   #`(list (cons num
                 #,(char->integer
                     (string-ref (syntax-e #'data) 0))))]
  [(_ start:nat range end:exact-positive-integer data:string nl)
   #:fail-unless (= ((syntax-e #'end)
                     . - .
                     (syntax-e #'start))
                    (string-length (syntax-e #'data)))
   "string ends are invalid"
   #`(list #,@(for/list ([num (in-range 0 ((syntax-e #'end)
                                           . - .
                                           (syntax-e #'start)))])
                        #`(cons #,num #,(char->integer
                                          (string-ref
                                            (syntax-e #'data)
                                            num)))))])
(provide ocm-asm-str)
;(require racket/cmdline)
;(provide (all-from-out racket/cmdline))
(define-simple-macro
  (ocm-asm items:expr ...)
  (let* ([pre-args (let ([a (current-command-line-arguments)])
                     (if (= (vector-length a) 0)
                         '#("run")
                         a))]
         [command (vector-ref pre-args 0)]
         [args (vector-drop pre-args 1)]
         [actualItems (apply append (for/list ([item (list items ...)]
                                               #:when (list? item))
                                              item))]
         [commandName (string-append
                        (path->string (find-system-path 'run-file))
                        " "
                        command)])
    (case command
      [("run" "r")
       (define new-bittage (BITTAGE))
       (define new-dbg-port (debugger-port))
       (command-line
         #:program commandName
         #:argv args
         #:once-each
         [("-B" "--bittage") => (lambda (flag arg)
                                  (set! new-bittage (string->number arg)))
                             '("Set the bittage of the emulator"
                               "the bittage")]
         [("-v" "--verbose")
          "Send debug output to stderr"
          (set! new-dbg-port (current-error-port))])
       (parameterize ([BITTAGE new-bittage]
                      [debugger-port new-dbg-port])
         (run-ocm-asm #:numbers (map cdr actualItems)))]
      [("memorydump" "dump" "md" "d")
       (define big-endian #f)
       (define new-bittage (BITTAGE))
       (command-line
         #:program commandName
         #:argv args
         #:once-each
         [("-b" "--big-endian")
          "Display in big endian form instead of little endian"
          (set! big-endian #t)]
         [("-B" "--bittage") => (lambda (flag arg)
                                  (set! new-bittage (string->number arg)))
                             '("Set the bittage of the memory dumper"
                               "the bittage")])
       (parameterize ([BITTAGE new-bittage])
         ; Read this from bottom to top
         ((compose1 displayln
                    (curryr string-join "\n")
                    (curry map (compose1 (if big-endian
                                             (compose1 list->string
                                                       reverse
                                                       string->list)
                                             identity)
                                         (curryr ~a
                                                 #:min-width (BITTAGE)
                                                 #:align 'right
                                                 #:left-pad-string "0")
                                         (curry format "~b")
                                         cdr)))
          actualItems))]
      [("help" "h" "?")
       ; TODO make this work
       (displayln (string-append "Try running the `run` or `memorydump`"
                                 " subcommands.\nEach of them also support the"
                                 " `-h` flag for help"))]
      [else (raise-user-error (format "`~a` is an invalid command. try `help`"
                                      command))])))
(provide ocm-asm)
; TODO unit test this all

