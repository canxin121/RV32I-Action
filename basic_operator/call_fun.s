# 计算寄存器a0中word的1的个数，结果存储在寄存器a1中
# a0 - 输入word
# a1 - 输出1的个数

    addi a1, zero, 0    # 初始化计数器为0
    li   t0, 32         # 初始化循环计数器为32

loop:
    andi t1, a0, 1      # 检查最低位是否为1
    beq  t1, zero, skip # 如果不是1，跳过增加计数
    addi a1, a1, 1      # 如果是1，计数器加1

skip:
    srai a0, a0, 1      # 将word右移一位
    addi t0, t0, -1     # 循环计数器减1
    bnez t0, loop       # 如果循环计数器不为0，继续循环

# 此时a1中存储的就是a0中1的个数
