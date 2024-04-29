.data
A:     .word 0
mess1: .asciiz "Nhap n: "
mess2: .asciiz "Nhap m: "
mess4: .asciiz "\nSo nguyen to la: "

.text
la $s6, A # tải địa chỉ của mảng A vào thanh ghi $s6.
li $s0, 0   # i = 0
li $s2, 2   # khởi tạo biến so bi chia bằng 2.
#in chuỗi
li $v0, 4
la $a0, mess1
syscall
#nhập giá trị n và sao chép n vào t0
li $v0, 5
syscall
move $t0, $v0   # t0 = n
#in chuỗi mess2
li $v0, 4
la $a0, mess2
syscall
# nhập giá trị m và sao chép vào t1
li $v0, 5
syscall
move $t1, $v0   # t1 = m
addi $s3, $t1, 1 #tăng giá trị m lên 1
#kiểm tra n có nhỏ hơn 3 không
for0:
    slti $t2, $t0, 3#nếu t0<3 thì t2=1 else t2=0
    beqz $t2, for1 #nếu t2=0 nhảy đến for1
   #lấy giá trị của n và ghi vào mảng
    add $t3, $s0, $s0 
    add $t3, $t3, $t3
    add $t3, $t3, $s6
    sw $t0, 0($t3)

    addi $t0, $t0, 1 #tăng n lên 1
    addi $s0, $s0, 1 #tăng giá trị biến đếm i lên 1
    j for0 # nhảy đến for 0
# vòng lặp để kiểm tra số n trong khoảng n-m có chia hết cho 2 đến n-1 không
for1:
    div $t0, $s2 # n chia s2
    mfhi $t4 # t4= phần dư của số chia
    beqz $t4, for2 #nếu $t4=0 thì nhảy đến for2

    addi $s2, $s2, 1 # tăng số bị chia lên 1
    beq $s2, $t0, for3 # nếu số bị chia bằng n thì nhảy đến for3
    j for1 # nhảy đến for1
# tăng giá trị n lên 1 nếu n là số chia hết
for2:
    addi $t0, $t0, 1 #n+1
    li $s2, 2 #khởi tạo lại số bị chia =2
    beq $t0, $s3, exit # nếu n lớn hơn m thì nhảy đến exit
    j for1 #nhảy đến for1
#ghi số nguyên tố vào mảng
for3:
    add $t3, $s0, $s0 
    add $t3, $t3, $t3
    add $t3, $t3, $s6 #lấy địa chỉ của mảng A để lưu số n
    sw $t0, 0($t3) #lưu số k vào mang A
    addi $s0, $s0, 1 #tăng biến đếm của mang lên 1
    beq $t0, $t1, exit #nếu n=m thì nhảy đến exit
    j for1 #nhảy đến for1

exit:
#hiện số nguyên tố
printf:
#gọi chuỗi mess4
    li $v0, 4
    la $a0, mess4
    syscall
#lấy địa chỉ của mảng A
    li $s7, 0 #j=0
    add $t3, $s7, $s7
    add $t3, $t3, $t3
    add $t3, $t3, $s6
  
# hiện số A[j]
loop:
  
    lw $t4, 0($t3) #đọc giá trị m của mảng A
     #in dấu cách
    li $a0,32
    li $v0,11
    syscall
    #in giá trị A[j]
    li $v0, 1
    move $a0, $t4
    syscall
    addi $s7, $s7, 1 #tăng biến j lên 1
    beq $s7, $s0, end #nếu j=1 thì kết thúc chương trình
    add $t3, $t3, 4 # tăng địa chỉ lên 4
    j loop #nhảy đến loop

end:
    # Kết thúc chương trình
