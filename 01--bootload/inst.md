When boot sector is loaded BIOS doesnt know how to load the os, so it hands it off to the boot sector. 

Should use 'nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin' to compile
The use 'qemu-system-x86_64 boot_sect_simple.bin' to run