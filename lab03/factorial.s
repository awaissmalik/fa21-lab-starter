.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # Check if n is 0 or 1
    beqz a0, done       # if n == 0, return 1
    beq a0, x0, done    # if n == 1, return 1

    # Initialize result to 1
    addi a1, x0, 1

loop:
    # Multiply result by n
    mul a1, a1, a0

    # Decrement n
    addi a0, a0, -1

    # Check if n > 1
    bnez a0, loop

done:
    # Return result
    mv a0, a1
    ret

