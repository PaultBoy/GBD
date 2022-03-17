create table tPersonaProfesion(
	nombre varchar(100),
    profesion varchar(100)
);

insert into tPersonaProfesion(nombre, profesion)
select * from Personas;

select * from tPersonaProfesion;