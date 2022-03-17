create schema alu200096_bdProc;
use alu200096_bdProc;
DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo1 $$
CREATE PROCEDURE ejemplo2 @nombre varchar(30)
BEGIN
SELECT 'Mi primer programa en MySQL' as @nombre;
END$$
-- Esto último sirve para que el delimitador vuelva a ser el original.
delimiter ;
call ejemplo1();
call saluda2();
call saluda3();
set @nombre = 'Pablo';
call prueba_rapida(@nombre);

create table tabla1(
	id int not null primary key
);
select * from tabla1;
-- La función rand() genera un número aleatorio entre 0 y 1
-- Por supuesto, el número aleatorio puede ser manipulado al devolver un número la función
select round(rand(),0);
call Insertar_aleatorios();
select * from tabla1;
-- procedimiento inserta_siguiente
-- el procedimiento debe buscar el valor más
-- alto de la tabla e insertar el valor siguiente
-- uno más
call inserta_siguienteinserta_siguiente();
call inserta_siguiente2();
-- procedimiento guardar_momento
create table momento(
	momento datetime not null primary key
);
call guardar_momento();
select * from momento;
call variables_procedimento();
call insertarPersonaNombre('Juanito');
set @nombre = "José";
call insertarPersonaNombre(@nombre);
select * from tabla3;
select @nombre;
set @hola = "Hola";
-- Es necesario asignar un valor a una variable en lugar de pasar el valor constante por parámetro, ya que una declaración literal es una constante que no se puede modificar.
-- Esto se aplica para los parámetros de salida y de entrada-salida, ya que estos parámetros permiten modificar el valor de variables de forma global en lugar de local.
call finalizar(@hola);
select @hola;
-- crear un procedimiento almacenado que acepte una letra como parametro de entrada
-- y me devuelva todo lo relacionado de la persona
-- cuyo nombre empiece por la letra de parámetro pLetra.
call buscarPorInicial('J');
-- crear tabla de log
create table log(
	id int auto_increment primary key,
	fecha_hora datetime,
    usuario varchar(25),
    comentario varchar(255)
);
select user();
call buscarPorInicial('A');
select * from log;
call gruposEdad('31');