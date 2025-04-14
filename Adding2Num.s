.data
num1: .word 9
num2: .word 5

.text
main:
    la a0, num1       # Load address of msg into t0
    lw a1, 0(a0)     # Load value of msg into t1

    la a2, num2      # Load address of msg1 into t2
    lw a3, 0(a2)     # Load value of msg1 into t3

    add a4, a1, a3   # t4 = t1 + t3

    mv a0, a4        # Move the result to a0 for printing
    li a7, 1         # Syscall for printing integer
    ecall

    li a7, 10        # Syscall for exit
    ecall
   