create database alu200096_repaso;
use alu200096_repaso;

create table fabricante(
	codigo int(10) not null auto_increment primary key,
    nombre varchar(100) not null
);

create table producto(
	codigo int(10) not null primary key,
    nombre varchar(100) not null,
    precio double,
	codigo_fabricante int(10) not null,
    foreign key (codigo_fabricante) references fabricante(codigo)
);
drop table producto;
drop table fabricante;
insert into fabricante(nombre) values("Asus"), ("Jeje");

create table producto(
	codigo int(10) not null auto_increment,
	nombre varchar(100)not null,
	precio double,
	codigo_fabricante int(10),
	foreign key (codigo_fabricante) references fabricante (codigo),
	primary key(codigo)
);
insert into producto(nombre, precio, codigo_fabricante) values("Asus Zenbook", 899,3);

update fabricante
set nombre = "Coches"
where nombre = "Asus";
select * from fabricante;
alter table fabricante 
add column(
	sector varchar(20),
    fundacion int(4)
);

update producto
set HDD
where;
insert into fabricante(sector, fundacion) values("automoción",1919);
delete from producto where codigo_fabricante = 2;
alter table fabricante
add column(
	procesador varchar(100),
    HDD int(4)
);