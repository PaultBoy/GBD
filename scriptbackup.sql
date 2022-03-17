USE Fila1;

SELECT *
INTO OUTFILE '/var/lib/mysql-files/Alumnos4.txt'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM Alumnos;

truncate Alumnos;

LOAD DATA INFILE '/var/lib/mysql-files/Alumnos4.txt'
INTO TABLE Alumnos
FIELDS TERMINATED BY ',';
