set @variable1 = "Hola mundo";
select @variable1;
set @variable2 = "Amazonas";
select * from Rio where nombre = @variable2;

select nombre, longitud into @nombreRio, @longitudRio
from Rio
limit 1;
select @nombreRio;
select @longitudRio;

