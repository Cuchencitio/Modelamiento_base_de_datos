SELECT * FROM EMPLEADO;
SELECT * FROM CLIENTE;
SELECT * FROM PROPIEDAD;

SELECT
    'EL EMPLEADO' ||' '|| NOMBRE_EMP ||' '|| APPATERNO_EMP ||' '|| APMATERNO_EMP ||' '|| 'NACIO EL' ||' '|| TO_CHAR(FECNAC_EMP, 'DD/MM/YYYY') AS "LISTADO DE CUMPLEAÑOS"
FROM EMPLEADO
ORDER BY FECNAC_EMP ASC, APPATERNO_EMP ASC;

SELECT
    NUMRUT_CLI AS "NUMERO RUT",
    DVRUT_CLI AS "DIGITO VERIFICADOR",
    APPATERNO_CLI||' '||APMATERNO_CLI||' '||NOMBRE_CLI AS "NOMBRE CLIENTE",
    RENTA_CLI AS "RENTA",
    FONOFIJO_CLI AS "TELEFONO FIJO",
    CELULAR_CLI AS "CELULAR"
FROM CLIENTE
ORDER BY APPATERNO_CLI, APMATERNO_CLI;

SELECT
    NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP AS "NOMBRE EMPLEADO",
    SUELDO_EMP AS "SUELDO",
    SUELDO_EMP*0.5 AS "BONO POR CAPACITACIÓN"
FROM EMPLEADO
ORDER BY "BONO POR CAPACITACIÓN" DESC;

SELECT
    NRO_PROPIEDAD AS "NRO PROPIEDAD",
    NUMRUT_PROP AS "RUT PROPIETARIO",
    DIRECCION_PROPIEDAD AS "DIRECCIÓN",
    VALOR_ARRIENDO AS "VALOR ARRIENDO",
    VALOR_ARRIENDO*0.054 AS "VALOR COMPENSACIÓN"
FROM PROPIEDAD
ORDER BY NUMRUT_PROP ASC;

SELECT --RUT EMPLEADO, NOMBRE EMPLEADO, SALARIO ACTUAL, SALARIO REAJUSTADO, REAJUSTE
    NUMRUT_EMP ||'-'||DVRUT_EMP AS "RUT EMPLEADO",
    NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP AS "NOMBRE EMPLEADO",
    SUELDO_EMP AS "SALARIO ACTUAL",
    (SUELDO_EMP*0.135)+SUELDO_EMP AS "SALARIO REAJUSTADO",
    SUELDO_EMP*0.135 AS "REAJUSTE"
FROM EMPLEADO
ORDER BY "REAJUSTE" DESC;

SELECT
    NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP AS "NOMBRE EMPLEADO",
    SUELDO_EMP AS "SALARIO",
    SUELDO_EMP*0.055 AS "COLACIÓN",
    SUELDO_EMP*0.178 AS "MOVILIZACIÓN",
    SUELDO_EMP*0.078 AS "SALUD",
    SUELDO_EMP*0.065 AS "AFP",
    SUELDO_EMP+(SUELDO_EMP*0.055)+(SUELDO_EMP*0.178)-(SUELDO_EMP*0.078)-(SUELDO_EMP*0.065) AS "ALCANCE LÍQUIDO"
FROM EMPLEADO
ORDER BY APPATERNO_EMP ASC;
