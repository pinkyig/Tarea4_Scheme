#lang scheme



(define( catalan_simple n)

  (if (= n 0)

      ;Si se cumple el if
      1

      ;Si no se cumple el if
      (* (/ (* 2 (- (* 2 n) 1)) (+ n 1)) (catalan_simple(- n 1)))

      )
  )


(define (catalan_tail n)

  ;Funcion Auxiliar que llevara acabo el calculo
  (define (helper n acc)
    (if (= n 0)
        
        acc
        
        (helper (- n 1) (* acc (/ (* 2 (- (* 2 n) 1)) (+ n 1))))

        )
    )

  ;Llamada a la funcion Auxiliar con un n dado y acc = 1, ya que este es el valor incial de la serie
  (helper n 1)


  )


