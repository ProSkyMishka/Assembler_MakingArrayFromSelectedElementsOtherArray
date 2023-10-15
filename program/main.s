.include "macrolib.s"
.include "new_macro.s"

.global main
.global array
.global arrayB

.data  
.align  2      
array:  .space  40
arrayB:  .space  40
.text   
main:
        print_str ("n = ") # hint
        read_int (t3) # read the entered value into t3
        ble     t3 zero fail # check entered length
        li      t4 10
        bgt     t3 t4 fail # check entered length
        la      t0 array # pointer to A
        li    	t2 0	# counts quantity of A's elements left
        mv   	t2 t3	# copy length of A
        mv	a3 t0	# save pointer to A
        make_input 	# call inputting A program
        mv	t2 t3 	# copy length A
        mv	t0 a3	# copy saved pointer to A
        la	a4 arrayB # pointer to B
        mv	a2 a4	# copy pointer to B
        li	t4 0	# counter of B's length
        make_prog	# call filling B program
        make_result	# call resulting program
fail:
        print_str ("error")
        exit	# stopping the program
