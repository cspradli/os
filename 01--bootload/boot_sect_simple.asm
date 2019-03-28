; infinite loop
loop:
    jmp loop

;fill with 510 zeros minus size of the previous code
times 510-($-$$) db 0
;yee magic number
dw 0xaa55