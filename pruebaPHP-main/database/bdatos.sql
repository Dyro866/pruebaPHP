CREATE DATABASE IF NOT EXISTS barcaa;
USE ferrarii;

CREATE TABLE IF NOT EXISTS t_usuarios (
    id_usuario INT(11) AUTO_INCREMENT NOT NULL,
    nombre     VARCHAR(100)           NOT NULL,
    apellido   VARCHAR(100)           NOT NULL,
    email      VARCHAR(200)           NOT NULL,
    password   VARCHAR(200)           NOT NULL,
    rol        VARCHAR(20)            NOT NULL,
    imagen     VARCHAR(200),
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_email UNIQUE (email)
) ENGINE=InnoDB;

INSERT INTO t_usuarios VALUES (NULL, 'Samuel', 'Martinez', 'samueldavidmartinezborbon@gmail.com', '123456', 'admin', 'imagen');

CREATE TABLE IF NOT EXISTS t_categorias (
    id_categoria         INT(11) AUTO_INCREMENT NOT NULL,
    nombre_categoria     VARCHAR(100)           NOT NULL,
   CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
 
)ENGINE=InnoDB;

INSERT INTO t_categorias VALUE (NULL,'Construccion'),(NULL,'electricos'),(NULL,'piso' ),(NULL, 'pintura');

CREATE TABLE IF NOT EXISTS t_productos (
    id_producto     INT AUTO_INCREMENT NOT NULL,
    nombre_producto VARCHAR(100)       NOT NULL,
    descripcion     VARCHAR(255)       NOT NULL,
    fecha           DATE               NOT NULL,
    stock           INT                NOT NULL,
    precio          DECIMAL(10,2)      NOT NULL,
    imagen          VARCHAR(200),
    oferta          VARCHAR(255)       NOT NULL,
    id_categoria    INT                NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
    CONSTRAINT fk_producto FOREIGN KEY (id_categoria) 
        REFERENCES t_categorias(id_categoria)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_pedidos (
    id_pedido     INT (11) auto_increment NOT NULL,
    id_usuario    INT                NOT NULL,
    fecha         DATE               NOT NULL,
    hora         TIME               NOT NULL,   
    ciudad        VARCHAR(100)       NOT NULL,
    direccion     VARCHAR(200)       NOT NULL,
    costo         float  (10,2)      NOT NULL,
    estado        VARCHAR(100)       NOT NULL,

    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) 
        REFERENCES t_usuarios(id_usuario)
) ENGINE=InnoDB; 

CREATE TABLE IF NOT EXISTS t_detallePedido(
    id_detallePedido  int(11) auto_increment NOT NULL,
    id_pedido         int(11)                NOT NULL,
    id_producto       int(11)                NOT NULL,
    unidades          int(100)               NOT NULL,
    CONSTRAINT pk_detallePedido PRIMARY KEY (id_detallePedido),
    CONSTRAINT fk_detallePedido_pedido FOREIGN KEY (id_pedido)
        REFERENCES t_pedidos(id_pedido),
    CONSTRAINT fk_detallePedido_producto FOREIGN KEY (id_producto)
        REFERENCES t_productos(id_producto)
)ENGINE=InnoDB;
