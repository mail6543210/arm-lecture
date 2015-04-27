file atomic
target remote localhost:1234

# break 'atomic.c':39
break 'atomic.c':40
break 'mutex.s':36

display mutexlock
display/x *$r0
display &mutexlock
display/x $r0
display $r1
display $r2
display/x $cpsr
