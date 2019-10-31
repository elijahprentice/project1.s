.text
main:

#   my ID is 02874763
#   N = 26 + (x % 11) = 27   base-27
#   M = N - 10 = 27 - 10 = 17
#   Mth letter in the alphabet = Q/q

    li $v0,4                    #call code 4 (print_string)
    la $a0,prompt               #$a0 points to the 'prompt'
    syscall                     #execute code 4 to print the prompt

    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to 'str'
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    la $a1,str                  #$a1 points to str
    li $a0,0                    #set sum to 0
    add $t0,$t0,$a1             #$t0 holds string
    addi $t2,$t2,87             #subtract 87 from the ascii value of lowercase letters
    addi $t1,$t1,55             #subtract 55 from the ascii value of uppercase letters
    addi $t3,$t3,48             #subtract 48 from the ascii value of integers
    addi $t4,$t4,0              #initialize loop counter
    addi $t5,$t5,1              #1: continue loop, 0: end loop

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

    li $a2,0
    addu $a2,$a2,$a0    #hold sum in $a2

    li $v0,4                    #call code 4 (print_string)
    li $a0,0                    #$a0 = 0
    la $a0,outputLine           #$a0 points to 'outputLine'
    syscall                     #execute code 4 to print the 'Output: '
    
    li $a0,0                    #$a0 = 0
    addu $a0,$a0,$a2            #return sum to $a0

    li $v0,1                    #call code 1 (print_int)
    syscall                     #execute code 1 to print the sum ($a0)

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Input: "
outputLine:.asciiz "\nOutput: "
str:.asciiz " "