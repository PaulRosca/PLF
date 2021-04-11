(setq vocale '(a e i o u))
(defun vocala (x v)
    (if (null v)
        nil
        (if (equalp x (car v))
            T
            (vocala x (cdr v))
        )
    )
)
(defun sterge-vocale (l)
    (if (null l)
        nil
        (if (vocala (car l) vocale)
            (sterge-vocale (cdr l))
            (cons (car l) (sterge-vocale (cdr l)))
        )
    )
)
(defun patrat (x)
    (* x x)
)
(defun suma-patrate (l)
    (if (null l)
        0
        (if (numberp (car l))
            (+ (patrat (car l)) (suma-patrate (cdr l)))
            (suma-patrate (cdr l))
        )
    )
)

(defun suma-patrate-fr (l &optional (s 0))
    (if (null l)
        s
        (if (numberp (car l))
            (suma-patrate-fr (cdr l) (+ s (patrat (car l))))
            (suma-patrate-fr (cdr l) s)
        )
    )
)

(defun palindroame-aux (l1 l2)
    (if (or (null l1) (null l2))
        (if (or (> (length l2) 1) (> (length l1) 1))
            NIL
            T
        )
        (if (palindroame-aux (cdr l1) (cdr l2))
            (equalp (car l1) (car l2))
            NIL
        )
    )
)
(defun palindroame (l1 l2)
    (palindroame-aux l1 (reverse l2))
)

