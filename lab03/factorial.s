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
    # Recursive factorial function
    # Input: a0 - n
    # Output: a0 - n!

    # Base case: n = 0 or n = 1
    beqz a0, base_case
    li t1, 1
    beq a0, t1, base_case

    # Recursive case: n! = n * (n-1)!
    subi a0, a0, 1         # Decrement n
    jal ra, factorial      # Recursive call
    lw a1, 0(a0)            # Load the result of (n-1)!
    mul a0, a0, a1         # Multiply n by (n-1)!

    ret

base_case:
    li a0, 1               # Base case: n! = 1
    ret
