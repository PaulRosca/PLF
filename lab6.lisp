;3-4
(defun fractie (x)
(rational x)
)
;1
(defun numarator (x)
    (numerator (fractie x))
)
;2
(defun numitor (x)
    (denominator (fractie x))
)
;4 invers
(defun decimal (x)
    (floor (fractie x))
)
;5
(defun rationale-egale (x y)
    (equalp (fractie x) (fractie y))
)
;6
(defun adunare-rationale (x y)
    (+ (fractie x) (fractie y))
)
(defun scadere-rationale (x y)
    (- (fractie x) (fractie y))
)
(defun inmultire-rationale (x y)
    (* (fractie x) (fractie y))
)
(defun impartire-rationale (x y)
    (/ (fractie x) (fractie y))
)

