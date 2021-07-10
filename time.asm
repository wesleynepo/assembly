%include 'functions.asm'

SECTION .data
message     db   'Seconds since Jan 01 1970', 0h

SECTION .text
global _start

_start:

  mov eax, message
  call sprint

  mov eax, 13
  int 80h

  call iprintLF
  call quit