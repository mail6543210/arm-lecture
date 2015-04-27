file ./fibseq
dir ./
target remote localhost:1234

break fibseq.c:11

#break main
#break fibonacci
break fib.s:30
break fib.s:37
break fib.s:47
break fib.s:51

display main::number
display main::result

display $r0
display $r4
display $r5
display/x $cpsr
