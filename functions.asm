; iprint ( integer )'
iprint:
  push eax 
  push ecx 
  push edx 
  push esi 
  mov  ecx, 0

divideLoop:
  inc  ecx
  mov  edx, 0
  mov  esi, 10
  idiv esi 
  add  edx, 48
  push edx
  cmp  eax, 0
  jnz divideLoop

printLoop:
  dec  ecx
  mov  eax, esp 
  call sprint
  pop  eax
  cmp  ecx, 0 
  jnz  printLoop

  pop esi 
  pop edx 
  pop ecx 
  pop eax 
  ret
  
; iprintlF

iprintLF:
  call iprint

  push eax
  mov  eax, 0x0a
  push eax
  mov  eax, esp
  call sprint
  pop  eax
  pop  eax
  ret 

; int slen (string message)
; String lenght
slen:
  push ebx
  mov ebx, eax

nextchar: 
  cmp byte [eax], 0
  jz finished
  inc eax
  jmp nextchar

finished:
  sub eax, ebx
  pop ebx
  ret 


; String print
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen
  
  mov edx, eax 
  pop eax 

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 0x80

  pop ebx 
  pop ecx
  pop edx 
  ret 

; sprintLF linefeed
sprintLF:
  call sprint
  push eax 
  mov  eax, 0x0a
  push eax,
  mov  eax, esp 
  call sprint
  pop  eax 
  pop  eax 
  ret 

; void exit 
quit:
  mov ebx, 0
  mov eax, 1 
  int 0x80
  ret 
