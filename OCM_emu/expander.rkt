#lang racket
(require syntax/parse/define "encodings.rkt" "runtime.rkt")
(provide #%datum)
(define-simple-macro (ocm-asm-dta pound dta:nat nl)
                     (list dta))
(provide ocm-asm-dta)
(define-simple-macro (ocm-asm-inst colon inst:id nl)
                     ; inst is a reference to a number
                     (list (symbol->num (quote inst))))
(provide ocm-asm-inst)
(define-simple-macro (ocm-asm-mb parse-tree:expr)
                     (#%module-begin parse-tree))
(provide (rename-out [ocm-asm-mb #%module-begin]))
(define-syntax-parser
  ocm-asm-str
  [(_ data:string nl)
   #:fail-unless (1 . = . (string-length (syntax-e #'data)))
   "string length is not one in implicit char"
   #`(if ((BITTAGE) . <= . 6)
         (begin
           (displayln (format "encodeita2 ~a" data))
           (list (encode-ITA_2 data)))
         (list (char->integer (string-ref data 0))))]
  [(_ data:string nl)
   #`(apply append
            (list #,@(for/list ([num (in-range 0 (syntax-e #'len))])
                               #`(let ([char (string-ref data #,num)])
                                   (if ((BITTAGE) . <= . 6)
                                     (encode-ITA_2 (list->string (list char)))
                                     (list (char->integer char)))))))])
(provide ocm-asm-str)
(define-simple-macro
  (ocm-asm items:expr ...)
  (let* ([pre-args (let ([a (current-command-line-arguments)])
                     (if ((vector-length a) . = . 0)
                         '#("run")
                         a))]
         [command (vector-ref pre-args 0)]
         [args (vector-drop pre-args 1)]
         [actualItems
           (thunk
             (let* ([theItems (apply append (for/list ([item (list items ...)]
                                                       #:when (list? item))
                                                      item))]
                    [len (length theItems)]
                    [iteration-count -1])
               (if (len . > . ((RAM_SIZE)))
                   (raise-user-error "The provided program is too long" len)
                   (for/list ([item theItems])
                             (set! iteration-count (iteration-count . + . 1))
                             (when (item . > . ((MAX_INT)))
                               (raise-user-error
                                 (format
                                   "The item at ~a in memory is too large"
                                   iteration-count)
                                 item))
                             item))))]
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
         (run-ocm-asm #:numbers (list->vector (actualItems)))
         ; Prevents printing when we don't need to
         (void))]
      [("memorydump" "dump" "md" "d")
       (define big-endian #f)
       (define decimal #f)
       (define new-bittage (BITTAGE))
       (command-line
         #:program commandName
         #:argv args
         #:once-each
         [("-d" "--decimal")
          "Print decimal numbers instead of binary numbers. Ignores flags relating to binary"
          (set! decimal #t)]
         [("-b" "--big-endian")
          "Display in big endian form instead of little endian"
          (set! big-endian #t)]
         [("-B" "--bittage") => (lambda (flag arg)
                                  (set! new-bittage (string->number arg)))
                             '("Set the bittage of the memory dumper"
                               "the bittage")])
       ; Read this from bottom to top
       ((compose1 displayln
                  (curryr string-join "\n")
                  (curry map
                         (if decimal
                             ~a
                             (compose1 (if big-endian
                                           (compose1 list->string
                                                     reverse
                                                     string->list)
                                           identity)
                                       (curryr ~a
                                               #:min-width new-bittage
                                               #:align 'right
                                               #:left-pad-string "0")
                                       (curry format "~b")))))
        (parameterize ([BITTAGE new-bittage])
          (actualItems)))]
      [("help" "h" "?" "-h" "--help")
       ; TODO make this work
       (displayln (string-append "Try running the `run` or `memorydump`"
                                 " subcommands.\nEach of them also support the"
                                 " `-h` flag for help"))]
      [else (raise-user-error (format "`~a` is an invalid command. try `help`"
                                      command))])))
(provide ocm-asm)
; TODO unit test this all
