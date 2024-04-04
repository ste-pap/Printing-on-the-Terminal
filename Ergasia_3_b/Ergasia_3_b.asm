title ergasia_3_b
include Irvine32.inc

.data

line1 byte "The value off the element a[2,2] is : ",0
line2 byte "The sum a[2,2] + z = : ",0
line3 byte "The sum a[2,2] - z = : ",0
line4 byte "The value of the element a[3,1] is : ",0

a sdword 00d, 10d, 20d, 30d,
		01d, 11d, 21d, 32d,
		02d, 12d, 22d, 32d,
		03d, 13d, 23d, 33d

x byte 2d
y byte 2d
z sbyte -30d

p_xy dword ?


.code
main proc
mov esi, type a
shl esi, 1
movzx ecx, y
add esi, ecx
shl esi, 2
add esi, offset a

mov ebx, esi


mov eax,[ebx]	; transfer value of pointer to eax 
mov edx,offset line1	; move the first line string to edx for printing
call WriteString	; print the first line
call WriteInt	; print value of a[x,y]
call Crlf	; print new line


movsx ecx,z ; transfer z to ecx with leading zeros 16bit -> 32bit
add eax,ecx	; add z to a[x,y] : a[x,y] + z
mov edx,offset line2	; move the second line string to edx for printing
call WriteString	; print the second line
call WriteInt	; print value of a[x,y] + z to the screen
call Crlf	; print new line

mov eax,[ebx]	; transfer value of pointer to eax 
sub eax,ecx	; subtract z from a[x,y] : a[x,y] - z
mov edx,offset line2	; move the third line string to edx for printing
call WriteString	; print the third line
call WriteInt	; print value of a[x,y] - z to the screen
call Crlf	; print new line

mov eax,a[13d*type a] ; get the 14th element of 1-D array corresponding to a[3,1] of imaginary 2-D array
					  ; (14th - 1) because we start counting from zero

mov edx,offset line4	; move the fourth line string to edx for printing
call WriteString	; print the fourth line
call WriteInt	; print value of a[3,1] to the screen
call Crlf	; print new line

exit
main endp
end main