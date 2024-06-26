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
valor_9: .float 0.111111
valor_1: .float 1
.text

.global main
main:
	lw  r1, valor_inicial
	lf  f24, valor_1
	movi2fp f1, r1
	cvti2f f1, f1
	divf f25, f24, f1  ;; 1/vIni
	addi  r8,r0,#4

	subi r5, r1, #1 ;;Comprobamos si el primer número es 1
	addi  r9,r0,#1
	add  r30,r0,r1
	sw secuencia, r1
	beqz r5, fin ;; Si es 1 termina el bucle

	
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	add  r9, r9, r1 ;; Acumulador

	;; En este caso r1 es 2
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

	j fin

    bucle:

		;; En este caso es impar
		slli r2, r1, #1  ;; Multiplica el número por 2
		
		add r1, r2, r1	 ;; Suma otra vez el número (x3)

		addi r1, r1, #1  ;; Suma 1 al número
		
		slt r29, r1, r30 ;;Cambiamos la división por una comparación para ahorrar ciclos

		;; Guarda el número en la secuencia
		sw secuencia(r8), r1

		add  r9, r9, r1 ;; Acumulador

		beqz r29, actualizar_maximo  ;; Si el nuevo número es el mayor, se actualiza

		;; A partir de aquí se hace el código de los pares encadenados. Cuando sea impar vuelve a empezar
		;; Divide el número r1 por 2 porque esta vez es par
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia+4(r8), r1

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle1

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia+8(r8), r1
		
		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle2

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia+12(r8), r1
		
		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle3

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia+16(r8), r1
		
		;; Compara el valor de r1 con 1
		subi r5, r1, #1
		
		;; Incrementa el contador de la secuencia
		addi r8, r8, #20
		
		beqz r5, fin ;; Si es 1 termina el bucle

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia(r8), r1
		
		;; Compara el valor de r1 con 1
		subi r5, r1, #1
		
		;; Incrementa el contador de la secuencia
		addi r8, r8, #4
		
		beqz r5, fin ;; Si es 1 termina el bucle

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia(r8), r1
		
		;; Compara el valor de r1 con 1
		subi r5, r1, #1
		
		;; Incrementa el contador de la secuencia
		addi r8, r8, #4
		
		beqz r5, fin ;; Si es 1 termina el bucle

		andi r5, r1, #1 ;; Comprueba si el número es par o impar
		add  r9, r9, r1 ;; Acumulador
		bnez r5, bucle

		;; En este caso es par
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia(r8), r1
		
		;; Compara el valor de r1 con 1
		subi r5, r1, #1
		
		;; Incrementa el contador de la secuencia
		addi r8, r8, #4
		
		beqz r5, fin ;; Si es 1 termina el bucle

		add  r9, r9, r1 ;; Acumulador

		;; En este caso r1 es 2
		;; Divide el número r1 por 2
		srli r1, r1, #1

		;; Guarda el número en la secuencia
		sw secuencia(r8), r1

		;; Incrementa el contador de la secuencia
		addi r8, r8, #4

fin:
    
	movi2fp f3, r30
	cvti2f f3, f3
	divf f26, f24, f3  ;; 1/vMax
	;; Obtenemos el tamaño de la secuencia dividiendo entre 4 el índice
	srli r7, r8, #2
	
	movi2fp f7, r9

	movi2fp f2, r7

	cvti2f f7, f7

	sw secuencia_tamanho, r7
	
	cvti2f f2, f2

	lf f14, valor_9

	multf f5, f1, f2    ;; vIni * vT
	sw secuencia_maximo, r30
	add r10, r0, #0
	add r11, r0, #4
	add r12, r0, #8
	multf f6, f3, f2    ;; vMax * vT
	add r13, r0, #12
	add r14, r0, #16
	add r15, r0, #20
	add r16, r0, #24

	;; Divide el acumulador por el tamaño de la secuencia
	divf f4, f7, f2

	multf f21, f25, f2  ;; vT/vIni
	addf f20, f5, f6
	add r17, r0, #28
	add r18, r0, #32
	multf f22, f26, f2  ;; vT/vMax
	addf f20, f20, f7
	sf lista(r10), f5
	sf lista(r11), f6
	multf f10, f3, f21  ;; (vMax/vIni) * vT
	sf lista(r12), f7

	divf f23, f2, f4    ;; vT/vMed

	multf f12, f4, f21  ;; (vMed/vIni) * vT
	addf f20, f20, f10
	sf secuencia_valor_medio, f4
	sf lista(r15), f10
	multf f8, f1, f22   ;; (vIni/vMax) * vT
	addf f20, f20, f12
	sf lista(r17), f12
	multf f13, f4, f22  ;; (vMed/VMax) * vT
    addf f20, f20, f8
	sf lista(r13), f8


	multf f9, f1, f23   ;; (vIni/vMed) * vT
	addf f20, f20, f13
	sf lista(r18), f13
	multf f11, f3, f23  ;; (vMax/vMed) * vT
	addf f20, f20, f9
	addf f20, f20, f11
	

	multf f20, f20, f14 ;;dividimos por 9
	sf lista(r14), f9
	sf lista(r16), f11


	sf lista_valor_medio, f20
	
	trap 0

;; FIN PROGRAMA

actualizar_maximo:
	add  r30,r0,r1

	;; A partir de aquí se hace el código de los pares encadenados. Cuando sea impar vuelve a empezar
	;; Divide el número r1 por 2 porque esta vez es par
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+4(r8), r1

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle1

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+8(r8), r1
		
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle2

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+12(r8), r1
		
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle3

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+16(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #20
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	add  r9, r9, r1 ;; Acumulador

	;; En este caso r1 es 2
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

	j fin

bucle1:

	;; Incrementa el contador de la secuencia
	addi r8, r8, #8

	;; En este caso es impar
	slli r2, r1, #1  ;; Multiplica el número por 2
		
	add r1, r2, r1	 ;; Suma otra vez el número (x3)

	addi r1, r1, #1  ;; Suma 1 al número
		
	slt r29, r1, r30 ;;Cambiamos la división por una comparación para ahorrar ciclos

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1

	add  r9, r9, r1 ;; Acumulador

	beqz r29, actualizar_maximo  ;; Si el nuevo número es el mayor, se actualiza

	;; A partir de aquí se hace el código de los pares encadenados. Cuando sea impar vuelve a empezar
	;; Divide el número r1 por 2 porque esta vez es par
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+4(r8), r1

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle1

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+8(r8), r1
		
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle2

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+12(r8), r1
		
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle3

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+16(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #20
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	add  r9, r9, r1 ;; Acumulador

	;; En este caso r1 es 2
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

	j fin

bucle2:

	;; Incrementa el contador de la secuencia
	addi r8, r8, #12

	;; En este caso es impar
	slli r2, r1, #1  ;; Multiplica el número por 2
		
	add r1, r2, r1	 ;; Suma otra vez el número (x3)

	addi r1, r1, #1  ;; Suma 1 al número
		
	slt r29, r1, r30 ;;Cambiamos la división por una comparación para ahorrar ciclos

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1

	add  r9, r9, r1 ;; Acumulador

	beqz r29, actualizar_maximo  ;; Si el nuevo número es el mayor, se actualiza

	;; A partir de aquí se hace el código de los pares encadenados. Cuando sea impar vuelve a empezar
	;; Divide el número r1 por 2 porque esta vez es par
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+4(r8), r1

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle1

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+8(r8), r1
	
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle2

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+12(r8), r1
	
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle3

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+16(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #20
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	add  r9, r9, r1 ;; Acumulador

	;; En este caso r1 es 2
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

	j fin

bucle3:

	;; Incrementa el contador de la secuencia
	addi r8, r8, #16

	;; En este caso es impar
	slli r2, r1, #1  ;; Multiplica el número por 2
		
	add r1, r2, r1	 ;; Suma otra vez el número (x3)

	addi r1, r1, #1  ;; Suma 1 al número
		
	slt r29, r1, r30 ;;Cambiamos la división por una comparación para ahorrar ciclos

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1

	add  r9, r9, r1 ;; Acumulador

	beqz r29, actualizar_maximo  ;; Si el nuevo número es el mayor, se actualiza

	;; A partir de aquí se hace el código de los pares encadenados. Cuando sea impar vuelve a empezar
	;; Divide el número r1 por 2 porque esta vez es par
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+4(r8), r1
	
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle1

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+8(r8), r1
		
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle2

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+12(r8), r1
	
	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle3

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia+16(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #20
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	andi r5, r1, #1 ;; Comprueba si el número es par o impar
	add  r9, r9, r1 ;; Acumulador
	bnez r5, bucle

	;; En este caso es par
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Compara el valor de r1 con 1
	subi r5, r1, #1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4
		
	beqz r5, fin ;; Si es 1 termina el bucle

	add  r9, r9, r1 ;; Acumulador

	;; En este caso r1 es 2
	;; Divide el número r1 por 2
	srli r1, r1, #1

	;; Guarda el número en la secuencia
	sw secuencia(r8), r1
		
	;; Incrementa el contador de la secuencia
	addi r8, r8, #4

	j fin



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
	
	;;f24 es 1/vIni