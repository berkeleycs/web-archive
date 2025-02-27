;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <False Values in Python (Mostly)>
;;;
;;; Description:
;;;   <Five falsy values
;;;    They must discover the truth
;;;    I saw orange vent>

(define (draw)
	(speed 0)
	(background)
	(penup)
	(gradient 0.25 0.5 0.5 -200 -100 -200 #t)
	(gradient 0.25 0.5 0.5 0 -100 0 #f)
	(penup)
	;(number_0 20 0 0 "#FFFFFF")
	;(quotes 20 0 0 "#FFFFFF")
	;(empty_list 20 0 0 "#FFFFFF")
	;(empty_dict 20 0 0 "#FFFFFF")
	;(letter_f_up 20 10 40 "#FFFFFF")
	;(letter_a 20 120 -10 "#FFFFFF")
	;(letter_l 20 160 40 "#FFFFFF")
	;(letter_s 20 280 -10 "#FFFFFF")
	;(letter_e 20 400 -10 "#FFFFFF")
	(setposition -40 -80)
	(right 90)
	(crewmate "#A90F0F" 1.5 True) (penup) (setposition -160 -70) (left 90) (pendown) ; red
    (crewmate "#0E7710" 1.2 True) (penup) (setposition -270 -60) (left 90) (pendown) ; green
    (crewmate "#3C1B6D" 1.05 True) (penup) (setposition 275 -60) (left 90) (pendown) ; purple
    (crewmate "#603E19" 1.05 False) (penup) (setposition 175 -70) (right 90) (pendown) ; brown
    (crewmate "#EF7D0E" 1.3 False) ; orange
    (penup)

    (number_0 4 5 14 "#FFFFFF")
    (quotes 4 -140 22 "#FFFFFF")
    (quotes 4 -110 22 "#FFFFFF")
    (empty_list 4 255 30 "#FFFFFF")
    (empty_dict 4 -232 30 "#FFFFFF")
    (quotes 4 83 32 "#FFFFFF")
    (letter_f_up 4 107 30 "#FFFFFF")
	(letter_a 4 127 20 "#FFFFFF")
	(letter_l 4 135 30 "#FFFFFF")
	(letter_s 4 159 20 "#FFFFFF")
	(letter_e 4 183 20 "#FFFFFF")
	(quotes 4 195 32 "#FFFFFF")

	(draw_crewmate_text)
	(define height 230)
	(letter_t_up 4 -312 height "#FFFFFF")
	(letter_h 4 -288 height "#FFFFFF")
	(letter_e 4 -264 (+ height 2) "#FFFFFF")
	(letter_r 4 -240 height "#FFFFFF")
	(letter_e 4 -216 (+ height 2) "#FFFFFF")

	(letter_i 4 -168 (+ height 2) "#FFFFFF")
	(letter_s 4 -144 (+ height 2) "#FFFFFF")

	(number_1 4 -96 (+ height 4) "#FB1C13")

	(letter_i_up 4 -48 (+ height 4) "#FB1C13")
	(letter_m 4 -24 height "#FB1C13")
	(letter_p 4 0 (+ height 2) "#FB1C13")
	(letter_o 4 24 height "#FB1C13")
	(letter_s 4 48 (+ height 2) "#FB1C13")
	(letter_t 4 64 (+ height 2) "#FB1C13")
	(letter_o 4 88 height "#FB1C13")
	(letter_r 4 112 height "#FB1C13")

	(letter_a 4 160 (+ height 2) "#FFFFFF")
	(letter_m 4 184 height "#FFFFFF")
	(letter_o 4 208 height "#FFFFFF")
	(letter_n 4 232 height "#FFFFFF")
	(letter_g 4 256 (+ height 2) "#FFFFFF")

	(letter_u 4 304 height "#FFFFFF")
	(letter_s 4 328 (+ height 2) "#FFFFFF")


  (exitonclick))
(define (draw_crewmate_text)
	(letter_C 16 -296 400 "#8DFFFF")
	(letter_r 16 -200 368 "#8DFFFF")
	(letter_e 16 -104 376 "#8DFFFF")
	(letter_w 16 -8 368 "#8DFFFF")
	(letter_m 16 88 368 "#8DFFFF")
	(letter_a 16 184 376 "#8DFFFF")
	(letter_t 16 248 376 "#8DFFFF")
	(letter_e 16 344 376 "#8DFFFF")
)
(define (draw_false)
	(letter_f_up 20 10 40 "#FFFFFF")
	(letter_a 20 120 -10 "#FFFFFF")
	(letter_l 20 160 40 "#FFFFFF")
	(letter_s 20 280 -10 "#FFFFFF")
	(letter_e 20 400 -10 "#FFFFFF")
)
(define (background)
	(color "#000000")
	(penup)
	(forward (/ (screen_height) 2))
	(left 90)
	(forward (/ (screen_width) 2))
	(pendown)
	(begin_fill)
	(right 180)
	(forward (screen_width))
	(right 90)
	(forward (screen_height))
	(right 90)
	(forward (screen_width))
	(right 90)
	(forward (screen_height))
	(end_fill)
)
(define (gradient rmax gmax bmax start_y end_y current_y direction_up)
	;(if (eq? current_y end_y) nil
	;(
	(setposition -500 current_y)
	(if direction_up
		(define portion (/ (- current_y start_y) (- end_y start_y)))
		(define portion (/ (- start_y current_y) (- start_y end_y))))
	(color (rgb (* portion rmax) (* portion gmax) (* portion bmax)))
	(pendown)
	(begin_fill)
	(setheading 90)
	(forward 1000)
	(if (eq? #t direction_up)
		(define delta 2)
		(define delta -2))
	(left 90)
	(forward delta)
	(left 90)
	(forward 1000)
	(end_fill)
	(if (eq? current_y end_y) nil
	(gradient rmax gmax bmax start_y end_y (+ current_y delta) direction_up))
)
(define (crewmate skincolor size direction)
  (define if_true_l90 '(if direction (left 90) (right 90)))
  (define if_true_r90 '(if direction (right 90) (left 90)))
  (begin_fill) (color skincolor) (backward (* size 80)) (eval if_true_r90) (forward (* size 22)) (eval if_true_l90) (forward (* size 24))
  (eval if_true_r90) (forward (* size 12)) (eval if_true_r90) (forward (* size 24)) (eval if_true_l90) (forward (* size 22))
  (eval if_true_l90) (forward (* size 60))
  (penup) (eval if_true_l90) (forward (* size 5)) (right 180) (end_fill)
  (forward (* size 5)) (eval if_true_l90) (forward (* size 24))
  (begin_fill) (color skincolor) (pendown) (circle (* size (if (eq? True direction) 28 -28)) 180) (forward (* size 5)) (eval if_true_r90) (forward (* size 10))
  (eval if_true_l90) (forward (* size 45)) (eval if_true_l90) (forward (* size 10)) (end_fill)
  (penup) (forward (* size 60)) (eval if_true_l90) (forward (* size 27)) (eval if_true_r90)
  (pendown) (color "#94C4DA") (begin_fill) (circle (* size (if (eq? True direction) 12 -12)) 180) (forward (* size 20)) (circle (* size (if (eq? True direction) 12 -12)) 180) (forward (* size 20)) (end_fill)

  (penup) (eval if_true_l90) (forward (* size 19)) (eval if_true_l90) (forward (* size 60)) (eval if_true_r90)

  (pendown) (color "black") (right 180) (forward (* size 80)) (eval if_true_l90) (forward (* size 22)) (eval if_true_l90) (forward (* size 24))
  (eval if_true_r90) (forward (* size 12)) (eval if_true_r90) (forward (* size 24)) (eval if_true_l90) (forward (* size 22))
  (eval if_true_l90) (forward (* size 60))
  (penup) (eval if_true_l90) (forward (* size 5)) (right 180)
  (forward (* size 5)) (eval if_true_l90) (forward (* size 24))
  (pendown) (circle (* size (if (eq? True direction) 28 -28)) 180) (forward (* size 5)) (eval if_true_r90) (forward (* size 10))
  (eval if_true_l90) (forward (* size 45)) (eval if_true_l90) (forward (* size 10))
  (penup) (forward (* size 60)) (eval if_true_l90) (forward (* size 27)) (eval if_true_r90)
  (pendown) (circle (* size (if (eq? True direction) 12 -12)) 180) (forward (* size 20)) (circle (* size (if (eq? True direction) 12 -12)) 180) (forward (* size 20))



 )


(define (draw_rect start_x start_y len_x len_y)
	(setposition start_x start_y)
	(begin_fill)
	(setheading 90)

	(forward len_x)
	(right 90)
	(forward len_y)
	(right 90)
	(forward len_x)
	(right 90)
	(forward len_y)
	(end_fill)
	(penup)
	)
; note - if space needs to be saved, arch can be generalized
;(define (arch_3 size x_pos y_pos arch_color)
;	(setposition x_pos y_pos)
;	(color arch_color)
;	(draw_rect x_pos y_pos size size)
;	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3)) (+ y_pos size) (* size 3) size)
;	(draw_rect (- x_pos (* size 3.5)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 4)) y_pos size size)
;	)
;(define (arch_2 size x_pos y_pos arch_color)
;	(setposition x_pos y_pos)
;	(color arch_color)
;	(draw_rect x_pos y_pos size size)
;	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 2)) (+ y_pos size) (* size 2) size)
;	(draw_rect (- x_pos (* size 2.5)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3)) y_pos size size)
;)
;(define (arch_2_5 size x_pos y_pos arch_color)
;	(setposition x_pos y_pos)
;	(color arch_color)
;	(draw_rect x_pos y_pos size size)
;	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 2.5)) (+ y_pos size) (* size 2.5) size)
;	(draw_rect (- x_pos (* size 3)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3.5)) y_pos size size)
;)
(define (arch arch_size size x_pos y_pos arch_color)
	(setposition x_pos y_pos)
	(color arch_color)
	(draw_rect x_pos y_pos size size)
	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
	(draw_rect (- x_pos (* size arch_size)) (+ y_pos size) (* size arch_size) size)
	(draw_rect (- x_pos (* size (+ arch_size 0.5))) (+ y_pos (/ size 2)) size size)
	(draw_rect (- x_pos (* size (+ arch_size 1))) y_pos size size)

)
; old letter C (variable size)
;(define (letter_C size x_pos y_pos letter_color)
;	; horizontal size: 5x size
;	; vertical size: 7x size
;	(setposition x_pos y_pos)
;	;(pendown)
;	(color letter_color)
;	(draw_rect x_pos y_pos size size)
;	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3)) (+ y_pos size) (* size 3) size)
;	(draw_rect (- x_pos (* size 3.5)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 4)) y_pos size (* size 5))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 4.5)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 5)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 4.5)) size size)
;	(draw_rect x_pos (- y_pos (* size 4)) size size)
;	)
(define (letter_C size x_pos y_pos letter_color)
	; horizontal size: 5x size
	; vertical size: 7x size
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(draw_rect x_pos y_pos size size)
	(draw_rect (- x_pos 8) (+ y_pos 8) size size)
	(draw_rect (- x_pos 48) (+ y_pos size) 48 size)
	(draw_rect (- x_pos 56) (+ y_pos 8) size size)
	(draw_rect (- x_pos 64) y_pos size 80)
	(draw_rect (- x_pos 56) (- y_pos 72) size size)
	(draw_rect (- x_pos 48) (- y_pos 80) 48 size)
	(draw_rect (- x_pos 8) (- y_pos 72) size size)
	(draw_rect x_pos (- y_pos 64) size size)
	)
(define (letter_r size x_pos y_pos letter_color)
	; horizontal size: 5x size
	; vertical size: 5x size
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(arch 2 size x_pos y_pos letter_color)
	(draw_rect (- x_pos (* size 3.5)) (- y_pos (/ size 2)) size size)
	(draw_rect (- x_pos (* size 4)) (+ y_pos size) size (* size 5))
)
(define (letter_e size x_pos y_pos letter_color)
	; horizontal size: 5x size
	; vertical size: 5x size
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(arch 3 size x_pos y_pos letter_color)
	(draw_rect (- x_pos (* size 4)) y_pos size (* size 3.5))
	(draw_rect (- x_pos (* size 4)) (- y_pos size) (* size 4.5) size)
	(draw_rect (+ x_pos (/ size 2)) (- y_pos size) (/ size 2) (/ size 2))
	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 3)) size size)
	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3.5)) (* size 3) size)
	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 3)) size size)
	(draw_rect (+ x_pos (/ size 2)) (- y_pos (* size 3)) (/ size 2) (/ size 2))
 )
;; old letter w with variable size
;(define (letter_w size x_pos y_pos letter_color)
;	; x - 5x size
;	; y - 5x size
;	(setposition x_pos y_pos)
;	;(pendown)
;	(color letter_color)
;	(draw_rect x_pos (+ y_pos size) size (* size 4))
;	(draw_rect (- x_pos (* size 4)) (+ y_pos size) size (* size 4))
;	(draw_rect (- x_pos (* size 2)) (- y_pos size) size (* size 2.5))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 2.5)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3)) size size)
;	(draw_rect (- x_pos size) (- y_pos (* size 3)) size size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 2.5)) size size)
;)  |#
(define (letter_w size x_pos y_pos letter_color)
	; x - 5x size
	; y - 5x size
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(draw_rect x_pos (+ y_pos size) size 64)
	(draw_rect (- x_pos 64) (+ y_pos size) size 64)
	(draw_rect (- x_pos 32) (- y_pos size) size 40)
	(draw_rect (- x_pos 56) (- y_pos 40) size size)
	(draw_rect (- x_pos 48) (- y_pos 48) size size)
	(draw_rect (- x_pos size) (- y_pos 48) size size)
	(draw_rect (- x_pos 8) (- y_pos 40) size size)
)
(define (letter_m size x_pos y_pos letter_color)
	; x, y - 5x
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(arch 3 size x_pos y_pos letter_color)
	(color "#000000")
	(draw_rect (- x_pos (* size 3)) (+ y_pos size) (/ size 2) (/ size 2))
	(color letter_color)
	(draw_rect (- x_pos (* size 4)) (+ y_pos size) size (* size 5))
	(draw_rect (- x_pos (* size 2)) y_pos size (* size 4))
	(draw_rect x_pos y_pos size (* size 4))

)
(define (letter_a size x_pos y_pos letter_color)
	; x - 5x, y - 5.5x
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(draw_rect x_pos y_pos size (* size 4.5))
	(draw_rect (- x_pos (/ size 2)) (+ y_pos (/ size 2)) size size)
	(draw_rect (- x_pos (* size 3)) (+ y_pos size) (* size 3) size)
	(arch 3 size x_pos (- y_pos (* size 2)) letter_color)
	(draw_rect (- x_pos (* size 4)) (- y_pos (* size 2)) size (* size 2))
	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 3)) size size)
	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3.5)) (* size 3) size)
	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 3)) size size)
	(color "#000000")
	(draw_rect (- x_pos (/ size 2)) (- y_pos size) (/ size 2) (/ size 2))
	(color letter_color)

)

(define (letter_t size x_pos y_pos letter_color)
	; x - 3x, y - 6.5x
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(draw_rect (- x_pos (* size 2)) (+ y_pos (/ size 2)) (* size 3) size)
	(draw_rect (- x_pos size) (+ y_pos (* size 2)) size (* size 5.5))
	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 3)) size size)
	(draw_rect x_pos (- y_pos (* size 3.5)) size size)

)

; old uppercase letter T
;(define (letter_t_up size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	;(pendown)
;	(color letter_color)
;	(draw_rect (- x_pos (* size 4)) (+ y_pos (* size 2.5)) (* size 5) size)
;	(draw_rect (- x_pos (* size 2)) (+ y_pos (* size 2.5)) size (* size 6.5))

;)
(define (letter_t_up size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	;(pendown)
	(color letter_color)
	(draw_rect (- x_pos 16) (+ y_pos 10) 20 size)
	(draw_rect (- x_pos 8) (+ y_pos 10) size 26)

)
; old letter h
;(define (letter_h size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(draw_rect x_pos (- y_pos (/ size 2)) size (* size 3.5))
;	(draw_rect (- x_pos (* size 4)) (+ y_pos (* size 2.5)) size (* size 6.5))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3)) y_pos size size)
;	(draw_rect (- x_pos (* size 2.5)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 2)) (+ y_pos size) (* size 1.5) size)
;	(draw_rect (- x_pos (* size 1)) (+ y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (/ size 2)) y_pos size size)

;)
(define (letter_h size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect x_pos (- y_pos 2) size 14)
	(draw_rect (- x_pos 16) (+ y_pos 10) size 26)
	(draw_rect (- x_pos 14) (- y_pos 2) size size)
	(draw_rect (- x_pos 12) y_pos size size)
	(draw_rect (- x_pos 10) (+ y_pos 2) size size)
	(draw_rect (- x_pos 8) (+ y_pos size) 6 size)
	(draw_rect (- x_pos 4) (+ y_pos 2) size size)
	(draw_rect (- x_pos 2) y_pos size size)

)
; old letter i
;(define (letter_i size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(draw_rect (- x_pos (* size 2)) y_pos (* size 2) size)
;	(draw_rect (- x_pos size) (+ y_pos (* size 2)) size size)
;	(draw_rect (- x_pos size) y_pos size (* size 3.5))
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 3)) size size)
;	(draw_rect x_pos (- y_pos (* size 3.5)) size size)
;)
(define (letter_i size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect (- x_pos 8) y_pos 8 size)
	(draw_rect (- x_pos size) (+ y_pos 8) size size)
	(draw_rect (- x_pos size) y_pos size 14)
	(draw_rect (- x_pos 2) (- y_pos 12) size size)
	(draw_rect x_pos (- y_pos 14) size size)
)
; old letter s
;(define (letter_s size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(arch 3 size x_pos y_pos letter_color)
;	(draw_rect (- x_pos (* size 3.5)) (+ y_pos (/ size 2)) size (* size 2))
;	(draw_rect (- x_pos (* size 2.5)) (- y_pos size) (* size 1.5) size)
;	(draw_rect (- x_pos (* size 1.5)) (- y_pos (* size 1.5)) (* size 1.5) size)
;	(draw_rect (- x_pos (* size 4)) (- y_pos (* size 2.5)) size size)
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 3)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3.5)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 2)) size (* size 2))
;	(draw_rect x_pos (- y_pos (* size 2.5)) size size)
;)

(define (letter_s size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(arch 3 size x_pos y_pos letter_color)
	(draw_rect (- x_pos 14) (+ y_pos 2) size 8)
	(draw_rect (- x_pos 10) (- y_pos size) 6 size)
	(draw_rect (- x_pos 6) (- y_pos 6) 6 size)
	(draw_rect (- x_pos 16) (- y_pos 10) size size)
	(draw_rect (- x_pos 14) (- y_pos 12) size size)
	(draw_rect (- x_pos 12) (- y_pos 14) 12 size)
	(draw_rect (- x_pos 2) (- y_pos 8) size 8)
	(draw_rect x_pos (- y_pos 10) size size)
)
; old number 1
;(define (number_1 size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(draw_rect (- x_pos size) (+ y_pos (* size 2)) size (* size 7))
;	(draw_rect (- x_pos (* size 1.5)) (+ y_pos (* size 1.5)) size size)
;	(draw_rect (- x_pos (* size 2)) (+ y_pos size) size size)
;	(draw_rect (- x_pos (* size 2)) (- y_pos (* size 4)) (* size 3) size)
;)
(define (number_1 size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect (- x_pos size) (+ y_pos 8) size 28)
	(draw_rect (- x_pos 6) (+ y_pos 6) size size)
	(draw_rect (- x_pos 8) (+ y_pos size) size size)
	(draw_rect (- x_pos 8) (- y_pos 16) 12 size)
)
; old uppercase I
;(define (letter_i_up size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(draw_rect (- x_pos (* size 2)) (+ y_pos (* size 2)) (* size 3) size)
;	(draw_rect (- x_pos (* size 2)) (- y_pos (* size 4)) (* size 3) size)
;	(draw_rect (- x_pos size) (+ y_pos (* size 2)) size (* size 7))
;)
(define (letter_i_up size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect (- x_pos 8) (+ y_pos 8) 12 size)
	(draw_rect (- x_pos 8) (- y_pos 16) 12 size)
	(draw_rect (- x_pos size) (+ y_pos 8) size 28)
)
; old letter p
;(define (letter_p size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(arch 2.5 size x_pos (+ y_pos (/ size 2)) letter_color)
;	(draw_rect (- x_pos (* size 4)) (+ y_pos (* size 1.5)) size (* size 6))
;	(draw_rect x_pos (+ y_pos (/ size 2)) size (* size 2.5))
;	(draw_rect (- x_pos (* size 2.5)) (- y_pos (* size 2)) (* size 2.5) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 1.5)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 1.5)) size size)
;	(draw_rect (- x_pos (* size 3.5)) y_pos size (* size 2.5))
;)
(define (letter_p size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(arch 2.5 size x_pos (+ y_pos 2) letter_color)
	(draw_rect (- x_pos 16) (+ y_pos 6) size 24)
	(draw_rect x_pos (+ y_pos 2) size 10)
	(draw_rect (- x_pos 10) (- y_pos 8) 10 size)
	(draw_rect (- x_pos 2) (- y_pos 6) size size)
	(draw_rect (- x_pos 12) (- y_pos 6) size size)
	(draw_rect (- x_pos 14) y_pos size 10)
)
; old letter o
;(define (letter_o size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(arch 3 size x_pos y_pos letter_color)
;	(draw_rect x_pos y_pos size (* size 3))
;	(draw_rect (- x_pos (* size 4)) y_pos size (* size 3))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 2.5)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 2.5)) size size)
;)
(define (letter_o size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(arch 3 size x_pos y_pos letter_color)
	(draw_rect x_pos y_pos size 12)
	(draw_rect (- x_pos 16) y_pos size 12)
	(draw_rect (- x_pos 14) (- y_pos 10) size size)
	(draw_rect (- x_pos 12) (- y_pos 12) 12 size)
	(draw_rect (- x_pos 2) (- y_pos 10) size size)
)
(define (letter_n size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(letter_m size x_pos y_pos letter_color)
	(color "#000000")
	(draw_rect (- x_pos (* size 2.1)) y_pos (* size 1.1) (* size 5))
)
; old letter g
;(define (letter_g size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(arch 3 size x_pos (+ y_pos (/ size 2)) letter_color)
;	(draw_rect (- x_pos (* size 4)) y_pos size size)
;	(draw_rect x_pos y_pos size (* size 3.5))
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (/ size 2)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos size) (* size 2.5) size)
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 3)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3.5)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 3)) size size)
;)
(define (letter_g size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(arch 3 size x_pos (+ y_pos 2) letter_color)
	(draw_rect (- x_pos 16) y_pos size size)
	(draw_rect x_pos y_pos size 14)
	(draw_rect (- x_pos 2) (- y_pos 2) size size)
	(draw_rect (- x_pos 14) (- y_pos 2) size size)
	(draw_rect (- x_pos 12) (- y_pos size) 10 size)
	(draw_rect (- x_pos 14) (- y_pos 12) size size)
	(draw_rect (- x_pos 12) (- y_pos 14) 12 size)
	(draw_rect (- x_pos 2) (- y_pos 12) size size)
)
; old letter u
;(define (letter_u size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(draw_rect x_pos (+ y_pos size) size (* size 4))
;	(draw_rect (- x_pos (* size 4)) (+ y_pos size) size (* size 4))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 2.5)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 3)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 2.5)) size size)
;)
(define (letter_u size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect x_pos (+ y_pos size) size 16)
	(draw_rect (- x_pos 16) (+ y_pos size) size 16)
	(draw_rect (- x_pos 14) (- y_pos 10) size size)
	(draw_rect (- x_pos 12) (- y_pos 12) 12 size)
	(draw_rect (- x_pos 2) (- y_pos 10) size size)
)
;; old number 0
;(define (number_0 size x_pos y_pos letter_color)
;	(setposition x_pos y_pos)
;	(color letter_color)
;	(arch 3 size x_pos y_pos letter_color)
;	(draw_rect x_pos y_pos size (* size 4.5))
;	(draw_rect (- x_pos (* size 4)) y_pos size (* size 4.5))
;	(draw_rect (- x_pos (* size 3.5)) (- y_pos (* size 4)) size size)
;	(draw_rect (- x_pos (* size 3)) (- y_pos (* size 4.5)) (* size 3) size)
;	(draw_rect (- x_pos (/ size 2)) (- y_pos (* size 4)) size size)
;)
(define (number_0 size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(arch 3 size x_pos y_pos letter_color)
	(draw_rect x_pos y_pos size 18)
	(draw_rect (- x_pos 16) y_pos size 18)
	(draw_rect (- x_pos 14) (- y_pos 16) size size)
	(draw_rect (- x_pos 12) (- y_pos 18) 12 size)
	(draw_rect (- x_pos 2) (- y_pos 16) size size)
)
(define (quotes size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect x_pos y_pos (/ size 2) (* size 2))
	(draw_rect (- x_pos size) y_pos (/ size 2) (* size 2))
)
(define (empty_list size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect x_pos y_pos size (* size 5))
	(draw_rect (- x_pos size) y_pos (* size 2) size)
	(draw_rect (- x_pos (* size 4)) y_pos (* size 2) size)
	(draw_rect (- x_pos (* size 4)) y_pos size (* size 5))
	(draw_rect (- x_pos size) (- y_pos (* size 4)) (* size 2) size)
	(draw_rect (- x_pos (* size 4)) (- y_pos (* size 4)) (* size 2) size)
)
(define (empty_dict size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(empty_list size x_pos y_pos letter_color)
	(draw_rect (+ x_pos size) (- y_pos (* size 2)) size size)
	(draw_rect (- x_pos (* size 5)) (- y_pos (* size 2)) size size)
)
(define (letter_f_up size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect (- x_pos (* size 4)) y_pos (* size 5) size)
	(draw_rect (- x_pos (* size 4)) (- y_pos (* size 3)) (* size 4) size)
	(draw_rect (- x_pos (* size 4)) y_pos size (* size 7))
)
(define (letter_l size x_pos y_pos letter_color)
	(setposition x_pos y_pos)
	(color letter_color)
	(draw_rect x_pos y_pos size (* size 7))
)
; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)