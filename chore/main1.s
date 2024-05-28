    .data             #数据段定义
var1:
    .word  0x0
    .globl __start
    .text
__start:
    la     t0, var1
    li     t1, 1
    li     t2, 2
    sb     t1, 0(t0)
    addi   t0, t0, 1
    sb     t2, 0(t0)
    li     a0, 5
NEXT:
    # 现在数据段为：1 2 5 0 5 2
    # a0: 5 4
    # t2: 2 0
    lb     t2, 0(t0)
    # t1: 1 5
    lb     t1, -1(t0)
    # t3: 4 0
    slli   t3, t2, 1
    # t3: 5 5
    add    t3, t3, t1
    # t0右移
    addi   t0, t0, 1
    # 存入: 5 5
    sb     t3, 0(t0)
    # t2: 5 5
    lb     t2, 0(t0)
    # t1: 2 0
    lb     t1, -1(t0)
    # t3: 2 2
    srli   t3, t2, 1
    # t3: 0 2
    sub    t3, t3, t1
    # t0右移一位
    addi   t0, t0, 1
    # 存入：0
    sb     t3, 0(t0)
    addi   a0, a0, -1
    bgtz   a0, NEXT
    ecall