;;calculoDLX
;;Tomás Pérez Vellarino
;;Álvaro Sánchez Moro


.data
;; VARIABLES DE ENTRADA Y SALIDA: NO MODIFICAR ORDEN
; VARIABLE DE ENTRADA: (SE PODRA MODIFICAR EL VALOR ENTRE 1 Y 100)
valor_inicial: .word 3
;; VARIABLES DE SALIDA:
secuencia: .space 120*4
secuencia_tamanho: .word 0
secuencia_maximo: .word 0
secuencia_valor_medio: .float 0
lista: .space 9*4
lista_valor_medio: .float 0
;; FIN VARIABLES DE ENTRADA Y SALIDA

.text

.global main
main:
	lw  r4, valor_inicial
	movi2fp f1, r4
	cvti2f f1, f1
    lw  r7, secuencia_tamanho
	addi  r8,r0,#0
    addi  r1,r0,#1
    addi  r2,r0,#2
    addi  r3,r0,#3
	addi  r7,r0,#0
	add  r30,r0,r4
	sw  secuencia(r8), r4
	

    bucle:
    
	;; Incrementa el contador de la secuencia
    add r7, r7, r1
	addi r8, r8, #4

    ;; Compara el valor de r4 con 1
    sub r5, r4, r1
    beqz r5, fin ;; Salta a fin si r4 es igual a 1

    ;; Llama a la función is_even_odd para verificar si el número en r4 es par o impar
    jal is_even_odd

	sw secuencia(r8), r4
	div r29, r30, r4
    beqz r29, actualizar_mayor  ;; Salta a actualizar_mayor si r4 es mayor que r30
    
    ;; Si r4 no es igual a 1, vuelve a ejecutar el bucle
    j bucle

	
fin:
    
	;; Guarda el tamaño de la secuencia en secuencia_tamanho
	movi2fp f2, r7
	cvti2f f2, f2
	sw secuencia_tamanho, r7

	;; Guarda el valor máximo de la secuencia en secuencia_maximo
	movi2fp f3, r30
	cvti2f f3, f3
	sw secuencia_maximo, r30

	;; Calcula el valor medio de la secuencia y lo guarda en secuencia_valor_medio
	jal sec_medio

	;; Calcula la lista y su valor medio
	jal listar

	trap 0

;; FUNCIONES AUXILIARES

is_even_odd:
    ;; Divide el número r4 por 2
    div r6, r4, r2

    ;; Multiplica el resultado de la división por 2
    mult r6, r6, r2

    ;; Resta el resultado de la multiplicación del número original
    sub r5, r4, r6

    ;; Si el resultado de la resta es cero, el número es par; si no, es impar
    beqz r5, is_even  ;; Salta a is_even si r5 es cero
    j is_odd  ;; Salta a is_odd si r5 no es cero

is_even:
    ;; El número es par
    div r4, r4, r2
    j end_check  ;; Salta al final de la función

is_odd:
    ;; El número es impar
    mult r4, r4, r3 
    add r4, r4, r1 
    j end_check  ;; Salta al final de la función

end_check:
	;; Fin de la función
    jr r31  ;; Retorna

actualizar_mayor:
	add r30, r0, r4 ;;
	j bucle
	
sec_medio:

	;; Inicializa el contador de la secuencia en 0
	addi r8, r0, #0

	;; Inicializa el acumulador de la secuencia en 0
	addi r9, r0, #0

	;; Inicializa el índice de la secuencia en 0
	addi r10, r0, #0

	;; Bucle para recorrer la secuencia
	bucle_secuencia:
		;; Carga el valor de la secuencia en r12
		lw r12, secuencia(r10)

		;; Suma el valor de la secuencia al acumulador
		add r9, r9, r12

		;; Incrementa el contador
		add r8, r8, r1

		;; Incrementa el índice
		addi r10, r10, #4

		;; Compara el contador con el tamaño de la secuencia
		sub r13, r7, r8
		bnez r13, bucle_secuencia  ;; Salta a bucle_secuencia si r13 no es cero

	movi2fp f5, r9
	cvti2f f5, f5

	;; Divide el acumulador por el tamaño de la secuencia
	divf f4, f5, f2

	;; Guarda el valor medio de la secuencia en secuencia_valor_medio
	sf secuencia_valor_medio, f4

	;; Fin de la función
	jr r31  ;; Retorna


listar:

	;;f1 es valor_inicial

	;;f2 es secuencia_tamanho

	;;f3 es secuencia_maximo
	
	;;f4 es secuencia_valor_medio
	
	add r8, r0, #0
	multf f5, f1, f2
	sf lista(r8), f5
	addf f6, f0, f5

	add r8, r0, #4
	multf f5, f3, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #8
	multf f5, f4, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #12
	divf f5, f1, f3
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5
	
	add r8, r0, #16
	divf f5, f1, f4
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #20
	divf f5, f3, f1
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #24
	divf f5, f3, f4
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #28
	divf f5, f4, f1
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #32
	divf f5, f4, f3
	multf f5, f5, f2
	sf lista(r8), f5
	addf f6, f6, f5

	add r8, r0, #9
	movi2fp f9, r8
	cvti2f f9, f9

	divf f6, f6, f9

	sf lista_valor_medio, f6
	
	jr r31  ;; Retorna
