drop table actividad;
DROP TABLE aeropuerto;
DROP TABLE campamento;
DROP TABLE canton;
DROP TABLE categoria;
DROP TABLE contacto;
DROP TABLE local;
DROP TABLE parroquia;
DROP TABLE provincia;
DROP TABLE tipo_e;
DROP TABLE ubicacion;
DELETE FROM contacto;

CREATE TABLE actividad (
    id_actividad VARCHAR(12) NOT NULL,
    n_actividad VARCHAR(200)
);

ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY ( id_actividad );

CREATE TABLE aeropuerto (
    id_aeropuerto VARCHAR(15) NOT NULL,
    aeropuerto_dis VARCHAR(200),
    id_canton VARCHAR(15) NOT NULL
);

ALTER TABLE aeropuerto ADD CONSTRAINT aeropuerto_pk PRIMARY KEY ( id_aeropuerto );

CREATE TABLE campamento (
    id_campamento VARCHAR(15) NOT NULL,
    n_campamento VARCHAR(400),
    id_provincia VARCHAR(15) NOT NULL
);

ALTER TABLE campamento ADD CONSTRAINT campamento_pk PRIMARY KEY ( id_campamento );

CREATE TABLE canton (
    id_canton VARCHAR(15) NOT NULL,
    nombre_canton VARCHAR(400),
    poblacion INTEGER,
    id_provincia VARCHAR(15) NOT NULL
);

ALTER TABLE canton ADD CONSTRAINT canton_pk PRIMARY KEY ( id_canton );

CREATE TABLE categoria (
    id_categoria VARCHAR(15) NOT NULL,
    categoria VARCHAR(200)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE contacto (
    id_contacto VARCHAR(15) NOT NULL,
    correo VARCHAR(200),
    telefono_p INTEGER(50),
    telefono_s INTEGER(50),
    direc_web VARCHAR(400)
);

ALTER TABLE contacto ADD CONSTRAINT contacto_pk PRIMARY KEY ( id_contacto );

CREATE TABLE local (
    id_local VARCHAR(15) NOT NULL,
    nombre_local VARCHAR(400),
    costo_hotel INTEGER,
    id_tipo_e VARCHAR(15) NOT NULL,
    id_contacto VARCHAR(15) NOT NULL,
    id_ubicacion VARCHAR(15) NOT NULL,
    id_categoria VARCHAR(15) NOT NULL,
    id_parroquia VARCHAR(15) NOT NULL
);

ALTER TABLE local ADD CONSTRAINT local_pk PRIMARY KEY ( id_local );

CREATE TABLE parroquia (
    id_parroquia VARCHAR(15) NOT NULL,
    nombre_parroquia VARCHAR(250),
    id_canton VARCHAR(15) NOT NULL
);

ALTER TABLE parroquia ADD CONSTRAINT parroquia_pk PRIMARY KEY ( id_parroquia );

CREATE TABLE provincia (
    id_provincia VARCHAR(15) NOT NULL,
    nombre_provincia VARCHAR(200),
    lugares_m_visitados VARCHAR(200)
);

ALTER TABLE provincia ADD CONSTRAINT provincia_pk PRIMARY KEY ( id_provincia );

CREATE TABLE tipo_e (
    id_tipo_e VARCHAR(12) NOT NULL,
    n_tipo_e VARCHAR(250),
    id_actividad VARCHAR(12) NOT NULL
);

ALTER TABLE tipo_e ADD CONSTRAINT tipo_e_pk PRIMARY KEY ( id_tipo_e );

CREATE TABLE ubicacion (
    id_ubicacion VARCHAR(15) NOT NULL,
    direccion VARCHAR(200),
    referencia_dir VARCHAR(400)
);

ALTER TABLE ubicacion ADD CONSTRAINT ubicacion_pk PRIMARY KEY ( id_ubicacion );

ALTER TABLE aeropuerto
    ADD CONSTRAINT aeropuerto_canton_fk FOREIGN KEY ( id_canton )
        REFERENCES canton ( id_canton );

ALTER TABLE campamento
    ADD CONSTRAINT campamento_provincia_fk FOREIGN KEY ( id_provincia )
        REFERENCES provincia ( id_provincia );

ALTER TABLE canton
    ADD CONSTRAINT canton_provincia_fk FOREIGN KEY ( id_provincia )
        REFERENCES provincia ( id_provincia );

ALTER TABLE local
    ADD CONSTRAINT local_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE local
    ADD CONSTRAINT local_contacto_fk FOREIGN KEY ( id_contacto )
        REFERENCES contacto ( id_contacto );

ALTER TABLE local
    ADD CONSTRAINT local_parroquia_fk FOREIGN KEY ( id_parroquia )
        REFERENCES parroquia ( id_parroquia );

ALTER TABLE local
    ADD CONSTRAINT local_tipo_e_fk FOREIGN KEY ( id_tipo_e )
        REFERENCES tipo_e ( id_tipo_e );

ALTER TABLE local
    ADD CONSTRAINT local_ubicacion_fk FOREIGN KEY ( id_ubicacion )
        REFERENCES ubicacion ( id_ubicacion );

ALTER TABLE parroquia
    ADD CONSTRAINT parroquia_canton_fk FOREIGN KEY ( id_canton )
        REFERENCES canton ( id_canton );

ALTER TABLE tipo_e
    ADD CONSTRAINT tipo_e_activdad_fk FOREIGN KEY ( id_actividad )
        REFERENCES actividad ( id_actividad );