create database lab04a
use lab04a
create table nhanvien
(
manv varchar(4) primary key,
hoten varchar(40) ,
ngaysinh varchar(20),
map varchar(4) ,
foreign key (map) references phong(map)
);
create table phong
(map varchar(4) primary key,
tenp varchar(20)
);
create table duan
(mada varchar(4) primary key,
tenda varchar(30),
ngansach int);
create table thamgia
(manv varchar(4),
mada varchar(4),
sogiothamgia int,
foreign key (manv) references nhanvien(manv),
foreign key (mada) references duan(mada)
);
insert into nhanvien(manv,hoten,ngaysinh,map)
values 
       ('NV01', 'Nguyễn Văn A', '1990-01-01', 'P01'),
       ('NV02', 'Trần Thị B', '1992-05-10', 'P02'),
       ('NV03', 'Lê Văn C', '1995-08-20', 'P01'),
       ('NV04', 'Phạm Thị D', '1993-03-15', 'P03');
insert into phong(map,tenp)
values
       ('P01', 'QLDT'),
       ('P02', 'DTTX'),
       ('P03', 'NCKH');
insert into duan(mada,tenda,ngansach)
values ('DA01', 'Quản lý đào tạo', 80000),
       ('DA02', 'Đào tạo từ xa', 120000),
       ('DA03', 'Nghiên cứu khoa học', 150000);

insert into thamgia(manv,mada,sogiothamgia)
values ('NV01', 'DA01', 40),
       ('NV01', 'DA02', 30),
       ('NV02', 'DA01', 20),
       ('NV02', 'DA02', 35),
       ('NV03', 'DA01', 25),
       ('NV03', 'DA03', 50),
       ('NV04', 'DA03', 40);
-- 1
select tenda
from duan
where ngansach>=50000 and ngansach<=100000
-- 2
select hoten
from nhanvien
join thamgia on thamgia.manv=nhanvien.manv
join duan on duan.mada=thamgia.mada
where duan.tenda='Quản lý đào tạo';
-- 3
select thamgia.manv
from thamgia
join duan on duan.mada=thamgia.mada
where duan.tenda in ('Quản lý đào taọ' ,'Đào tạo từ xa')
group by thamgia.manv
having count(distinct duan.mada)=2
-- 4
select t1.manv
from thamgia t1
left join thamgia t2 on t1.manv=t2.manv and t2.mada 
in (select mada
from duan
where tenda='Đào tạo từ xa')
where t1.mada
 in(select mada
 from duan
 where tenda='Quản lý đào tạo')
and t2.mada is null;
-- 5
select p.map
from phong p
where not exists
(select 1
from nhanvien n
where n.map=p.map
)
-- 6
SELECT t1.mada
FROM thamgia t1
INNER JOIN nhanvien nv ON t1.manv = nv.manv
LEFT JOIN (
    SELECT manv
    FROM nhanvien
    WHERE map <> 'NCKH'
) nv2 ON nv.manv = nv2.manv
GROUP BY t1.mada
HAVING COUNT(DISTINCT nv2.manv) = 0;
-- 7
select avg(duan.ngansach) as ngansachtb
from duan
join thamgia on thamgia.mada=duan.mada
where thamgia.manv='nv01'
-- 8
select count(thamgia.manv) as sonvthamgia
from thamgia
join duan on duan.mada=thamgia.mada
where duan.tenda='Quản lý đào tạo';
-- 9
select tenda
from duan
join thamgia on thamgia.mada=duan.mada
group by tenda
having count(thamgia.manv)<10
-- 10
select tenda,count(thamgia.manv) as sonhanvienthamgia
from duan
join thamgia on thamgia.mada=duan.mada
group by tenda
order by sonhanvienthamgia desc
limit 1
