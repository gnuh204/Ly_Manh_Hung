create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
cID int not null auto_increment primary key,
cName varchar(30) not null ,
cAge int 
);

create table Order_(
oID int not null auto_increment primary key,
cID int not null ,
oDate Datetime,
oTotalPrice  double not null,
foreign key (cID) references Customer(cID) on delete cascade
);

create table Product(
pID int not null auto_increment primary key,
pName varchar(60),
pPrice double not null  
);

create table OrderDetail (
oID int  not null,
pID int not null,
odQTY  varchar(60),
primary key (oId,pID),
foreign key (oID) references Order_(oID) on delete cascade,
foreign key (pID) references Product(pID) on delete cascade
);

