    .text
    .globl _main
_main:
# 初始化数据
    li     a0, 0x12345678 # 假设这是要检查的字
    call   count_ones     # 调用函数计算位为 1 的数量
# a0 现在包含位为 1 的数量

# 正常退出程序
    li     a7, 93         # 系统调用号，93 是退出系统调用
    li     a0, 0          # 退出状态码，0 表示正常退出
    ecall                 # 执行系统调用，结束程序

    .globl count_ones
count_ones:
# 输入: a0 - 包含要检查的字
# 输出: a0 - 位为 1 的数量

    li     t0, 0          # t0 用于计数 1 的个数
    li     t1, 32         # t1 用于迭代 32 次

count_loop:
    beqz   t1, end        # 如果迭代 32 次，则结束循环
    andi   t2, a0, 1      # t2 = a0 & 1，检查最低位
    add    t0, t0, t2     # 如果最低位为 1，则计数器加 1
    srli   a0, a0, 1      # a0 右移一位，准备检查下一个位
    addi   t1, t1, -1     # 迭代次数减 1
    j      count_loop     # 跳转回循环开始

end:
    mv     a0, t0         # 将计数结果移动到 a0 以返回
    ret                   # 返回调用者
