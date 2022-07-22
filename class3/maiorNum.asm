segment .data 
    LF        equ 0xA ; Line feed
    NULL      equ 0xD ; final da string 
    SYS_CALL  equ 0x80; enviar informacao ao SO 

    ; EAX 
    SYS_EXIT  equ 0x1 ; finalizar o programa
    SYS_READ  equ 0x3 ; Operacao de leitura
    SYS_WRITE equ 0x4 ; Operacao de escrita 

    ; EBX 
    RET_EXIT  equ 0x0 ; Operacao realizada com sucesso
    STD_OUT   equ 0x1 ; saida padrao
    STD_IN    equ 0x0 ; Entrada padrao

section .data 
    ; db tem 1 byte 
    ; dw define word 2 bytes = char 
    ; dd significa define double word 4 bytes = int ou short 
    ; dq define quad words 8 bytes 
    ; dt define ten words 10 bytes 
    x dd 10 
    y dd 50 
    msg1 db 'X é maior que y', LF, NULL 
    tam1 equ $ - msg1
    msg2 db 'Y é maior que X', LF, NULL 
    tam2 equ $ - msg2
    
section .text 

global _start 

_start: 
    ; dword = movimentação da seção data para os registradores
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]  

    ; if - cmp = comparar 
    cmp EAX, EBX 
    ; salto condicional
    ; je = igual (==)
    ; jg = maior (>)
    ; jge = maior ou igual (>=)
    ; jl = menor (<)
    ; jle = menor ou igual (<=)
    ; jne = difentre (!=)
    jge maior 
    mov ECX, msg2 
    mov EDX, tam2
    jmp final

maior: 
    mov ECX, msg1
    mov EDX, tam1

final: 
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL 

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT ; xor EBX, EBX
    int SYS_CALL