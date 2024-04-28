create database lab02a
use lab02a
create table giangvien
(
 gv varchar(4) primary key,
 hoten varchar(50),
 diachi varchar(50),
 ngaysinh varchar(15)
);
create table detai
(
dt varchar(4) primary key,
tendetai varchar(50),
cap varchar(20),
kinhphi int
);
create table thamgia
(
gv varchar(4),
dt varchar (4),
sogio int,
foreign key (gv) references giangvien(gv),
foreign key (dt) references detai(dt)
);
insert into giangvien(gv,hoten,diachi,ngaysinh)
values  ('GV01', 'Vũ Tuyết Trinh', 'Hoàng Mai, Hà Nội', '1975-10-10'),
       ('GV02', 'Nguyễn Nhật Quang', 'Hai Bà Trưng, Hà Nội', '1976-11-03'),
       ('GV03', 'Trần Đức Khánh', 'Đống Đa, Hà Nội', '1977-04-06'),
       ('GV04', 'Nguyễn Hồng Phương', 'Tây Hồ, Hà Nội', '1983-10-12'),
       ('GV05', 'Lê Thanh Hương', 'Hai Bà Trưng, Hà Nội', '1976-10-10');
insert into detai(dt,tendetai,cap,kinhphi)
values
('DT01', 'Tính toán lưới', 'Nhà nước', 700),
  ('DT02', 'Phát hiện tri thức', 'Bộ', 300),
  ('DT03', 'Phân loại văn bản', 'Bộ', 270),
  ('DT04', 'Dịch tự động Anh Việt', 'Trường', 30);
insert into thamgia(gv,dt,sogio)
values 
 ('GV01', 'DT01', 100),
  ('GV01', 'DT02', 80),
  ('GV01','DT03', 80),
  ('GV02', 'DT01', 120),
  ('GV02', 'DT03', 140),
  ('GV03', 'DT03', 150),
    ('GV04', 'DT04', 180);
-- cau1
select 
*from giangvien
where diachi like '%Hai Bà Trưng%'
order by hoten desc;
-- 2
select giangvien.hoten,giangvien.diachi,giangvien.ngaysinh
from giangvien
join thamgia on thamgia.gv=giangvien.gv
join detai on detai.dt=thamgia.dt
where detai.tendetai='Dịch tự động Anh Việt'
-- 3
select hoten,diachi,ngaysinh
from giangvien
where giangvien.gv in
(
select gv
from thamgia
where dt in
(
  select dt
  from detai
  where tendetai='Phân loại văn bản' or tendetai='Dịch tự động Anh Việt'
)
)
-- 4
select giangvien.gv,giangvien.hoten,giangvien.diachi,giangvien.ngaysinh
from giangvien
join thamgia on thamgia.gv=giangvien.gv
group by gv,hoten,diachi,ngaysinh
having count(distinct(thamgia.dt))>=2
-- 5
select hoten,count(distinct(thamgia.dt)) as sodetai
from giangvien
join thamgia on giangvien.gv=thamgia.gv
group by hoten
order by sodetai desc
limit 1
-- 6
select 
*from detai
order by kinhphi asc
limit 1
-- 7
SELECT giangvien.hoten, giangvien.ngaysinh, detai.tendetai
FROM giangvien
JOIN thamgia ON giangvien.gv = thamgia.gv
JOIN detai ON thamgia.dt = detai.dt
WHERE giangvien.diachi LIKE '%Tây Hồ%';
-- 8
select giangvien.hoten
from giangvien
join thamgia on thamgia.gv=giangvien.gv
join detai on detai.dt=thamgia.dt
where year(giangvien.ngaysinh)<1980 and detai.tendetai='Phân loại văn bản'
-- 9
select giangvien.gv, giangvien.hoten, sum(thamgia.sogio) as tongsogio
from giangvien
join thamgia on thamgia.gv=giangvien.gv
group by giangvien.gv,giangvien.hoten
-- 10
insert into giangvien(gv,hoten,diachi,ngaysinh)
values
('GV06','Ngô Tuấn Phong','Đống Đa,Hà Nội',1986-09-08);
-- 11
update giangvien
set diachi='Tây Hồ, Hà Nội'
where gv='GV01'
-- 12
delete from giangvien
where gv='GV02'
and gv not in (select gv from thamgia);