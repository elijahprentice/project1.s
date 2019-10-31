.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the str
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    la $a1,str                  #$a1 points to str
    add $t0,$t0,$zero           #x character in string
    addu $a1,$a1,$t0            #point to x character of string in $a1
    add $t1,$t1,$a1             #add ascii value of character to $t1
    lbu $a0,($t1)               #load $t1 to $a0
    li $v0,1
    syscall

    la $a1,str
    addi $t0,$t0,1
    addu $a1,$a1,$t0
    add $t1,$t1,$a1

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "