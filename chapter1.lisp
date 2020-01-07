; 1.1 
(= (+ 5 3 4 )  12)
(= (- 9 1) 8)
(= (/ 6 2) 3)
(= (+ (* 2 4) (- 4 6)) 6)
(define a 3)
(define b (+ a 1))
(= (+ a b (* a b)) 19)
(= a b) ; #f
(= (if (and (> b a) (< b (* a b)))
	b
	a
	) b)

(= (cond ((= a 4) 6)
		((= b 4) (+ 6 7 a))
		(else 25)
	) 16)

(= (+ 2 (if (> b a) b a)) 6)
(= (* (cond ((> a b) a)
			((< a b) b)
			(else -1))
	  (+ a 1)) 16)

; 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5)))) (* 3 (- 6 2) (- 2 7)) )

; 1.3

(define (square x) (* x x))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (biggest x y z)
	(cond ((and (> x y) (> x z)) x)
		  ((and (> y x) (> y z)) y)
		  (else z))) 

(define (second_after_biggest x y z biggest_num)
	(cond ((= x biggest_num) (if (> y z) y z))
		  ((= y biggest_num) (if (> x z) x z))
		  ((= z biggest_num) (if (> x y) x y))
		))

(define (biggest_pair_square_sum_of_three x y z) 
	(sum_of_squares  (biggest x y z) (second_after_biggest x y z (biggest x y z))))

; 1.4
(define (a-plus-abs-b a b) 
	((if (> b 0) + - ) a b))

;1.5
(define (p) (p)) ; recursion function

(define (test x y)
	(if (= x 0)
		0
		y))

(test 0 (p)) ; тест на определения порядка вычисления аргументов функции
; нормальный порядок вычисления - полное подставление аргументов, аппликативный - сначала вычисляем аргументы, затем применяем к ним функцию
; если порядок вычисления аппликативный, то будет уход в рекурсию. 
; если порядок нормальный, то результат функции будет 0. В лиспе аппликативный порядок
