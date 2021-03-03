;;;;Lab 2 (Vechi)

;;;Ex1
;;;Functie pentru puteri pozitive
(defun x-putere-y-poz (x y)
    (if (<= y 0)
        1
        (* x (x-putere-y x (- y 1)))
    )
)

;;;Functie pentru ridicarea la putere
(defun x-putere-y (x y)
    (if (< y 0)
        (/ 1.0 (x-putere-y-poz x (abs y)))
        (x-putere-y-poz x y)
    )
)

;;;Ex2
(defun xxyy (x y)
    (* x (* x (* y y)))
)

;;;Ex3
(defun nr-numere (l)
    (if (null l)
        0
        (if (numberp (car l))
            (+ 1 (nr-numere (cdr l)))
            (nr-numere (cdr l))
        )
    )
)

;;;Ex4
(defun aceleasi-elemente (l)
    (if (equalp (car l) (cadr l))
        (aceleasi-elemente (cdr l))
        (if (equalp (cdr l) nil) ;am gasit o neregula
            T ;am ajuns la finalul listei
            nil ;nu am ajuns la finalul listei
        )
    )
)


;;;Ex6
(defun concatenare-liste (l1 l2)
    (if(null l1)
        l2
        (cons (car l1) (concatenare-liste (cdr l1) l2))
    )
)

;;;Ex7
(defun factorial (n)
    (if (<= n 0)
        1
        (* n (factorial (- n 1)))
    )
)


;;;;Lab 2 (2021)

;;;Ex1
(defun suma-lista(l) "Calculeaza suma numerelor din lista 'l'"
    (if (null l)
        0
        (if (numberp (car l))
            (+ (car l) (suma-lista (cdr l)))
            (+ 0 (suma-lista (cdr l)))
        )
    )
)


;;;Ex2 (folosum "nr-numere" de mai sus)
(defun medie-aritmetica (l) "Calculeaza media aritmetica a numerelor din lista 'l'"
    (/ (suma-lista l) (nr-numere l))
)

;;;Ex3
(defun stergere-element (l el) "Sterge prima aparitie a lui 'el' in lista 'l' "
    (if (or (null l) (equalp el (car l)))
        (cdr l)
        (cons (car l) (stergere-element (cdr l) el))
    )
)

;;;Ex4
(defun elemente-pozitii-pare (l) "Returneaza lista cu elementele de pe pozitiile pare"
    (if (or (null l) (equalp (cadr l) nil))
        nil
        (cons (cadr l) (elemente-pozitii-pare (cddr l)))
    )
)

