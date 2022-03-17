-- Mostrar los países en los que han nacido directores
-- distinct me permite mostrar resultados no repetidos
-- En datos compuestos como el de abajo se omiten nombres de 
-- directores de distintos países que se llamen igual.
select distinct pais, nombre from Director;

-- Mostrar el número de países total que tenemos en la tabla director
select count(distinct pais) from Director;