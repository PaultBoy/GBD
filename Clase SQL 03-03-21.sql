select Lengua, count(*) as "Total Países"
from Lenguas
group by Lengua
order by count(*) desc;

select count(*)
from Paises
where Region = "Middle East";

select Region, count(*)
from Paises
group by Region;

-- Contar el total de países de cada región
-- sólo de aquellas regiones pequeñas
-- (máximo 10 países)
select Continente, Region, count(*)
from Paises
group by Continente, Region
having count(*) <= 10;

-- Contar los países de cada región que consiguieron la independencia en el mismo año
select Region, Independencia, count(*)
from Paises
group by Region, Independencia;

-- Mostrar la población de cada región de las
-- ciudades Españolas obteniendo los datos 
-- de la tabla Ciudades

select Region, sum(Poblacion)
from Ciudades
where Cod_Pais = "ESP"
group by Region
union
select "Total España", Poblacion
from Paises
where Cod_Pais = "ESP";

-- Mostrar la población de cada región de España
-- basándonos en la población de las ciudades 
-- y una última columna mostrar el porcentaje
-- que representa la población en el 
-- total de España
-- 1-Sacar la población total
-- 2-Calcular el porcentaje de una región con
-- respecto a la población total
-- 3-Hacer la consulta agrupada por región.
-- En el cálculo, tendré que integrar la subconsulta de
-- la población total
select Poblacion from Paises where Cod_Pais = "ESP";
select Region, sum(Poblacion), 100*sum(Poblacion)/(select Poblacion from Paises where Cod_Pais = "ESP") as "Porcentaje"
from Ciudades
where Cod_Pais = "ESP"
group by Region;

-- Mostrar la esperanza de vida media por continente
select avg(Esperanza_Vida) as "Esperanza de vida", Continente
from Paises
group by Continente;
select * from Paises;
-- Mostrar el producto interior bruto de los países africanos
-- agrupado por las regiones de áfrica
select Region, sum(GNP) as "PIB"
from Paises
where Continente = "Africa"
group by Region;

-- Mostrar la superficie media de los países por región geográfica
select Region, round(avg(Superficie),0) as "Superficie"
from Paises
group by Region;

-- Mostrar la media de población de las capitales de los países
-- agrupando por continente (hay que hacer un join con ciudades
-- con el campo Paises.Capital = Ciudades.Cod_Ciudad
select p.Continente, avg(c.Poblacion) "Media"
from Ciudades c join Paises p
	on p.Capital=c.Cod_Ciudad
group by p.Continente;

-- Mostrar los países en los que el producto interior bruto haya
-- disminuido
-- Añadid una columna con la diferencia del GNP
-- Añadid una columna con el porcentaje perdido o ganado
-- con respecto del GNPOld
select Nombre, GNP, GNPOld, if(GNP-GNPOld > 0, concat("+",GNP-GNPOld), GNP-GNPOld)as "Diferencia", if(round(((GNP-GNPOld)/GNPOld)*100) >= 0, concat("+", round(((GNP-GNPOld)/GNPOld)*100),"%"), concat(round(((GNP-GNPOld)/GNPOld)*100),"%")) as "Porcentaje"
from Paises
where (GNPOld is not null 
and GNP is not null);