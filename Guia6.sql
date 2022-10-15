SELECT * FROM CREDITO;
SELECT * FROM CREDITO_CLIENTE;
SELECT * FROM CLIENTE;
SELECT * FROM PRODUCTO_INVERSION;
SELECT * FROM PRODUCTO_INVERSION_CLIENTE;

SELECT
    TO_CHAR(CC.FECHA_OTORGA_CRED, 'MM/YYYY') AS "MES TRANSACCION",
    CRE.NOMBRE_CREDITO AS "TIPO CREDITO",
    TO_CHAR(CC.MONTO_SOLICITADO, '$99G999G999') AS "MONTO SOLICITADO CREDITO",
    (CASE WHEN CC.MONTO_SOLICITADO BETWEEN 100000 AND 1000000 THEN TO_CHAR(CC.MONTO_SOLICITADO * 0.01, '$99G999G999')
    WHEN CC.MONTO_SOLICITADO BETWEEN 1000001 AND 2000000 THEN TO_CHAR(CC.MONTO_SOLICITADO * 0.02, '$99G999G999')
    WHEN CC.MONTO_SOLICITADO BETWEEN 2000001 AND 4000000 THEN TO_CHAR(CC.MONTO_SOLICITADO * 0.03, '$99G999G999')
    WHEN CC.MONTO_SOLICITADO BETWEEN 4000001 AND 6000000 THEN TO_CHAR(CC.MONTO_SOLICITADO * 0.04, '$99G999G999')
    WHEN CC.MONTO_SOLICITADO > 6000000 THEN TO_CHAR(CC.MONTO_SOLICITADO * 0.07, '$99G999G999') END) AS "APORTE A LA SBIF"
FROM CREDITO CRE JOIN CREDITO_CLIENTE CC ON (CRE.COD_CREDITO = CC.COD_CREDITO)
WHERE EXTRACT(YEAR FROM CC.FECHA_OTORGA_CRED) = EXTRACT(YEAR FROM SYSDATE)-1
ORDER BY "MES TRANSACCION", CRE.NOMBRE_CREDITO;

SELECT
    TO_CHAR(CLI.NUMRUN, '99G999G999')||'-'|| CLI.DVRUN AS "RUN CLIENTE",
    CLI.PNOMBRE ||' '|| CLI.SNOMBRE ||' '|| CLI.APPATERNO ||' '|| CLI.APMATERNO AS "NOMBRE CLIENTE",
    SUM(PIC.MONTO_TOTAL_AHORRADO) AS "MONTO TOTAL AHORRADO",
    (CASE WHEN SUM(PIC.MONTO_TOTAL_AHORRADO) BETWEEN 100000 AND 1000000 THEN 'BRONCE'
    WHEN SUM(PIC.MONTO_TOTAL_AHORRADO) BETWEEN 1000001 AND 4000000 THEN 'PLATA'
    WHEN SUM(PIC.MONTO_TOTAL_AHORRADO) BETWEEN 4000001 AND 8000000 THEN 'SILVER'
    WHEN SUM(PIC.MONTO_TOTAL_AHORRADO) BETWEEN 8000001 AND 15000000 THEN 'GOLD'
    WHEN SUM(PIC.MONTO_TOTAL_AHORRADO) > 15000000 THEN 'PLATINUM' END) AS "CATEGORIA CLIENTE"
FROM CLIENTE CLI JOIN PRODUCTO_INVERSION_CLIENTE PIC ON (CLI.NRO_CLIENTE = PIC.NRO_CLIENTE)
GROUP BY CLI.NUMRUN, CLI.DVRUN, CLI.PNOMBRE, CLI.SNOMBRE, CLI.APPATERNO, CLI.APMATERNO
ORDER BY CLI.APPATERNO;