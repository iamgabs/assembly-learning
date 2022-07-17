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
    msg db "Entre com seu nome:", LF, NULL 
    tam equ $- msg

section .bss 
    nome resb 1 ; resb => indica que é um byte 

section .text 

global _start 

_start: 
    mov EAX, SYS_WRITE 
    mov EBX, STD_OUT
    mov ECX, msg 
    mov EDX, tam 
    int SYS_CALL 

    mov EAX, SYS_READ 
    mov EBX, STD_IN
    mov ECX, nome 
    mov EDX, 0xA ; max 10 chars
    int SYS_CALL 

    mov EAX, SYS_EXIT 
    mov EBX, RET_EXIT 
    int SYS_CALL 