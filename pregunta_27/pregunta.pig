/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD './data.csv' using PigStorage(',') AS (id:int,  firstname:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
results = FOREACH datos GENERATE INDEXOF(firstname, 'ia');
STORE results INTO 'output/' using PigStorage(',');
