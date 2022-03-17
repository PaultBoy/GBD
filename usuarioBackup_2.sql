use Fila1;
select * from Alumnos;
select *
into outfile '/var/lib/mysql-files/AlumnosBackup1.txt'
fields terminated by ','
lines terminated by '\n'
from Alumnos;
truncate Alumnos;
load data infile '/var/lib/mysql-files/Alumnos3.txt'
into table Alumnos
fields terminated by ',';