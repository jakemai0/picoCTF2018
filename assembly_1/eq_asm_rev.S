.intel_syntax noprefix
.bits 32
	
.global asm1


#we need to call asm1(0x76)

asm1:
	push	ebp	#function prologue
	mov	ebp,esp	#function prologue
	cmp	DWORD PTR [ebp+0x8],0x98 #here we compare if our argument with 0x98, use python to check: 0x76 < 0x98
	jg 	part_a			 #since 0x76 < 0x98, we wont jump to part a
	cmp	DWORD PTR [ebp+0x8],0x8	 #check: 0x76 does > 0x8 => true, go to part b
	jne	part_b
	mov	eax,DWORD PTR [ebp+0x8]
	add	eax,0x3
	jmp	part_d
part_a:
	cmp	DWORD PTR [ebp+0x8],0x16
	jne	part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_b:
	mov	eax,DWORD PTR [ebp+0x8] #eax = 0x76
	sub	eax,0x3			#subtract 0x3: 0x76 - 0x3 = 0x73
	jmp	part_d			#go to part d
	cmp	DWORD PTR [ebp+0x8],0xbc
	jne	part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_c:
	mov	eax,DWORD PTR [ebp+0x8]
	add	eax,0x3
part_d:					#we finish here, so asm1(0x76) = 0x73
	pop	ebp
	ret

#flag is:
#0x73
