.data
	ask: .asciiz "Digite sua idade: "             # mensagem de `pergunta` com terminador nulo      
	menor: .asciiz "voce tem menos de 18 anos\n"  # mensagem de `maior` com terminador nulo 
	maior: .asciiz "voce tem 18 anos ou mais\n"		# mensagem de `maior` com terminador nulo 
	
.text

main:
	la $a0, ask   # carregando msg para o registro de argumento de $v0
	li $v0, 4			# configurando $v0 para `imprimir string`
	syscall				# chamada de rotina
	
	li $v0, 5			# configurando $v0 para `ler int`
	syscall				# chamada de rotina

	bge $v0 , 18, maior_res			# Compara se o valor em $v0 é >= 18, se verdadeiro, pula para label `maior_res`
	blt $v0 , 18, menor_res			# Compara se o valor em $v0 é < 18, se verdadeiro, pula para label `menor_res`

maior_res:
	la $a0, maior			# carregando msg para o registro de argumento de $v0
	li $v0, 4					# configurando $v0 para `imprimir string`
	syscall						# chamada de rotina
	j finally					# instrução de desvio ( Jump )  para label `finally`
	
menor_res:
	la $a0, menor			# carregando msg para o registro de argumento de $v0
	li $v0, 4					# configurando $v0 para `imprimir string`
	syscall						# chamada de rotina
	j finally					# instrução de desvio ( Jump )  para label `finally`	
	
finally: 						# nesse ponto o código é finalizado
	li $v0, 10				# configurando $v0 para `exit`
	syscall						# chamada de rotina