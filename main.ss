#lang scheme
(require net/url
         net/base64)

(define (tweet! username password status)
  (define tweet-url
    (make-url "http"
              #f
              "twitter.com"
              80
              #t
              (list (make-path/param "statuses" empty)
                    (make-path/param "update.xml" empty))
              (list (cons 'status status))
              #f))
  (define basic-auth-token
    (bytes->string/utf-8 (base64-encode (string->bytes/utf-8 (format "~a:~a" username password)))))
  (close-input-port
   (post-pure-port 
    tweet-url 
    #f
    (list (format "Authorization: Basic ~a"
                  basic-auth-token)))))

(provide/contract
 [tweet! (string? string? (string-len/c 140) . -> . void)])