	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW

    mov r2, #locked
    @r0=addr, r1=value, r2=status
    LDREX r1, [r0]
    CMP r1, #0
	    STREXEQ r1, r2, [r0]
	    CMPEQ r1, #0
    BNE lock_mutex
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        
	mov r2, #unlocked
    LDREX r1, [r0]
    STREX r1, r2, [r0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
