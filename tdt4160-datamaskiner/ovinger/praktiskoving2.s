


addi a2, x0, 1 # største divisor til a0
addi a3, x0, 1 # iterator

find_gd:
    beq a0, a3, find_gd_end #hvis a0 er lik a3 find_gd ferdig
    
    rem a4, a0, a3

    bne a4, a5, store_current_gd_end # hvis a0 % a3 != 1 -> hopp til neste iterasjon
    
    mv a2, a3 #lagre nåværende iterasjon som største divisor
    
    store_current_gd_end:
        
    addi a3, a3, 1 # a2 +1
    jal x0, find_gd
    

find_gd_end:
    
    
    
addi a3, x0, 1 # Resette iterator
addi a1, x0, 0 # Anta att a0 ikke er et kvadrattall

find_sqrt:
    mul a4, a3, a3 # a4 = a3*a3
    
    bne a0, a4, not_sqrt # a4 = a3 ^ 2 != a0, ikke en rot
    
    addi a1, a1, 1 # a1 + 1
    
    not_sqrt:
 
    bge a4, a0, find_sqrt_end # hvis a4^2 > a0 -> find_sqrt_end
    
    addi a3, a3, 1 # iterer + 1
    
    jal x0, find_sqrt # we go round
    
    
find_sqrt_end:
    
    mv a0, a2
    
    nop