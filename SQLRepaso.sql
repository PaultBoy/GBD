select *
from Paises
order by Cod_Pais asc;

-- Seleccionar el país ordenando por PIB
select * from Paises order by GNP desc
limit 2, 10;

select Paises.Nombre, Ciudades.Nombre
from Paises right join Ciudades
	on Paises.Capital = Ciudades.Cod_Ciudad;
-- Mostrar los paises y su capital
-- En el caso de no tener capital
-- Mostrar el nombre del país y en la capital
-- Poner "No disponible"

select p.Nombre as "País", if(c.Nombre is null, "No disponible", c.Nombre) as "Capital"
from Paises p left join Ciudades c
	on p.Capital=c.Cod_Ciudad;

-- Mostrar la suma población de todas las ciudades
select avg(Poblacion)
from Ciudades;

-- Contar cuántas ciudades tenemos en nuestra base de datos
select count(*)
from Ciudades;

select count(*)
from Paises
where Capital is not null;

-- Agregados
-- sum, count, avg, min, max
select * from Paises
where Poblacion = (select min(Poblacion)from Paises);

-- Mostrar la media de población por continente
select Continente, round(avg(Poblacion),0)
from Paises
where Nombre != "Spain"
group by Continente
having avg(Poblacion) > 10000000
order by avg(Poblacion) desc;

-- Muestra el resultado de la operación 5*4+3 con el título
-- "Resultado" (Las comillas son parte del título)
select 5*4+3 as "\"Resultado\"";

-- USO DE comodines en texto con LIKE % o _ (este último para sustituir un solo carácter)
select * from Paises
where Nombre like "%ce";

-- Países que contengan la letra a pero en posiciones intermedias, independientemente de si empiezan por A o no
select * from Paises
where Nombre like "%a%" and nombre not like "a%";

-- Contar en cuántos países es Jefe de estado Elisabeth II
select count(*)
from Paises
where Jefe_Estado = "Elisabeth II";

-- Mostrar un país, su capital y su ciudad más poblada

select p.Nombre "País", c.Nombre "Ciudad", ccap.Nombre as "Capital"
from Ciudades c join Paises p join Ciudades ccap
	on c.Cod_Pais = p.Cod_Pais and p.Capital = ccap.Cod_Ciudad;
    
-- Mostrar país, su capital y la poblacion de la ciudad más poblada
select p.Nombre, ccap.Nombre, max(c.Poblacion), ccap.Poblacion, c.Nombre
from Paises p join Ciudades ccap join Ciudades c
	on p.Capital = ccap.Cod_Ciudad and p.Cod_pais = c.Cod_pais
group by p.Nombre;

-- Crear un código para las ciudades
-- compuesto por las 3 primeras letras de país,
-- _ y las 3 primeras letras de la unidad

select concat(substring(p.Nombre,1,3),"_", substring(c.Nombre,1,3)) as "Cod_Ciudad"
from Paises p join Ciudades c
	on c.Cod_Pais = p.Cod_Pais;

-- Mostrar las ciudades más pobladas de cada continente

select p.Continente, c.Nombre
from Ciudades c join Paises p
	on c.Cod_Pais=p.Cod_Pais
where c.Poblacion = (select max(c.Poblacion) from Ciudades)
group by p.Continente;
    
-- Mostrar la población de la ciudad más poblada de cada continente
select * from Ciudades c2 join Paises p2
	on c2.Cod_Pais = p2.Cod_Pais
where c2.Poblacion =(select max(c.Poblacion)
				from Paises p join Ciudades c
				on p.Cod_Pais = c.Cod_Pais
				where p.Continente=p2.Continente);

select max(c.Poblacion)
from Paises p join Ciudades c
	on p.Cod_Pais = c.Cod_Pais
where p.Continente= "Asia";