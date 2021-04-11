(setq casa '());Initializam casa ca fiind goala

(defun adaugare-camera-obiecte (camera &rest obiecte)
"Functia adauga o camera in casa si eventual si obiectele din camera"
    (setq casa (cons (cons camera (mapcar 'list obiecte)) casa))
)

(defun adaugare-atribut-obiect-camera (camera obiect atribut valoare-atribut)
"Functia adauga unui obiect dintr-o camera, un atribut cu o valoare (ex 'sufragerie 'masa 'pret 100)" 
    (setq casa-act '())
    (dolist (cm casa) ;iteram prin toate camerele casei
        (if (equalp (car cm) camera) ;daca am ajuns la camera pe care dorim sa o actualizam
            (setq casa-act (cons (block in-camera
                            (setq camera-act (list (car cm))); adaugam numele camerei la camera actualizata
                            (dolist (ob (cdr cm)); iteram prin obiectele camerei
                                (if (equalp (car ob) obiect); daca am gasit obiectul la care dorim sa i adaugam atributul
                                    ; Adaugam la camera actualizata obiectul actualizat cu noul atribut
                                    (setq camera-act (append camera-act (list (cons (car ob) (list (append (list (list atribut valoare-atribut)) (cadr ob)))))))
                                    (setq camera-act (append camera-act (list ob))); Altfel adaugam obiectul nemodificat
                                )
                            )
                            (return-from in-camera camera-act)
            ) casa-act))
            (setq casa-act (cons cm casa-act));altfel punem camera in acelasi forma inapoi in casa
        )
    )
    (setq casa (reverse casa-act)); Actualizam informatiile din casa
)

(defun planul-casei ()
"Functia afiseaza toate camerele casei, obiectele din acestea si atributele obiectelor respective"
    (format T "Am intrat in casa.")
    (dolist (camera casa)
        (terpri)
        (format T "Intram in ~s. " (car camera))
        (if (cdr camera)
             (block in-camera
                 (format T "Aici gasim urmatoarele obiecte : ")
                 (dolist (obiect (cdr camera))
                     (terpri)
                     (format T "~s" (car obiect))
                     (if (cadr obiect)
                            (block detalii-obiect
                                (format T " care are atributele urmatoare ")
                                (dolist (atr-vl (cadr obiect))
                                        (format T "~s " atr-vl)
                                )
                            )
                     )
                 )
             )   
        )
    )
)


;;Adaugam camerele din casa si obiectele din acestea
(adaugare-camera-obiecte 'baie 'cabina-dus 'chiuveta)
(adaugare-camera-obiecte 'dormitor 'pat 'noptiera)
(adaugare-camera-obiecte 'sufragerie 'masa 'scaun1 'scaun2 'scaun3)
(adaugare-camera-obiecte 'bucatarie 'cuptor 'masa 'scaun1 'scaun2)
(adaugare-camera-obiecte 'hol 'cuier 'dulap-pantofi)

;;Adaugam atribute obiectelor din casa
(adaugare-atribut-obiect-camera 'baie 'cabina-dus 'pret 900)
(adaugare-atribut-obiect-camera 'dormitor 'noptiera 'material 'lemn)
(adaugare-atribut-obiect-camera 'sufragerie 'masa 'material 'lemn)
(adaugare-atribut-obiect-camera 'bucatarie 'cuptor 'pret 1200)
(adaugare-atribut-obiect-camera 'bucatarie 'cuptor 'marca 'whirlpool)

;;;Obiectul "casa" este o lista de asociere, in care fiecare camera are asociata o lista de obiecte
;;;Fiecare camera este o lista in care CAR reprezinta numele camerei si CDR lista de obiecte
;;;In lista de obiecte fiecare obiect este o lista in care CAR reprezinta numele obiectului si CDR o lista de asociere cu atributele obiectului


;;;Obiectul "casa" are urmatoarea structura
;; (
;;    (camera#1
;;         (obiect#1
;;              (
;;                  (atribut#1 valoare#1)
;;                  (atribut#2 valoare#2)
;;                  ...................
;;                  (atribut#N valoare#N)
;;              )
;;         )
;;          ..........................
;;         (obiect#N
;;              (
;;                  (atribut#1 valoare#1)
;;                  (atribut#2 valoare#2)
;;                  ...................
;;                  (atribut#N valoare#N)
;;              )
;;         )
;;    )
;;    ..................................
;;    (camera#N
;;         (obiect#1
;;              (
;;                  (atribut#1 valoare#1)
;;                  (atribut#2 valoare#2)
;;                  ...................
;;                  (atribut#N valoare#N)
;;              )
;;         )
;;          ..........................
;;         (obiect#N
;;              (
;;                  (atribut#1 valoare#1)
;;                  (atribut#2 valoare#2)
;;                  ...................
;;                  (atribut#N valoare#N)
;;              )
;;         )
;;    )
;; )
