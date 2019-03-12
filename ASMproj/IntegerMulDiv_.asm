.model flat, c
.code

; extern "C" int IntegerMulDiv_(int a, int b, int* prod, int* quo, int* rem);
;
; Description: This function demonstrates use of the imul and idiv
; instructions. It also illustrates pointer usage.
;
; Returns: 0 Error (divisor is zero)
; 1 Success (divisor is zero)
;
; Computes: *prod = a * b;
; *quo = a / b
; *rem = a % b

IntegerMulDiv_ proc

; Init a stack frame ptr
push ebp
mov ebp, esp
push ebx

; zero division check
xor eax, eax ;set return code
mov ecx, [ebp+8] ;ecx = a;
mov edx, [ebp+12] ;edx = b;
or edx, edx ;zero check
jz InvalidDivisor ;jump if b is zero

; Calc prod and store result
imul edx, ecx ; edx = a * b
mov ebx, [ebp+16] ; ebx = prod
mov [ebx], edx ; save product to prod

; Calc deivision
mov eax, ecx ; eax = a
cdq ;edx:eax contains dividend
idiv dword ptr [ebp+12] ; eax = quo, edx = rem

mov ebx, [ebp+20] ;ebx = quo
mov [ebx], eax ; save quo
mov ebx, [ebp+24] ; ebx = rem
mov [ebx], edx ; save rem
mov eax, 1 ; set success ret code

; Func epilog
InvalidDivisor:
pop ebx
pop ebp
ret

IntegerMulDiv_ endp
end