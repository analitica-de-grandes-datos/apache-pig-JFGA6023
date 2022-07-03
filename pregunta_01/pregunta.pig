/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, num:int);
grouped = GROUP datos BY letra;
wordcount = FOREACH grouped GENERATE group, COUNT(datos);

STORE wordcount INTO 'output/' using PigStorage(',');
