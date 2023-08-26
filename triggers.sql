use segunda_entrega;


# Creacion para calcular el monto a pagar de un pedido

delimiter //
create trigger calculo_venta 
before insert on pedido_mercaderia
for each row
begin
declare total_pagar decimal (6,2);
set total_pagar = (
select precio from mercaderias where id_merca = new.mercaderia );
set new.total = total_pagar * new.cantidad;
end //
delimiter 

drop trigger calculo_venta;

insert into pedido_mercaderia (id, pedidos, mercaderia, cantidad) values
(28, 27,30, 2);

select * from pedido_mercaderia;

#Primero cree una tabla para poder agregar mercaderia nueva y que me figure cual fueron.

create table new_mercaderias(
id_merca INT NOT NULL, #clave primaria
nombre VARCHAR(45) NOT NULL,  #clave primaria
precio DECIMAL(6,2), 
primary key(id_merca)
);


create trigger add_merca
after insert on mercaderias
for each row 
insert into `new_mercaderias`(id_merca, nombre, precio) values (new.id_merca, new.nombre, new.precio);

drop table new_mercaderias;
drop trigger add_merca;

insert into mercaderias values
(35, 'destornillador estrella 12', 2101.25, 10, 32),
(36, 'destornillador estrella 14', 2601.25, 10, 28);

select *from mercaderias;
select * from new_mercaderias;

insert into mercaderias values
(37, 'llave 6', 601.25, 6, 10);

# Cree un trigger con descuento de un 10% para la persona que supera un monto en especial de su pedido.

DELIMITER !!
CREATE TRIGGER Descuento_compra
BEFORE INSERT ON pedido_mercaderia
FOR EACH ROW
BEGIN
  IF NEW.total > 10000 THEN
    set NEW.total = new.total - (new.total *0.10);
  END IF;
END!!


insert into pedido_mercaderia (id, pedidos, mercaderia, cantidad) values
(41, 27,36, 10);

