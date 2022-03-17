USE Peliculas;
select nombre, fecha_nac  -- campos que quiero mostrar
from Actriz; -- las tablas de esos campos

select nombre
from Director;

select titulo, duracion
from Pelicula
where titulo = 'Torrente';

select *
from Actriz
where nombre like "A%";

-- seleccionar todo de los directores
-- cuyo nombre termina por n
select *
from Director
where nombre like 'Daniel Monzón'
order by pais desc;

-- Mostrar nombre, pais y fecha de nacimiento de actores
-- y actrices que nacieron en paises que empiezan por E
-- ordenados/as de más joven a más mayor
select nombre,pais,fecha_nac
from Actriz
where pais like "E%"
order by fecha_nac desc;

-- mostrar titulo y duracion de las peliculas
select titulo,duracion
from Pelicula;

-- mostrar titulo y duracion de peliculas largas
-- > 145 minutos
select titulo,duracion
from Pelicula
where duracion > 145;

-- mostrar la duración total de las peliculas largas
-- > 145 minutos
select sum(duracion)
from Pelicula
where duracion > 145;

-- mostrar la duracion de la pelicula mas larga
select min(duracion)
from Pelicula;

-- mostrar las 2 primeras actrices de la lista
select *
from Actriz
limit 2;

-- mostrar las 2 actrices más jóvenes
select *
from Actriz
order by fecha_nac desc
limit 2;

-- mostrar las 2 actrices españolas más jóvenes
select *
from Actriz 
where pais = "España"
order by fecha_nac desc
limit 2;

-- mostrar las actrices/actores nacidos
-- en España y los nacidos en Reino Unido
select *
from Actriz
where pais = "Reino Unido" or pais = "España";

-- Muestrame las peliculas largas (>150) cuyo
-- título empiece por L
select *
from Pelicula
where duracion > 150 and titulo like "L%";

-- Muestrame las peliculas largas (>150) cuyo
-- título empiece por L y las cortas cuyo título
-- empiece por E
select *
from Pelicula
where duracion > 150 and titulo like "L%"
   or duracion < 150 and titulo like "E%";
















-- mostrar nombre y el país de las actrices/actores
select nombre, pais
from Actriz;

-- mostrar la duracion, el titulo y el 
-- id del director de la pelicula "Interstellar"
select duracion, titulo, id_Director
from Pelicula
where titulo = "Interstellar";

-- mostrar la duración de las películas largas >145 minutos
select sum(duracion)
from Pelicula
where titulo like "E%";
-- Funciones de agregado: 
	-- min, max, sum, avg, count( )
-- Mostrar el número total de actrices
select count(*)
from Actriz;

-- Mostrar la media de la duracion de las pelicula
select avg(duracion)
from Pelicula;

-- Mostrar el 2º, 3er y 4º actor más mayor
select *
from Actriz
order by fecha_nac
limit 2,3; 

-- Mostrar el nombre de las actrices que empiecen por A
select nombre
from Actriz
where nombre like "A%";

-- Mostrar las actrices ordenadas de más joven a más mayor
select *
from Actriz
order by fecha_nac desc;

-- Mostrar las actrices que nacieron en verano (Julio y Agosto)
select *, month(fecha_nac)
from Actriz
where month(fecha_nac) = 7 or month(fecha_nac) = 8;

-- Mostrar los directres ordenados por el pais de nacimiento
select *
from Director
order by pais asc;

-- Mostrar los personajes que contengas una J en el nombre
select *
from Papel
where personaje like "%j%";

-- Funciones de fechas: day, year, weekday, dayofweek, dayname...
-- mostrar los actores con el dia de la semana en que nacieron
-- nombre, fecha, weekday, dayofweek y dayname
select nombre, fecha_nac, weekday(fecha_nac), dayofweek(fecha_nac), dayname(fecha_nac)
from Actriz;


-- mostrar la edad junto al nombre de los actores
select nombre, NOW() - fecha_nac
from Actriz;

-- qué día es hoy y qué hora es para el servidor
select now();
-- para no tener que cambiar a consulta cada año
select nombre, (datediff(now(),fecha_nac))/(365.25)
from Actriz;

-- otras funciones
select minute( now() );

-- Para unir dos tablas usamos JOIN
-- y tenemos que relacionar los campos que forman
-- y la relacion. Es decir clave primaria = clave foránea
select titulo, nombre
from Director as d join Pelicula as p
	on d.id = p.id_Director;
    
-- Mostrar los personajes que ha interpretado
-- cada actriz
select personaje, nombre 
from Actriz as a join Papel as p
	on a.id = p.id_Actriz;
-- Mostrar los papeles que aparecen en las películas
-- Título y personaje.