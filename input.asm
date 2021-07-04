%include 'functions.asm'

SECTION .data
messageOne db 'Please enter your name:', 0x00
messageTwo db 'Hello, ', 0x00

SECTION .bss 
sinput: resb 255

SECTION .text 
global _start

_start: 

  mov eax, messageOne
  call sprint

  mov edx, 255
  mov ecx, sinput
  mov ebx, 0
  mov eax, 3
  int 0x80

  mov eax, messageTwo
  call sprint

  mov eax, sinput
  call sprint 

  call quit 