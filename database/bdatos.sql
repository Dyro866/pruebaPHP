CREATE DATABASE IF NOT EXISTS `spider_tienda_dabi`;

USE `spider_tienda_dabi`;

CREATE TABLE IF NOT EXISTS t_usuarios (
    id_usuario INT(11) AUTO_INCREMENT NOT NULL,
    nombre      VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    correo      VARCHAR(200) NOT NULL,
    password    VARCHAR(200) NOT NULL,
    rol         VARCHAR(20) NOT NULL,
    imagen      VARCHAR(200),
    
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_correo UNIQUE (correo)
) ENGINE=InnoDB;

-- Insertar un usuario
INSERT INTO t_usuarios VALUES (
    NULL,
    'David',
    'Rodriguez',
    'rodavid866@gmail.com',
    '123456',
    'admin',
    'admin'
);
