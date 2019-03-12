.model flat,c
.code
; extern "C" void CalculateSums_(int a, int b, int c, int* s1, int* s2, int* s3);
;
; Description: This function demonstrates a complete assembly
; language prolog and epilog.
;
; Returns: None.
;
; Computes: *s1 = a + b + c
; *s2 = a * a + b * b + c * c
; *s3 = a * a * a + b * b * b + c * c * c

CalculateSums_ proc

; Function prolog
push ebp
mov ebp, esp
sub esp, 12
push ebx
push esi
push edi

; Load args
mov eax, [ebp+8] ;a
mov ebx, [ebp+12] ;b
mov ecx, [ebp+16] ;c
mov edx, [ebp+20] ;s1
mov esi, [ebp+24] ;s2
mov edi, [ebp+28] ;s3

; Compute s1
mov [ebp-12], eax
add [ebp-12], ebx
add [ebp-12], ecx

; Compute s2
imul eax, eax
imul ebx, ebx
imul ecx, ecx
mov [ebp-8], eax
add [ebp-8], ebx
add [ebp-8], ecx

; Compute s3
imul eax, [ebp+8]
imul ebx, [ebp+12]
imul ecx, [ebp+16]
mov [ebp-4], eax
add [ebp-4], ebx
add [ebp-4], ecx

; Populate results
mov eax, [ebp-12]
mov [edx], eax
mov eax, [ebp-8]
mov [esi], eax
mov eax, [ebp-4]
mov [edi], eax

; End proc
pop edi
pop esi
pop ebx
mov esp, ebp
pop ebp
ret

CalculateSums_ endp
end
