section .data
    menu db '1. Opcion 1', 0xA,  ; Opción 1
         db '2. Opcion 2', 0xA,  ; Opción 2
         db '3. Salir', 0xA, 0   ; Opción 3 y terminador nulo

    opcion1 db 'Has seleccionado la opcion 1. \n', 0xA, 0  ; Mensaje para opción 1
    opcion2 db 'Has seleccionado la opcion 2.', 0xA, 0  ; Mensaje para opción 2
    salir db 'Saliendo del programa...', 0xA, 0         ; Mensaje de salida
    error db 'Opcion no valida. Intenta de nuevo.', 0xA, 0  ; Mensaje de error
    prompt db 'Selecciona una opcion: ', 0              ; Prompt para la entrada

section .bss
    input resb 2  ; Reserva 2 bytes: 1 para la entrada y 1 para el salto de línea

section .text
    global _start

_start:
    ; Mostrar el menú
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, menu       ; mensaje a mostrar
    mov edx, 33         ; longitud del mensaje
    int 0x80            ; llamada al sistema

    ; Mostrar el prompt para la entrada
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt     ; mensaje del prompt
    mov edx, 22         ; longitud del mensaje
    int 0x80            ; llamada al sistema

    ; Leer la entrada del usuario
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, input      ; buffer para almacenar la entrada
    mov edx, 2          ; longitud de la entrada (1 byte + salto de línea)
    int 0x80            ; llamada al sistema

    ; Comparar la entrada del usuario
    cmp byte [input], '1'
    je seleccion1       ; Saltar a seleccion1 si la entrada es '1'
    cmp byte [input], '2'
    je seleccion2       ; Saltar a seleccion2 si la entrada es '2'
    cmp byte [input], '3'
    je salir_programa   ; Saltar a salir_programa si la entrada es '3'

    ; Si la entrada no es válida, mostrar un mensaje de error
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, error      ; mensaje de error
    mov edx, 31         ; longitud del mensaje
    int 0x80            ; llamada al sistema
    jmp _start          ; Volver a mostrar el menú

seleccion1:
    ; Mostrar mensaje de la opción 1
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, opcion1    ; mensaje de la opción 1
    mov edx, 26         ; longitud del mensaje
    int 0x80            ; llamada al sistema
    jmp _start          ; Volver a mostrar el menú

seleccion2:
    ; Mostrar mensaje de la opción 2
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, opcion2    ; mensaje de la opción 2
    mov edx, 26         ; longitud del mensaje
    int 0x80            ; llamada al sistema
    jmp _start          ; Volver a mostrar el menú

salir_programa:
    ; Mostrar mensaje de salida
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, salir      ; mensaje de salida
    mov edx, 24         ; longitud del mensaje
    int 0x80            ; llamada al sistema

    ; Salir del programa
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; código de salida 0
    int 0x80            ; llamada al sistema
