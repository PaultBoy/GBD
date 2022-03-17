select substring("Hola mundo",2,4);

create table Rios(
	Cod_Rio int auto_increment,
    Nombre varchar(255) not null,
    primary key(Cod_Rio)
);
insert into Rios(Nombre) values("Nilo"),("Ebro"),("Volga"),("Danubio");

select * from Rios;

insert into Rios(Nombre) values("Aragón");
alter table Rios add column(
	Cod_RioPrincipal int
);
alter table Rios add column test int not null;
alter table Rios add column test2 varchar(2) not null;
alter table Rios drop column test2;

alter table Rios
add constraint fk_afluenteDe foreign key (Cod_RioPrincipal) references Rios(Cod_Rio);

insert into Rios(Nombre, Cod_RioPrincipal) values("Sil",5);
delete from Rios where Nombre="Aragon";

delete from Rios where Cod_Rio = 5;

update Rios set Cod_RioPrincipal = 2
where Cod_Rio = 10;

alter table Rios
add column Caudal_Medio int;
alter table Rios
add constraint chk_CaudalNoNegativo
check(Caudal_Medio > 0);

update Rios set Caudal_Medio = -2
where Cod_Rio = 2;

alter table Rios
add constraint chk_nombreDuplicado
check ((select count(*) from Rios r where r.Nombre = Nombre) > 0);
-- Puedo cambiar todo salvo el nombre
alter table Rios
modify column Nombre varchar(255) unique;

-- Puedo cambiar cualquier cosa de la columna, incluyendo el nombre.
alter table Rios
rename column Caudal_Medio to CaudalMedio;

alter table Rios
add column Mar varchar(100);

select * from Rios;
update Rios
set Mar = "Mediterráneo"
where Cod_Rio=1;

alter table Rios
add constraint chk_desembocadura
check((Cod_RioPrincipal is null and Mar is null)
or (Cod_RioPrincipal is not null and Mar is null)
or (Cod_RioPrincipal is null and Mar is not null));