#lang racket
(require plot)

(define words (file->lines "english-words/words_alpha.txt"))
(define (n-words n)
  (for/list ([line words]
             #:when (eq? (string-length line) n))
    line))

(define longest-word-length
  (apply max (map (lambda (w) (string-length w))
            words)))

(plot (discrete-histogram
       (for/list ([n (in-inclusive-range 1 longest-word-length)])
         (vector n (length (n-words n))))))

(plot (discrete-histogram
       (for/list ([n (in-inclusive-range 1 longest-word-length)])
         (vector n (* 100.0 (- 1 (/ (length (n-words n)) (expt 26 n))))))))

#|
(define 2-words (n-words 2))
(define 3-words (n-words 3))

(plot
    (points (for/list ([word 2-words])
              (for/list ([c word])
                (- (char->integer c) 96.5)))
            #:sym 'fullsquare
            #:size 18
            #:color "black")
    #:x-min 0 #:x-max 26 #:y-min 0 #:y-max 26)

(plot3d
    (points3d (for/list ([word 3-words])
                (for/list ([c word])
                  (- (char->integer c) 96.5)))
              #:sym 'fullsquare
              #:size 18
              #:alpha 0.4
              #:color "blue")
    #:x-min 0 #:x-max 26 #:y-min 0 #:y-max 26 #:z-min 0 #:z-max 26)
|#

