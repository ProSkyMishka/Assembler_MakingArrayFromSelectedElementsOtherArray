.include "macrolib.s"
.include "new_macro.s"

.global main
.global array
.global arrayB

.data
array:  .space  40
arrayB:  .space  40
.text   
main:
	li 	a6 -1	# counter of tests
	la 	t0 array #pointer to A
        la	a4 arrayB # pointer to B
	print_str ("Tests")
test:
	newline
	newline
	newline
	addi	a6 a6 1
	mv	a3 t0	# copy pointer to A
	jal 	tests	# entering A
	ble     t3 zero fail_0 # check entered length
        li      t4 10
        bgt     t3 t4 fail_11 # check entered length
        mv	t2 t3 	# copy length A
        mv	a3 t0	# copy pointer to A
        mv	a2 a4	# copy pointer to B
        li	t4 0	# counter of B's length
        make_prog	# call filling B program
        make_result	# call resulting program
        j	test
fail_0:
        print_str ("error")
        j	test
fail_11:
        print_str ("error")
        exit
# choose test
tests:
	beq	zero a6 fir
	li	t6 1
	beq	t6 a6 sec
	li	t6 2
	beq	t6 a6 thi
	li	t6 3
	beq	t6 a6 for
	li	t6 4
	beq	t6 a6 fif
# entering A
fir:
	li 	t3 0
	print_str ("First: empty A")
	newline
	ret
sec:
	li	t3 -2
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -4
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -56
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -8
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -6
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -10
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -12
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -100
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -2147483648
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -24
	sw	t3 (a3)
	li	t3 10
	print_str ("Second: n_A = 10, all elements even and less than zero")
	newline
	ret
thi:
	li	t3 2
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 55
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -57
	sw	t3 (a3)
	li	t3 3
	print_str ("Third: n_A = 3, not includes even and less than zero element")
	newline
	ret
for:
	li	t3 -1
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -2
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 -4
	sw	t3 (a3)
	addi	a3 a3 4
	li	t3 6
	sw	t3 (a3)
	li	t3 4
	print_str ("Forth: n_A = 4, some elements odd and some even, some less and some greater than zero")
	newline
	ret
fif:
	li 	t3 11
	print_str ("Fifth: lenth greater than 10")
	newline
	ret
