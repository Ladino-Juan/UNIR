.data
n: .word 15              
fib: .space 60           

.text
.globl main

main:
    lw $t0, n               
    li $t1, 1               
    li $t2, 1               

    la $t3, fib             
    sw $t1, 0($t3)          
    sw $t2, 4($t3)          

    li $t4, 2               

calcular_fibonacci:
    bge $t4, $t0, terminar   
    lw $t1, 0($t3)           
    lw $t2, 4($t3)           
    add $t5, $t1, $t2         

    sw $t5, 8($t3)            
    addi $t3, $t3, 4          
    addi $t4, $t4, 1          
    j calcular_fibonacci

terminar:
    
    li $v0, 10               
    syscall