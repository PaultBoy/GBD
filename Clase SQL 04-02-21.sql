USE alu200096_Peliculas2;

insert into alu200096_Peliculas2.Actriz (nombre, pais, fecha_nac) values ('Penélope Cruz','España', '1974-04-28'); 
select * from Actriz;
insert into Pais (nombre) values('Perú'), ('Ecuador');
select * from Pais;

select * from Papel;
select * from Pelicula where id = 2;
select * from Actriz where id=13;
update Papel
set personaje = 'Molly'
where (id_Pelicula = 2) and (id_Actriz = 13);

update Papel
set personaje = 'José Luis Torrente'
where (id_Pelicula = 6) and (id_Actriz = 8);

delete from Pais where (nombre = 'Perú');

select * from Pais;


insert into Pais(nombre)
values ("Perú"), ("Venezuela"), ("Irán");

delete from Pais where (nombre = 'Perú') or (nombre = 'Venezuela') or (nombre = 'Irán');

select * from Actriz
where Pais in ("España", "Estados Unidos");
-- equivalente a
-- where Pais = "España" or Pais = "Estados Unidos"

delete from Pais where nombre in ("Perú", "Venezuela", "Irán");
use alu200096_Tienda;
alter table producto
rename column FechaCad to fechaCaducidad;

alter table Venta
modify column FechaCompra datetime not null;

alter table producto
add constraint precioMayorQueCero
check (Precio > 0); 
select * from producto;

create database alu200096_Coches;
use alu200096_Coches;

create table Coches(
	id int not null auto_increment,
    matriculado bool not null,
    matricula varchar(7),
    primary key (id)
);

alter table Coches
rename column matriculado to matricuado;
-- Corrijo el campo mal puesto anteriormente
alter table Coches
change column matricuado matriculado bool not null;

insert into Coches(matriculado) values (false), (false), (false);
select * from Coches;

insert into Coches (matriculado, matricula)
values (true, "8565GHJ");

-- Ejercicio
-- Crear una base de datos Personas
-- Crear una tabla Persona(dni, nombre, edad, mayor_de_edad)
-- Crear una restriccion para que si la edad es >= 18 no
-- deje introducir mayor_de_edad = false y al revés.

create schema alu200096_Personas;
use alu200096_Personas;
create table Persona (
	dni varchar(9) not null,
	nombre varchar(45) not null,
    edad int,
    mayor_de_edad boolean,
    -- crear la resticcion directamente en el create table
    constraint CHK_mayorDeEdad
    check((edad >= 18 and mayor_de_edad = true) or (edad < 18 and mayor_de_edad = false)),
    constraint PK_dni primary key (dni)
);

drop table Persona;
alter table Coches
add constraint CHK_MatriculaNecesariaSimatriculado
check (matriculado = true and matricula is not null
		or matriculado = false and matricula is null);
insert into Persona (dni, nombre, edad, mayor_de_edad) values ("12345678A", "Juan Pérez", 18, true);
select * from Persona;