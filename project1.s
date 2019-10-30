.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the string
    li $a1,8                    #read 8 characters (including null character)
    syscall                     #execute code 8 to read the string

    add $t0,$t0,$zero           #loop increment
    add $t1,$t1,$zero           #hold sum
    add $t2,$a0,$zero           #$t2 points to the string
    Loop:   bne $t0,6,Exit
        addu $t1,$a0,$t0        #the $t0 place in $a0 is added to $t1
        addi $t0,$t0,1          #increment $t0 by 1
        j Loop
    Exit:

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

    .data
str:.asciiz "Enter Student ID:"
#my ID is 2874763