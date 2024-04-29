create database lab02
use lab02
create table giangvien
(GV char(4) primary key,
HoTen varchar(30),
DiaChi varchar(30),
NgaySinh varchar(15)
);
create table detai
(DT CHAR(4) PRIMARY KEY,
TenDT char(30),
Cap char(20),
KinhPhi int);
create table thamgia(
GV CHAR(4),
DT CHAR(4),
SoGio int,
foreign key (GV) references giangvien(GV),
foreign key (DT) references detai(DT)
);
insert into giangvien(GV,HoTen,DiaChi,NgaySinh)
values
('GV01', 'Vũ Tuyết Trinh', 'Hoàng Mai, Hà Nội', '1975-10-10'),
  ('GV02', 'Nguyễn Nhật Quang', 'Hai Bà Trưng, Hà Nội', '1976-11-03'),
  ('GV03', 'Trần Đức Khánh', 'Đống Đa, Hà Nội', '1977-06-04'),
  ('GV04', 'Nguyễn Hồng Phương', 'Tây Hồ, Hà Nội', '1983-12-10'),
  ('GV05', 'Lê Thanh Hương', 'Hai Bà Trưng, Hà Nội', '1976-10-10');
insert into detai(DT,TenDT,Cap,KinhPhi)
values
('DT01', 'Tính toán lưới', 'Nhà nước', 700),
  ('DT02', 'Phát hiện tri thức', 'Bộ', 300),
  ('DT03', 'Phân loại văn bản', 'Bộ', 270),
  ('DT04', 'Dịch tự động Anh Việt', 'Trường', 30);
INSERT INTO thamgia(GV,DT,SoGio)
values
 ('GV01', 'DT01', 100),
  ('GV01', 'DT02', 80),
  ('GV01','DT03', 80),
  ('GV02', 'DT01', 120),
  ('GV02', 'DT03', 140),
  ('GV03', 'DT03', 150),
    ('GV04', 'DT04', 180);
1.
select *from giangvien
where DiaChi like '%Hai Bà Trưng%'
order by HoTen desc;
2.
insert into giangvien(GV,HoTen,DiaChi,NgaySinh)
values
('GV06','Ngô Tuấn Phong','08/09/1986','Đống Đa, Hà Nội');
3.
update giangvien
set DiaChi='Tây Hồ, Hà Nội'
where HoTen='Vũ Thị Tuyết Trnh';
4.
delete from giangvien
where GV='GV02';
delete from thamgia
where GV='GV02';
5.
select Cap,sum(KinhPhi) as TongKinhPhi
from detai
group by Cap;
6.
select GV,SUM(SoGio) as TongSoGio
from thamgia
group by GV;
7.
select *from giangvien
where  year(NgaySinh)>=1980