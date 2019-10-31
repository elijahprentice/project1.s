.text
main:
    li $v0,8                    #call code 8 (read_string)
    la $a0,str                  #$a0 points to the string
    li $a1,11                   #read 11 characters (including null character)
    syscall                     #execute code 8 to read the string

    li $v0,10                   #call code 10 (exit)
    syscall                     #execute code 10 to exit

.data
prompt:.asciiz "Enter Student ID: "
str:.asciiz " "