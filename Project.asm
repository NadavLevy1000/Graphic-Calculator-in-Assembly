;Nadav Levy
IDEAL
MODEL small
STACK 100h
DATASEG
ReturnAddress dw 0
ReturnAddress2 dw 0
ReturnAddress3 dw 0
ReturnAddress4 dw 0
ReturnAddress5 dw 0
ReturnAddress6 dw 0
ReturnAddress7 dw 0
ReturnAddress8 dw 0
ReturnAddress9 dw 0
ReturnAddress10 dw 0
ReturnAddress11 dw 0
ReturnAddress12 dw 0
ReturnAddress13 dw 0
ReturnAddress14 dw 0
ReturnAddress15 dw 0
ReturnAddress16 dw 0
ReturnAddress17 dw 0
ReturnAddress18 dw 0
poppedin dw 0
color dw 0
saver dw 0
saver1 dw 0
saver2 dw 0
saver3 dw 0
saver4 dw 0
saver5 dw 0
saverofy dw 0
endx dw 0
endy dw 0
startx dw 0
printthebuttons dw 0
answer dw 0
previousAnswer dw 0
prevprevAnswer dw 0
useprevprev dw 0
plusbool dw 2
minusbool dw 2
multiplicationbool dw 2
divisionbool dw 2
firstdigit dw 1
decimal dw 0
place dw 0
CODESEG
proc printpixel;gets place and color in that order via stack
	pop [ReturnAddress]
	mov bh,0h
	pop bx
	mov cx,bx
	pop bx
	mov dx,bx
	pop bx
	mov ax,bx
	mov bl,0
	mov ah,0ch
	int 10h
	push [ReturnAddress]
	ret
endp printpixel

proc printRow;gets index of row and color
	pop[ReturnAddress2]
	pop color
	mov cx,319
	printapixel:
	pop bx;has y coordinate of row
	push bx
	mov saver,cx
	push color
	push bx
	push cx
	call printpixel
	mov cx,saver
	dec cx
	cmp cx,0
	jne printapixel
	push[ReturnAddress2]
	ret
endp printRow

proc printlinerow;gets start of line y coordinate and end of line
	pop[ReturnAddress2]
	pop color
	pop cx
	printapixel2:
	pop bx;has y coordinate of row
	push bx
	mov saver,cx
	push color
	push bx
	push cx
	call printpixel
	mov cx,saver
	dec cx
	pop bx
	pop dx
	push dx
	push bx
	cmp cx,dx
	jne printapixel2
	push[ReturnAddress2]
	ret
endp printlinerow

proc printCollumn;gets index of collumn and color
	pop[ReturnAddress2]
	pop color
	mov cx,199
	printapixel3:
	pop bx;has x coordinate of collumn
	push bx
	mov saver,cx
	push color
	push cx
	push bx
	call printpixel
	mov cx,saver
	dec cx
	cmp cx,0
	jne printapixel3
	push[ReturnAddress2]
	ret
endp printCollumn

proc printlinecollumn;gets start of line x coordinate and end of line and color
	pop[ReturnAddress2]
	pop color
	pop cx
	printapixel4:
	pop bx;has x coordinate of row
	push bx
	mov saver,cx
	push color
	push cx
	push bx
	call printpixel
	mov cx,saver
	dec cx
	pop bx
	pop dx
	push dx
	push bx
	cmp cx,dx
	jne printapixel4
	push[ReturnAddress2]
	ret
endp printlinecollumn

proc printRectangle;gets starting position(bottom right corner), width and length and color
	pop [ReturnAddress3]
	pop color
	pop endx
	pop endy
	pop cx
	pop bx
	printrow2:
	mov startx,cx
	mov saverofy, bx
	push endx
	push bx
	push cx
	push color
	call printlinerow
	mov cx,startx
	mov bx,saverofy
	dec bx
	cmp bx,endy
	jne printRow2
	
	
	push [ReturnAddress3]
	ret
endp printRectangle

proc printOne;prints one gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1,cx
	mov saver2,dx
	sub cx, 6
	sub dx, 1
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 9
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 15
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 11
	sub dx, 15
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push [ReturnAddress4]
	ret
endp printOne

proc printTwo;prints two gets x and y coordinates and color
	pop [ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx,4
	sub dx,2
	push dx
	push cx
	sub cx,13
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 13
	sub dx, 4
	push dx
	push cx
	sub cx,2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 11
	sub dx, 6
	push dx
	push cx
	sub cx,2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx,saver2
	sub cx, 9
	sub dx, 8
	push dx
	push cx
	sub cx,2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx,saver1
	mov dx,saver2
	sub cx,7
	sub dx,10
	push dx
	push cx
	sub cx,2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 12
	push dx
	push cx
	sub cx,2
	sub dx,5
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx,7
	sub dx,17
	push dx
	push cx
	sub cx,7
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 15
	push dx
	push cx
	sub cx, 2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	push [ReturnAddress4]
	ret
endp printTwo

proc printThree;prints three to the screen gets x and y coordinates and color
	pop [ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx,7
	sub dx,1
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 6
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 7
	sub dx, 9
	push dx
	push cx
	sub cx, 5
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 11
	push dx
	push cx
	sub cx, 2
	sub dx, 6
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 7
	sub dx, 17
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 15
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push [ReturnAddress4]
	ret
endp printThree

proc printFour;prints four to the screen get x and y coordinates and a color
	pop [ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1,cx
	mov saver2,dx
	sub cx,6
	sub dx,1
	push dx
	push cx
	sub cx,2
	sub dx, 18
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 8
	push dx
	push cx
	sub cx, 15
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 8
	sub dx, 16
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 10
	sub dx, 14
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 12
	sub dx, 12
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 14
	sub dx, 10
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push [ReturnAddress4]
	ret
endp printFour

proc printFive;prints five to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1,cx
	mov saver2,dx
	sub cx, 5
	sub dx, 1
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 6
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 9
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 11
	push dx 
	push cx
	sub cx, 2
	sub dx, 8
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 17
	push dx
	push cx
	sub cx, 12
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printFive

proc printSix;prints six to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2 ,dx
	sub cx, 5
	sub dx, 1
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 7
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 12
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 10
	push dx
	push cx
	sub cx, 10
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2 
	sub cx, 13
	sub dx, 15
	push dx
	push cx
	sub cx,2
	sub dx,2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 17
	push dx
	push cx
	sub cx, 9
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printSix

proc printSeven;prints seven to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 13
	sub dx, 1
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 12
	sub dx, 4
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 10
	sub dx, 7
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 9
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 8
	sub dx, 11
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 13
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 15
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 17
	push dx
	push cx
	sub cx, 13
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printSeven

proc printEight;prints eight to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 5
	sub dx, 1
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1 
	mov dx, saver2 
	sub cx, 3
	sub dx, 2
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx 
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 2
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 2
	sub dx, 5
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 16
	sub dx, 5
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 8
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 8
	push dx
	push cx
	sub cx, 2
	sub dx, 3
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 11
	push dx
	push cx
	sub cx, 12
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 13
	push dx
	push cx
	sub cx, 2
	sub dx, 4
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 13
	push dx
	push cx
	sub cx, 2
	sub dx, 4
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 17
	push dx
	push cx
	sub cx, 12
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printEight

proc printNine;prints nine to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 5
	sub dx, 1
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 14
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 9
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 11
	push dx
	push cx
	sub cx, 2
	sub dx, 6
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 17
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx 
	push color 
	call printRectangle
	push[ReturnAddress4]
	ret
endp printNine

proc printPlusSign;prints plus sign to the screen get x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 6
	sub dx, 9
	push dx
	push cx
	sub cx, 3
	sub dx, 2
	push dx
	push cx 
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 11
	sub dx, 9
	push dx
	push cx
	sub cx, 3
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 9
	sub dx, 6
	push dx
	push cx
	sub cx, 2
	sub dx, 8
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printPlusSign

proc printMinusSign;prints minus sign to the screen get x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	sub cx, 6
	sub dx, 9
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printMinusSign

proc printMultiplicationSign;prints multiplication sign to the screen gets x and y coortdinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 5
	sub dx, 5
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 13
	sub dx, 5
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 7
	sub dx, 7
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 11
	sub dx, 7
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 9
	sub dx, 9
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 7
	sub dx, 11
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 11
	sub dx, 11
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 13
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 13
	sub dx, 13
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 6
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 12
	sub dx, 6
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 8
	sub dx, 8
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 10
	sub dx, 8
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 8
	sub dx, 10
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 10
	sub dx, 10
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 12
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 12
	sub dx, 12
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printMultiplicationSign

proc printDivisionSign;prints division sign to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 9
	sub dx, 6
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 9
	sub dx, 12
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 9
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printDivisionSign

proc printEqualsSign;prints the equals sign to the screen gets x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 6
	sub dx, 7
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 11
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printEqualsSign

proc printZero;prints zero to the screen get x and y coordinates and color
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 5
	sub dx, 1
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 14
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 3
	push dx
	push cx
	sub cx, 2
	sub dx, 14
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 5
	sub dx, 17
	push dx
	push cx
	sub cx, 10
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	push[ReturnAddress4]
	ret
endp printZero

proc printClear
	pop[ReturnAddress4]
	pop cx
	pop dx
	pop color
	mov saver1, cx
	mov saver2, dx
	sub cx, 6
	sub dx, 1
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 2
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 4
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 14
	sub dx, 2
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 15
	sub dx, 4
	push dx
	push cx
	sub cx, 2
	sub dx, 12
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 3
	sub dx, 14
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 14
	sub dx, 16
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 4
	sub dx, 16
	push dx
	push cx
	sub cx, 2
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	mov cx, saver1
	mov dx, saver2
	sub cx, 6
	sub dx, 17
	push dx
	push cx
	sub cx, 8
	sub dx, 2
	push dx
	push cx
	push color
	call printRectangle
	push[ReturnAddress4]
	ret
endp printClear

proc printCalculator;prints the calculator
	pop[ReturnAddress6]
	;prints base of calculator
	push 197 ;starty
	push 212 ;startx
	push 2 ;endy
	push 106 ;endx
	push 20 ;color
	call printRectangle
	
	;prints screen of calculator
	push 70
	push 210
	push 4
	push 108
	push 27
	call printRectangle
	
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	;printing buttons
	
	call printButtons

	push[ReturnAddress6]
	ret
endp printCalculator

proc printButtons
	pop[ReturnAddress5]
	
	;Clear button
	push 188
	push 132
	push 166
	push 110
	push 27
	call printRectangle
	push 187 ;start y
	push 131 ;start x
	push 167 ;end y
	push 111 ;end x
	push 25 ;color 
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 131 ;x coordinate
	call printClear
	
	;0 button
	push 188
	push 157
	push 166
	push 135
	push 27
	call printRectangle
	push 187 ;starty
	push 156 ;startx
	push 167 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 156 ;x coordinate
	call printZero
	
	;= button
	push 188
	push 182
	push 166
	push 160
	push 27
	call printRectangle
	push 187 ;starty
	push 181 ;startx
	push 167 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 181 ;x coordinate
	call printEqualsSign
	
	;/ button
	push 188
	push 207
	push 166
	push 185
	push 27
	call printRectangle
	push 187 ;starty
	push 206 ;startx
	push 167 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 206 ;x coordinate
	call printDivisionSign
	
	;1 button
	push 158
	push 132
	push 136
	push 110
	push 27
	call printRectangle
	push 157 ;starty
	push 131 ;startx
	push 137 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 131 ;x coordinate
	call printOne
	
	;2 button
	push 158
	push 157
	push 136
	push 135
	push 27
	call printRectangle
	push 157 ;starty
	push 156 ;startx
	push 137 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 156 ;x coordinate
	call printTwo
	
	;3 button
	push 158
	push 182
	push 136
	push 160
	push 27
	call printRectangle
	push 157 ;starty
	push 181 ;startx
	push 137 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 181 ;x coordinate
	call printThree
	
	;* button
	push 158
	push 207
	push 136
	push 185
	push 27
	call printRectangle
	push 157 ;starty
	push 206 ;startx
	push 137 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 206 ;x coordinate
	call printMultiplicationSign
	
	;4 button
	push 128
	push 132
	push 106
	push 110
	push 27
	call printRectangle
	push 127 ;starty
	push 131 ;startx
	push 107 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 131 ;x coordinate
	call printFour
	
	;5 button
	push 128
	push 157
	push 106
	push 135
	push 27
	call printRectangle
	push 127 ;starty
	push 156 ;startx
	push 107 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 156 ;x coordinate
	call printFive
	
	;6 button 
	push 128
	push 182
	push 106
	push 160
	push 27
	call printRectangle
	push 127 ;starty
	push 181 ;startx
	push 107 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 181 ;x coordinate
	call printSix
	
	;- button
	push 128
	push 207
	push 106
	push 185
	push 27
	call printRectangle
	push 127 ;starty
	push 206 ;startx
	push 107 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 206 ;x coordinate
	call printMinusSign
	
	;7 button
	push 98
	push 132
	push 76
	push 110
	push 27
	call printRectangle
	push 97 ;starty
	push 131 ;startx
	push 77 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 131 ;x coordinate
	call printSeven
	
	;8 button
	push 98
	push 157
	push 76
	push 135
	push 27
	call printRectangle
	push 97 ;starty
	push 156 ;startx
	push 77 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 156 ;x coordinate
	call printEight
	
	;9 button 
	push 98
	push 182
	push 76
	push 160
	push 27
	call printRectangle
	push 97 ;starty
	push 181 ;startx
	push 77 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 181 ;x coordinate
	call printNine
	
	;+ button
	push 98
	push 207
	push 76
	push 185
	push 27
	call printRectangle
	push 97 ;starty
	push 206 ;startx
	push 77 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 206 ;x coordinate
	call printPlusSign
	push[ReturnAddress5]
	ret
endp printButtons

proc highlightClear
	pop[ReturnAddress5]
	
	push 187 ;start y
	push 131 ;start x
	push 167 ;end y
	push 111 ;end x
	push 4 ;color 
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 131 ;x coordinate
	call printClear
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	push 0
	push 47
	push 207
	call printClear
	
	mov answer, 0
	mov previousAnswer, 0
	mov place, 0
	mov prevprevAnswer, 0
	mov useprevprev, 0
	mov ax, 0
	
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readtheClock:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readtheClock
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	push 187 ;start y
	push 131 ;start x
	push 167 ;end y
	push 111 ;end x
	push 25 ;color 
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 131 ;x coordinate
	call printClear
	push[ReturnAddress5]
	ret
endp highlightClear

proc highlightOne
	pop[ReturnAddress5]
	push 157 ;starty
	push 131 ;startx
	push 137 ;endy
	push 111 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 131 ;x coordinate
	call printOne
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigit
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 1
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish
	
	
	isfirstDigit:
	
	mov firstDigit, 0
	;prints one to the screen
	push 0
	push 47
	push 207
	call printOne
	
	cmp plusbool,1
	jne n1
	jmp allreadyoperated
	n1:
	cmp minusbool,1
	jne n2
	jmp allreadyoperated
	n2:
	cmp multiplicationbool,1
	jne n3
	jmp allreadyoperated
	n3:
	cmp divisionbool,1
	jne didntoperate
	
	allreadyoperated:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate:
	cmp previousAnswer, 0
	je dontwork
	mov answer, 1
	jmp finish
	
	dontwork:
	mov previousAnswer, 1
	jmp finish
	
	
	
	finish:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock
	
	push 157 ;starty
	push 131 ;startx
	push 137 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 131 ;x coordinate
	call printOne
	push[ReturnAddress5]
	ret
endp highlightOne

proc highlightTwo
	pop[ReturnAddress5]
	push 157 ;starty
	push 156 ;startx
	push 137 ;endy
	push 136 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 156 ;x coordinate
	call printTwo
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp firstDigit, 1
	je isfirstDigitTwo
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 2
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish2
	
	
	isfirstDigitTwo:
	
	mov firstDigit, 0
	;prints two to the screen
	push 0
	push 47
	push 207
	call printTwo
	
	cmp plusbool,1
	jne n21
	jmp allreadyoperated2
	n21:
	cmp minusbool,1
	jne n22
	jmp allreadyoperated2
	n22:
	cmp multiplicationbool,1
	jne n23
	jmp allreadyoperated2
	n23:
	cmp divisionbool,1
	jne didntoperate2
	
	allreadyoperated2:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate2:
	cmp previousAnswer, 0
	je dontwork2
	mov answer, 2
	jmp finish2
	
	dontwork2:
	mov previousAnswer, 2
	jmp finish2
	
	
	
	finish2:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock2:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock2
	
	push 157 ;starty
	push 156 ;startx
	push 137 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 156 ;x coordinate
	call printTwo
	push[ReturnAddress5]
	ret
endp highlightTwo

proc highlightThree
	pop[ReturnAddress5]
	push 157 ;starty
	push 181 ;startx
	push 137 ;endy
	push 161 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 181 ;x coordinate
	call printThree
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitThree
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 3
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish3
	
	
	isfirstDigitThree:
	
	mov firstDigit, 0
	;prints three to the screen
	push 0
	push 47
	push 207
	call printThree
	
	cmp plusbool,1
	jne n31
	jmp allreadyoperated3
	n31:
	cmp minusbool,1
	jne n32
	jmp allreadyoperated3
	n32:
	cmp multiplicationbool,1
	jne n33
	jmp allreadyoperated3
	n33:
	cmp divisionbool,1
	jne didntoperate3
	
	allreadyoperated3:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate3:
	cmp previousAnswer, 0
	je dontwork3
	mov answer, 3
	jmp finish3
	
	dontwork3:
	mov previousAnswer, 3
	jmp finish3
	
	
	
	finish3:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock3:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock3
	
	push 157 ;starty
	push 181 ;startx
	push 137 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 181 ;x coordinate
	call printThree
	push[ReturnAddress5]
	ret
endp highlightThree

proc highlightFour
	pop[ReturnAddress5]
	push 127 ;starty
	push 131 ;startx
	push 107 ;endy
	push 111 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 131 ;x coordinate
	call printFour
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitFour
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 4
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish4
	
	
	isfirstDigitFour:
	
	mov firstDigit, 0
	;prints four to the screen
	push 0
	push 47
	push 207
	call printFour
	
	cmp plusbool,1
	jne n41
	jmp allreadyoperated4
	n41:
	cmp minusbool,1
	jne n42
	jmp allreadyoperated4
	n42:
	cmp multiplicationbool,1
	jne n43
	jmp allreadyoperated4
	n43:
	cmp divisionbool,1
	jne didntoperate4
	
	allreadyoperated4:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate4:
	cmp previousAnswer, 0
	je dontwork4
	mov answer, 4
	jmp finish4
	
	dontwork4:
	mov previousAnswer, 4
	jmp finish4
	
	
	
	finish4:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock4:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock4
	
	push 127 ;starty
	push 131 ;startx
	push 107 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 131 ;x coordinate
	call printFour
	push[ReturnAddress5]
	ret
endp highlightFour

proc highlightFive
	pop[ReturnAddress5]
	push 127 ;starty
	push 156 ;startx
	push 107 ;endy
	push 136 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 156 ;x coordinate
	call printFive
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitFive
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 5
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish5
	
	
	isfirstDigitFive:
	
	mov firstDigit, 0
	;prints five to the screen
	push 0
	push 47
	push 207
	call printFive
	
	cmp plusbool,1
	jne n51
	jmp allreadyoperated5
	n51:
	cmp minusbool,1
	jne n52
	jmp allreadyoperated5
	n52:
	cmp multiplicationbool,1
	jne n53
	jmp allreadyoperated5
	n53:
	cmp divisionbool,1
	jne didntoperate5
	
	allreadyoperated5:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate5:
	cmp previousAnswer, 0
	je dontwork5
	mov answer, 5
	jmp finish5
	
	dontwork5:
	mov previousAnswer, 5
	jmp finish5
	
	
	
	finish5:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock5:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock5
	
	push 127 ;starty
	push 156 ;startx
	push 107 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 156 ;x coordinate
	call printFive
	push[ReturnAddress5]
	ret
endp highlightFive

proc highlightSix
	pop[ReturnAddress5]
	push 127 ;starty
	push 181 ;startx
	push 107 ;endy
	push 161 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 181 ;x coordinate
	call printSix
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitSix
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 6
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish6
	
	
	isfirstDigitSix:
	
	mov firstDigit, 0
	;prints six to the screen
	push 0
	push 47
	push 207
	call printSix
	
	cmp plusbool,1
	jne n61
	jmp allreadyoperated6
	n61:
	cmp minusbool,1
	jne n62
	jmp allreadyoperated6
	n62:
	cmp multiplicationbool,1
	jne n63
	jmp allreadyoperated6
	n63:
	cmp divisionbool,1
	jne didntoperate6
	
	allreadyoperated6:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate6:
	cmp previousAnswer, 0
	je dontwork6
	mov answer, 6
	jmp finish6
	
	dontwork6:
	mov previousAnswer, 6
	jmp finish6
	
	
	
	finish6:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock6:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock6
	
	push 127 ;starty
	push 181 ;startx
	push 107 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 181 ;x coordinate
	call printSix
	push[ReturnAddress5]
	ret
endp highlightSix

proc highlightSeven
	pop[ReturnAddress5]
	push 97 ;starty
	push 131 ;startx
	push 77 ;endy
	push 111 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 131 ;x coordinate
	call printSeven
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitSeven
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 7
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish7
	
	
	isfirstDigitSeven:
	
	mov firstDigit, 0
	;prints seven to the screen
	push 0
	push 47
	push 207
	call printSeven
	
	cmp plusbool,1
	jne n71
	jmp allreadyoperated7
	n71:
	cmp minusbool,1
	jne n72
	jmp allreadyoperated7
	n72:
	cmp multiplicationbool,1
	jne n73
	jmp allreadyoperated7
	n73:
	cmp divisionbool,1
	jne didntoperate7
	
	allreadyoperated7:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate7:
	cmp previousAnswer, 0
	je dontwork7
	mov answer, 7
	jmp finish7
	
	dontwork7:
	mov previousAnswer, 7
	jmp finish7
	
	
	
	finish7:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock7:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock7
	
	push 97 ;starty
	push 131 ;startx
	push 77 ;endy
	push 111 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 131 ;x coordinate
	call printSeven
	push[ReturnAddress5]
	ret
endp highlightSeven

proc highlightEight
	pop[ReturnAddress5]
	push 97 ;starty
	push 156 ;startx
	push 77 ;endy
	push 136 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 156 ;x coordinate
	call printEight
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	
	cmp firstDigit, 1
	je isfirstDigitEight
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 8
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish8
	
	
	isfirstDigitEight:
	
	mov firstDigit, 0
	;prints eight to the screen
	push 0
	push 47
	push 207
	call printEight
	
	cmp plusbool,1
	jne n81
	jmp allreadyoperated8
	n81:
	cmp minusbool,1
	jne n82
	jmp allreadyoperated8
	n82:
	cmp multiplicationbool,1
	jne n83
	jmp allreadyoperated8
	n83:
	cmp divisionbool,1
	jne didntoperate8
	
	allreadyoperated8:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate8:
	cmp previousAnswer, 0
	je dontwork8
	mov answer, 8
	jmp finish8
	
	dontwork8:
	mov previousAnswer, 8
	jmp finish8
	
	
	
	finish8:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock8:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock8
	
	push 97 ;starty
	push 156 ;startx
	push 77 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 156 ;x coordinate
	call printEight
	push[ReturnAddress5]
	ret
endp highlightEight

proc highlightNine
	pop[ReturnAddress5]
	push 97 ;starty
	push 181 ;startx
	push 77 ;endy
	push 161 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 181 ;x coordinate
	call printNine
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp firstDigit, 1
	je isfirstDigitNine
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 9
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish
	
	
	isfirstDigitNine:
	
	mov firstDigit, 0
	;prints nine to the screen
	push 0
	push 47
	push 207
	call printNine
	
	cmp plusbool,1
	jne n91
	jmp allreadyoperated9
	n91:
	cmp minusbool,1
	jne n92
	jmp allreadyoperated9
	n92:
	cmp multiplicationbool,1
	jne n93
	jmp allreadyoperated9
	n93:
	cmp divisionbool,1
	jne didntoperate9
	
	allreadyoperated9:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate9:
	cmp previousAnswer, 0
	je dontwork9
	mov answer, 9
	jmp finish9
	
	dontwork9:
	mov previousAnswer, 9
	jmp finish9
	
	
	
	finish9:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock9:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock9
	
	push 97 ;starty
	push 181 ;startx
	push 77 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 181 ;x coordinate
	call printNine
	push[ReturnAddress5]
	ret
endp highlightNine

proc highlightZero
	pop[ReturnAddress5]
	push 187 ;starty
	push 156 ;startx
	push 167 ;endy
	push 136 ;endx
	push 4 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 156 ;x coordinate
	call printZero
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp firstDigit, 1
	je isfirstDigitZero
	
	xor dx,dx
	mov ax, previousAnswer
	add ax, answer
	mov bx, 0ah
	mul bx
	add ax, 0
	mov answer, 0
	mov previousAnswer, ax
	call printAccordingly
	jmp finish0
	
	
	isfirstDigitZero:
	
	mov firstDigit, 0
	;prints zero to the screen
	push 0
	push 47
	push 207
	call printZero
	
	cmp plusbool,1
	jne n01
	jmp allreadyoperated0
	n01:
	cmp minusbool,1
	jne n02
	jmp allreadyoperated0
	n02:
	cmp multiplicationbool,1
	jne n03
	jmp allreadyoperated0
	n03:
	cmp divisionbool,1
	jne didntoperate0
	
	allreadyoperated0:
	mov ax, previousAnswer
	mov prevprevAnswer, ax
	mov useprevprev, 1
	mov previousAnswer, 0
	
	didntoperate0:
	cmp previousAnswer, 0
	je dontwork0
	mov answer, 0
	jmp finish0
	
	dontwork0:
	mov previousAnswer, 0
	jmp finish0
	
	
	
	finish0:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock10:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock10
	
	push 187 ;starty
	push 156 ;startx
	push 167 ;endy
	push 136 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 156 ;x coordinate
	call printZero
	push[ReturnAddress5]
	ret
endp highlightZero

proc highlightEqualsSign
	pop[ReturnAddress8]
	push 187 ;starty
	push 181 ;startx
	push 167 ;endy
	push 161 ;endx
	push 3 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 181 ;x coordinate
	call printEqualsSign
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	mov firstDigit, 1
	
	cmp useprevprev, 1
	je checkdivide
	
	cmp plusbool,1
	jne checkminus
	mov plusbool, 0
	mov ax, answer
	add ax, previousAnswer
	call printAccordingly
	jmp clockWork
	
	checkminus:
	cmp minusbool, 1
	jne ceckmultiply
	mov minusbool, 0
	mov ax, previousAnswer
	sub ax, answer
	call printAccordingly
	jmp clockWork
	
	ceckmultiply:
	cmp multiplicationbool, 1
	jne checkdivide
	mov multiplicationbool, 0
	mov ax, answer
	xor dx,dx
	mul previousAnswer
	mov saver4, ax
	call printAccordingly
	mov ax, saver4
	mov answer, 0
	jmp clockWork
	
	checkdivide:
	cmp useprevprev, 1
	je usingprevprev
	cmp divisionbool, 1
	jne	printRegular
	mov divisionbool, 0
	mov ax, previousAnswer
	xor dx, dx
	mov bx, answer
	div bx
	mov saver4, ax
	call printAccordingly
	mov ax, saver4
	mov answer, 0
	jmp clockWork
	
	printRegular:
	call printAccordingly
	jmp clockWork
	
	
	
	usingprevprev:
	
	cmp plusbool,1
	jne checkminus2
	mov plusbool, 0
	mov ax, previousAnswer
	add ax, prevprevAnswer
	call printAccordingly
	jmp clockWork
	
	checkminus2:
	cmp minusbool, 1
	jne ceckmultiply2
	mov minusbool, 0
	mov ax, prevprevAnswer
	sub ax, previousAnswer
	call printAccordingly
	jmp clockWork
	
	ceckmultiply2:
	cmp multiplicationbool, 1
	jne checkdivide2
	mov multiplicationbool, 0
	mov ax, previousAnswer
	xor dx,dx
	mov bx, prevprevAnswer
	mul bx
	mov saver4, ax
	call printAccordingly
	mov ax, saver4
	mov previousAnswer, 0
	jmp clockWork
	
	checkdivide2:
	cmp divisionbool, 1
	jne	printRegular2
	mov divisionbool, 0
	mov ax, prevprevAnswer
	xor dx, dx
	mov bx, previousAnswer
	div bx
	mov saver4, ax
	call printAccordingly
	mov ax, saver4
	mov previousAnswer, 0
	jmp clockWork
	
	printRegular2:
	call printAccordingly
	jmp clockWork
	
	
	clockWork:
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock11:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock11
	
	push 187 ;starty
	push 181 ;startx
	push 167 ;endy
	push 161 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 181 ;x coordinate
	call printEqualsSign
	push[ReturnAddress8]
	ret
endp highlightEqualsSign

proc highlightDivisionSign
	pop[ReturnAddress8]
	push 187 ;starty
	push 206 ;startx
	push 167 ;endy
	push 186 ;endx
	push 3 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 206 ;x coordinate
	call printDivisionSign
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp answer , 0
	je clockWork3
	mov ax, answer
	div previousAnswer
	mov saver4, ax
	call printAccordingly
	mov divisionbool, 1
	mov ax, saver4
	mov previousAnswer, ax
	mov answer, 1
	
	clockWork3:
	mov firstDigit, 1
	mov ax, previousAnswer
	call printAccordingly
	mov divisionbool, 1
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock12:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock12
	
	push 187 ;starty
	push 206 ;startx
	push 167 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 187 ;y coordinate
	push 206 ;x coordinate
	call printDivisionSign
	push[ReturnAddress8]
	ret
endp highlightDivisionSign

proc highlightMultiplicationSign
	pop[ReturnAddress8]
	push 157 ;starty
	push 206 ;startx
	push 137 ;endy
	push 186 ;endx
	push 3 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 206 ;x coordinate
	call printMultiplicationSign
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp answer, 0
	je clockWork2
	mov ax, answer
	mul previousAnswer
	mov saver4, ax
	call printAccordingly
	mov ax, saver4
	mov previousAnswer, ax
	mov multiplicationbool, 1
	mov answer, 1
	
	clockWork2:
	mov firstDigit, 1
	mov ax, previousAnswer
	call printAccordingly
	mov multiplicationbool, 1
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock13:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock13
	
	push 157 ;starty
	push 206 ;startx
	push 137 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 157 ;y coordinate
	push 206 ;x coordinate
	call printMultiplicationSign
	push[ReturnAddress8]
	ret
endp highlightMultiplicationSign

proc highlightMinusSign
	pop[ReturnAddress8]
	push 127 ;starty
	push 206 ;startx
	push 107 ;endy
	push 186 ;endx
	push 3 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 206 ;x coordinate
	call printMinusSign
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	mov firstDigit, 1
	mov ax, previousAnswer
	sub ax, answer
	mov saver4, ax
	call printAccordingly
	mov minusbool ,1
	mov answer, 0
	mov ax, saver4
	mov previousAnswer ,ax
	mov firstDigit, 1
	
	
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock14:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock14
	
	push 127 ;starty
	push 206 ;startx
	push 107 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 127 ;y coordinate
	push 206 ;x coordinate
	call printMinusSign
	push[ReturnAddress8]
	ret
endp highlightMinusSign

proc highlightPlusSign
	pop[ReturnAddress8]
	push 97 ;starty
	push 206 ;startx
	push 77 ;endy
	push 186 ;endx
	push 3 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 206 ;x coordinate
	call printPlusSign
	
	;clears screen **temporary!**
	push 67 ;starty
	push 207 ;startx
	push 7 ;endy
	push 111 ;endx
	push 15 ;color
	call printRectangle
	
	cmp firstDigit, 1
	je isfirstDigit2
	
	mov firstDigit, 1
	
	
	isfirstDigit2:
	xor ax,ax
	mov ax, answer
	add ax, previousAnswer
	mov saver4, ax
	call printAccordingly
	mov plusbool, 1
	mov answer, 0
	mov ax, saver4
	mov previousAnswer ,ax
	mov firstDigit, 1
	
	mov ah, 2ch
	int 21h
	mov saver1, dx
	readClock15:
	mov ah, 2ch
	int 21h
	sub dx, saver1
	cmp dx, 50
	jl readClock15
	
	push 97 ;starty
	push 206 ;startx
	push 77 ;endy
	push 186 ;endx
	push 25 ;color
	call printRectangle
	push 0 ;color
	push 97 ;y coordinate
	push 206 ;x coordinate
	call printPlusSign
	push[ReturnAddress8]
	ret
endp highlightPlusSign

proc printAccordingly;prints the value that is in ax to the screen of the calculator
	
	
	cmp ax, 09h
	jle smaller
	jmp bigger
	
	smaller:
	pop[ReturnAddress6]
	cmp ax, 0
	jne next
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	call printZero
	push[ReturnAddress6]
	jmp jumper
	next:
	cmp ax, 1
	jne next2
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printOne
	push[ReturnAddress6]
	jmp jumper
	next2:
	cmp ax, 2
	jne next3
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printTwo
	push[ReturnAddress6]
	jmp jumper
	next3:
	cmp ax, 3
	jne next4
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printThree
	push[ReturnAddress6]
	jmp jumper
	next4:
	cmp ax, 4
	jne	next5
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFour
	push[ReturnAddress6]
	jmp jumper
	next5:
	cmp ax, 5
	jne	next6
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFive
	push[ReturnAddress6]
	jmp jumper
	next6:
	cmp ax, 6
	jne next7
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printSix
	push[ReturnAddress6]
	jmp jumper
	next7:
	cmp ax, 7
	jne	next8
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printSeven
	push[ReturnAddress6]
	jmp jumper
	next8:
	cmp ax, 8
	jne	next9
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printEight
	push[ReturnAddress6]
	jmp jumper
	next9:
	cmp ax, 9
	jne jumper
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printNine
	push[ReturnAddress6]
	jmp jumper
	
	bigger:
	cmp ax, 0fh
	jle notevenbigger
	jmp evenbigger
	jumper:
	jmp endofproc
	
	notevenbigger:
		pop[ReturnAddress10]
		cmp ax, 0ah
		jne next10
		mov saver4, ax
		mov ax, 0
		mov place, 0 
		call printAccordingly2
		next10:
		
		cmp ax, 0bh
		jne next11
		mov saver4, ax
		mov ax, 1
		mov place, 0
		call printAccordingly2
		next11:
		
		cmp ax, 0ch
		jne next12
		mov saver4, ax
		mov ax, 2
		mov place, 0
		call printAccordingly2
		next12:
		
		cmp ax, 0dh
		jne next13
		mov saver4, ax
		mov ax, 3
		mov place, 0
		call printAccordingly2
		next13:
	
		cmp ax, 0eh
		jne next14
		mov saver4, ax
		mov ax, 4
		mov place, 0
		call printAccordingly2
		next14:
		
		cmp ax, 0fh
		jne next15
		mov saver4, ax
		mov ax, 5
		mov place, 0
		call printAccordingly2
		next15:
	   
	   
		mov ax, 1
		inc place
		call printAccordingly2
		dec place
		mov ax, saver4
		push[ReturnAddress10]
		jmp endofproc
		
	evenbigger:
		mov place, 0
		xor dx,dx
		mov bx, 0ah
		div bx
		mov saver5, ax
		mov ax, dx
		pop[ReturnAddress11]
		call printAccordingly2
		inc place
		mov ax, saver5
		call printAccordingly2
		push[ReturnAddress11]
	
	
	endofproc:
	
	
	ret
endp printAccordingly

proc printAccordingly2


	
	cmp ax, 09h
	jle smaller2
	jmp bigger2
	
	smaller2:
	pop[ReturnAddress12]
	cmp ax, 0
	jne nextt
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	call printZero
	push[ReturnAddress12]
	jmp endofproc2
	nextt:
	cmp ax, 1
	jne nextt2
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printOne
	push[ReturnAddress12]
	jmp endofproc2
	nextt2:
	cmp ax, 2
	jne nextt3
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printTwo
	push[ReturnAddress12]
	jmp endofproc2
	nextt3:
	cmp ax, 3
	jne nextt4
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printThree
	push[ReturnAddress12]
	jmp endofproc2
	nextt4:
	cmp ax, 4
	jne	nextt5
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFour
	push[ReturnAddress12]
	jmp endofproc2
	nextt5:
	cmp ax, 5
	jne	nextt6
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFive
	push[ReturnAddress12]
	jmp endofproc2
	nextt6:
	cmp ax, 6
	jne nextt7
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printSix
	push[ReturnAddress12]
	jmp endofproc2
	nextt7:
	cmp ax, 7
	jne	nextt8
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printSeven
	push[ReturnAddress12]
	jmp endofproc2
	nextt8:
	cmp ax, 8
	jne	nextt9
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printEight
	push[ReturnAddress12]
	jmp jumpingtoend
	nextt9:
	cmp ax, 9
	jne	jumpingtoend
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printNine
	push[ReturnAddress12]
	jumpingtoend:
	jmp endofproc2
	
	bigger2:
	cmp ax, 0fh
	jle notevenbigger2
	jmp evenbigger2
	
	notevenbigger2:
		pop[ReturnAddress13]
		cmp ax, 0ah
		jne nextt10
		mov saver4, ax
		mov ax, 0 
		call printAccordingly3
		nextt10:
		
		cmp ax, 0bh
		jne nextt11
		mov saver4, ax
		mov ax, 1
		call printAccordingly3
		nextt11:
		
		cmp ax, 0ch
		jne nextt12
		mov saver4, ax
		mov ax, 2
		call printAccordingly3
		nextt12:
		
		cmp ax, 0dh
		jne nextt13
		mov saver4, ax
		mov ax, 3
		call printAccordingly3
		nextt13:
		
		cmp ax, 0eh
		jne nextt14
		mov saver4, ax
		mov ax, 4
		call printAccordingly3
		nextt14:
		
		cmp ax, 0fh
		jne nextt15
		mov saver4, ax
		mov ax, 5
		call printAccordingly3
		nextt15:
	   
	   
		mov ax, 1
		inc place
		call printAccordingly3
		dec place
		mov ax, saver4
		push[ReturnAddress13]
		jmp endofproc2
		
	evenbigger2:
		;mov place, 0
		xor dx,dx
		mov bx, 0ah
		div bx
		mov saver5, ax
		mov ax, dx
		pop[ReturnAddress14]
		call printAccordingly3
		mov ax, saver5
		inc place
		call printAccordingly3
		push[ReturnAddress14]
	
	
	endofproc2:
	ret
endp printAccordingly2

proc printAccordingly3

	cmp ax, 09h
	jle smaller3
	jmp bigger3
	
	smaller3:
	pop[ReturnAddress16]
	cmp ax, 0
	jne nexttt
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	call printZero
	push[ReturnAddress16]
	jmp endofproc3
	nexttt:
	cmp ax, 1
	jne nexttt2
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printOne
	push[ReturnAddress16]
	jmp endofproc3
	nexttt2:
	cmp ax, 2
	jne nexttt3
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printTwo
	push[ReturnAddress16]
	jmp endofproc3
	nexttt3:
	cmp ax, 3
	jne nexttt4
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printThree
	push[ReturnAddress16]
	jmp endofproc3
	nexttt4:
	cmp ax, 4
	jne	nexttt5
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFour
	push[ReturnAddress16]
	jmp endofproc3
	nexttt5:
	cmp ax, 5
	jne	nexttt6
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printFive
	push[ReturnAddress16]
	jmp endofproc3
	nexttt6:
	cmp ax, 6
	jne nexttt7
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax  
	mov ax, saver
	call printSix
	push[ReturnAddress16]
	jmp endofproc3
	nexttt7:
	cmp ax, 7
	jne	nexttt8
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax
	mov ax, saver
	call printSeven
	push[ReturnAddress16]
	jmp endofproc3
	nexttt8:
	cmp ax, 8
	jne	nexttt9
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printEight
	push[ReturnAddress16]
	jmp jumpingtoend2
	nexttt9:
	cmp ax, 9
	jne	jumpingtoend2
	mov saver, ax
	mov ax, place
	mov bx, 20
	mul bx
	mov bx, ax
	mov ax, 202
	sub ax, bx
	push 4
	push 47
	push ax 
	mov ax, saver
	call printNine
	push[ReturnAddress16]
	jumpingtoend2:
	jmp endofproc3
	
	bigger3:
	cmp ax, 0fh
	jle notevenbigger3
	jmp evenbigger3
	
	notevenbigger3:
		pop[ReturnAddress17]
		cmp ax, 0ah
		jne nexttt10
		mov saver4, ax
		mov ax, 0 
		call printAccordingly3
		nexttt10:
		
		cmp ax, 0bh
		jne nexttt11
		mov saver4, ax
		mov ax, 1
		call printAccordingly3
		nexttt11:
		
		cmp ax, 0ch
		jne nexttt12
		mov saver4, ax
		mov ax, 2
		call printAccordingly3
		nexttt12:
		
		cmp ax, 0dh
		jne nexttt13
		mov saver4, ax
		mov ax, 3
		call printAccordingly3
		nexttt13:
		
		cmp ax, 0eh
		jne nexttt14
		mov saver4, ax
		mov ax, 4
		call printAccordingly3
		nexttt14:
		
		cmp ax, 0fh
		jne nexttt15
		mov saver4, ax
		mov ax, 5
		call printAccordingly3
		nexttt15:
	   
	   
		mov ax, 1
		inc place
		call printAccordingly3
		dec place
		mov ax, saver4
		push[ReturnAddress17]
		jmp endofproc3
		
	evenbigger3:
		mov place, 0
		xor dx,dx
		mov bx, 0ah
		div bx
		mov saver5, ax
		mov ax, dx
		pop[ReturnAddress18]
		call printAccordingly3
		mov ax, saver5
		inc place
		call printAccordingly3
		push[ReturnAddress18]
	
	
	endofproc3:
	
	ret
endp printAccordingly3






























;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start:
	mov ax,@data
	mov ds,ax
	
	;Graphic mode
	mov ax,13h
	int 10h
	
	
	call printCalculator
		
	;Mouse initialization
	mov ax,0h
	int 33h
	
	;Presenting mouse on the screen
	mov ax,1h
	int 33h
	
	Update:
	
	cmp printthebuttons, 1
	jne dontprint
	mov printthebuttons, 0
	call printButtons
	dontprint:
	
	;for clear button
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skipit
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 111
	jl skipit
	cmp ax, 131
	jg skipit
	cmp dx, 167
	jl skipit
	cmp dx, 187
	jg skipit
	mov printthebuttons, 1
	call highlightClear
	skipit:
	
	;for button one
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 111
	jl skip
	cmp ax, 131
	jg skip
	cmp dx, 137
	jl skip
	cmp dx, 157
	jg skip
	mov printthebuttons, 1
	call highlightOne
	skip:
	
	;for button two
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip2
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 136
	jl skip2
	cmp ax, 156
	jg skip2
	cmp dx, 137
	jl skip2
	cmp dx, 157
	jg skip2
	mov printthebuttons, 1
	call highlightTwo
	skip2:
	
	;for button three
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip3
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 161
	jl skip3
	cmp ax, 181
	jg skip3
	cmp dx, 137
	jl skip3
	cmp dx, 157
	jg skip3
	mov printthebuttons, 1
	call highlightThree
	skip3:
	
	;for button four
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip4
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 111
	jl skip4
	cmp ax, 131
	jg skip4
	cmp dx, 107
	jl skip4
	cmp dx, 127
	jg skip4
	mov printthebuttons, 1
	call highlightFour
	skip4:
	
	;for button five
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip5
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 136
	jl skip5
	cmp ax, 156
	jg skip5
	cmp dx, 107
	jl skip5
	cmp dx, 127
	jg skip5
	mov printthebuttons, 1
	call highlightFive
	skip5:
	
	;for button six
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip6
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 161
	jl skip6
	cmp ax, 181
	jg skip6
	cmp dx, 107
	jl skip6
	cmp dx, 127
	jg skip6
	mov printthebuttons, 1
	call highlightSix
	skip6:
	
	;for button seven
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip7
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 111
	jl skip7
	cmp ax, 131
	jg skip7
	cmp dx, 77
	jl skip7
	cmp dx, 97
	jg skip7
	mov printthebuttons, 1
	call highlightSeven
	skip7:
	
	;for button eight
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip8
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 136
	jl skip8
	cmp ax, 156
	jg skip8
	cmp dx, 77
	jl skip8
	cmp dx, 97
	jg skip8
	mov printthebuttons, 1
	call highlightEight
	skip8:
	
	;for button nine
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip9
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 161
	jl skip9
	cmp ax, 181
	jg skip9
	cmp dx, 77
	jl skip9
	cmp dx, 97
	jg skip9
	mov printthebuttons, 1
	call highlightNine
	skip9:
	
	;for button zero
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip10
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 136
	jl skip10
	cmp ax, 156
	jg skip10
	cmp dx, 167
	jl skip10
	cmp dx, 187
	jg skip10
	mov printthebuttons, 1
	call highlightZero
	skip10:
	
	;for button =
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip11
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 161
	jl skip11
	cmp ax, 181
	jg skip11
	cmp dx, 167
	jl skip11
	cmp dx, 187
	jg skip11
	mov printthebuttons, 1
	call highlightEqualsSign
	skip11:
	
	;for button /
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip12
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 186
	jl skip12
	cmp ax, 206
	jg skip12
	cmp dx, 167
	jl skip12
	cmp dx, 187
	jg skip12
	mov printthebuttons, 1
	call highlightDivisionSign
	skip12:
	
	;for button *
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip13
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 186
	jl skip13
	cmp ax, 206
	jg skip13
	cmp dx, 137
	jl skip13
	cmp dx, 157
	jg skip13
	mov printthebuttons, 1
	call highlightMultiplicationSign
	skip13:
	
	;for button -
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip14
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 186
	jl skip14
	cmp ax, 206
	jg skip14
	cmp dx, 107
	jl skip14
	cmp dx, 127
	jg skip14
	mov printthebuttons, 1
	call highlightMinusSign
	skip14:
	
	;for button +
	xor bx,bx
	mov ax,3h
	mov saver,dx
	int 33h
	cmp bx,1
	jne skip15
	xor dx,dx
	mov ax,cx
	mov cx,2
	div cx
	mov dx, saver
	cmp ax, 186
	jl skip15
	cmp ax, 206
	jg skip15
	cmp dx, 77
	jl skip15
	cmp dx, 97
	jg skip15
	mov printthebuttons, 1
	call highlightPlusSign
	skip15:
	
	jmp Update
	
	;Wait for key press
	mov ah,00h
	int 16h
	
	;Return to text mode
	mov ah,0
	mov al,2
	int 10h
	
	
	
	
exit:
	mov ax,4c00h
	int 21h
END start