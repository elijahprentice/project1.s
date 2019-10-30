.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the string
    li $a1,8                    #read 8 characters (including null character)
    syscall                     #execute code 8 to read the string

    add $t0,$t0,$zero           #loop increment (x)
    add $t1,$t1,$zero           #hold sum
    add $t2,$a0,$zero           #$t2 points to the string
    add $t3,$t3,$zero           #hold individual byte

    Loop:   bne $t0,1,Exit      #exit after reading one character
        lb $t3,$t0($t2)         #load the x character in string
        addi $t0,$t0,1          #increment $t0 by 1
        j Loop
    Exit:

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

    .data
str:.asciiz "Enter Student ID:"
#my ID is 2874763