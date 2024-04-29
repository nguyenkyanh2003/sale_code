create database lab01A
USE lab01A
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

insert into NCC(MSNCC,TenNCC,Diachi)
values 
('NCC2','Cty D','Nam Định');
insert into  NCC(MSNCC,TenNCC,Diachi)
values
('NCC3','Cty D','Nam Định');
insert into  NCC(MSNCC,TenNCC,Diachi)
values
('NCC4','Cty D','Nam Định');

insert into mathang(MSMH,TenMH,Mausac)
values
('MH5','Mat hang 6','tim');
insert into mathang(MSMH,TenMH,Mausac)
values
('MH6','Mat hang 6','tim');

insert into cungcap(MSNCC,MSMH,Giatien)
values 
('NCC3','MH7',100);
insert into cungcap(MSNCC,MSMH,Giatien)
values 
('NCC3','MH4',100);
SELECT NCC.MSNCC , NCC.TenNCC, cungcap.MSMH
from NCC
JOIN cungcap on NCC.MSNCC = cungcap.MSNCC

SELECT NCC.MSNCC, NCC.TenNCC, CUNGCAP.MSMH
from NCC
join cungcap ON NCC.MSNCC=CUNGCAP.MSNCC
order by NCC.MSNCC 

select NCC.MSNCC ,NCC.TenNCC, CUNGCAP.MSMH
FROM NCC, CUNGCAP

SELECT NCC.MSNCC,NCC.TenNCC,CUNGCAP.MSMH,MATHANG.TenMH
FROM NCC
JOIN CUNGCAP ON CUNGCAP.MSNCC=NCC.MSNCC
JOIN MATHANG ON CUNGCAP.MSMH=MATHANG.MSMH

select distinct MSNCC
FROM cungcap
WHERE MSMH IN(
SELECT MSMH
FROM MATHANG
WHERE Mausac='do' OR Mausac='xanh');

select distinct cungcap.MSNCC
from cungcap
join mathang on mathang.MSMH=cungcap.MSMH
WHERE mathang.Mausac='do'
and cungcap.MSNCC IN(
select MSNCC
FROM CUNGCAP
join mathang on mathang.MSMH=cungcap.MSMH
WHERE Mausac='xanh'
)

select MSNCC, TenNCC, DiaChi
from NCC
WHERE MSNCC NOT IN
(select MSNCC
FROM CUNGCAP
WHERE MSMH!='MH1'
)

select MSNCC,TenNCC,DiaChi
from ncc
where MSNCC NOT IN
(select MSNCC
from cungcap
);

SELECT NCC.MSNCC,NCC.TenNCC,NCC.DiaChi, count(cungcap.MSMH) AS SoLuongMatHang
from ncc
left join cungcap on cungcap.MSNCC=NCC.MSNCC
group by ncc.MSNCC,NCC.TenNCC,NCC.DiaChi	

select MSMH
from cungcap
group by MSMH
having count(distinct MSNCC)>=2

SELECT MSMH
FROM cungcap
where MSNCC='NCC1'
order by Giatien desc
limit 1


