/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD './data.csv' using PigStorage(',') AS (id:int,  firstname:chararray, lastname:chararray,   date:datetime,  color:chararray, other:int);
filtro= FILTER datos BY SUBSTRING(firstname, 0, 1) >= 'm';
results = FOREACH filtro GENERATE firstname;
STORE results INTO 'output/' using PigStorage(',');
