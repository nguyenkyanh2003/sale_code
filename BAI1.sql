create database lab01
use lab01
drop table msncc
create table NCC(
MSNCC CHAR(5) PRIMARY KEY,
TenNCC varchar(20),
Diachi varchar(20)
);
create table mathang(
MSMH CHAR(5) PRIMARY KEY,
TenMH varchar(20),
Mausac varchar(10)
);
create table cungcap(
MSNCC CHAR(5),
MSMH CHAR(5),
Giatien int,
foreign key (MSNCC) references NCC(MSNCC),
foreign key (MSMH) references mathang(MSMH)
);
insert into ncc(MSNCC,TenNCC,Diachi)
values 
('NCC1', 'Cty A', 'Hai Ba Trung, Ha Noi'),
('NCC2', 'Cty B', 'Hoan Kiem, Ha Noi'),
('NCC3', 'Cty C', 'Huong Khe, Ha Tinh');
insert into mathang(MSMH,TenMH,Mausac)
values
 ('MH1', 'Mat hang 1', 'do'),
 ('MH2', 'Mat hang 2', 'tim'),
 ('MH3', 'Mat hang 3', 'xanh'),
  ('MH4', 'Mat hang 4', 'do'),
  ('MH5', 'Mat hang 5', 'do');
insert into cungcap(MSNCC,MSMH,Giatien)
values
('NCC1', 'MH1', 150),
('NCC1', 'MH2', 250),
('NCC1', 'MH3', 350),
('NCC1', 'MH4', 50),
('NCC1', 'MH5', 245),
('NCC2', 'MH1', 50),
('NCC2', 'MH2', 450),
('NCC2', 'MH3', 250),
('NCC2', 'MH4', 150);
1.
select *from ncc
2.
select *from ncc
where Diachi like'%Ha Noi%';
3.
select 
*from mathang
where Mausac='do';
4.
select MSNCC,MSMH
FROM cungcap
where Giatien>=50 and Giatien<=150
5.
select MSMH ,Giatien
from cungcap
where MSNCC='NCC1';
6.
SELECT MSMH,Giatien
from cungcap
where MSNCC='NCC1' AND Giatien<100;
7.
select MSMH,Giatien
from cungcap
order by Giatien desc;
8.
select MSMH,Giatien
from cungcap
order by MSNCC desc,Giatien desc;
9.
update mathang
set Mausac='xanh'
where MSMH='MH5';
10.
select MSNCC, count(MSMH) AS SoLuongMatHang
from cungcap
group by MSNCC;
11.
select Mausac, count(MSMH) AS SoLuongMatHang
from mathang
group by Mausac;
12.
delete from cungcap
where Giatien>200;







