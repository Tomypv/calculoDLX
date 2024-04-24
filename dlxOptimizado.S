;;calculoDLX
;;Tomás Pérez Vellarino
;;Álvaro Sánchez Moro


.data
;; VARIABLES DE ENTRADA Y SALIDA: NO MODIFICAR ORDEN
; VARIABLE DE ENTRADA: (SE PODRA MODIFICAR EL VALOR ENTRE 1 Y 100)
valor_inicial: .word 75
;; VARIABLES DE SALIDA:
secuencia: .space 120*4
secuencia_tamanho: .word 0
secuencia_maximo: .word 0
secuencia_valor_medio: .float 0
lista: .space 9*4
lista_valor_medio: .float 0
;; FIN VARIABLES DE ENTRADA Y SALIDA
valor_9: .float 0.111111
.text

.global main
main:
	lw  r1, valor_inicial
	movi2fp f1, r1
	cvti2f f1, f1

	addi  r8,r0,#0
	addi  r9,r0,#1
    addi  r2,r0,#2
    addi  r3,r0,#3
	addi  r4,r0,#4 ;;Añadimos r4 para poder dividir por 4
	
	actualizar_maximo:
		add  r30,r0,r1
		sw secuencia(r8), r1

    bucle:

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1
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
    
	;; Obtenemos el tamaño de la secuencia dividiendo entre 4 el índice (luego le añadimos 1)
	srli r7, r8, #2
	movi2fp f3, r30

	sw secuencia_maximo, r30

	addi r7, r7, #1 ;; Añade 1 al tamaño de la secuencia

	cvti2f f3, f3

	movi2fp f2, r7
	
	movi2fp f5, r9
	
	cvti2f f2, f2

	cvti2f f5, f5

	sw secuencia_tamanho, r7

	;; Divide el acumulador por el tamaño de la secuencia
	divf f4, f5, f2

	multf f5, f1, f2
	add r10, r0, #0
	add r11, r0, #4
	add r12, r0, #8
	add r13, r0, #12
	multf f6, f3, f2
	lf f14, valor_9
	add r14, r0, #16
	add r15, r0, #20
	add r16, r0, #24
	add r17, r0, #28
	add r18, r0, #32
	
	sf lista(r10), f5
	addf f20, f0, f5
	addf f20, f20, f6

	divf f21, f2, f1  ;; vT/vIni
	multf f7, f4, f2
	sf lista(r11), f6


	divf f22, f2, f3    ;; vT/vMax
	multf f10, f3, f21  ;; (vMax/vIni) * vT
	sf secuencia_valor_medio, f4
	sf lista(r12), f7
	addf f20, f20, f7
	multf f12, f4, f21  ;; (vMed/vIni) * vT
	addf f20, f20, f10
	sf lista(r15), f10
	

	divf f23, f2, f4    ;; vT/vMed
	multf f8, f1, f22   ;; (vIni/vMax) * vT
	sf lista(r17), f12
	addf f20, f20, f12
	multf f13, f4, f22  ;; (vMed/VMax) * vT
    addf f20, f20, f8
	sf lista(r13), f8


	;;divf f11, f6, f4
	multf f9, f1, f23   ;; (vIni/vMed) * vT
	addf f20, f20, f13
	sf lista(r18), f13
	multf f11, f3, f23  ;; (vMax/vMed) * vT
	sf lista(r14), f9
	addf f20, f20, f9
	addf f20, f20, f11
	

	multf f20, f20, f14 ;;dividimos por 9
	sf lista(r16), f11

	sf lista_valor_medio, f20
	
	trap 0

;; FIN PROGRAMA

is_even:
	;; En este caso es par
	;; Divide el número r1 por 2
		srli r1, r1, #1
	j continue


	;;f1 es valor_inicial

	;;f2 es secuencia_tamanho

	;;f3 es secuencia_maximo
	
	;;f4 es secuencia_valor_medio

	;;f5 es vIni * vt

	;;f6 es vMax * vt

	;;f7 es vMed * vt

	;;f21 es vT / vIni

	;;f22 es vT / vMax

	;;f23 es vT / vMed
	