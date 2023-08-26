use segunda_entrega;


delimiter //
create function escala_precios (precio int)
returns varchar(50)
deterministic
begin 
case 
when precio < 1000 then 
return 'Mas barato';
when precio >=1000 and precio<2000 then 
return 'Precio neutral';
when precio >2000 then 
return 'Mas caro';
end case;
end //
delimiter ;

select id_merca, nombre,precio, (precio) from mercaderias;


delimiter ~~
create function Saludo_proveedor_nuevo (nombre varchar(50), id int)
returns varchar (100)
deterministic
begin 
declare nombre_id varchar (100);
set nombre_id = concat(nombre, ' ' , id);
return concat('Bienvenido ', nombre_id);
end ~~
delimiter 

select nombre, telefono, Saludo_proveedor_nuevo(nombre,id_proveedor) from proveedores
where id_proveedor =11;

drop function Saludo_proveedor_nuevo;
