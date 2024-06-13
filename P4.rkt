#lang scheme

(define (stratatree seq tree)
  <
  (define (recorrido seq subArbol)
    ;; Función auxiliar para recorrer el árbol siguiendo la secuencia dada.
    ;; seq : Lista de símbolos que representan direcciones.
    ;; subArbol : Subárbol actual en la recursión.
    (if (null? seq)
        subArbol
        (let ((direction (car seq))
              (hijo (cdr subArbol)))
          (if (null? hijo)
              #f
              (let ((sigArbol
                     (busquedaHijo direction hijo)))
                (if sigArbol
                    (recorrido (cdr seq) sigArbol)
                    #f)))
          )
        )
    )
  
  (define (busquedaHijo direction hijo)
    ;; Función auxiliar para buscar un hijo en un subárbol que coincida con la dirección dada.
    ;; direction : Dirección actual en la secuencia.
    ;; hijo : Lista de hijos del subárbol actual.
    (cond ((null? hijo) #f)
          ((and (pair? (car hijo)) (eq? (caar hijo) direction))
           (car hijo))
          (else (busquedaHijo direction (cdr hijo)))))
  
  (if (and (not (null? seq)) (eq? (car seq) 'S))
      (recorrido (cdr seq) tree)
      #f))

;; Ejemplo de uso:
(display (stratatree '(S U D) '(S (U (D (" Adv Weapon")) (L ("HellBomb")) (U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)

(display (stratatree '(S L R R) '(S (U (D (" Adv Weapon")) (L ("HellBomb"))(U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)

(display (stratatree '(S L R U) '(S (U (D (" Adv Weapon")) (L ("HellBomb"))(U ("Suministros"))) (L (D (" Orbital Strike")) (R (R (" Air Strike")))))))
(newline)







