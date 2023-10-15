.include "macrolib.s"

.global input

.text
input:
fill:    
        print_str ("Enter array element = ") # hint
        read_int_a0	# read the entered value into a0
        sw    	a0 (t0)	# save a0 in A
        addi    t0 t0 4 # increase the address by the word size in bytes
        addi    t2 t2 -1
        bnez    t2 fill # check if not go beyond A boundary
        newline
        ret
