.data
newline:        .asciiz "\n"
input_prompt:   .asciiz "Enter your string: "
my_string:     .space 1000

.text
.globl main

main:
	li $v0, 4       # Print input prompt
    la $a0, input_prompt
    syscall
	
done:
	li $v0, 10      # Exit program
    syscall