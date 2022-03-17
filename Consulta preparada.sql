prepare consulta1 from "select nombre, pais from Actriz where pais=?";
-- Las consultas preparadas sólo pueden emplear variables de usuario como datos a recoger. Suelen ser empleadas para generar filtros en vez de campos.
set @vCampo = "España";
execute consulta1 using @vCampo;