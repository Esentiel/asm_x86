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


