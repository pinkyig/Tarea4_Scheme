#lang scheme

(define (liberar lista)

  (if(null? lista)
     ;; Si se cumple el if 
     '()
     
     ;; Si no se cumple el if
     (let iteracion ((resto (cdr lista)) (menor (car lista)))
        (if (null? resto)
            ;;Si el resto de la lista  esta vacio sigifica que se encontro el planeta con menor liberacion por que se se hace un car para obetener el nombre 
            (list (car menor))
            
            (let* ((siguiente (car resto))
                   (nombre (car siguiente))
                   (porcentaje (cadr siguiente))
                   (menor-nombre (car menor))
                   (menor-porcentaje (cadr menor)))
              
              (if (< porcentaje menor-porcentaje)
                  (iteracion (cdr resto) siguiente)
                  (iteracion (cdr resto) menor))
              
              )))
     )
  )
  

;; Ejemplos de uso:
(display (liberar '(("Malevelon Creek" 50.0) ("Rend" 43.0154) ("Caladan" 100.0) ("Trantor" 68.59))))

