.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the str
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    la $a1,str                  #$a1 points to str
    add $t0,$t0,$a1             #$t0 holds string

    addi $t2,$t2,87
    addi $t1,$t1,55
    addi $t3,$t3,48

    lbu $a0,($t0)               #load ascii value of 0($t0) to $a0

    bgt $a0,113,OutRange                    #if $a0 > 113, jump to OutRange
        bge $a0,97,Lower                    #if 113 > $a0 > 97, jump to Lower

        bgt $a0,81,OutRange                 #if 97 > $a0 > 81, jump to OutRange
            bge $a0,65,Upper                #if 81 > $a0 > 65, jump to Upper

            bgt $a0,57,OutRange             #if 65 > $a0 > 57, jump to OutRange
                bge $a0,48,Num              #if 57 > $a0 > 48, jump to Num

                j OutRange
                Num: subu $a0,$a0,$t3       #subtract 48 to get decimal value
                j InRange
            
            j OutRange
            Upper: subu $a0,$a0,$t1         #subtract 55 to get decimal value
            j InRange

        j OutRange
        Lower: subu $a0,$a0,$t2             #subtract 87 to get decimal value
        j InRange

    OutRange:
        li $a0,0
    InRange:

    lbu $a2,1($t0)
    bgt $a2,113,Out1                        #
        bge $a2,97,Low1

        bgt $a2,81,Out1
            bge $a2,65,Up1
            bgt $a2,57,Out1
                bge $a2,48,Num1
                j Out1
                Num1: subu $a2,$a2,$t3
                j Done1

            j Out1
            Up1: subu $a2,$a2,$t1
            j Done1

        j Out1
        Low1: subu $a2,$a2,$t2
        j Done1
        
    Out1:   li $a2,0
    Done1:  addu $a0,$a0,$a2

    lbu $a2,2($t0)
    bgt $a2,113,Out2
        bge $a2,97,Low2

        bgt $a2,81,Out2
            bge $a2,65,Up2
            
            j Out2
            Up2: subu $a2,$a2,$t1
            j Done2

        j Out2
        Low2: subu $a2,$a2,$t2
        j Done2
    Out2:   li $a2,0
    Done2:  addu $a0,$a0,$a2

    #lbu $a2,3($t0)
    #addu $a0,$a0,$a2

    li $v0,1
    syscall

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "