;*****************************
;	Nerys Jimenez Pichardo
;	The College of Saint Rose
;	Spring 2016
;	CSC 332: Fibonacci Series
;******************************
;--------------------------------------------------------------------------
stacksg segment para stack 'Stack'	
	db	32 dup (0)		
stacksg ends
;---------------------------------------------------------------------------
datasg segment para 'Data'
first DB 0		;first memory location initialized to 0
second DB 1		;second memory location initializedd to 1
next DB ?
result DB ?		;array where sequence is going to be stored
datasg ends
;---------------------------------------------------------------------------
codesg	segment para 'Code'	
main	proc	far		
	assume ss:stacksg, ds:datasg, cs:codesg
	mov ax, datasg	
	mov ds, ax
	mov es, ax

	mov ah, 0			;counter initialized to 0	
	lea bx, result		;loads array result into register bx

loopy:	mov al, first	;move value stored in variable first to register al
		add al, second	;add first two values and stores result into register al		
		mov next, al	;move value in register al to variable next
		mov cl, second	;resgiter cl is used to swap values
		mov first, cl	;first becomes second
		mov ch, next	;register ch is used to swap values
		mov second, ch	;second becomes next

		mov [bx], ch	;stores sequence into memory

		inc bx			;increments pointer
		inc ah			;increments counter

		cmp ah, 10		;loop has 10 iterations

		jne loopy

		nop			

	mov ax, 4c00h
	int 21h

main	endp
codesg	ends
	end main