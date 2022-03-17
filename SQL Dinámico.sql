-- SQL dinámico permite que las instucciones puedan modificarse según ciertos parámetros de entrada, en lugar de repetirlas completamente.
set @titulo = 'E%';
set @duracion = 86; 
-- El ? hace referencia a la existencia de un parámetro oculto en la secuencia preparada
prepare consulta from "select * from Pelicula where titulo like ? and duracion >= ?";
-- using sirve para asignar el valor de @titulo al interrogante. Las comas separan los parámetros para cada ?
execute consulta using @titulo, @duracion;
deallocate prepare consulta;


