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
	
	
	
	# Initialize accumulator
	li $t5, 0       #Accumulator where items will be stored.

loop:
	lb $t0, 0($s0) #Load each index of string
	beq $t0, $zero, done #Exit loop at end of string
	
	beq $t0, 10, continue_loop  # Skip newline characters
	
	beq $t0, 65, add_10 #A
	beq $t0, 97, add_10 #a
	
	beq $t0, 66, add_11 #B
	beq $t0, 98, add_11 #b
	
	beq $t0, 67, add_12 #C
	beq $t0, 99, add_12 #c
	
	beq $t0, 68, add_13 #D
	beq $t0, 100, add_13 #d
	
	beq $t0, 69, add_14 #E
	beq $t0, 101, add_14 #e
	
	beq $t0, 70, add_15 #F
	beq $t0, 102, add_15 #f
	
	beq $t0, 71, add_16 #G
	beq $t0, 103, add_16 #g
	
	beq $t0, 47, delimiter
	
	sub $t1, $t0, '0'  # Convert the character to integer and store in $t1 
	
	add $t5, $t5, $t1 # Add integer to the Accumulator which is in $t5

	
	#Jumps to beginning of loop
	j continue_loop
	
add_10:
	li $t1, 10
	add $t5, $t5, $t1
	j continue_loop

add_11:
	li $t1, 11
	add $t5, $t5, $t1
	j continue_loop

add_12:
	li $t1, 12
	add $t5, $t5, $t1
	j continue_loop

add_13:
	li $t1, 13
	add $t5, $t5, $t1
	j continue_loop
	
add_14:
	li $t1, 14
	add $t5, $t5, $t1
	j continue_loop
	
add_15:
	li $t1, 15
	add $t5, $t5, $t1
	j continue_loop
	
add_16:
	li $t1, 16
	add $t5, $t5, $t1
	j continue_loop
	
delimiter:
	li $v0, 1       # Print the result
    move $a0, $t5
    syscall
	
	
	li $v0, 11
	la, $a0, 47
	syscall
	
	li $t5, 0
	
	
	j continue_loop
	
continue_loop:
    addi $s0, $s0, 1
    j loop
	
done:	
	li $v0, 1       # Print the result
    move $a0, $t5
    syscall
	
    li $v0, 10      # Exit program
    syscall
