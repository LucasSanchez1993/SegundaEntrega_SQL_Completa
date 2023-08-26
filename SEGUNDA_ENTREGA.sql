use segunda_entrega;

CREATE TABLE pagina_empresa(
cuenta varchar(50) not null, #null
cuit INT NOT NULL, # unique, una empresa no puede tener un cuit igual a otra
direccion varchar(60) not null, #primary key, direccion de la empresa
preguntas varchar(200), # null
primary key(cuit)
);

CREATE TABLE cuenta(
id INT NOT NULL, # unique, por el hecho de que no puede haber una id igual a la de la cuenta exitente
cuit_empresa INT NOT NULL, #null
NAME varchar(30) NOT NULL,# es unico no puede haber dos cuentas con el mismo nombre
password varchar(20) NOT NULL, 
FOREIGN KEY(cuit_empresa) references pagina_empresa(cuit), # integridad referencial de la empresa
primary key(id));


CREATE TABLE DATOS_CLIENTES(
ID_CUENTA INT NOT NULL, #unique
NOMBRE VARCHAR(30) NOT NULL,# clave primaria
APELLIDO VARCHAR(30) NOT NULL,#clave primaria
DNI INT NOT NULL UNIQUE,#unique
DIRECCION varchar(50) NOT NULL,# clave primaria
primary key(ID_CUENTA, nombre)
);


CREATE TABLE proveedores(
nombre VARCHAR(20) UNIQUE NOT NULL, #clave primaria
telefono INT NOT NULL, # clave primaria
id_proveedor int not null auto_increment, #clave primaria
tipo_mercaderia varchar(50) not null, 
primary key(id_proveedor)
);

CREATE TABLE mercaderias(
id_merca INT NOT NULL, #clave primaria
nombre VARCHAR(45) NOT NULL,  #clave primaria
precio DECIMAL(6,2), 
proveedor int not null, # integridad referencial
stock  INT NOT NULL, 
FOREIGN KEY(proveedor) REFERENCES proveedores(id_proveedor), # es de integridad referencial de los proveedores ya que ellos les otorga la mercaderia
primary key(id_merca)
);

 CREATE TABLE PEDIDOS(
 direccion_de_entrega VARCHAR(50) NOT NULL,
 numero_pedido INT NOT NULL, #clave primaria auto incrementable
 fecha_entrega VARCHAR(30), 
id INT NOT NULL, # integridad referencial referido a que su padre es el id de cuenta
mercaderias_pedidas INT NOT NULL, # integridad referencial por el padre de la tabla mercaderias
FOREIGN KEY(id) REFERENCES DATOS_CLIENTES(ID_CUENTA),
FOREIGN KEY(mercaderias_pedidas) REFERENCES mercaderias(id_merca)
);

CREATE TABLE reclamos(
tipo_de_reclamo VARCHAR(30) not null, # ambas dos columnas son clave primaria, las necesitas para saber que reclamos hay y diferencialos o reflejarlos con sus id. 
id INT NOT NULL,
primary key(tipo_de_reclamo,id)
);

ALTER TABLE cuenta
CHANGE COLUMN id id INT NOT NULL AUTO_INCREMENT;

CREATE UNIQUE INDEX NAME_CUENTA
ON cuenta(NAME);


ALTER TABLE PEDIDOS
CHANGE COLUMN numero_pedido numero_pedido INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (numero_pedido);

create table pedido_mercaderia(
id int not null,
pedidos int not null, 
mercaderia int not null, 
cantidad int not null,
foreign key (mercaderia) references mercaderias(id_merca),
foreign key (pedidos) references PEDIDOS(numero_pedido),
primary key (id)
);

CREATE TABLE cliente_reclamo(
number int not null auto_increment, #clave primaria
tipo VARCHAR(30) NOT NULL,
id_client int not null,
FOREIGN KEY(id_client) REFERENCES DATOS_CLIENTES(DNI), # integridad referencial asosiado a la tabla padre de datos de cliente mediante la busqueda de dni	
foreign key(tipo) references reclamos(tipo_de_reclamo), # integridad referencial que tiene como padre a la tabla padre referido a su tipo de reclamo
PRIMARY KEY (number));


alter table mercaderias
change column precio precio decimal(6,2) not null;

alter table cuenta
change column cuit_empresa cuit_empresa int;

CREATE UNIQUE INDEX id
ON cuenta(id);

alter table pagina_empresa
change column cuenta cuenta varchar(50);

CREATE UNIQUE INDEX id_cuenta
ON DATOS_CLIENTES(id_cuenta);

alter table mercaderias 
change column proveedor id_proveedor int not null;

# Le agregue a la tabla pedido mercaderia la tabla total.

alter table pedido_mercaderia
add column total decimal(8,2);