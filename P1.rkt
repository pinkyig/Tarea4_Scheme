#lang scheme

(define (liberar lista)

  (if(null? lista)
     ;; Si se cumple el if 
     '()
     
     ;; Si no se cumple el if
     (let loop ((resto (cdr lista)) (menor (car lista)))
        (if (null? resto)
            (list (car menor))
            (let* ((siguiente (car resto))
                   (nombre (car siguiente))
                   (porcentaje (cadr siguiente))
                   (menor-nombre (car menor))
                   (menor-porcentaje (cadr menor)))
              (if (< porcentaje menor-porcentaje)
                  (loop (cdr resto) siguiente)
                  (loop (cdr resto) menor)))))))
  

;; Ejemplos de uso:
(display (liberar '(("Malevelon Creek" 50.0) ("Rend" 43.0154) ("Caladan" 100.0) ("Trantor" 68.59))))

