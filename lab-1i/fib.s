	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {lr}

 	@ if(R0 <= 0) goto .L3 (which returns 0)
	SUBS r0, #0
	BLS .L3

	@ a, b = 0, 1
	MOV r1, #0
	MOV r2, #1

.WHILE:
	@ a, b = b, a+b
	MOV r3, r1
	MOV r1, r2
	ADD r2, r3, r1
	@ n--
	SUBS r0, r0, #1
	BNE .WHILE

	MOV r0, r1
	pop {pc}		@EPILOG
	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
