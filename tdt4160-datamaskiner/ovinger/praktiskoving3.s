# init
#addi a0, a0, 7
#addi a1, a1, 5
#addi a2, a2, 6
#addi a3, a3, 19
#addi a4, a4, 3
#addi a5, a5, 100


loop:

    ble a0, a1, next0

    addi a6, a0, 0
    addi a0, a1, 0
    addi a1, a6, 0

    next0:


    ble a1, a2, next1

    addi a6, a1, 0
    addi a1, a2, 0
    addi a2, a6, 0

    next1:


    ble a2, a3, next2

    addi a6, a2, 0
    addi a2, a3, 0
    addi a3, a6, 0

    next2:


    ble a3, a4, next3

    addi a6, a3, 0
    addi a3, a4, 0
    addi a4, a6, 0

    next3:


    ble a4, a5, next4

    addi a6, a4, 0
    addi a4, a5, 0
    addi a5, a6, 0

    next4:
    
    
    bge a0, a1, loop
    
    bge a1, a2, loop
    
    bge a2, a3, loop
    
    bge a3, a4, loop
    
    bge a4, a5, loop








