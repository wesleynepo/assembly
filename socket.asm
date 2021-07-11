%include 'functions.asm'

SECTION .bss
buffer resb 255,

SECTION .data
response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World!', 0Dh, 0Ah, 0h

SECTION .text
global _start

_start:

  xor eax, eax
  xor ebx, ebx
  xor edi, edi
  xor esi, esi

_socket:

  push byte 6
  push byte 1
  push byte 2
  mov ecx, esp
  mov ebx, 1
  mov eax, 102
  int 80h

_bind:

  mov edi, eax 
  push dword 0x00000000
  push word 0x2923
  push word 2
  mov ecx, esp 
  push byte 16
  push ecx
  push edi
  mov ecx, esp
  mov ebx, 2
  mov eax, 102
  int 80h

_listen:

  push byte 1
  push edi
  mov ecx, esp
  mov ebx, 4
  mov eax, 102
  int 80h

_accept:

  push byte 0
  push byte 0
  push edi
  mov ecx, esp
  mov ebx, 5
  mov eax, 102
  int 80h
  
_fork:

  mov esi,eax
  mov eax, 2
  int 80h

  cmp eax, 0
  jz _read 

  jmp _accept

_read:

  mov edx, 255
  mov ecx, buffer
  mov ebx, esi
  mov eax, 3
  int 80h

  mov eax, buffer
  call sprintLF

_write:

  mov edx, 78
  mov ecx, response
  mov ebx, esi
  mov eax, 4
  int 80h

_close:

  mov ebx, esi
  mov eax, 6
  int 80h

_exit:

  call quit 