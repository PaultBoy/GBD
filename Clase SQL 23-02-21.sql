-- Vistas: tablas dinámicas creadas con consultas a las tablas estándar
-- Mostrar las películas y el nombre de los directores
select p.titulo, d.nombre
from Pelicula p join Director d
	on p.id_Director = d.id;
    
create view VistaPeliDirector ( pelicula, director ) 
as select p.titulo, d.nombre
from Pelicula p join Director d
	on p.id_Director = d.id; 

select *
from VistaPeliDirector;

-- Crear una vista que muestre los actores/actrices
-- y los papeles (personaje) que han interpretado

select *
from Actriz a join Papel p
	on a.id = p.id_Actriz;
    
create view ActoresyPapeles (actor, personaje)
as select a.nombre, p.personaje from Actriz a 
join Papel p on a.id = p.id_Actriz;

drop view VistaPeliDirector;

drop view ActoresyPapeles;
select *
from ActoresyPapeles;

select * from Actriz;

update ActoresyPapeles
set personaje="Jennifer Aniston"
where actor="Amanda Peet";

-- Creas la vista de actores nacidos en Abril
-- Incluid todos los campos de la tabla en la vista
-- Generamos la consulta
select *
from Actriz
where month(fecha_nac) = 4;

create view ActoresAbril as
select *
from Actriz
where month(fecha_nac) = 4;

select *
from ActoresAbril;

select * from VistaPeliDirector;