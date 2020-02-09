# implementando a = b - ( c - d ) + e

.text

li $s2, 33 		# variavel 'c'
li $s3, 77 		# variavel 'd'

SUB $t1, $s2, $s3 	# $t1 = ( $s2 - $s3 ) e o mesmo que $t1 = ( c - d )
SUB $t1, $s1, $t1 	# $t1 = $s1 - $t1 e o mesmo que $t1 = b - ( c - d )
ADD $s0, $t1, $s4	# $s0 = $t1 + $s4 e o mesmo que $s0 = b - ( c - d ) + e
