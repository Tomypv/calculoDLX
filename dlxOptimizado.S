;;calculoDLX
;;Tomás Pérez Vellarino
;;Álvaro Sánchez Moro


.data
;; VARIABLES DE ENTRADA Y SALIDA: NO MODIFICAR ORDEN
; VARIABLE DE ENTRADA: (SE PODRA MODIFICAR EL VALOR ENTRE 1 Y 100)
valor_inicial: .word 66
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
	lw  r1, valor_inicial
	addi  r8,r0,#0
	movi2fp f1, r1
	cvti2f f1, f1
    addi  r2,r0,#2
    addi  r3,r0,#3
	addi  r4,r0,#4 ;;Añadimos r4 para poder dividir por 4
	
	actualizar_maximo:
		add  r30,r0,r1
		sw secuencia(r8), r1

    bucle:

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		beqz r5, is_even

		;; En este caso es impar
		mult r1, r1, r3
		addi r1, r1, #1

	continue:
	
	slt r29, r1, r30 ;;Cambiamos la división por una comparación para ahorrar ciclos

	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

    beqz r29, actualizar_maximo  ;; Si el nuevo número no es el mayor, volver a ejecutar el bucle directamente

	;; Compara el valor de r1 con 1
	subi r5, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1

	bnez r5, bucle ;; Repite el bucle si no es 1

fin:
    
	;; Guarda el tamaño de la secuencia en secuencia_tamanho
	div r7, r8, r4
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

is_even:
	;; En este caso es par
	;; Divide el número r1 por 2
		div r1, r1, r2
	j continue
	
sec_medio:

	;; Inicializa el contador de la secuencia en 1
	addi r8, r0, #1

	;; Inicializa el índice de la secuencia en 0
	addi r10, r0, #4

	;; Calcula la diferencia entre el contador y el tamaño de la secuencia para saber cuándo terminar
		sub r13, r7, r8

	;; Carga el primer valor de la secuencia en el acumulador
		lw r9, valor_inicial

	;; Compara el contador con el tamaño de la secuencia
		beqz r13, continuar  ;; Salta a bucle_secuencia si r13 no es cero

	;; Bucle para recorrer la secuencia
	bucle_secuencia:
		;; Carga el valor de la secuencia en r12
		lw r12, secuencia(r10)

		;; Incrementa el contador
		addi r8, r8, #1

		;; Suma el valor de la secuencia al acumulador
		add r9, r9, r12

		;; Calcula la diferencia entre el contador y el tamaño de la secuencia para saber cuándo terminar
		sub r13, r7, r8

		;; Incrementa el índice
		addi r10, r10, #4

		;; Compara el contador con el tamaño de la secuencia
		bnez r13, bucle_secuencia  ;; Salta a bucle_secuencia si r13 no es cero

	continuar:
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

	;;f5 es vIni * vt

	;;f6 es vMax * vt

	;;f7 es vMed * vt

	add r8, r0, #0
	multf f5, f1, f2
	multf f6, f3, f2
	multf f7, f4, f2
	sf lista(r8), f5
	addf f20, f0, f5

	add r8, r0, #4
	multf f6, f3, f2
	sf lista(r8), f6
	addf f20, f20, f6

	add r8, r0, #8
	multf f7, f4, f2
	sf lista(r8), f7
	addf f20, f20, f7

	add r8, r0, #12
	divf f8, f5, f3
	sf lista(r8), f8
	addf f20, f20, f8
	
	add r8, r0, #16
	divf f9, f5, f4
	sf lista(r8), f9
	addf f20, f20, f9

	add r8, r0, #20
	divf f10, f6, f1
	sf lista(r8), f10 
	addf f20, f20, f10

	add r8, r0, #24
	divf f11, f6, f4
	sf lista(r8), f11
	addf f20, f20, f11

	add r8, r0, #28
	divf f12, f7, f1
	sf lista(r8), f12
	addf f20, f20, f12

	add r8, r0, #32
	divf f5, f7, f3
	sf lista(r8), f13
	addf f20, f20, f13

	add r8, r0, #9
	movi2fp f14, r8
	cvti2f f14, f14

	divf f20, f20, f14

	sf lista_valor_medio, f20
	
	jr r31  ;; Retorna
