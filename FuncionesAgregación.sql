select count(*)
from Director
where nombre like "l%";

-- Contar el número de directores y actores que empiezan por L

select count(*)
from Personas
where nombre like "l%";