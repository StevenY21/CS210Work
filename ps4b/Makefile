calc_basic: calc.o data/basic_cmds.o and.o or.o sum.o upper.o
	ld -g  calc.o data/basic_cmds.o and.o or.o sum.o upper.o -o calc_basic
calc_simpleone: calc.o data/simpleone_cmds.o and.o or.o sum.o upper.o
	ld -g  calc.o data/simpleone_cmds.o  and.o or.o sum.o upper.o -o calc_simpleone
calc_upperonly: calc.o data/upperonly_cmds.o and.o or.o sum.o upper.o
	ld -g calc.o data/upperonly_cmds.o and.o or.o sum.o upper.o -o calc_upperonly
calc_easy: calc.o data/easy_cmds.o and.o or.o sum.o upper.o
	ld -g calc.o data/easy_cmds.o and.o or.o sum.o upper.o -o calc_easy
calc_basicwithupper: calc.o data/basicwithupper_cmds.o and.o or.o sum.o upper.o
	ld -g calc.o data/basicwithupper_cmds.o and.o or.o sum.o upper.o -o calc_basicwithupper
calc_simplerandom: calc.o data/simplerandom_cmds.o and.o or.o sum.o upper.o
	ld -g calc.o data/simplerandom_cmds.o and.o or.o sum.o upper.o -o calc_simplerandom
and.o: and.s
	as -g and.s -o and.o
or.o: or.s
	as -g or.s -o or.o
sum.o: sum.s
	as -g sum.s -o sum.o
upper.o: upper.s
	as -g upper.s -o upper.o
calc.o: calc.s
	as -g  calc.s -o calc.o
data/basic_cmds.o: data/basic_cmds.s
	as -g  data/basic_cmds.s -o data/basic_cmds.o 
data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o data/simpleone_cmds.o
data/upperonly_cmds.o: data/upperonly_cmds.s
	as -g data/upperonly_cmds.s -o data/upperonly_cmds.o
data/easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o data/easy_cmds.o
data/basicwithupper_cmds.o: data/basicwithupper_cmds.s
	as -g data/basicwithupper_cmds.s -o data/basicwithupper_cmds.o
data/simplerandom_cmds.o: data/simplerandom_cmds.o
	as -g data/simplerandom_cmds.s -o data/simplerandom_cmds.o
