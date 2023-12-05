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
    # Check if n is 0 or 1, in which case return 1
    beqz a0, return_one
    li t1, 1
    beq a0, t1, return_one

    # Compute n! recursively
    sub sp, sp, sp    # Allocate space for local variables
    sw ra, 0(sp)      # Save return address

    addi a0, a0, -1   # n-1
    jal ra, factorial
    lw t2, 0(sp)      # Restore return address
    add sp, sp, sp    # Deallocate space for local variables

    mul a0, a0, t2    # n * (n-1)!

    ret

return_one:
    li a0, 1
    ret
