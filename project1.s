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

    lbu $a0,($t0)                           #load ascii value of 0($t0) to $a0
    bgt $a0,113,OutRange                    #if $a0 > 113, jump to OutRange
        bge $a0,97,Lower                    #if 113 >= $a0 >= 97, jump to Lower
        bgt $a0,81,OutRange                 #if 97 > $a0 > 81, jump to OutRange
            bge $a0,65,Upper                #if 81 >= $a0 >= 65, jump to Upper
            bgt $a0,57,OutRange             #if 65 > $a0 > 57, jump to OutRange
                bge $a0,48,Num              #if 57 >= $a0 >= 48, jump to Num
                j OutRange
                Num: subu $a0,$a0,$t3       #subtract 48 to get decimal value
                j InRange
            j OutRange
            Upper: subu $a0,$a0,$t1         #subtract 55 to get decimal value
            j InRange
        j OutRange
        Lower: subu $a0,$a0,$t2             #subtract 87 to get decimal value
        j InRange
    OutRange:   li $a0,0
    InRange:

    lbu $a2,1($t0)
    bgt $a2,113,Out1
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
            bgt $a2,57,Out2
            bge $a2,48,Num2
                j Out2
                Num2: subu $a2,$a2,$t3
                j Done2
            j Out2
            Up2: subu $a2,$a2,$t1
            j Done2
        j Out2
        Low2: subu $a2,$a2,$t2
        j Done2
    Out2:   li $a2,0
    Done2:  addu $a0,$a0,$a2

    lbu $a2,3($t0)
    bgt $a2,113,Out3
    bge $a2,97,Low3
        bgt $a2,81,Out3
        bge $a2,65,Up3
            bgt $a2,57,Out3
            bge $a2,48,Num3
                j Out3
                Num3: subu $a2,$a2,$t3
                j Done3
            j Out3
            Up3: subu $a2,$a2,$t1
            j Done3
        j Out3
        Low3: subu $a2,$a2,$t2
        j Done3
    Out3:   li $a2,0
    Done3:  addu $a0,$a0,$a2

    lbu $a2,4($t0)
    bgt $a2,113,Out4
    bge $a2,97,Low4
        bgt $a2,81,Out4
        bge $a2,65,Up4
            bgt $a2,57,Out4
            bge $a2,48,Num4
                j Out4
                Num4: subu $a2,$a2,$t3
                j Done4
            j Out4
            Up4: subu $a2,$a2,$t1
            j Done4
        j Out4
        Low4: subu $a2,$a2,$t2
        j Done4
    Out4:   li $a2,0
    Done4:  addu $a0,$a0,$a2

    lbu $a2,5($t0)
    bgt $a2,113,Out5
    bge $a2,97,Low5
        bgt $a2,81,Out5
        bge $a2,65,Up5
            bgt $a2,57,Out5
            bge $a2,48,Num5
                j Out5
                Num5: subu $a2,$a2,$t3
                j Done5
            j Out5
            Up5: subu $a2,$a2,$t1
            j Done5
        j Out5
        Low5: subu $a2,$a2,$t2
        j Done5
    Out5:   li $a2,0
    Done5:  addu $a0,$a0,$a2

    lbu $a2,6($t0)
    bgt $a2,113,Out6
    bge $a2,97,Low6
        bgt $a2,81,Out6
        bge $a2,65,Up6
            bgt $a2,57,Out6
            bge $a2,48,Num6
                j Out6
                Num6: subu $a2,$a2,$t3
                j Done6
            j Out6
            Up6: subu $a2,$a2,$t1
            j Done6
        j Out6
        Low6: subu $a2,$a2,$t2
        j Done6
    Out6:    li $a2,0
    Done6:  addu $a0,$a0,$a2

    lbu $a2,7($t0)
    bgt $a2,113,Out7
    bge $a2,97,Low7
        bgt $a2,81,Out7
        bge $a2,65,Up7
            bgt $a2,57,Out7
            bge $a2,48,Num7
                j Out7
                Num7: subu $a2,$a2,$t3
                j Done7
            j Out7
            Up7: subu $a2,$a2,$t1
            j Done7
        j Out7
        Low7: subu $a2,$a2,$t2
        j Done7
    Out7:    li $a2,0
    Done7:  addu $a0,$a0,$a2

    lbu $a2,8($t0)
                j Out8
                Num8: subu $a2,$a2,$t3
                j Done8
            Up8: subu $a2,$a2,$t1
        Low8: subu $a2,$a2,$t2
    Out8:    li $a2,0
    Done8:  addu $a0,$a0,$a2
    lbu $a2,9($t0)

    li $v0,1
    syscall
    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "