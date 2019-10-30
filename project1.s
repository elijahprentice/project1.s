.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the string
    li $a1,8                    #read 8 characters (including null character)
    syscall                     #execute code 8 to read the string

    add $t0,$t0,$zero           #loop increment (x)

    Loop:
        bne $t0,1,Exit      #exit after reading one character
        la $a1,str              #$a1 points to the string
        addu $a1,$a1,$t0        #$a1 becomes the x ($t0) character of the string
        add $t1,$t1,$a1         #add ascii value of character into $t1
        lbu $a0,($t1)           #read $t1 integer 
        addi $t0,$t0,1          #increment by one
        j Loop
    Exit:
    
    li $v0,1
    syscall

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

    .data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "
#my ID is 2874763