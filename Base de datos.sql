create database Proyecto;
USE Proyecto;

CREATE TABLE usuario (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL
);
CREATE TABLE ubicacion (
    id_ubicacion INT UNSIGNED NOT NULL PRIMARY KEY,
    longitud FLOAT NOT NULL,
    latitud FLOAT NOT NULL
);
CREATE TABLE camioneros (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);
CREATE TABLE personalAlmacen (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);
CREATE TABLE oficinistas (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE clientes (
    ci INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE usuario_tel (
    ci INT UNSIGNED NOT NULL,
    tel INT(9) NOT NULL,
    PRIMARY KEY (ci, tel),
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE camion (
    id_camion INT UNSIGNED NOT NULL PRIMARY KEY,
    peso FLOAT NOT NULL
);
ALTER TABLE camion
ADD marca VARCHAR(50),
ADD modelo VARCHAR(50);

CREATE TABLE almacen (
    id_almacen INT UNSIGNED NOT NULL PRIMARY KEY,
    latitud FLOAT NOT NULL,
    longitud FLOAT NOT NULL
);

CREATE TABLE paquete (
    id_paquete INT NOT NULL PRIMARY KEY,
    peso FLOAT NOT NULL
);

CREATE TABLE lugarEnvio (
    id_lugarEnvio INT NOT NULL PRIMARY KEY,
    longitud FLOAT NOT NULL,
    latitud FLOAT NOT NULL
);

CREATE TABLE almacena (
    id_almacen INT UNSIGNED NOT NULL,
    id_paquete INT NOT NULL,
    PRIMARY KEY (id_almacen, id_paquete),
    FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
    FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete)
);

CREATE TABLE pedido (
    id_pedido INT UNSIGNED NOT NULL PRIMARY KEY,
    id_lugarenvio INT NOT NULL,
    fechapedido DATE,
    horapedido DATETIME,
    FOREIGN KEY (id_lugarenvio) REFERENCES lugarEnvio(id_lugarEnvio)
);

CREATE TABLE pedido_almacen (
    id_almacen INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_almacen, id_pedido),
    FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE pedido_cliente (
    id_pedido INT UNSIGNED NOT NULL,
    ci INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido, ci),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (ci) REFERENCES usuario(ci)
);

CREATE TABLE camionerosCamion (
    ci INT UNSIGNED NOT NULL,
    id_camion INT UNSIGNED NOT NULL,
    PRIMARY KEY (ci, id_camion),
    FOREIGN KEY (ci) REFERENCES camioneros(ci),
    FOREIGN KEY (id_camion) REFERENCES camion(id_camion)
);

CREATE TABLE rutaEnvio (
    id_ruta INT NOT NULL PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    horario DATE
);

CREATE TABLE camionerosRuta (
    ci INT UNSIGNED NOT NULL,
    id_ruta INT NOT NULL,
    PRIMARY KEY (ci, id_ruta),
    FOREIGN KEY (ci) REFERENCES camioneros(ci),
    FOREIGN KEY (id_ruta) REFERENCES rutaEnvio(id_ruta)
);

CREATE TABLE camionerosPedido (
    ci INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (ci, id_pedido),
    FOREIGN KEY (ci) REFERENCES camioneros(ci),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE rutaPedidos (
    id_pedido INT UNSIGNED NOT NULL,
    id_ruta INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_ruta) REFERENCES rutaEnvio(id_ruta)
);
CREATE TABLE ubicacion_camioneros (
    ci_camionero INT UNSIGNED NOT NULL,
    id_ubicacion INT UNSIGNED NOT NULL,
    FOREIGN KEY (ci_camionero) REFERENCES camioneros(ci),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);












INSERT INTO usuario (ci, nombre, apellido, correo, usuario) 
VALUES
    (15054918, 'Sofía', 'Romero', 'sofía@example.com', 'camioneros'),
    (75646029, 'Juan', 'Sánchez', 'juan@example.com', 'camioneros'),
    (90322438, 'Pedro', 'Rodríguez', 'pedro@example.com', 'camioneros'),
    (35940297, 'Juan', 'González', 'juan@example.com', 'camioneros'),
    (84848470, 'Laura', 'García', 'laura@example.com', 'camioneros'),
    (42366463, 'Ana', 'González', 'ana@example.com', 'cliente'),
    (35164449, 'Paula', 'Romero', 'paula@example.com', 'cliente'),
    (35774907, 'Sofía', 'Rodríguez', 'sofía@example.com', 'cliente'),
    (14449881, 'Laura', 'López', 'laura@example.com', 'cliente'),
    (82880761, 'Juan', 'Fernández', 'juan@example.com', 'oficinistas'),
    (12345678, 'Carlos', 'Martínez', 'carlos@example.com', 'personal_almacen'),
    (23456789, 'Luisa', 'López', 'luisa@example.com', 'personal_almacen'),
    (34567890, 'Roberto', 'Gómez', 'roberto@example.com', 'personal_almacen');


INSERT INTO camioneros (ci, nombre, apellido, correo, usuario)
VALUES
    (15054918, 'Sofía', 'Romero', 'sofía@example.com', 'camioneros'),
    (75646029, 'Juan', 'Sánchez', 'juan@example.com', 'camioneros'),
    (90322438, 'Pedro', 'Rodríguez', 'pedro@example.com', 'camioneros'),
    (35940297, 'Juan', 'González', 'juan@example.com', 'camioneros'),
    (84848470, 'Laura', 'García', 'laura@example.com', 'camioneros');

 
 INSERT INTO clientes (ci, nombre, apellido, correo, usuario) 
VALUES
    (42366463, 'Ana', 'González', 'ana@example.com', 'cliente'),
    (35164449, 'Paula', 'Romero', 'paula@example.com', 'cliente'),
    (35774907, 'Sofía', 'Rodríguez', 'sofía@example.com', 'cliente'),
    (14449881, 'Laura', 'López', 'laura@example.com', 'cliente');

 
INSERT INTO oficinistas (ci, nombre, apellido, correo, usuario) 
VALUES (82880761, 'Juan', 'Fernández', 'juan@example.com', 'oficinistas');

 INSERT INTO personalAlmacen (ci, nombre, apellido, correo, usuario)
VALUES
    (12345678, 'Carlos', 'Martínez', 'carlos@example.com', 'personal_almacen'),
    (23456789, 'Luisa', 'López', 'luisa@example.com', 'personal_almacen'),
    (34567890, 'Roberto', 'Gómez', 'roberto@example.com', 'personal_almacen');
INSERT INTO usuario_tel (ci, tel) 
VALUES
    (15054918, '092060952'),
    (75646029, '096270174'),
    (90322438, '097335666'),
    (35940297, '097897654'),
    (84848470, '096122228'),
    (42366463, '098841177'),
    (35164449, '095978761'),
    (35774907, '094080914'),
    (14449881, '095528951'),
    (82880761, '099835256'),
	(12345678, '098765432'),
    (23456789, '099876543'),
    (34567890, '097654321');

 
INSERT INTO camion (id_camion, peso) VALUES (37, 181.93),
 (51, 9565.33), (83, 4063.26), (89, 2417.26), (9, 1620.62), 
 (73, 5018.10), (97, 966.21), (49, 2656.80), (3, 4299.94), 
 (77, 2699.84);
 
 INSERT INTO almacen (id_almacen, latitud, longitud) VALUES (54, 14.152532, -112.305083), 
 (45, 54.084340, -131.666482), (98, 78.651926, 54.240202), 
 (61, -3.647300, -73.871064), (38, 38.690374, 9.624890), (55, 10.375304, -100.312671),
 (36, 18.494121, -30.869243), (68, 63.473521, -104.016908), (39, -21.320194, -70.215187),
 (75, -36.211815, -176.060812);
 
 INSERT INTO paquete (id_paquete, peso) 
 VALUES (1, 18.14), (2, 4.85), (3, 32.23), 
 (4, 41.10), (5, 43.08), (6, 49.19), (7, 3.22), 
 (8, 1.77), (9, 48.07), (10, 14.07);
 
INSERT INTO lugarEnvio (id_lugarEnvio, longitud, latitud) 
VALUES 
    (11, -56.1874, -34.9011), 
    (12, -56.1918, -34.9055), 
    (13, -56.1752, -34.9119), 
    (14, -56.1777, -34.9210), 
    (15, -56.1755, -34.9322), 
    (16, -56.1870, -34.9315),
    (17, -56.1652, -34.9084),
    (18, -56.1710, -34.9189), 
    (19, -56.1914, -34.9085), 
    (20, -56.1913, -34.9081);


INSERT INTO almacena (id_almacen, id_paquete) 
VALUES
    (54, 1),
    (45, 2),
    (98, 3),
    (61, 4),
    (38, 5),
    (55, 6),
    (36, 7),
    (68, 8),
    (39, 9),
    (75, 10);
INSERT INTO pedido (id_pedido, id_lugarenvio, fechapedido, horaPedido)
VALUES
    (11, 11, '2023-09-10', '10:30:00'),
    (12, 12, '2023-09-11', '11:15:00'),
    (13, 13, '2023-09-12', '12:45:00'),
    (14, 14, '2023-09-13', '14:00:00'),
    (15, 15, '2023-09-14', '15:30:00'),
    (16, 16, '2023-09-15', '16:45:00'),
    (17, 17, '2023-09-16', '17:15:00'),
    (18, 18, '2023-09-17', '18:30:00'),
    (19, 19, '2023-09-18', '19:45:00'),
    (20, 20, '2023-09-19', '20:00:00');



INSERT INTO pedido_almacen (id_almacen, id_pedido) 
VALUES (54, 11),
       (45, 12),
       (98, 13),
       (61, 14),
       (38, 15),
       (55, 16),
       (36, 17),
       (68, 18),
       (39, 19),
       (75, 20);

INSERT INTO pedido_cliente (id_pedido, ci) 
VALUES
    (11, 42366463),
    (12, 35164449),
    (13, 35774907),
    (14, 14449881),
    (15, 42366463),
    (16, 35164449),
    (17, 35774907),
    (18, 42366463),
    (19, 35774907),
    (20, 14449881);
INSERT INTO camionerosCamion (ci, id_camion) 
VALUES 
    (15054918, 37),
    (75646029, 51),
    (90322438, 83),
    (35940297, 89),
    (84848470, 9);

INSERT INTO rutaEnvio (id_ruta, estado, horario)
VALUES 
    (4, 'Entregado', '2023-09-23 09:30:00'),
    (5, 'En Camino', '2023-09-24 11:15:00'),
    (6, 'En Almacén', '2023-09-25 13:45:00'),
    (7, 'Entregado', '2023-09-26 10:30:00'),
    (8, 'En Camino', '2023-09-27 14:15:00');
    
INSERT INTO camionerosRuta (ci, id_ruta)
VALUES 
    (15054918, 4), 
    (75646029, 5), 
    (90322438, 6),
    (35940297, 7),
    (84848470, 8);

INSERT INTO camionerosPedido (ci, id_pedido)
VALUES 
    (15054918, 11), 
    (75646029, 12), 
    (90322438, 13),
    (35940297, 14),
    (84848470, 15); 

INSERT INTO rutaPedidos (id_pedido, id_ruta)
VALUES 
    (11, 4), 
    (12, 5), 
    (13, 6),
    (14, 7),
    (15, 8); 
INSERT INTO ubicacion (id_ubicacion, longitud, latitud)
VALUES
    (21, -56.2116, -34.9036),
    (22, -56.1814, -34.9034), 
    (23, -56.1552, -34.9010), 
    (24, -56.1602, -34.9088), 
    (25, -56.1505, -34.9151); 

INSERT INTO ubicacion_camioneros (ci_camionero, id_ubicacion)
VALUES
    (15054918, 21),  
    (75646029, 22), 
    (90322438, 23),  
    (35940297, 24),  
    (84848470, 25); 
    
SELECT c.ci, c.nombre AS nombre_camionero, c.apellido AS apellido_camionero, cm.id_camion, cm.marca, cm.modelo
FROM camioneros c
JOIN camionerosCamion cc ON c.ci = cc.ci
JOIN camion cm ON cc.id_camion = cm.id_camion;

SELECT r.id_ruta, r.estado, p.id_pedido, p.fechapedido, p.horapedido
FROM rutaEnvio r
JOIN rutaPedidos rp ON r.id_ruta = rp.id_ruta
JOIN pedido p ON rp.id_pedido = p.id_pedido
WHERE r.id_ruta = 4; 

SELECT uc.ci_camionero, c.nombre AS nombre_camionero, c.apellido AS apellido_camionero, u.longitud, u.latitud
FROM ubicacion_camioneros uc
JOIN ubicacion u ON uc.id_ubicacion = u.id_ubicacion
JOIN camioneros c ON uc.ci_camionero = c.ci;