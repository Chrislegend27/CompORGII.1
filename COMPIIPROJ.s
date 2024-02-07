loop:
    lb $t0, 0($s0)         # Load each index of the string
    beq $t0, $zero, done   # Exit loop at the end of the string

    # Check if the character is a digit
    li $t6, '0'             # ASCII value of '0'
    li $t7, '9'             # ASCII value of '9'
    blt $t0, $t6, not_digit # Branch if character is not a digit
    bgt $t0, $t7, not_digit # Branch if character is not a digit

    # Convert the character to integer and store in $t1
    sub $t1, $t0, '0'  

    add $t5, $t5, $t1       # Add integer to the accumulator

    li $v0, 1               # Print current character
    move $a0, $t1
    syscall

    li $v0, 4               # Print newline
    la $a0, newline
    syscall

    # Update position for loop
    addi $s0, $s0, 1
    j loop

not_digit:
    # Handle non-digit characters (optional)
    j loop

done:
    #li $v0, 1               # Print the result
    #move $a0, $t5
    #syscall

    li $v0, 10              # Exit program
    syscall
