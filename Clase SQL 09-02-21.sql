create schema alu200096_insti;
use alu200096_insti;

create table aula (
	codigo char(3) not null primary key,
    superficie decimal,
    capacidad int,
    constraint chk_capacidadMaxima
    check (capacidad < 50),
    constraint chk_supMinima
    check (superficie > 10),
    constraint chk_supcap
    check((superficie > 20 and capacidad < 11) or (superficie > 40 and capacidad < 20) or capacidad <= 10)
);
insert into aula (codigo, superficie, capacidad) values ("B16",8,11);
drop table aula;

use alu200096_Peliculas2;
show tables;

select * from Director;

select * from Actriz;

select * from Pelicula;

drop database alu200096_Peliculas;

delete from Pais
where nombre = "Canadá";

update Director
set nombre = "Eduardo Burns"
where nombre = "Edward Burns";

update Pais
set nombre = "EE.UU."
where nombre = "E.E.U.U.";