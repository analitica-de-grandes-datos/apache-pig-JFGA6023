/*
Pregunta
===========================================================================
Para responder la pregunta use el archivo `data.csv`.
Escriba el código equivalente a la siguiente consulta SQL.
   SELECT 
       firstname, color 
   FROM 
       u
   WHERE color IN ('blue','black');
   
Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
data = LOAD 'data.csv' USING PigStorage(',')

    AS (
        id:int,
        firstname:chararray,
        lastname:chararray,
        date:datetime,
        color:chararray,
        cant:int
    );
filtro = FILTER data BY (color matches 'blue') or (color matches 'black');
result = FOREACH filtro GENERATE firstname, color;

STORE result INTO 'output' USING PigStorage(',');
