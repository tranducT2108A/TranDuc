CREATE DATABASE Student_Management
Go
USE Student_Management
Go
use dtbase
go
if exists( select * from sys.databases where name = 'dtbase')
drop database dtbase
go
create database dtbase
go
use dtbase
go
create table product(
proid varchar(20) primary key,
proname varchar(30),
id_name varchar(20)
)
go
create table manager(
idmanager int primary key,
name varchar(20)
)
go
create table manageproduct(
id int primary key,
id_product varchar(20) references product(proid),
id_manager int references manager(idmanager),
ngaysanxuat date
)
go
insert into manager
values (1,'nguyen van a'),
       (2,'nguyen van b'),
	   (3,'nguyen van c')
	   go

insert into product
values ('a01','may tinh bang z01','z01'),
       ('a02','may tinh bang z02','z02'),
	   ('a03','dien thoai di dong b11','b11'),
	   ('a04','dien thoai di dong b12','b12'),
	   ('a05','tai nghe z32','z32'),
	   ('a06','tai nghe z37','z37')
go

go
update manageproduct set ngaysanxuat='2020-10-02'  where id_product ='a01'
update manageproduct set ngaysanxuat='2020-03-02' where id_product ='a02'
update manageproduct set ngaysanxuat='2020-02-02'  where id_product ='a03'
update manageproduct set ngaysanxuat='2020-01-02'  where id_product ='a04'
update manageproduct set ngaysanxuat='2020-04-02'  where id_product ='a05'
update manageproduct set ngaysanxuat='2020-05-02'  where id_product ='a06'


insert into manageproduct
values (1,'a01',1,'2020-10-02'),
       (2,'a02',2,'2020-03-02'),
	   (3,'a03',1,'2020-02-02'),
	   (4,'a04',2,'2020-01-02'),
	   (5,'a05',3,'2020-04-02'),
	   (6,'a06',1,'2020-05-02'),
	   (7,'a01',2,'2020-10-02'),
	   (8,'a05',3,'2020-04-02'),
	   (9,'a06',2,'2020-05-02'),
	   (10,'a02',1,'2020-03-02')
	   go

select * from manageproduct
go
create view loaisanpham
as
select pr.id_name 
from product pr
go
select * from manager
select * from product
select * from loaisanpham

select pr.proname
from product pr
order by pr.proname
go
select mn.name   
from manager mn
order by mn.name

select pr.proname
from product pr
where pr.id_name = 'b11'
go

select proname from product
where proid in( select id_product from manageproduct where id_manager = 1)