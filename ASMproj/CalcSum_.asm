.model flat,c
.code
; extern "C" int CalcSum_(int a, int b, int c)
;
; Description: This function demonstrates passing arguments between
; a C++ function and an assembly language function.
;
; Returns: a + b + c

CalcSum_ proc

; Init a stack frame ptr
push ebp
mov ebp,esp

; Load the args
mov eax, [ebp+8]
mov ecx, [ebp+12]
mov edx, [ebp+16]

; Calculate the sum
add eax,ecx
add eax,edx

; Restore the Callers stack frame ptr
pop ebp
ret

CalcSum_ endp
end