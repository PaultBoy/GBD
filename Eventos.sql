show processlist;
-- Activar el programador de eventos
set global event_scheduler = ON;
-- Estructura básica de la sintaxis para crear un evento
create event if not exists cadaMinuto
on schedule at current_timestamp + interval '1:01' minute_second
do
insert into Peliculas.RegistroSucesos(suceso)
values ("evento disparado");
-- Evento que se repite cada minuto que pasa. Se ejecuta la primera vez nada más crearse
create event if not exists cadaMinutoReal
on schedule every 1 minute
do
insert into Peliculas.RegistroSucesos(suceso)
values ("Evento periódico");

-- Mostrar eventos en marcha
show events;
-- Eliminar evento
drop event cadaMinutoReal;
-- Mostrar eventos de la base de datos
show events from Peliculas;
-- Desactivar un evento
alter event Peliculas.cadaMinutoReal disable;
-- Activar un evento
alter event Peliculas.cadaMinutoReal enable;

show processlist;
create event pruebecilla
on schedule every 1 minute
do
insert into alu200096_Peliculas2.RegistroSucesos(suceso) values ('Prueba');