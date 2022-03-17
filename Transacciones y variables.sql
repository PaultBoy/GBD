-- Variables de usuario: vida limitada a la sesión del usuario. Empiezan por @
set @var1= 3;
set @var2=3;
select @var1;
-- Lo de abajo es una base de datos de variables que el servidor almacena.
select * from information_schema.USER_VARIABLES
ORDER BY VARIABLE_NAME;

select @var1+@var2;

set @minLong=(select min(longitud) from Rio);
select nombre, longitud
from Rio
where longitud = @minLong;

select nombre, longitud into @nombre, @longitud
from Rio
where nombre="Amazonas";
select @nombre, @longitud;

-- Propiedad de las transacciones: 
-- Atomicidad, o sea, que todas las instrucciones de la transacción funcionan como una unidad.
-- Consistencia: sólo se pueden realizar las transacciones en las que todas las instrucciones se pueden terminar, y que las condiciones se mantengan.
-- Aislamiento: esta operación sólo se puede realizar de una en una, sin interferencias externas.
-- Durabilidad: las operaciones se mantienen y no se pueden deshacer.
-- Se pueden inicializar variables en el select poniendo doble punto para asignar un valor.
select @n:=nombre, @l:=longitud
from Rio
where nombre="Amazonas";
select @n;

-- sleep sirve para parar el tiempo de procesador durante un tiempo determinado
select sleep(3);
do sleep(3);

-- Estructura de una transacción
start transaction;
-- Operaciones a realizar
commit;

select longitud from Rio where nombre="Cinca";
set @var1 = 4;
-- Comando muy interesante para ver las variables de usuario cuya usabilidad es vigente ahora mismo en el motor.
select * from information_schema.USER_VARIABLES;
use alu200096_Peliculas2;
select * from Director;

select nombre into @director2
from Director
where id = 2;

select @director3:=nombre 
from Director where id = 3;
select nombre, pais into @direc5Nombre, @direc5Pais
from Director
where id=5;

select @direc6Nombre:=nombre, @direc6Pais:=pais
from Director
where id=6;

set @direc7Nombre = (select nombre from Director where id=7);

set @Pais = (select Pais from Director where id = 1);
select * from information_schema.USER_VARIABLES;
-- Mostrar el país del director cuyo nombre es igual al texto guardado en la variable director2
select Pais
from Director
where nombre = @director2;

create database alu200096_Transacciones;
use alu200096_Transacciones;
-- Creamos tabla Persona con un campo id (clave primaria)
-- y un campo nombre. Los dos obligatorios y
-- la clave primaria autonumérico

create table Persona(
	id int not null auto_increment,
    nombre varchar(50) not null,
    primary key(id)
);
insert into Persona(nombre) values ('Juan'), ('Víctor'), ('Manuela'), ('María'), ('Violeta');
start transaction;
truncate Persona;
rollback;

-- Comenzar transaccion
-- Borrar la persona 1
-- Ver la tabla
-- Borrar la persona 2
-- Ver la tabla
-- Borrar la persona 3
-- Ver la tabla
-- Hacer rollback
-- Ver la tabla

start transaction;
delete from Persona where id=1;
select * from Persona;
delete from Persona where id=2;
select * from Persona;
delete from Persona where id=3;
select * from Persona;
rollback;
select * from Persona;

-- Iniciamos transacción
start transaction;
-- borramos persona 1
delete from Persona where id=1;
-- miramos tabla
select * from Persona;
-- hacemos commit;
commit;
-- Miramos la tabla;
select * from Persona;

-- Por defecto, MySQL tiene activado el autocommit. Para ello, se recomienda usar start transaction para usar instrucciones y poder deshacer sus cambios con rollback.
-- En caso de no hacer commit, se hace rollback al perder la conexión con la base de datos.

-- Crear tabla Cuenta_Bancaria, vinculada a la tabla Persona.

create table Cuenta_Bancaria (
	id int not null auto_increment,
    saldo decimal,
    id_Persona int not null,
    foreign key(id_Persona) references Persona(id),
    primary key(id)
);

-- Insertad los siguientes datos:
-- Manuela tendrá 2 cuentas bancarias, una
-- de ellas con 2054.56 y otra con 200
-- Víctor tendrá una cuenta bancaria con 305.66
-- Violeta tendrá una cuenta bancaria con 0.00
alter table Cuenta_Bancaria
modify column saldo float;
insert into Cuenta_Bancaria(saldo, id_Persona) values
(2054.66, (select id from Persona where nombre="Manuela")), 
(200, (select id from Persona where nombre="Manuela")), (305.66, (select id from Persona where nombre="Víctor")), 
(0.00, (select id from Persona where nombre="Violeta"));

select nombre, saldo, Cuenta_Bancaria.id from Persona join Cuenta_Bancaria
	on Persona.id=Cuenta_Bancaria.id_Persona;
create table Persona_Cuenta (
	id_Titular int not null,
    id_Cuenta int not null,
    foreign key(id_Titular) references Persona(id),
    foreign key(id_Cuenta) references Cuenta_Bancaria(id),
    primary key(id_Titular, id_Cuenta)
);

-- Comenzar transacción (importante)
-- Pasar 300 euros de la cuenta número 2 de Manuela
-- a la cuenta de Violeta
-- Establecer una variable con el importe (300)

start transaction;
set @importe=300;
-- obtener una cuenta de Manuela que tenga
-- saldo suficiente
set @cuentaValidaConFondos = (select Cuenta_Bancaria.id 
					from Persona join Cuenta_Bancaria
						on Persona.id = Cuenta_Bancaria.id_Persona
					where saldo >= @importe and nombre = "Manuela"
                    limit 1);
update Cuenta_Bancaria
set saldo = saldo - @importe
where id = @cuentaValidaConFondos;
update Cuenta_Bancaria
set saldo = saldo + @importe
where id = (select c.id from Persona p 
		join Cuenta_Bancaria c 
			on p.id = c.id_Persona
            where p.nombre = 'Violeta');
rollback;
select * from Cuenta_Bancaria;