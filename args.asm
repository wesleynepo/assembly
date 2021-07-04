%include 'functions.asm'

SECTION .text
global _start 

_start:

  pop ecx

nextArgument:
  cmp  ecx,  0x00
  jz   noMoreArguments
  pop  eax
  call sprintLF
  dec  ecx
  jmp  nextArgument

noMoreArguments: 
  call quit