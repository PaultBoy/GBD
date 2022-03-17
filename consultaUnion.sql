create view Personas as
select nombre, "Director" as profesion
from Director
union
select nombre, "Actriz" as profesion
from Actriz
order by nombre;

drop view Personas;

select *
from Personas -- Personas es una vista.
where nombre like "%z%";

update Personas
set nombre="Vim Diesel"
where nombre="Vin Diesel";

-- Las vistas con unión no son actualizables

select * from Personas;