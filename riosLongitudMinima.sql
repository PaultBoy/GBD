select min(longitud) into @longMin
from Rio;
select nombre 
from Rio
where longitud = @longMin;
-- Las variables son muy útiles para crear scripts más legibles.