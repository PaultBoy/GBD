
select Nombre, GNP, GNPOld, GNP-GNPOld as "Diferencia", concat(round(((GNP-GNPOld)/GNPOld)*100,1),"%") as "Porcentaje"
from Paises
where (GNPOld is not null 
and GNP is not null);

select Nombre, GNP, GNPOld, if(GNP-GNPOld > 0, concat("+",GNP-GNPOld), GNP-GNPOld)as "Diferencia", if(round(((GNP-GNPOld)/GNPOld)*100) >= 0, concat("+", round(((GNP-GNPOld)/GNPOld)*100),"%"), concat(round(((GNP-GNPOld)/GNPOld)*100),"%")) as "Porcentaje"
from Paises
where (GNPOld is not null 
and GNP is not null);