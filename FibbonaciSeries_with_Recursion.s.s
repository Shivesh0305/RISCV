.text
main:
    li a0, 10        # Compute fib(10)
    jal ra, fib      # Call fib(n)
    
    # Print result
    li a7, 1
    ecall
    
    li a7, 10
    ecall

# fib(n):
# if n == 0 -> return 0
# if n == 1 -> return 1
# else return fib(n-1) + fib(n-2)

fib:
    addi sp, sp, -16   # Allocate stack space
    sw ra, 12(sp)
    sw a0, 8(sp)

    li t0, 1
    beq a0, zero, base0
    beq a0, t0, base1

    addi a0, a0, -1
    jal ra, fib
    mv t1, a0           # Save fib(n-1) in t1

    lw a0, 8(sp)
    addi a0, a0, -2
    jal ra, fib
    add a0, a0, t1      # fib(n) = fib(n-1) + fib(n-2)

    lw ra, 12(sp)
    addi sp, sp, 16
    jr ra

base0:
    li a0, 0
    lw ra, 12(sp)
    addi sp, sp, 16
    jr ra

base1:
    li a0, 1
    lw ra, 12(sp)
    addi sp, sp, 16
    jr ra
