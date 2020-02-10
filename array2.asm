

# Armazenando valores em um array de 2 inteiros -> Em C: int array[2];
# Depois dos IMEDIATOS armazenados. Pegando a posição 0 e 1 e somando.
# -> Em C: int soma = array[0] + array[1];

################# Estrutura de dados #################
.data

	array:	.space 8           # array de 2 inteiros

######################################################

################# Instruções #########################
.text

main:
	la $t0,	array	 	# Carrega o endereço do array para $t0
	li $t1, 5				# Carrega o IMEDIATO 5 para $t1
	sw $t1, ($t0)		# Armazena o valor em $t1 para posição 0 do array, ou seja: array[0] = 5
	li $t1, 13			# Carrega o IMEDIATO 13 para $t1
	sw $t1, 4($t0)  # Carrega o valor em $t1 para a posição 1 do array, ou seja: array[1] = 13
	
	lw $t2, ($t0)				# Carrega a posição 0 do array para $t2
	lw $t3, 4($t0)			# Carrega a posição 1 do array para $t3
	add $s0, $t2, $t3		# Soma e armazena em $s0, ou seja: $s0 = array[0] + array[1] -> $s0 = 18
######################################################
