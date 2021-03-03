;;;;Lab 2 (Vechi)

;;;Ex 1
(defun x-putere-y-pozitiva (x y) "Functia ridica x la puterea y (daca y este pozitiv)"
    (if (= y 0)
        1
        (* x (x-putere-y-pozitiva x (- y 1)))
    )
)
(defun x-putere-y (x y) "Functia ridica x la puterea y"
    (if (>= y 0)
        (x-putere-y-pozitiva x y)
        (/ 1.0 (x-putere-y-pozitiva x (abs y)))
    )
)

;;;Ex 2
(defun xxyy (x y) "Functia calculeaza x*x*y*y"
    (* x (* x (* y y)))
)

;;;Ex 3
(defun nr-numere (l) "Functia calculeaza numarul de numere din lista 'l'"
    (if (null l)
        0
        (if (numberp (car l))
            (+ 1 (nr-numere (cdr l)))
            (nr-numere (cdr l))
        )
    )
)

;;;Ex 4
(defun aceleasi-elemente (l) "Functia determina daca lista 'l' contine acelasi element sau nu"
    (if (equalp (car l) (cadr l))
        (aceleasi-elemente (cdr l))
        (if (null (cdr l))
            T
            nil
        )
    )
)

;;;Ex 6
(defun concatenare-liste (l1 l2) "Functia concateneaza lista 'l2' la lista 'l1'"
    (if (null l1)
        l2
        (cons (car l1) (concatenare-liste (cdr l1) l2))
    )
)

;;;Ex 7
(defun factorial (n) "Functia calculeaza n!"
    (if (<= n 0)
        1
        (* n (factorial (- n 1)))
    )
)

;;;;Lab 2 (2021)

;;;Ex 1
(defun suma-numere (l) "Functia calculeaza suma numerelor din lista 'l'"
    (if (null l)
        0
        (if (numberp (car l))
            (+ (car l) (suma-numere (cdr l)))
            (suma-numere (cdr l))
        )
    )
)

;;;Ex 2 (Folosim "nr-numere" si "suma-numere" de mai sus)
(defun media-aritmetica (l) "Functia calculeaza media aritmetica a numerelor din lista 'l'"
    (setq nr (nr-numere l))
    (if (= nr 0)
        0
        (/ (suma-numere l) (float nr))
    )
)

;;;Ex 3
(defun sterge-prima-aparitie (l el) "Functia sterge prima aparitie a elemetului 'el' din lista 'l'"
    (if (or (null l) (equalp el (car l)))
        (cdr l)
        (cons (car l) (sterge-prima-aparitie (cdr l) el))
    )
)

;;;Ex 4
(defun elemente-pozitii-pare (l) "Functia returneaza lista formata din elementele de pe pozitiile pare din lista 'l'"
    (if (null (cdr l))
        nil
        (cons (cadr l) (elemente-pozitii-pare (cddr l)))
    )
)