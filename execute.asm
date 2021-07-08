%include 'functions.asm'

SECTION .data
command       db    '/bin/echo', 0h
argumentOne   db    'Hello Word!', 0h
arguments     dd     command 
              dd     0h
              dd     0h
environment   dd     0h 

SECTION .text 
global _start

_start: 

    mov edx, environment
    mov ecx, arguments
    mov ebx, command
    mov eax, 11
    int 80h

    call quit