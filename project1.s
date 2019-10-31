.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the str
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    la $a1,str                  #$a1 points to str
    add $t2,$t2,$zero
Loop: bne $t2,10,Exit
    addi $a1,$a1,1              #add offset to address
    add $t0,$t0,$a1             #$t0 holds string
    lbu $a0,($t0)               #load ascii value of [offset]($t0) to $a0
    addi $t2,$t2,1
Exit:
    li $v0,1
    syscall

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "