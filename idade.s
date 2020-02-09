.data
	ask: .asciiz "Digite sua idade: "
	menor: .asciiz "voce tem menos de 18 anos\n"
	maior: .asciiz "voce tem 18 anos ou mais\n"
	
.text

main:
	la $a0, ask
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall

	bge $v0 , 18, maior_res
	blt $v0 , 18, menor_res

maior_res:
	la $a0, maior
	li $v0, 4
	syscall
	j finally
	
menor_res:
	la $a0, menor
	li $v0, 4
	syscall
	j finally
	
finally:
	li $v0, 10
	syscall