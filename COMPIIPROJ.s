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
	
	li $v0, 4       # Print string will be removed!!!
    la $a0, my_string
    syscall
	
	li $v0, 4       # Print newline
    la $a0, newline
    syscall
	
	li $v0, 4       # Print string will from register will be removed!!!
    move $a0, $s0
    syscall
	
	
	# Initialize position and multiplier
	li $t5, 0       #Accumulator where items will be stored.
	li $t3, 0       # Position
loop:
	lb $t0, 0($s0)
	beq $t0, $zero, done
	
	sub $t1, $t0, '0'  # Convert the character to integer and store in $t1 
	
	add $t5, $t5, $t1 # Add integer to the Accumulator
	
	li $v0, 1       # Print the result
    move $a0, $t1
    syscall

	
	# Update position for loop
    addi $t3, $t3, 1
done:	
    li $v0, 10      # Exit program
    syscall
