SECTION .data

msg: db "Hello World!", 0x0a
len: equ $-msg

SECTION .text
global _main

kernel:
    syscall
    ret

_main:
    mov rax,0x2000004
    mov rdi,1
    mov rsi,msg
    mov rdx,len
    call kernel

    mov rax,0x2000001
    mov rdi,0
    call kernel


;brew reinstall nasm
;编译,asm源文件从而生成obj文件
;nasm -f macho64 -o helloworld.o helloworld.asm
;链接,link obj源文件从而生成exe文件
;ld -o helloworld -e _main helloworld.o -macosx_version_min 10.13 -lSystem

;别名
;alias comp="nasm -f macho64"
;alias lk="ld -e _main -macosx_version_min 10.13 -lSystem"
;comp helloworld.asm -o helloworld.o
;lk helloworld.o -o helloworld
;./helloworld
