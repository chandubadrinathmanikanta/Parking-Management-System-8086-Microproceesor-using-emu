              .model small
.stack 100h
.data
menu db '*****************PARKING MANAGEMENT SYSTEM*********************$'
menu1 db 'Press 1 for Auto$'
menu2 db 'Press 2 for Car$'
menu3 db 'Press 3 for Bus$'
menu4 db 'Press 4 to Show the Record$'
menu5 db 'Press 5 to Delete the Record$'
menu6 db 'Press 6 to Exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong Input$'
msg3 db 'Car$'
msg4 db 'Bus$'
msg5 db 'Record$'
msg6 db 'There is More Space in the Parking.$'
msg7 db 'The Total Amount is=$'
msg8 db 'The Total Numbers of Vehicles Parked=$'
msg9 db 'The Total Number of Autos Parked=$'
msg10 db 'The Total Number of Cars Parked=$'
msg11 db 'The Total Number of Buses Parked=$'
msg12 db '***Record Deleted Successfully***$'
amount dw 0
count dw  '0'
am1 dw ?
am2 dw ?
am3 dw ?


r dw '0'
c db '0'
b db '0'
.code
main proc
mov ax,@data
mov ds,ax

;mov cx,count

;mov cx,0

while_:   
             ;Menu
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




  ;userinput

mov ah,1
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  ;now compare
mov al,bl
cmp al,'1'
je auot
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_


mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

auot:
call auto


car:
call caar


rec:
call recrd


del:
call delt


bus:
call buss



end_:
mov ah,4ch
int 21h

main endp





auto proc
cmp count,'8'
jle auot1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

auot1:
mov ax,200
add amount, ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3
;mov am1,dx
inc count
;mov dx,count
inc r

jmp while_
jmp end_


caar proc
cmp count,'8'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:
mov ax,300
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33

;mov am2,amount

inc count
inc c
jmp while_
jmp end_




buss proc
cmp count,'8'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus1:
mov ax,400
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333
;mov am3,amount

inc count
inc b
jmp while_
jmp end_


recrd proc
mov dx,offset msg7
mov ah,9
int 21h


; print here the whole amount
mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
      ;  mov ah,0
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h







mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg9
mov ah,9
int 21h

mov dx,r
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg10
mov ah,9
int 21h


mov dl,c
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

jmp while_
jmp end_


delt proc
mov r,'0'
mov c,'0'
mov b,'0'
mov amount,0
;sub amount,48
mov count,'0'
mov dx,offset msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




jmp while_
jmp end_










end main
