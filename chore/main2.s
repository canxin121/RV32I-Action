main:
  li t0,80000H
  li t1,55H
  li t2,AAH
  li t3,16384
L0:
  sb t1,0(t0)
  lbu t4,0(t0)
  bne t1,t4, error
  sb t2,0(t0)
  lbu t4,0(t0)
  bne t2,t4,error
  addi t0,t0,1
  addi t3,t3,-1
  bgtz,t3,L0
  j end 
end:
error;
