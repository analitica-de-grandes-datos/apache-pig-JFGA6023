/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
cant = FOREACH datos GENERATE SUBSTRING(date, 0, 4) AS yearBirthday;
groupy = GROUP cant BY yearBirthday;
results = FOREACH groupy GENERATE $0, COUNT($1);

STORE results INTO 'output/' using PigStorage(',');
