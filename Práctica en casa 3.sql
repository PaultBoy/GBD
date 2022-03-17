create database alu200096_crearTablas;
Use alu200096_crearTablas;

create table fabricantes(
	nombre varchar(60) not null,
    codigo int not null,
    constraint tamaño
    check(length(nombre) > 2),
    primary key(codigo)
);

insert into fabricantes(nombre,codigo) values("Asus", 2);

update fabricantes
set nombre = "ASU"
where nombre= "Asus";
select * from fabricantes;

alter table fabricantes
drop column Importante;

delete from fabricantes where codigo="2";

create table productos (
	nombre varchar(45) not null,
    id int not null,
    cod_compañia int not null,
    primary key(id),
    foreign key(cod_compañia) references fabricantes(codigo)
);

insert into productos(nombre,id,cod_compañia) values("Asus Zenbook", 4, 3);

select * from productos;