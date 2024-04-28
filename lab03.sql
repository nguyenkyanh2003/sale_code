create database lab03a
use lab03a
create table nhanvien
(
msnv varchar(4) primary key,
hoten varchar(40),
luong float
);
create table phong
(
msp varchar(4) primary key,
tenphong varchar(20),
nganquy float,
mstruongphong varchar(10)
);
create table lamviec
(
msnv varchar(4),
msp varchar(4),
foreign key (msnv) references nhanvien(msnv),
foreign key (msp) references phong(msp)
);
insert into nhanvien(msnv,hoten,luong)
values ('nv01', 'Nguyễn Văn A', 5000000),
  ('nv02', 'Trần Thị B', 7000000),
  ('nv03', 'Phạm Văn C', 6000000),
  ('nv04', 'Lê Thị D', 5500000),
  ('nv05', 'Hoàng Văn E', 8000000),
  ('nv06', 'Nguyễn Thị F', 9000000);
  insert into phong(msp,tenphong,nganquy,mstruongphong)
  values
   ('sp01', 'Phòng Tổ chức', 1500000, 'tp02'),
  ('sp02', 'Phòng Kế hoạch', 2000000, 'tp04'),
  ('sp03', 'Phòng Kỹ thuật', 3000000, 'tp06'),
  ('sp04', 'Phòng Nhân sự', 1000000, 'tp01');
  insert into lamviec(msnv,msp)
  values
  ('nv01', 'sp01'),
  ('nv02', 'sp01'),
  ('nv02', 'sp02'),
  ('nv03', 'sp03'),
  ('nv04', 'sp02'),
  ('nv04', 'sp03'),
  ('nv05', 'sp04'),
  ('nv06', 'sp04');
  -- 1
select nhanvien.hoten
from nhanvien
inner join lamviec on lamviec.msnv=nhanvien.msnv
inner join phong on lamviec.msp=phong.msp
where phong.tenphong in ('Phòng Tổ chức','Phòng Kế hoạch')
group by nhanvien.hoten
having count(distinct phong.msp)=2
-- 2
select phong.msp,count(lamviec.msnv) as sonv
from phong
inner join lamviec on lamviec.msp=phong.msp
group by phong.msp
having count(lamviec.msnv)>5
-- 3
select nhanvien.hoten
from nhanvien
where nhanvien.luong> all(
select phong.nganquy
from phong
join lamviec on phong.msp=lamviec.msp
where nhanvien.msnv=lamviec.msnv
);
-- 4
select mstruongphong
from phong
where nganquy>1000000
-- 5
select mstruongphong
from phong 
order by nganquy desc
limit 1
-- 6
select mstruongphong
from phong
where sum(nganquy)>5000000

