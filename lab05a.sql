create database lab05a
use lab05a
create table sinhvien
( mssv varchar(10) primary key,
hoten varchar(40) not null,
ngaysinh varchar(20),
quequan varchar(40)
);
create table monhoc
( msmh varchar(10) primary key,
tenmh varchar(40) not null,
tengv varchar(40)
);
create table dangky
( msmh varchar(10),
mssv varchar(10),
diem float,
foreign key (msmh) references monhoc(msmh),
foreign key (mssv) references sinhvien(mssv),
check (diem>=0 and diem<=10)
);
insert into sinhvien(mssv,hoten,ngaysinh,quequan)
values (20242324 ,'Nguyễn Văn A', '2000-01-01', 'Hà Nội'),
       (20242325, 'Trần Thị B', '2001-02-02', 'Hồ Chí Minh'),
       (20225783, 'Lê Văn C', '2002-03-03', 'Đà Nẵng');
insert into monhoc(msmh,tenmh,tengv)
values 	('M1', 'Toán', 'Nguyễn Văn X'),
       ('M2', 'CSDL', 'Trần Thị Y'),
       ('M3', 'Hóa', 'Lê Văn Z');
INSERT INTO dangky(mssv,msmh,diem)
values
	    (20242324,'M1', 7.5),
       (20242324,'M2', 9.0),
       (20242324, 'M3', 6.5),
       (20242325, 'M2', 9.5),
       (20242325, 'M3', 7.0),
       (20225783,'M1',10.0),
       (20225783,'M3',10.0);
-- 1
select tenmh
from monhoc
-- 2
select mssv,hoten,ngaysinh
from sinhvien
where quequan like '%Hà Nội%'        
-- 3
select distinct mssv
from dangky
where msmh='M1' or msmh='M2';
-- 4
select tenmh
from monhoc
join dangky on dangky.msmh=monhoc.msmh
where dangky.mssv=20242325
-- 5
select distinct hoten
from sinhvien
join dangky on dangky.mssv=sinhvien.mssv
join monhoc on dangky.msmh=monhoc.msmh
where monhoc.tengv='Nguyễn Văn X'
-- 6
select monhoc.tenmh,dangky.diem
from monhoc
join dangky on monhoc.msmh=dangky.msmh
join sinhvien on sinhvien.mssv=dangky.mssv
where sinhvien.hoten='Nguyễn Văn A'
-- 7
select distinct mssv
from dangky
join monhoc on monhoc.msmh=dangky.msmh
where monhoc.tengv='Trần Thị Y'
group by dangky.mssv
having count(distinct dangky.msmh)=(select count(*) from monhoc where tengv='Trần Thị Y')
-- 8
select tenmh
from monhoc
left join dangky on monhoc.msmh=dangky.msmh
where dangky.msmh is null
-- 9
select s.mssv,s.hoten,s.ngaysinh,s.quequan
from sinhvien s
join dangky on s.mssv=dangky.mssv 
group by s.mssv,s.hoten,s.ngaysinh,s.quequan
having count(dangky.msmh)>=3
-- 10
select avg(diem) as diemtrungbinh
from dangky
join sinhvien on dangky.mssv=sinhvien.mssv
where sinhvien.hoten='Nguyễn Văn A'
-- 11
select hoten
from sinhvien
join dangky on dangky.mssv=sinhvien.mssv
join monhoc on monhoc.msmh=dangky.msmh
where monhoc.tenmh='CSDL'
order by dangky.diem desc
limit 1