%include 'functions.asm'

SECTION .data
childMessage    db    'This is the child process', 0h
parentMessage   db    'This is the parent process', 0h

SECTION .text
global _start

_start:

    mov eax, 2 
    int 80h

    cmp eax, 0 
    jz  child

parent:
  mov eax, parentMessage
  call sprintLF

  call quit

child:
  mov   eax, childMessage
  call  sprintLF

  call quit 