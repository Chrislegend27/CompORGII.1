.data
newline:        .asciiz "\n"
input_prompt:   .asciiz "Enter your string: "
my_string:      .space 1000

.text
.globl main

main:
    li $v0, 4       # Print input prompt
    la $a0, input_prompt
    syscall
	
	li $v0, 4       # Print newline
    la $a0, newline
    syscall
	
	li $v0, 8     # Reading string
    la $a0, my_string
    syscall
	
	move $s0, $a0   # Preserve the original pointer to the string
	
	
	
	# Initialize position and multiplier
	li $t5, 0       #Accumulator where items will be stored.

loop:
	lb $t0, 0($s0) #Load each index of string
	beq $t0, $zero, done #Exit loop at end of string
	
	
	beq $t0, '-', process_negative
	
	sub $t1, $t0, '0'  # Convert the character to integer and store in $t1 
	
	add $t5, $t5, $t1 # Add integer to the Accumulator
	
	li $v0, 1       # Print current character
    move $a0, $t1
    syscall
	
	
	li $v0, 4       # Print newline
    la $a0, newline
    syscall

	
	# Update position for loop
	j continue_loop
	
process_negative:
    j continue_loop
	
continue_loop:
    addi $s0, $s0, 1
    j loop
	
done:	
	#li $v0, 1       # Print the result
    #move $a0, $t5
    #syscall
	
    li $v0, 10      # Exit program
    syscall
