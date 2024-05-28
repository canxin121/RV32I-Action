    .data              #数据段定义
var1:
    .byte  17, 0, 0x42

    .text
    .globl _main
_main:
    lw     t0,var1
    lb     t1,var1
    nop