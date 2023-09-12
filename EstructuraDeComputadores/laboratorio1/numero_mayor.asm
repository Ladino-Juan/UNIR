.data
numeros: .word 78, 78, 78
resultado: .word 0            

.text
.globl main

main:
    la $t0, numeros     
    lw $t1, 0($t0)      
    lw $t2, 4($t0)      
    lw $t3, 8($t0)      

    
    move $t4, $t1       
    blt $t2, $t4, comprobar  
    move $t4, $t2

comprobar:
    blt $t3, $t4, guardar_mayor 
    move $t4, $t3

guardar_mayor:
    sw $t4, resultado         

    
    beq $t1, $t2, numeros_iguales
    beq $t1, $t3, numeros_iguales
    beq $t2, $t3, numeros_iguales

    
    li $v0, 1                
    move $a0, $t4            
    syscall

    
    li $v0, 10               
    syscall

numeros_iguales:
    
    la $a0, mensaje_iguales  
    li $v0, 4                
    syscall

    
    li $v0, 10               
    syscall

.data
mensaje_iguales: .asciiz "Los números son iguales\n"