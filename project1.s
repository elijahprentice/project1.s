.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the str
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    la $a1,str                  #$a1 points to str
    add $t0,$t0,$a1             #$t0 holds string

    addi $t1,$t1,113
    
    lbu $a0,($t0)               #load ascii value of [offset]($t0) to $a0
    ble $a0,$t1,OutRange
    OutRange:

    #lbu $a2,1($t0)
    #addu $a0,$a0,$a2

    #lbu $a2,2($t0)
    #addu $a0,$a0,$a2

    #lbu $a2,3($t0)
    #addu $a0,$a0,$a2

    li $v0,1
    syscall

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "