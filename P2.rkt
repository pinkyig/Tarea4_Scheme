#lang scheme



(define( catalan_simple n)

  (if (= n 0)

      ;Si se cumple el if
      1

      ;Si no se cumple el if
      (* (/ (* 2 (- (* 2 n) 1)) (+ n 1)) (catalan_simple(- n 1)))

      )
  )


(define (catalan_cola n)

  ;Funcion Auxiliar que llevara acabo el calculo
  (define (cola_aux n resultado)
  ;; cola_aux: Función auxiliar que lleva a cabo el cálculo del número de Catalan utilizando recursión de cola.
  ;; n : El número actual en la iteración.
  ;; resultado : El acumulador que contiene el resultado parcial del cálculo.
    (if (= n 0)
        
        resultado
        
        (cola_aux (- n 1) (* resultado (/ (* 2 (- (* 2 n) 1)) (+ n 1))))

        )
    )

  ;Llamada a la funcion Auxiliar con un n dado y resultado = 1, ya que este es el valor incial de la serie
  (cola_aux n 1)

  )


