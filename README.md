# Introdução

* MIPS, acrônimo para __Microprocessor without interlocked pipeline__ (microprocessador sem estágios intertravados de pipeline).

* É uma arquitetura de microprocessadores **RISC** 

# Arquitetura

> O MIPS é uma arquitetura baseada em registradores, ou seja, a CPU usa apenas registradores para realizar suas operações lógicas e aritméticas. Cada instrução possui 32 bits ( fixo ), contando com 32 registradores de uso geral

# Instruções Reais

* #### Instruções do Tipo R -> `Registrador - Registrador`
|        opcode       |          rs          |          rt          |           rd           |                 shamt                |               funct               |
|:-------------------:|:--------------------:|:--------------------:|:----------------------:|:------------------------------------:|:---------------------------------:|
|        6 bits       |        5 bits        |        5 bits        |         5 bits         |                5 bits                |               6 bits              |
| Código de  operação | 1º registrador fonte | 2º registrador fonte | registrador de destino | quantidade de bits pra ser deslocado | função específica a ser realizada |

* Ex: **add $t2, $t1, $t0**

| opcode = 0 | rs = 9 | rt = 8 | rd = 10 | shamt | funct = 0x20 |
|:----------:|:------:|:------:|:-------:|:-----:|:------------:|
|   00 0000   |  0 1001 |  0 1000 |  0 1010  | 0 0000 |    10 0000    |

--------------------------------------------------------------
* #### Instruções do Tipo I -> `Envolvendo valor IMEDIATO`
|        opcode       |               rs               |           rt           |    Constante ou endereço    |
|:-------------------:|:------------------------------:|:----------------------:|:---------------------------:|
|        6 bits       |             5 bits             |         5 bits         |           16 bits           |
| Código de  operação | Registrador base a ser operado | Registrador de destino | CONSTANTE: 1, 2, 3 ... 2³ |

* Ex: **addi $s1, $s2, 100**

| opcode = 0x8 | rs = 18 | rt = 17 |  constante = 100 |
|:------------:|:-------:|:-------:|:----------------:|
|    00 1000    |  1 0010  |  1 0001  | 0000 0000 0110 0100 |


* #### Instruções do Tipo J -> `Desvio ( Jump )`
|        opcode       |       endereço      |
|:-------------------:|:-------------------:|
|        6 bits       |       26 bits       |
| Código de  operação | Endereço de destino |

* Ex: **j 245**

| opcode = 0x2 |          endereço = 245          |
|:------------:|:--------------------------------:|
|    00 0010   | 00 0000 0000 0000 0000 1111 0101 |


# Tabela de Instruções 

* ### Aritméticas

|          Nome         |   Sintaxe Instrução   |                      Significado                     | Formato | Opcode | Funct |                                                    Notas                                                    |
|:---------------------:|:---------------------:|:----------------------------------------------------:|:-------:|:------:|:-----:|:-----------------------------------------------------------------------------------------------------------:|
|          Add          |   add $s1, $s2, $s3   |              $s1 = $s2 + $s3 -> (signed)             |    R    |    0   |  0x20 |                                    Soma dois registradores. Estende sinal                                   |
|      Add Unsigned     |   addu $s1, $s2, $s3  |             $s1 = $s2 + $s3 -> (unsigned)            |    R    |    0   |  0x21 |                                  Soma dois registros. Sem extensão de sinal                                 |
|        Subtract       |   sub $s1, $s2, $s3   |              $s1 = $s2 - $s3 -> (signed)             |    R    |    0   |  0x22 |                                          Subtrai dois registradores                                         |
|   Subtract Unsigned   |   sub $s1, $s2, $s3   |             $s1 = $s2 - $s3 -> (unsigned)            |    R    |    0   |       |                              Subtrai dois registradores. Sem extensão de sinal                              |
|      Add Imediate     |  addi $s1, $s2, CONST |              $s1 = $s2 + CONST (signed)              |    I    |  0x08  |       |        Usado para somar constantes e copiar registro  para outro ( addi $s1, $s2, 0 ). Estende sinal        |
| Add Imediate Unsigned | addiu $s1, $s2, CONST |             $s1 = $s2 + CONST (unsigned)             |    I    |  0x09  |       |    Usado para somar constantes e copiar registro  para outro ( addi $s1, $s2, 0 ). Sem extensão de sinal    |
|        Multiply       |     mult $s1, $s2     | LO = (($s1 * $s2) << 32) >>32 HI = ($s1 * $s2) >> 32 |    R    |    0   |  0x18 | Multiplica dois registradores e coloca o resultado de 64 bits em dois pontos especiais de memória (LO, HI). |
|         Divide        |      div $s1, $s2     |             LO = $s1 / $s2 HI = $s1 % $s2            |    R    |        |       |          Divide dois registradores e coloca o resultado inteiro de 32 bits em LO e o restante em HI         |

* ### Transferência de Dados
|    Nome    | Sintaxe Instrução |             Significado            | Formato | Opcode | Funct |                                                         Notas                                                         |
|:----------:|:-----------------:|:----------------------------------:|:-------:|:------:|:-----:|:---------------------------------------------------------------------------------------------------------------------:|
|  Load word | lw $s1,CONST($s2) |      $s1 = Memory[$s2 + CONST]     |    I    |  0x23  |       |                     Carrega o termo armazenado a partir de: MEM[$s2+CONST] e os seguintes 3 bytes.                    |
|  Load byte | lb $s1,CONST($s2) | $s1 = Memory[$s2 + CONST] (signed) |    I    |        |       |                                       Carrega o byte armazenado: MEM[$s2+CONST].                                      |
| Store word | sw $s1,CONST($s2) |      Memory[$s2 + CONST] = $s1     |    I    |        |       | Armazena um termo em: MEM [$s2+CONST] e os seguintes 3 bytes.  A ordem dos operadores é uma grande fonte de confusão. |

* ### Lógico
|            Nome            |   Sintaxe Instrução  |     Significado     | Formato | Opcode | Funct |                         Notas                        |
|:--------------------------:|:--------------------:|:-------------------:|:-------:|:------:|:-----:|:----------------------------------------------------:|
|             And            |   and $s1, $s2, $s3  |   $s1 = $s2 & $s3   |    R    |        |       |                      Bitwise and                     |
|        And immediate       | andi $s1, $s2, CONST |  $s1 = $s2 & CONST  |    I    |        |       |                                                      |
|             Or             |   or $s1, $s2, $s3   |   $s1 = $s2 | $s3   |    R    |        |       |                      Bitwise or                      |
|        Or immediate        |  ori $s1, $s2, CONST |  $s1 = $s2 | CONST  |    I    |        |       |                                                      |
|        Exclusive or        |   xor $s1, $s2, $s3  |   $s1 = $s2 ^ $s3   |    R    |        |       |                                                      |
|             Nor            |   nor $s1, $s2, $s3  |  $s1 = ~($s2 | $s3) |    R    |        |       |                      Bitwise nor                     |
|      Set on less than      |   slt $s1, $s2, $s3  |  $s1 = ($s2 < $s3)  |    R    |        |       |    Testa se um registrador é menor do que o outro    |
| Set on less than immediate | slti $s1, $s2, CONST | $s1 = ($s2 < CONST) |    I    |        |       | Testa se um registrador é menor do que uma constante |

# Tabela In/Out e chamada de sistema

| Função | Código em $v0 | Argumentos | Resultado |
|:--------------:|:-------------:|:-----------------------------------------------------------:|:------------------------:|
| Imprime INT | 1 | $a0 = inteiro a ser impresso |  |
| Imprime FLOAT | 2 | $f12 = float a ser impresso |  |
| Imprime DOUBLE | 3 | $f12 = double a ser impresso |  |
| Imprime STRING | 4 | $a0 = endereço de memória da string |  |
| Lê INT | 5 |  | inteiro retornado em $v0 |
| Lê FLOAT | 6 |  | float retornado em $v0 |
| Lê DOUBLE | 7 |  | double retornado em $v0 |
| Lê STRING | 8 | $a0 = endereço de memória da string $a1 = tamanho da string |  |
| Exit | 10 |  | endereço em v0 |