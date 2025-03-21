
-- them thong tin vao bang customer
insert into customer(cName,cAge)
values ('Minh Quan',10);
insert into customer(cName,cAge)
values ('Ngoc Oanh',20);
insert into customer(cName,cAge)
values ('Hong Ha',50);

-- them thong tin vao bang Oder
insert into order_(cID,oDate,oTotalPrice)
values (1,'2006/3/21',null);
insert into order_(cID,oDate,oTotalPrice)
values (2,'2006/3/23',null);
insert into order_(cID,oDate,oTotalPrice)
values (1,'2006/3/16',null);

-- them thong tin vao bang Product
insert into product (pName, pPrice)
values('May Giat',3);
insert into product (pName, pPrice)
values('Tu Lanh',5);
insert into product (pName, pPrice)
values('Dieu Hoa',7);
insert into product (pName, pPrice)
values('Quat',1);
insert into product (pName, pPrice)
values('Bep Dien',2);

-- them thong tin bang Oderdetail
insert into orderdetail(oID,pID,odQTY)
values (1,1,3);
insert into orderdetail(oID,pID,odQTY)
values (1,3,7);
insert into orderdetail(oID,pID,odQTY)
values (1,4,2);
insert into orderdetail(oID,pID,odQTY)
values (2,1,1);
insert into orderdetail(oID,pID,odQTY)
values (3,1,8);
insert into orderdetail(oID,pID,odQTY)
values (2,5,4);
insert into orderdetail(oID,pID,odQTY)
values (2,3,3);
-- ####################################################################################

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate,oTotalPrice from order_;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select C.cName, C.cAge,O.oDate,P.pName,OD.odQTY 
from customer C join order_ O on C.cID = O.cID
join orderdetail OD on o.oID = OD.oID
join product P on OD.pID = P.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.cID,C.cName, C.cAge
from customer C left join order_ O on C.cID = O.cID
where O.oID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select OD.oID,O.oDate,sum(P.pPrice * OD.odQTY) AS GiaTien
from customer C join order_ O on C.cID = O.cID
join orderdetail OD on o.oID = OD.oID
join product P on OD.pID = P.pID
group by OD.oID;



