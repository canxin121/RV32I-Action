# 计算斐波那契数列的前N项
    .text
    .globl _start

_start:
    li      t0, 10        # t0寄存器存储N的值，这里以计算前10项为例
    li      t1, 0         # t1寄存器存储当前项的值，初始为0
    li      t2, 1         # t2寄存器存储下一项的值，初始为1

loop:
    beq     t0, zero, end # 如果计数器为0，跳转到结束
    add     t3, t1, t2    # t3寄存器存储下一项的值（t1 + t2）
    mv      t1, t2        # 更新当前项的值
    mv      t2, t3        # 更新下一项的值
    addi    t0, t0, -1    # 计数器减1
    j       loop          # 跳转回循环开始

end:
# 此处可以添加代码以输出计算结果，例如通过系统调用
# 结束程序
    li      a7, 93        # 系统调用号exit
    nop
    ecall                 # 执行系统调用
