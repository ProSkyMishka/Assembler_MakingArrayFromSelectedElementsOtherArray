.include "macrolib.s"

.global result

.text
result:
	print_str("A:")
	print_array(t3,t0) # print A
	newline
	print_str("B:")
	beqz	t4 empty # check if B empty
	print_array(t4,a4) # print B
	ret
empty:
	print_str("Empty array")
	ret
