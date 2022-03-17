-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
select *
from pedido
where year(fecha) = 2017 and total > 500;
select * from cliente;
-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select *
from pedido
order by fecha desc;
-- Devuelve todos los datos de los dos pedidos de mayor valor.
select *
from pedido
order by total desc
limit 2;
-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct id_cliente
from pedido;
-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido1, apellido2
from comercial
where comisión between 0.05 and 0.11;
-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select comisión
from comercial
order by comisión desc
limit 1;
-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1
from cliente
where apellido2 is not null
order by apellido1 asc, nombre asc;
-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select nombre
from cliente
where (nombre like "A%" and nombre like "%n") or (nombre like "P%")
order by nombre asc;
-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
select nombre
from cliente
where nombre not like "A%"
order by nombre asc;
-- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre
from comercial
where nombre like "%el" or nombre like "%o";

-- Consultas multitabla (inner join)
-- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select c.id, c.nombre, c.apellido1, c.apellido2
from cliente c join pedido p
	on c.id=p.id_cliente
group by c.id
order by c.nombre asc;

-- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

select c.*,p.*
from cliente c join pedido p
	on c.id=p.id_cliente
order by c.nombre asc;

-- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
-- El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
select p.*, co.*
from pedido p join comercial co
	on p.id_comercial=co.id
order by co.nombre asc;

-- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
select p.*, c.*, co.*
from pedido p join cliente c join comercial co
	on c.id=p.id_cliente and p.id_comercial=co.id;
    
-- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select c.*, p.total
from cliente c join pedido p
	on c.id=p.id_cliente
where year(p.fecha) = 2017 and p.total between 300 and 1000;

-- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
select distinct c.nombre, c.apellido1, c.apellido2
from comercial c join pedido p join cliente e
	on c.id=p.id_comercial and e.id=p.id_cliente
where e.nombre="María" and e.apellido1="Santana" and e.apellido2="Moreno";

-- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
select distinct e.nombre, e.apellido1, e.apellido2
from comercial c join pedido p join cliente e
	on c.id=p.id_comercial and e.id=p.id_cliente
where c.nombre="Daniel" and c.apellido1="Sáez" and c.apellido2="Vega";

-- Consultas multitabla (Composición externa)
-- Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
select c.*,p.*
from cliente c left join pedido p
	on c.id=p.id_cliente
order by c.apellido1, c.apellido2, c.nombre;


