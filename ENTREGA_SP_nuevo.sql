use segunda_entrega;

delimiter //
create procedure suba_precios (
in precio_anterior decimal (6,2),
in precio_nuevo decimal (6,2))
begin 
update mercaderias set precio = precio_nuevo
where precio = precio_anterior;
end //
delimiter ;

drop procedure suba_precios;

select * from mercaderias;

call suba_precios(4523.00,4953.50);  

#ACA LO QUE HICE ES EL PODER PONERLA CANTIDAD DE STOCK QUE QUERES VER ( OSEA CUANTO HAY) DE TODAS LAS MERCADERIAS

select * from mercaderias;

delimiter !!
create procedure ver_stock(
in m_stock int)
begin
select id_merca, nombre, precio
from mercaderias
where stock < m_stock;
end !!
delimiter ;

call ver_stock(2);

drop procedure ver_stock;

# EL ORDEN QUE LE QUERES PONER A LOS CLIENTES SEGUN NOMBRE APELLIDO, LO QUE QUIERAS ASCENDETE


select * from datos_clientes;

delimiter ((
create procedure or_cliente 
(in c_orden char(50))
begin 
if c_orden <> '' then 
set @cliente = concat('order by ' , c_orden);
else 
set @cliente = '';
end if;
set @completo = concat('select * from datos_clientes ', @cliente);
prepare runSQL from @completo;
execute runSQL;
DEALLOCATE PREPARE runSQL;
end ((

drop procedure or_cliente;

call or_cliente('ID_CUENTA');


#Metodo para buscar el id maximo de un cliente hecho en un pedido. EJ el pedido numero 1.

select * from pedido_mercaderia;

delimiter %%
CREATE PROCEDURE NUMBER_id
(IN p_numero int,
out mayor float)
begin 
select max(id) into mayor
from
pedido_mercaderia
where pedidos=p_numero;
end %%

delimiter ;

drop procedure number_pd;

call number_pd(1, @p);
select @p;

 