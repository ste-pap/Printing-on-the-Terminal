title ergasia_3_b
include Irvine32.inc

.data

line1 byte "The value off the element a[2,2] is : ",0   ; String for line 1 output
line2 byte "The sum a[2,2] + z = : ",0                ; String for line 2 output
line3 byte "The sum a[2,2] - z = : ",0                ; String for line 3 output
line4 byte "The value of the element a[3,1] is : ",0  ; String for line 4 output

a sdword 00d, 10d, 20d, 30d,    ; Define a 4x4 matrix 'a' in row-major order
        01d, 11d, 21d, 32d,
        02d, 12d, 22d, 32d,
        03d, 13d, 23d, 33d

x byte 2d      ; Initialize x with value 2 (row index)
y byte 2d      ; Initialize y with value 2 (column index)
z sbyte -30d   ; Initialize z with value -30

p_xy dword ?   ; Define variable p_xy as a signed doubleword (initialized to 0)


.code
main proc

mov esi, type a   ; Move the size of 'a' (16 bytes) into esi
shl esi, 1        ; Multiply esi by 2 (size of each element in a doubleword)
movzx ecx, y      ; Zero-extend y (2) into ecx
add esi, ecx      ; Add y to esi (esi now points to the start of row 2 in 'a')
shl esi, 2        ; Multiply esi by 4 (each row in 'a' is 4 bytes)
add esi, offset a ; Add the offset of 'a' to esi (esi points to a[2,2])

mov ebx, esi      ; Copy esi (pointer to a[2,2]) to ebx


; Output line 1: "The value off the element a[2,2] is : "
mov eax, [ebx]    ; Move the value at a[2,2] into eax
mov edx, offset line1  ; Move the address of line1 into edx
call WriteString  ; Call Irvine32 procedure to write the string at edx
call WriteInt     ; Call Irvine32 procedure to write the integer value in eax (a[2,2])
call Crlf         ; Call Irvine32 procedure to output a newline


; Output line 2: "The sum a[2,2] + z = : "
movsx ecx, z      ; Sign-extend z (-30) into ecx
add eax, ecx      ; Add z to eax (eax = a[2,2] + z)
mov edx, offset line2  ; Move the address of line2 into edx
call WriteString  ; Call Irvine32 procedure to write the string at edx
call WriteInt     ; Call Irvine32 procedure to write the integer value in eax (sum of a[2,2] + z)
call Crlf         ; Call Irvine32 procedure to output a newline


; Output line 3: "The sum a[2,2] - z = : "
mov eax, [ebx]    ; Move the value at a[2,2] back into eax
sub eax, ecx      ; Subtract z from eax (eax = a[2,2] - z)
mov edx, offset line3  ; Move the address of line3 into edx
call WriteString  ; Call Irvine32 procedure to write the string at edx
call WriteInt     ; Call Irvine32 procedure to write the integer value in eax (sum of a[2,2] - z)
call Crlf         ; Call Irvine32 procedure to output a newline


; Output line 4: "The value of the element a[3,1] is : "
mov eax, a[13d * type a]  ; Calculate offset to a[3,1] and move value into eax
mov edx, offset line4  ; Move the address of line4 into edx
call WriteString  ; Call Irvine32 procedure to write the string at edx
call WriteInt     ; Call Irvine32 procedure to write the integer value in eax (value of a[3,1])
call Crlf         ; Call Irvine32 procedure to output a newline

exit
main endp
end main
