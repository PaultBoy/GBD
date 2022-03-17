-- Subconsultas
-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select pedido.*
from cliente, pedido
where cliente.id = 2 and cliente.id=pedido.id_cliente
order by total desc
limit 0,3;

-- Devuelve los datos del cliente que realizón el pedido más caro en el año 2019
select c.*,max(p.total)
from cliente c join pedido p
	on c.id=p.id_cliente
group by c.id;

select c.*,min(p.total)
from cliente c join pedido p
	on c.id=p.id_cliente
group by c.id
having c.nombre="Pepe";