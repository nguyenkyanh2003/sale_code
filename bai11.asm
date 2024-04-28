.data
mess1: .asciiz "Nhap ho ten:"
mess2: .space 30
mess3: .asciiz "Ho ten sau khi sua:"
mess4: .space 30
.text
# yeu cau nhap chuoi
li $v0,4
la $a0,mess1
syscall
# nhap ho ten
li $v0,8
la $a0,mess2
li $a1,30
syscall

li $t4,0 #khoi tao bien dem ban dau i=0
li $s6,0 #bien dem j=0
li $t7,0 #bien dem k=0
#dem so ki tu chuoi
dem:
lb $t0,mess2($t4) # doc ki tu trong chuoi luu vao t0
beqz $t0,space # neu t0='\0' nhay den space
addi $t4,$t4,1 #tang bien dem i=i+1
j dem #nhay den dem
 #tim space cuoi cung
space:
lb $t0,mess2($t4) #doc ki tu luu vao t0
beq $t0,' ',strcpy # neu t0=' ' nhay den strcpy
addi $t4,$t4,-1 # giam gia tri i=i-1
j space #nhay den space
#copy ki tu sau khoang trang cuoi cung vao mess4
strcpy:
addi $t5,$t4,0#luu gia tri khoang trang cuoi cung
loop:
addi $t4,$t4,1 #tang bien i=i+1
lb $t0,mess2($t4) #doc ki tu trong chuoi mess2 và lưu vào t0
sb $t0,mess4($t6) # luu ki tu t0 vao chuoi mess4
beqz $t0,strcpy2 #neu t0='\0' nhay den strcpy2
addi $t6,$t6,1 #tang bien dem j=j+1
j loop #nhay den loop
#sao chep từ đầu chuỗi mess2 đến khoảng trắng cuối cùng vào mess4
strcpy2:
addi $t6,$t6,-1 # tra ve vi tri truoc chuoi vi da sao chep ki tu null cua chuoi mess2
#luu khoang trang vào mess2
lb $t0,mess2($t5) #dọc kí tự ở chuỗi mess2 lưu vào t0 với t5 vị trí của khoảng trắng cuối cùng
sb $t0,mess4($t6) #luu ki tự t0 vào mess4
addi $t6,$t6,1 #j=j+1
loop2:
lb $t0,mess2($t7) #dọc kí tự chuỗi mess2 lưu vào t0 với t7=k=0
sb $t0,mess4($t6) # lưu kí tự t0 vào chuỗi mess4
beq $t7,$t5,printf #nếu k bằng với vị trí của khoảng trắng cuối cùng thì nhảy đến printf
addi $t7,$t7,1 #k=k+1
addi $t6,$t6,1 #j=j+1
j loop2 
#hien thi chuoi da chuyen doi
printf:
#hien chuoi mess3 
li $v0,4
la $a0,mess3
syscall
#hien chuoi da chuyen doi mess4
li $v0,4
la $a0,mess4
syscall
#ket thuc chuong trinh
li $v0,10
syscall
