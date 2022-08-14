SELECT * FROM HR.EMPLOYEES

SELECT
    FIRST_NAME AS "NOMBRE",
    LAST_NAME AS "APELLIDO"
FROM HR.EMPLOYEES
ORDER BY LAST_NAME DESC;

SELECT
    FIRST_NAME AS "NOMBRE",
    EMAIL || '@MICORREO.CL'
FROM HR.EMPLOYEES
ORDER BY EMAIL;

SELECT
    FIRST_NAME AS "NOMBRE",
    '+56' ||' '||PHONE_NUMBER AS "NUMERO DE TELEFONO"
FROM HR.EMPLOYEES;

SELECT 
    JOB_ID AS "IDENTIFICADOR DE TRABAJO",
    SALARY AS "SUELDO"
FROM HR.EMPLOYEES
ORDER BY JOB_ID, SALARY;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    HIRE_DATE AS "FECHA DE CONTRATACION"
FROM HR.EMPLOYEES
ORDER BY HIRE_DATE;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    MANAGER_ID AS "iDENTIFICADOR DE ADMINISTRADOR"
FROM HR.EMPLOYEES
WHERE MANAGER_ID BETWEEN 100 AND 200
ORDER BY MANAGER_ID;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    SALARY AS "SUELDO"
FROM HR.EMPLOYEES
WHERE SALARY > 4000
ORDER BY SALARY;

SELECT
    JOB_ID AS "IDENTIFICADOR DE TRABAJO",
    DEPARTMENT_ID AS "IDENTIFICADOR DE DEPARTAMENTO"
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 100
ORDER BY JOB_ID;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    MANAGER_ID AS "IDENTIFICADOR DE GERENTE"
FROM HR.EMPLOYEES
WHERE MANAGER_ID IN (100, 102, 108)
ORDER BY MANAGER_ID;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    JOB_ID AS "IDENTIFICADOR DE TRABAJO",
    COMMISSION_PCT AS "PORCENTAJE DE COMISION"
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT BETWEEN .2 AND .4
ORDER BY JOB_ID;

SELECT
    FIRST_NAME ||' '|| LAST_NAME AS "NOMBRE COMPLETO",
    SALARY * 0.25 AS "25% DE AUMENTO DE SUELDO",
    SALARY AS "SUELDO",
    SALARY * 1.25 AS "SUELDO AUMENTADO EN 25%",
    DEPARTMENT_ID AS "IDENTIFICADOR DE DEPARTAMENTO"
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID;