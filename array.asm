# implementando a = b + c[10]

.data
# diretiva "word" armazena N valores de 32 bits
	c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0

# Descricao variaveis
# b = $s1
# c[] = $s2

.text
	li $s1, 30              # carregando o IMEDIATO 30 para $s1
	la $s2, c               # colocando o endereço do array em $s2
	lw $t0, 40($s2)        	# obtendo o valor da célula " 10 " do array. lw = Load Word
	add $s0, $s1, $t0       # executando a soma $s0 = b + c[10]

	# implementando a = b[15] - c

	# Descricao variaveis
	# b[] = $t1
	# c = $s4

	li $s4, 30		# carregando o IMEDIATO 30 para $s4
	lw $t1, 60($s2)		# obtendo o valor da célula " 15 " do array.
	SUB $s5, $t1, $s4	# executando a subtração $s5 = b[15] - c