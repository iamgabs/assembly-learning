section .data 
    msg db 'Hello world!'
    tam equ $- msg

section .text 

global _start 

_start: 
    ; destino => origem  
    mov EAX, 0x4 ; enviar algo para a saída padrao
    mov EBX, 0x1 ; paridade com EAX 
    mov ECX, msg   
    mov EDX, tam 
    int 0x80 ; pegar todas as movimentacoes feitas, e executar

    mov EAX, 0x1
    mov EBX, 0x0
    int 0x80