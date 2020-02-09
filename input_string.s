.data 
	ask: .asciiz "Entre com seu nome (max 100 char) : "
	ret: .asciiz "Seu nome e: "
	buffer: .space 100
	
.text

	ask_code: 
		la $a0, ask
		li $v0, 4
		syscall

	input_code:
		li $v0, 8
		la $a0, buffer
		li $a1, 100
		move $t0, $a0
		syscall

	res_code:
		la $a0, ret
		li $v0, 4
		syscall

		la $t1, buffer
		move $a0, $t1
		li $v0, 4
		syscall
	li $v0, 10
	syscall
		
		
		
		
		
