/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
results = FOREACH datos GENERATE SUBSTRING(date, 0, 4), SUBSTRING(date, 2,4);
DUMP results
STORE results INTO 'output/' using PigStorage(',');
