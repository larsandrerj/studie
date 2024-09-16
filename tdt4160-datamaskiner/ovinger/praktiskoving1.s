add a0, a0, a1
add a2, a2, a3
add a4, a4, a5

bge a0, a2, wecheckin
mv a0, a2

wecheckin:


bge a0, a4, wecheckin2
mv a0, a4


wecheckin2:
nop
