CREATE TABLE Cliente ( 
    rut_cliente NUMBER(11) Not Null, 
    dv CHAR(1) NOT NULL, 
    primer_nombre VARCHAR2(250) NOT NULL, 
    segundo_nombre VARCHAR2(250) NOT NULL, 
    apellido_paterno VARCHAR2(250) NOT NULL, 
    apellido_materno VARCHAR2(250) NOT NULL, 
    direccion VARCHAR2(250) NOT NULL, 
    fono NUMBER NOT NULL, 
    correo VARCHAR2(250) NOT NULL, 
    comuna_id NUMBER NOT NULL, 
)