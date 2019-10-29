.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 = address of the string
    li $a1,8                    #read 8 characters (including null character)
    syscall                     #execute code 8 to read the string

    addu $s0,$s0,$zero          #loop increment
    addu $s1,$s1,$zero          #hold sum
    Loop:   bne $s0,6,Exit
        addi $s0,$s0,1
        j Loop
    Exit:   li $v0,1            #call code 1 (print_int)
    move $a0,$s1                #$a0 = address of string
    syscall                     #execute code 1 to print the integer

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

    .data
str:.asciiz "Enter Student ID:"
#my ID is 2874763