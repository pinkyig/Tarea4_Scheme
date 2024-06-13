#lang scheme

;; Descripción de la función
;; La función `liberar` toma una lista de planetas con sus porcentajes de liberación y devuelve una lista que contiene el nombre del planeta con el menor porcentaje de liberación.
;;
;; lista : Lista de listas donde cada sublista contiene el nombre de un planeta y su porcentaje de liberación.

(define (liberar lista)

  (if (null? lista)
      ;; Si la lista está vacía, devuelve una lista vacía.
      '()
      
      ;; Si la lista no está vacía, inicia la iteración.
      (let iteracion ((resto (cdr lista)) (menor (car lista)))
        ;; iteracion: Función auxiliar que recorre la lista para encontrar el planeta con menor porcentaje de liberación.
        ;; resto: El resto de la lista de planetas por procesar.
        ;; menor: El planeta con el menor porcentaje de liberación encontrado hasta ahora.
        (if (null? resto)

            (list (car menor))
            
            
            (let* ((siguiente (car resto))
                   (nombre (car siguiente))
                   (porcentaje (cadr siguiente))
                   (menor-nombre (car menor))
                   (menor-porcentaje (cadr menor)))
              
              ;; Compara el porcentaje actual con el menor porcentaje encontrado hasta ahora.
              (if (< porcentaje menor-porcentaje)
                 
                  (iteracion (cdr resto) siguiente)
                  
                  (iteracion (cdr resto) menor))))))
  )

;; Ejemplos de uso:
(display (liberar '(("Malevelon Creek" 50.0) ("Rend" 43.0154) ("Caladan" 100.0) ("Trantor" 68.59))))


