(define (accumulate-tail combiner start n term)
  (define (accum-helper x so-far)
    (if (= x 0)
        so-far
        (accum-helper (- x 1) (combiner (term x) so-far))))
  (accum-helper n start))

; ALT solution
(define (accumulate-tail combiner start n term)
  (if (= n 0)
      start
      (accumulate-tail combiner
                       (combiner (term n) start)
                       (- n 1)
                       term)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

; derive returns the derivative of EXPR with respect to VAR
(define (derive expr var)
  (cond 
    ((number? expr)
     0)
    ((variable? expr)
     (if (same-variable? expr var)
         1
         0))
    ((sum? expr)
     (derive-sum expr var))
    ((product? expr)
     (derive-product expr var))
    ((exp? expr)
     (derive-exp expr var))
    (else
     'Error)))

; Variables are represented as symbols
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eqv? v1 v2)))

; Numbers are compared with =
(define (=number? expr num)
  (and (number? expr) (= expr num)))

; Sums are represented as lists that start with +.
(define (make-sum a1 a2)
  (cond 
    ((=number? a1 0)                 a2)
    ((=number? a2 0)                 a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else                            (list '+ a1 a2))))

(define (sum? x)
  (and (list? x) (eqv? (car x) '+)))

(define (first-operand s) (cadr s))

(define (second-operand s) (caddr s))

; Products are represented as lists that start with *.
(define (make-product m1 m2)
  (cond 
    ((or (=number? m1 0) (=number? m2 0))
     0)
    ((=number? m1 1)
     m2)
    ((=number? m2 1)
     m1)
    ((and (number? m1) (number? m2))
     (* m1 m2))
    (else
     (list '* m1 m2))))

(define (product? x)
  (and (list? x) (eqv? (car x) '*)))

; You can access the operands from the expressions with
; first-operand and second-operand
(define (first-operand p) (cadr p))

(define (second-operand p) (caddr p))

(define (derive-sum expr var)
  (make-sum (derive (first-operand expr) var)
            (derive (second-operand expr) var)))

(define (derive-product expr var)
  (make-sum
   (make-product (derive (first-operand expr) var)
                 (second-operand expr))
   (make-product (first-operand expr)
                 (derive (second-operand expr) var))))

; Exponentiations are represented as lists that start with ^.
(define (make-exp base exponent)
  (cond 
    ((= exponent 0)
     1)
    ((= exponent 1)
     base)
    ((and (number? base) (integer? exponent))
     (expt base exponent))
    (else
     (list '^ base exponent))))

(define (exp? exp)
  (and (list? exp) (eqv? (car exp) '^)))

(define x^2 (make-exp 'x 2))

(define x^3 (make-exp 'x 3))

(define (derive-exp exp var)
  (let ((b (first-operand exp))
        (n (second-operand exp)))
    (if (number? n)
        (let
         ((first (make-product n (make-exp b (- n 1)))))
         (make-product first (derive b var))) ; ; Note: Chain rule isn't tested by ok.
        'unknown)))
