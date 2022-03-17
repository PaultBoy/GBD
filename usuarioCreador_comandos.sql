create database Fila1;
use Fila1;
create database Fila2;
use Fila2;
select * from Fila1.Alumnos;

delete from Alumnos where id = 1;
truncate Fila1.Alumnos;
load data infile '/var/lib/mysql-files/Alumnos3.txt'
into table Alumnos
fields terminated by ',';