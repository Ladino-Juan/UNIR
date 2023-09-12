.data
numeros: .word 10, 87, 25     
resultado: .word 0            
iguales_msg: .asciiz "Los números son iguales\n"

.text
.globl main

main:
    la $t0, numeros         
    lw $t1, 0($t0)          
    lw $t2, 4($t0)          
    lw $t3, 8($t0)          

    
    move $t4, $t1           
    bgt $t2, $t4, comprobar  
    move $t4, $t2
comprobar:
    bgt $t3, $t4, guardar_menor 
    move $t4, $t3
guardar_menor:
    sw $t4, resultado          

    
    beq $t1, $t2, numeros_iguales
    beq $t1, $t3, numeros_iguales
    beq $t2, $t3, numeros_iguales
    j fin_programa

numeros_iguales:
    li $v0, 4                
    la $a0, iguales_msg      
    syscall

fin_programa:
    
    li $v0, 10               
    syscall