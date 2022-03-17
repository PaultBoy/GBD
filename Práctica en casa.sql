-- Obtener los datos completos de los empleados
select *
from empleados;
-- Obtener los datos completos de los departamentos
select *
from departamentos;

-- Obtener los datos completos de los empleados con cargo 'Secretaria'
select *
from empleados
where cargoE = "Secretaria";

-- Listar el nombre y salario de los empleados
select nomEmp, salEmp
from empleados;

-- Obtener los datos de los vendedores, ordenado por nombre
select *
from empleados
where cargoE = "Vendedor"
order by nomEmp;

select distinct cargoE
from empleados;

-- Listar el nombre de los departamentos

select distinct nombreDpto
from departamentos;

-- Obtener el nombre y cargo de todos los empleados, ordenado por salario.

select nomEmp, cargoE
from empleados
order by salEmp desc;

-- Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión.
select salEmp, comisionE
from empleados
where codDepto = "2000";

-- Listar todas las comisiones
select distinct comisionE
from empleados;

select *
from empleados;
-- Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de 500.000, en orden alfabético del empleado.
select nomEmp, salEmp + 500000 + comisionE as bonificado
from empleados
where codDepto = "3000"
order by nomEmp;

-- Obtener la lista de los empleados que ganan una comisión superior a su sueldo

select *
from empleados
where comisionE > salEmp;

-- Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo
select *
from empleados
where comisionE <= 0.3*salEmp;

select *
from empleados;
-- Elabore un listado donde para cada fila, figure 'Nombre' y 'Cargo' antes del valor respectivo para cada empleado
select nomEmp as Nombre, cargoE as Cargo, nDIEmp as id
from empleados;

-- Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identitad es superior al '19.709.802'
select salEmp, comisionE, nDIEmp
from empleados
where nDIEmp > '19.709.802';

-- Muestra los empleados cuyo nombre empiece entre las letras J y Z. Lista los empleados y su cargo por orden alfabético;
select nomEmp, cargoE
from empleados
where left(nomEmp, 1) >= 'J' and left(nomEmp, 1) <= 'Z'
order by nomEmp asc;

select * from departamentos; 
-- Obtener el nombre y el departamento de los empleados con cargo ‘Secretaria’ o ‘Vendedor’, que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,
-- ordenados por fecha de incorporación
select e.nomEmp,e.CargoE, d.nombreDpto
from empleados e join departamentos d
	on e.codDepto=d.codDepto
where (e.cargoE = "Secretaria" and d.nombreDpto != "PRODUCCION" and e.salEmp>1000000)
or (e.cargoE = "Vendedor" and d.nombreDpto != "PRODUCCION" and e.salEmp>1000000);

-- Listar el salario, la comisión, el salario total (salario + comisión), 
-- documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, 
-- ordenar el informe por el número del documento de identidad
 select salEmp, comisionE, salEmp + comisionE as salTotal
 from empleados
 where comisionE > 1000000
 order by nDIEmp;
 
 -- Obtener un listado similar al anterior, pero de aquellos empleados que no tienen comisión
select salEmp, comisionE, salEmp + comisionE as salTotal
 from empleados
 where comisionE = 0
 order by nDIEmp;
 
 -- Hallar los empleados cuyo nombre no contiene la cadena "MA"
 
 select nomEmp
 from empleados
 where (nomEmp not like '%MA%') and (nomEmp not like 'Ma%') and (nomEmp not like '%ma%');
 
 -- Obtener los nombres de los departamentos que no sean "Ventas" ni "Investigación" ni "MANTENIMIENTO"
 select nombreDpto
 from departamentos
 where nombreDpto not like "VENTAS" and nombreDpto not like "INVESTIGACIÓN" and nombreDpto not like "MANTENIMIENTO";
 
 -- Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres
 select *
 from empleados
 where length(nomEmp) = 11;
  -- Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
 select *
 from empleados
 where length(nomEmp) >= 11;
 -- Listar los datos de los empleados cuyo nombre inicia por la letra ‘M’, su salario es mayor a $800.000 o reciben comisión y trabajan para el departamento de ‘VENTAS’
select *
from empleados join departamentos
	on empleados.codDepto = departamentos.codDepto
where empleados.nomEmp like "M%" and (empleados.salEmp > 800000 or empleados.comisionE > 0) and departamentos.nombreDpto = "VENTAS";

select * from empleados;
-- Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la mitad de la comisión la propia comisión
select nomEmp, salEmp, comisionE
from empleados
where salEmp between 0.5*comisionE and comisionE;

-- Mostrar el salario más alto de la empresa

select salEmp
from empleados
order by salEmp desc
limit 1;

select max(salEmp)
from empleados;

-- Mostrar cada una de las comisiones y el número de empleados que las reciben
select comisionE, count(*)
from empleados
where comisionE > 0
group by comisionE;
 
select count(*) from empleados;

-- Mostrar el nombre del último empleado de la lista por orden alfabético

select nomEmp
from empleados
order by nomEmp desc
limit 1;

-- Hallar el salario más alto, el más bajo y la diferencia entre ellos
select max(salEmp), min(salEmp), max(salEmp) - min(salEmp) as "Diferencia de salario"
from empleados;

-- Hallar el salario promedio por departamento
select avg(salEmp), departamentos.nombreDpto
from empleados join departamentos
	on empleados.codDepto = departamentos.codDepto
group by departamentos.nombreDpto;

-- Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento
select departamentos.nombreDpto as "Departamento", sexEmp, count(*)
from empleados join departamentos
	on empleados.codDepto=departamentos.codDepto
group by departamentos.nombreDpto, sexEmp;

-- Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
select nomEmp, salEmp, departamentos.nombreDpto
from empleados join departamentos
	on  empleados.codDepto=departamentos.codDepto
where salEmp >= (select avg(salEmp)
from empleados)
order by departamentos.nombreDpto;

-- Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
select d.nombreDpto, count(e.nDIEmp)
from departamentos d join empleados e
	on d.codDepto=e.codDepto
group by d.nombreDpto
having count(e.nDIEmp) >= 3;
select * from empleados;
-- Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan mas de dos empleados (2 incluido)
select ej.nomEmp, e.jefeID, count(e.nomEmp)
from empleados e join departamentos d join empleados ej
	on e.jefeID=d.codDirector and ej.nDIEmp=d.codDirector
group by e.jefeID;
-- Hallar los departamentos que no tienen empleados
select d.nombreDpto 
from departamentos d join empleados e
	on d.codDepto=e.codDepto
group by d.nombreDpto
having count(e.nomEmp) = 0;

-- Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma

select d.nombreDpto, sum(e.salEmp) as "Suma salarios"
from departamentos d join empleados e
	on d.codDepto= e.codDepto
group by d.nombreDpto
order by sum(e.salEmp) desc
limit 1;

