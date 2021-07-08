%include 'functions.asm'

SECTION .data
messageOne db 'Jumping to finished label.', 0x00
messageTwo db 'Inside subroutine number: ', 0x00
messageThree db 'Inside subroutine "finished"', 0x00 

SECTION .text
global _start

_start:

subroutineOne:
  mov eax, messageOne
  call sprintLF
  jmp .finished

.finished:
  mov eax, messageTwo
  call sprint
  mov eax, 1 
  call iprintLF

subroutineTwo:
  mov eax, messageOne
  call sprintLF
  jmp .finished

.finished:
  mov eax, messageTwo
  call sprint
  mov eax, 2
  call iprintLF

  mov eax, messageOne
  call sprintLF
  jmp finished

finished:
  mov eax, messageThree
  call sprintLF
  call quit   