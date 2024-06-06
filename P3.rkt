#lang scheme



; Función auxiliar para calcular el dígito descifrado de una fila usando una función dada
(define calcular_digito

  (lambda (fila funcion)
    (let* ((m (length fila)))
      (modulo(floor(/ (apply + (map funcion fila)) m))10))

    )
  )

; Función para descifrar los mensajes usando recursión simple o cola??? XDD
(define (descifrar_simple mensajes funciones)
  
  (if (null? mensajes)
      
      '()
      
      (cons (calcular_digito (car mensajes) (car funciones))
            
            (descifrar_simple (cdr mensajes) (cdr funciones)))

      )

  )



(define (descifrar_cola_aux mensajes funciones resultado)

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












