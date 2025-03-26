Create database demo;
use demo;
create table Products(
 id int auto_increment primary key,
 productCode varchar(40) not null ,
 productName varchar(40) not null,
 productPrice double not null,
 producAmount varchar(40),
 productDescription varchar(40),
 productStatus varchar(40)
);


INSERT INTO Products (productCode, productName, productPrice, producAmount, productDescription, productStatus) 
VALUES 
('P001', 'Laptop Dell XPS 13', 1200.50, '15', 'Laptop cao cấp', 'Available'),
('P002', 'iPhone 15 Pro', 999.99, '20', 'Điện thoại Apple', 'Available'),
('P003', 'Samsung Galaxy S23', 850.75, '30', 'Điện thoại Samsung', 'Available'),
('P004', 'MacBook Air M2', 1300.00, '10', 'Laptop Apple M2', 'Out of Stock'),
('P005', 'Sony WH-1000XM5', 399.99, '25', 'Tai nghe chống ồn', 'Available'),
('P006', 'iPad Pro 12.9', 1100.50, '12', 'Máy tính bảng Apple', 'Available'),
('P007', 'Asus ROG Strix G15', 1450.00, '8', 'Laptop gaming', 'Available'),
('P008', 'Logitech MX Master 3', 99.99, '40', 'Chuột không dây', 'Available');



create unique index idx_productCode on products(productCode);

create  index idx_product_name_price on products(productName, productPrice);

explain select * from products where productCode = 'P004';

explain select * from products where productName =' MacBook Air M2' or productPrice >= 1000;

create view product_view as 
select productCode, productName,productPrice,ProductStatus 
from products;

select * from product_view;

UPDATE product_view SET productPrice = 1200 WHERE productCode = 'P001';

DROP VIEW IF EXISTS product_view ;



DELIMITER //
create procedure sp_get_product()
begin 
select * from products;
END //

DELIMITER ;



DELIMITER //
create procedure sp_add_product(
	in sp_productCode varchar(40),
    in sp_productName varchar(40),
    in sp_productPrice double,
    in sp_producAmount varchar(40),
    in sp_productDescription varchar(40),
    in sp_productStatus varchar(40)
) 
begin 
	insert into Products (productCode, productName, productPrice, producAmount, productDescription, productStatus) 
	values (sp_productCode,sp_productName,sp_productPrice,sp_producAmount,sp_productDescription,sp_productStatus);
end //
DELIMITER ;



DELIMITER //
create procedure sp_up_productDescription(
	in sp_id int,
    in sp__productDescription varchar(40)
)
begin 
	update products set proproductDescription = sp__productDescription
    where id = sp_id;
end //
DELIMITER ;



DELIMITER //
create procedure sp_delete_product(
	in sp_id int
)
begin 
	delete from products where id = sp_id;

end //
DELIMITER ;
