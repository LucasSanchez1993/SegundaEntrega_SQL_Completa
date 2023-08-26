use primera_entrega;

USE segunda_entrega;

insert into cuenta (id,name, password) values
(null,'rpepe', 'pepito'),
(null, 'mchipi', 'martinita'),
(null,'jhernandez', 'josesito'),
(null,'lsanchez1993', 'toto1'),
(null,'mlorenzo', 'miguelito');

select * from cuenta;

insert into datos_clientes (ID_CUENTA, NOMBRE, APELLIDO, DNI, DIRECCION) VALUES
(1111,'JOSE', 'HERNANDEZ', 32323232, 'AVENIDA RIVADAVIA 23 3ºR'),
(1112, 'MARTINA', 'CHIPI', 32233215, 'GANA 254'),
(1113, 'ROBERTO', 'PEPE', 35555555, 'MALABIA 777 PB A'),
(1114, 'LUCAS', 'SANCHEZ', 31234578, 'ARGENTINA 3'),
(1115, 'MIGUEL', 'LORENZO', 45555578, 'SANCHEZ 4532');

insert into proveedores values
('herramientas pucho', 1147951564,null, 'herramientas'),
('Plactiflex', 1145672310, null, 'plasticos'),
('pintez', 1136547895, null, 'pinturas'),
('Todo tornillo',1198745632, null,'tornillos y tuercas'),
('Herrero Loco', 1147896523, null, 'herramientas');

select * from datos_clientes;

select * from proveedores;

insert into mercaderias values
(30, 'martillo', 1254, 6, 20),
(31, 'aerosol rosa', 904.12, 8, 2),
(32, 'sierra', 4523,10,1),
(33,'llave 3/4',2310,6,0),
(34, 'tuerca 3/4',80, 9,1200);

select * from mercaderias;

insert into pedidos(direccion_de_entrega, numero_pedido, id, mercaderias_pedidas) values
('gallardo 452 3ºf', null, 1111, 30),
('rivadavia ',null,1112,30),
('sanchez 454 2', null, 1113,31),
('gallo 1239',null, 1114, 34),
('brasil 123', null,1115,30);

select * from pedidos;

insert into reclamos values
('rotura', 1),
('falta mercaderia',2),
('tardanza entrega',3),
('mercaderia no pedida',4),
('cantidad no deseada',5);

select * from reclamos;

insert into pedido_mercaderia values
(21, 27,30, 4),
(22, 1, 34,120),
(23,28,34,100),
(24,1,31,1),
(25,35,32,1);

select * from pedido_mercaderia;


insert into cliente_reclamo values
(null,'falta mercaderia', 32323232),
(null, 'rotura', 32233215),
(null,'falta mercaderia', 45555578),
(null,'tardanza entrega', 45555578),
(null,'cantidad no deseada',31234578);

select * from cliente_reclamo;


insert into proveedores values
('Bob Construye', 1178912325,null, 'Maquinarias de construccion');

