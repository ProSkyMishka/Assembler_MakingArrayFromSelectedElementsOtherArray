.include "macrolib.s"

.global program

.text
program: 
fill:
	beqz	t2 out	# check if go beyond A boundary
        lw	t5 (a3)	# read A's element into t5
        addi	a3 a3 4	# increase the address by the word size in bytes
        addi	t2 t2 -1
        bgtz 	t5 fill # check if element great than zero
        andi    t6 t5 1 # read the last bit digit of t5 into t6
        li	t1 1
        beq    	t1 t6 fill # check if t5 odd
        addi	t4 t4 1	# increase counter of B's length
        sw	t5 (a2) # save t5 in B
        addi	a2 a2 4 # increase the address by the word size in bytes
        j	fill
out:
	ret
