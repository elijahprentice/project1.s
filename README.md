# project1.s
CSCI 201 - Project 1

Assume your Howard ID as a decimal integer is X. Let N = 26 + (X % 11) where % is the modulo operation, and M = N – 10.

You will write a MIPS program that reads a string of exactly 10 characters(including spaces, excluding the null character at the end)
from user input.
  
  • For each of the characters in the input,
      
      o If it is from '0' to '9' and from 'a' to β and from 'A' to Δ, treat it as a single digit base-N number. β stands for the M-th 
      lower case letter and Δ stands for the M-th upper case letter in the English alphabet. In a base-N number, both 'a' and 'A' 
      correspond to the decimal integer of 10, both 'b' and 'B' to 11, and so on. Both β and Δ correspond to N – 1.
      
      o If it is not in the above specified range, ignore it.
  
  • Sum up all the single-digit base-N numbers from the input, please the result as an unsigned decimal number. If there is no base-N 
  numbers in the input, print 0. NO OTHER CHARACTERS SHOULD BE PRINTED, or it will be marked as wrong.
  
  • The program MUST EXIT after processing one single user input.
