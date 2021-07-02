SECTION .data
msg db 'Rawller ', 0x0a

SECTION .text 
global _start 

_start:
  ; move para os dois registradores a string
  mov ebx, msg
  mov eax, ebx

nextchar:
  ;compara o byte que o eax está apontando com zero ( indicador de fim de string no endereço )
  ;chama o finished caso for zero 
  ;caso contrário incrementa o endereço do EAX com um byte e faz um loop
  cmp byte [eax], 0
  jz finished
  inc eax
  jmp nextchar
  
finished:
  sub eax, ebx  ;subtrai o endereço do eax com o ebx para definir o tamanho em bytes da string
  mov edx, eax  
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov ebx, 0
  mov eax, 1
  int 0x80