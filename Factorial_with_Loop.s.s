.text
main:
    li t0, 5        # t0 = n = 5
    li t1, 1        # t1 = result = 1

loop:
    mul t1, t1, t0  # result = result * n
    addi t0, t0, -1 # n = n - 1
    bnez t0, loop   # if n != 0, repeat loop

    mv a0, t1       # Move result to a0 for printing
    li a7, 1        # Syscall: print integer
    ecall

    # Exit
    li a7, 10
    ecall
