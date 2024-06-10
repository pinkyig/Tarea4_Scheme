#lang scheme

(define (stratatree seq tree)
  (define (navigate seq subtree)
    (if (null? seq)
        subtree
        (let ((direction (car seq))
              (children (cdr subtree)))
          (if (null? children)
              #f
              (let ((next-subtree
                     (find-child direction children)))
                (if next-subtree
                    (navigate (cdr seq) next-subtree)
                    #f))))))
  
  (define (find-child direction children)
    (cond ((null? children) #f)
          ((and (pair? (car children)) (eq? (caar children) direction))
           (car children))
          (else (find-child direction (cdr children)))))
  
  (if (and (not (null? seq)) (eq? (car seq) 'S))
      (navigate (cdr seq) tree)
      #f))

;; Ejemplo de uso:
(display (stratatree '(S U D) '(S (U (D (" Adv Weapon")) (L ("HellBomb")) (U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)

(display (stratatree '(S L R R) '(S (U (D (" Adv Weapon")) (L ("HellBomb"))(U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)

(display (stratatree '(S L R U) '(S (U (D (" Adv Weapon")) (L ("HellBomb"))(U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)

(display (stratatree '(S U) '(S (U (D (" Adv Weapon")) (L ("HellBomb")) (U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))







