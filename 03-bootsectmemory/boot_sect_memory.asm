mov ah, 0x0e

;this attempt failed because it tried to print the memory address
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

;It tried to print the mem address of 'the_secret' which is the correct approach
; BIOS places our boot_sect mem at address 0x7c00 so we need to add that padding before
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

;ATTEMPT 3 DEAR GOD
; add bios offset and then deref the contents of that pointer
; need to use bx because mova al, [ax] is no bueno
; a register cant be used as a source and dest at the same time
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

;Lets try shortcuts
;dont want to be recounting label offsets every time we change code
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $ ;love infinite loops

the_secret:
    ;ASCII code X is stored just before the zero-padding
    db "X"

;zero padding and magic number for BIOS
times 510-($-$$) db 0
dw 0xaa55