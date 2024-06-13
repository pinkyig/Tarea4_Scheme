#lang scheme



(define calcular_digito

  ; Función auxiliar para calcular el dígito descifrado de una fila usando una función dada
  ;;
  ;; fila : Lista de números que representa una fila de datos.
  ;; funcion : Función que se aplica a cada elemento de la fila.

  (lambda (fila funcion)
    (let* ((m (length fila)))
      (modulo(floor(/ (apply + (map funcion fila)) m))10))

    )
  )

; Función para descifrar los mensajes usando recursión simple
(define (descifrar_simple mensajes funciones)
  
  (if (null? mensajes)
      
      '()
      
      (cons (calcular_digito (car mensajes) (car funciones))
            
            (descifrar_simple (cdr mensajes) (cdr funciones)))

      )

  )



(define (descifrar_cola_aux mensajes funciones resultado)
  ; Función auxiliar para descifrar los mensajes usando recursión de cola
;;
;; mensajes : Lista de listas de números, donde cada sublista representa un mensaje.
;; funciones : Lista de funciones que se aplican a cada mensaje correspondiente.
;; resultado : Acumulador que almacena los resultados parciales del descifrado.

  (if (null? mensajes)
      
      (reverse resultado)

      (descifrar_cola_aux (cdr mensajes) (cdr funciones) (cons (calcular_digito (car mensajes) (car funciones)) resultado))

      )
  )


(define (descifrar_cola mensajes funciones)
  (descifrar_cola_aux mensajes funciones '())
  )

; Ejemplos de uso
(display (descifrar_simple '((5 2 3) (3 2 4 2 25)) (list (lambda (x) (* x 5)) (lambda (x) (/ (* x 2) (+ x 2))))))
(newline)
(descifrar_cola '((5 2 3) (3 2 4 2 25)) (list (lambda (x) (* x 5)) (lambda (x) (/ (* x 2) (+ x 2)))))













