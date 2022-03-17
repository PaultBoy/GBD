SELECT * FROM alu200096_Peliculas2.Pelicula;

select Pelicula.*, Director.*
from Pelicula right join Director
	on Pelicula.id_Director = Director.id;
    
select nombre
from Director
union
select nombre
from Actriz;

-- Mostrar aquellos directores que no son actores

select nombre from Director
intersect
select nombre from Actriz;

-- Mostrar aquellos directores que no son actores
select nombre from Director
except
select nombre from Actriz;

-- Mostrar aquellos actores que no son directores
select nombre from Actriz
except
select nombre from Director;