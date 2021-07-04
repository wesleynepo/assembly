%include 'functions.asm'

SECTION .data
messageOne    db      'Hello, brave new world!', 0x00   
messageTwo    db      'This is how we recycle in NASM.', 0x00

SECTION .text
global _start

_start:
    mov eax, messageOne
    call sprintLF

    mov eax, messageTwo
    call sprintLF

    call quit