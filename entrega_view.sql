use segunda_entrega;

# primera 


select * from proveedores;
select * from mercaderias;

create view proveedores_mercaderia as
(select p.nombre,p.tipo_mercaderia, m.id_merca
from proveedores p
join mercaderias m
on p.id_proveedor = m.id_proveedor
where m.stock > 10);

select * from proveedores_mercaderia;

# segunda

select * from datos_clientes;

create view cliente as
(select apellido, dni
from datos_clientes
where id_cuenta = 1111);

select * from cliente;

# tercera

select * from cliente_reclamo;

create view reclamos_hechos as
(select tipo, number
from cliente_reclamo
where id_client = 45555578);

select * from reclamos_hechos;

# cuarta

select * from cuenta;

create view password_cuenta as
(select id, password
from cuenta
where name like upper('%ez%'));

select * from password_cuenta;

# quinta

select * from pedidos;

create view direcciones as
( select direccion_de_entrega, numero_pedido, mercaderias_pedidas
from pedidos
where id <(1114));

select * from direcciones;

# sexta

create view entrega as
(select numero_pedido
from pedidos
where direccion_de_entrega = ('gallardo 452 3ºf'));

select *from entrega;