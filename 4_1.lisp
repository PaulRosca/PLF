(defun prezent (at expr-at)
    (if (listp expr-at)
        (mapcar (lambda (e) (egale at e)) expr-at)
        (equalp at expr-at)
    )
)