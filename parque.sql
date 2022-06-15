CREATE TABLE Clientes ( 
    rut_cliente         NUMBER(11) Not Null, 
    dv                  CHAR(1) NOT NULL, 
    primer_nombre       VARCHAR2(250) NOT NULL, 
    segundo_nombre      VARCHAR2(250) NOT NULL, 
    apellido_paterno    VARCHAR2(250) NOT NULL, 
    apellido_materno    VARCHAR2(250) NOT NULL, 
    direccion           VARCHAR2(250) NOT NULL, 
    fono                NUMBER NOT NULL, 
    correo              VARCHAR2(250) NOT NULL, 
    comuna_id           NUMBER NOT NULL 
);

--Añado PK a la tabla clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_pk PRIMARY KEY (rut_cliente);

CREATE TABLE Comunas (
    id_comuna       NUMBER NOT NULL,
    nombre          VARCHAR2(250) NOT NULL,
    provincia_id    NUMBER NOT NULL
);
--Añado PK a la tabla comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_pk PRIMARY KEY (id_comuna);
--Añado FK a la tabla a la tabla clientes
ALTER TABLE Clientes ADD CONSTRAINT comuna_fk FOREIGN KEY (comuna_id)
    REFERENCES Comunas (id_comuna);
    
CREATE TABLE Provincia (
    id_provincia    NUMBER NOT NULL,
    nombre          VARCHAR2(250)
);

ALTER TABLE Provincia ADD CONSTRAINT provincia_pk PRIMARY KEY (id_provincia);


CREATE TABLE Region (
    id_region       NUMBER NOT NULL,
    nombre          VARCHAR(250)
);

ALTER TABLE Region ADD CONSTRAINT region_pk PRIMARY KEY (id_region);

CREATE TABLE Sector (
    id_sector       NUMBER NOT NULL,
    nombre          VARCHAR2(250) NOT NULL
);

ALTER TABLE Sector ADD CONSTRAINT sector_pl PRIMARY KEY (id_sector);

CREATE TABLE Parque (
    id_parque       NUMBER NOT NULL,
    nombre          VARCHAR(250) NOT NULL
);

ALTER TABLE Parque ADD CONSTRAINT parque_pk PRIMARY KEY (id_parque);

CREATE TABLE Reserva (
    numero_reserva      NUMBER NOT NULL,
    fecha_reserva       DATE NOT NULL,
    check_in            DATE NOT NULL,
    check_out           DATE NOT NULL,
    total_a_pagar       NUMBER NOT NULL,
    total_final         NUMBER NOT NULL
);

ALTER TABLE Reserva ADD CONSTRAINT reserva_pk PRIMARY KEY (numero_reserva);

CREATE TABLE Detalle_Servicio (
    id_detalle          NUMBER NOT NULL,
    fecha_consumo       DATE  NOT NULL,
    total_a_pagar       NUMBER NOT NULL
);

ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_pk PRIMARY KEY (id_detalle);

CREATE TABLE Servicio (
    id_servicio         NUMBER NOT NULL,
    codigo_servicio     NUMBER NOT NULL,
    nombre              VARCHAR2(250) NOT NULL,
    descripcion         VARCHAR2(250) NOT NULL,
    valor_persona       NUMBER NOT NULL
);

ALTER TABLE Servicio ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);

CREATE TABLE Habitacion (
    id_habitacion       NUMBER NOT NULL,
    numero              NUMBER NOT NULL,
    valor_noche         NUMBER NOT NULL,
    capacidad_maxima    NUMBER(2) NOT NULL
);

ALTER TABLE Habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY (id_habitacion);

CREATE TABLE Cabania (
    id_habitacion       NUMBER NOT NULL,
    cant_dormitorios    NUMBER NOT NULL,
    cant_baños          NUMBER NOT NULL,
    can_cocinas         NUMBER NOT NULL,
    cant_tinajas        NUMBER NOT NULL
);

ALTER TABLE Cabania ADD CONSTRAINT cabania_pk PRIMARY KEY (id_habitacion);

CREATE TABLE Domo (
    id_habitacion       NUMBER NOT NULL,
    tiene_minibar       CHAR(1) NOT NULL,
    tiene_baño_privado  CHAR(1) NOT NULL,
    tiene_calefaccion   CHAR(1) NOT NULL,
    cantidad_camas      NUMBER(2) NOT NULL
);

ALTER TABLE Domo ADD CONSTRAINT domo_pk PRIMARY KEY (id_habitacion);

CREATE TABLE Descuento (
    id_descuento         NUMBER NOT NULL,
    codigo_descuento     VARCHAR(250) NOT NULL,
    es_festivo           CHAR(1) NOT NULL,
    descripcion          VARCHAR2(1000) NOT NULL,
    porcentaje_descuento NUMBER(2) NOT NULL
);

ALTER TABLE Descuento ADD CONSTRAINT descuento_pk PRIMARY KEY (id_descuento);

CREATE TABLE Acompañante (
    rut_acompañante     NUMBER(11) NOT NULL,
    dv                  CHAR(1) NOT NULL,
    primer_nombre       VARCHAR2(250) NOT NULL,
    segundo_nombre      VARCHAR2(250),
    apellido_paterno    VARCHAR2(250) NOT NULL,
    apellido_materno    VARCHAR2(250),
    direccion           VARCHAR2(250) NOT NULL,
    fono                NUMBER NOT NULL,
    correo              VARCHAR2(250) NOT NULL
);

ALTER TABLE Acompañante ADD CONSTRAINT acompañante_pk PRIMARY KEY (rut_acompañante);



----Ingresar datos a la tabla usuario
--INSERT INTO Clientes VALUE (123,)

----Consulta Basica
--SELECT FROM * Clientes;
--SELECT FROM * Comunas;
----COnsulta por columna
---- ASCENDENTe
--SELECT * FROM Clientes ORDER BY rut_cliente ASC;
----DESCENDENTE
--SELECT * FROM Clientes ORDER BY rut_cliente DESC;
--SELECT
--    primer_nombre,
--    apellido_paterno,
--    comuna_id
--FROM Clientes;

---- Select simple nivel 2
--SELECT
--    cl.primer_nombre AS "Nombre",
--    cl.apellido_paterno AS "Apellido",
--    co.comuna_id AS "Comuna"
--FROM Clientes cl
--    JOIN Comunas co ON (cl.comuna_id = co.id_comuna)
--;
