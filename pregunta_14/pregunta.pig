/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

datos = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Num:int,
        Name:chararray,
        Last:chararray,
        Date:chararray,
        Color:chararray,
        Cant:int
    );
filtro = FILTER datos BY (NOT(Color MATCHES 'b.*'));
results = FOREACH filtro GENERATE Color;

STORE results INTO 'output' USING PigStorage(',');
