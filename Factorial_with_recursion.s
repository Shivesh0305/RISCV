.data
num1: .word 5
str1: .string "Factorial of "
str2: .string " is "

.text
main:
    li a0, 5         # Load 5 into a0 (argument to factorial)
    jal ra, fact     # Call factorial function
                     # result will be in a0

    # Print the result
    li a7, 1         # Syscall: print integer
    ecall

    # Exit
    li a7, 10
    ecall

# Function: int fact(int n)
# Input: a0 = n
# Output: a0 = factorial(n)

fact:
    addi sp, sp, -16     # Make space on stack
    sw ra, 12(sp)        # Save return address
    sw a0, 8(sp)         # Save argument n

    li t0, 1
    beq a0, t0, base_case  # if n == 1, return 1

    addi a0, a0, -1       # n = n - 1
    jal ra, fact          # Recursive call: fact(n - 1)

    lw t1, 8(sp)          # Load original n
    mul a0, a0, t1        # a0 = fact(n-1) * n

    lw ra, 12(sp)         # Restore return address
    addi sp, sp, 16       # Clean up stack
    jr ra                 # Return

base_case:
    li a0, 1              # Return 1 for base case
    lw ra, 12(sp)
    addi sp, sp, 16
    jr ra