select * from Paises;
-- Sumar la población de Europa
select sum(Poblacion)
from Paises
where Continente = "Europe";

-- Contar todos los países
select count(*) as "Total de Países"
from Paises;

-- Agrupar la población por continente
select sum(Poblacion), Continente
from Paises
group by Continente;

select Continente, count(*) as "Nº países"
from Paises
order by Continente;

-- No podemos filtrar por las columnas agregadas, sólo por las originales. Para ello es necesario usar "having" en lugar de "where"
-- Para usar "having" no podemos usar un alias, sino el nombre completo de la columna a mostrar
-- Having pone las condiciones a la petición de agrupación "group by", no a la petición base

-- Mostrar los continenter, el número de países que tienen
-- excepto aquellos continentes que tengan menos de 500 millones
-- de habitantes, con más de 30 países, sin los países que empiecen por E
-- 
select count(Cod_Pais) as "Total de Países", Continente, sum(Poblacion) as "Total Población"
from Paises
where Nombre not like "E%"
group by Continente
having count(Cod_Pais) > 30 and sum(Poblacion) > 500000000;

-- Sumar la población por continente de todos los países
-- excepto los europeos
select Continente, sum(Poblacion)
from Paises
where Continente != "Europe"
group by Continente;

select Continente, sum(Poblacion)
from Paises
group by Continente
having Continente != "Europe";

-- Contar los países en los que se habla cada lengua
-- Mostrar el nombre de la lengua y el total de países
-- En los que se habla
    
select Lengua, count(Cod_Pais) as "Países parlantes"
from Lenguas
group by Lengua
order by count(Cod_Pais) desc;

-- Contad la gente que habla cada idioma en cada país
select Lengua, Porcentaje, Cod_Pais
from Lenguas
group by Cod_Pais;
 -- Contad el número de idiomas oficiales
 -- de cada país. Mostrar Nombre de país, total lenguas oficales. Usad join Lenguas y Paises
 select count(l.Lengua) as "Total lenguas", p.Nombre
 from Lenguas l join Paises p
 on l.Cod_Pais = p.Cod_Pais
 where l.Oficial = true
 group by Nombre
 order by count(Lengua) desc;
 
 select count(l.Lengua) as "Total lenguas", p.Nombre
 from Lenguas l join Paises p
 on l.Cod_Pais = p.Cod_Pais
 group by p.Nombre
 order by count(l.Lengua);

-- Lengua
select Lengua, count(Cod_Pais) as "Nº de países en los que se habla"
from Lenguas
group by Lengua
order by count(Cod_Pais);

-- Seleccionar cuanta gente habla cada lengua en España. Redondeado sin decimales
select Poblacion
from Paises
where Nombre = "Spain";
select Lengua,round((Porcentaje/100) * (select Poblacion from Paises where Nombre = "Spain"),0) as "Parlantes"
from Lenguas
where Cod_Pais = "ESP";