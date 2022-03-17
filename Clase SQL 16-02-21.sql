use alu200096_Peliculas2;
select *
from Actriz join Papel p1
	on id = p1.id_actriz
where pais ='España' and (select count(*)
	from Papel p
    where p.id_actriz = p1.id_actriz) > 1;
-- En la subconsulta miramos si el número de papeles
-- del actor que estamos mirando en el join (recordamos 
-- que se busca la fila) tiene más de un papel 
-- la consulta count nos devuelve un número siempre
select * from Pelicula where titulo = 'Torrente';

select count(*) from Papel
where id_Actriz = 8;

-- Mostrar el mes de nacimiento de todos los actores
select nombre, month(fecha_nac)
from Actriz;

select nombre, fecha_nac, date_format(fecha_nac,'el %e de %M de %Y', 'es_ES')
from Actriz
where date_format(fecha_nac,'%M', 'es_ES') = 'octubre';

-- Mostrar los actores que nacieron en martes y 13,
-- si no los hay, los que nacieron en viernes y 13

select *
from Actriz
where (date_format(fecha_nac, '%W', 'es_ES') = 'martes'
and day(fecha_nac) = '13') xor (date_format(fecha_nac, '%W', 'es_ES') = 'viernes' 
and day(fecha_nac) = '13'); 



-- Seleccionar todos los actores y añadir una columa
-- que sea ¿nació en octubre?

select *, if(month(fecha_nac) = 10 or month(fecha_nac) = 6, 'sí', 'no') 
		as '¿nació en octubre o en junio?'
		from Actriz;

-- Actores que hayan nacido en año impar
select *
from Actriz
where year(fecha_nac) % 2 = 1;

-- Actores que hayan nacido en años que acaban en 0
select *
from Actriz
where year(fecha_nac) % 10 = 0;

-- Actores que sumando su dia y su mes de nacimiento dé un número entre 10 y 15
select *
from Actriz
where (day(fecha_nac) + month(fecha_nac) < 15) and (day(fecha_nac) + month(fecha_nac) > 10);

-- Mostrar la fecha 15 días después de 20 de febrero de 1999
select date_add('2000-02-20', interval 15 day);

-- Mostrar la fecha 65 días antes de 20 de febrero de 2000
select date_sub('2000-02-20', interval 65 day);
