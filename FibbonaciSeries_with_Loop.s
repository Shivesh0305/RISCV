.text
main:
    li t0, 0        # t0 = a = 0 (first number)
    li t1, 1        # t1 = b = 1 (second number)
    li t2, 10       # t2 = n = 10 (number of terms)
    
print_loop:
    beqz t2, end     # If n == 0, end

    mv a0, t0        # Print a
    li a7, 1         # Syscall: print int
    ecall

    add t3, t0, t1   # t3 = a + b (next number)
    mv t0, t1        # a = b
    mv t1, t3        # b = next
    addi t2, t2, -1  # n--

    j print_loop

end:
    li a7, 10        # Exit
    ecall
