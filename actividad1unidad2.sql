SELECT * FROM ALUMNO;
SELECT * FROM CARRERA;
SELECT * FROM EMPLEADO;

SELECT
    CARRERAID AS "IDENTIFICADOR DE LA CARRERA",
    COUNT(CARRERAID) AS "TOTAL ALUMNOS MATRICULADOS",
    'Le corresponden'||TO_CHAR(COUNT(CARRERAID)*30200, '$999G999')||' '|| 'del presupuesto total asignado para publicidad ' AS "MONTO POR PUBLICIDAD"
FROM ALUMNO
GROUP BY CARRERAID
ORDER BY COUNT(CARRERAID) DESC;

SELECT
    CARRERAID AS "CARRERA",
    COUNT(CARRERAID) AS "TOTAL DE ALUMNOS"
FROM ALUMNO
HAVING COUNT(CARRERAID) > 4
GROUP BY CARRERAID;

SELECT
    TO_CHAR(RUN_JEFE, '99G999G999') AS "RUN JEFE SIN DV",
    COUNT(RUN_JEFE) AS "TOTAL EMPLEADOS A SU CARGO",
    MAX(SALARIO) AS "SALARIO MAXIMO",
    COUNT(RUN_JEFE) * 10 ||'% DEL SALARIO MAXIMO' AS "PORCENTAJE DE BONIFICACION",
    TO_CHAR(MAX(SALARIO)*(COUNT(RUN_JEFE)/10), '$99G999G999') AS "BONIFICACION"
FROM EMPLEADO
WHERE RUN_JEFE IS NOT NULL
GROUP BY RUN_JEFE;