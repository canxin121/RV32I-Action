    .data              #数据段定义
var1:
    .byte  17, 0, 0x42
var3:
    .word  0x127B

    .globl __start
    .text
__start:
    la     t0, var1
    li     t1, 1
    li     t3, 10
NEXT:
    lb     t2, 0(t0)
    bnez   t2, L1      #if≠0, jump
    sb     t1, 0(t0)
    addi   t1, t1, 1
L1:
    addi   t0, t0, 1
    addi   t3, t3, -1
    bgtz   t3, NEXT
    ecall