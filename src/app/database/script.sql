/* CREATE DATABASE bd_elconde DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE bd_elconde; */

CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombres VARCHAR(50),
	apellidos VARCHAR(50),
	num_doc VARCHAR(15),
	tipo_doc VARCHAR(30),
	telefono VARCHAR(20),
	fecha_nac DATE,
	direccion VARCHAR(50),
	correo VARCHAR(50),
	descripcion TEXT,
	activo TINYINT(1),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO clientes VALUES
(NULL, 'CLIENTES', 'VARIOS', '11111111', 'DNI', '993277619', '2020-07-15', 'ECHENIQUE 552', 'CLIENTESVARIOS@GMAIL.COM', 'MISMA BARBERIA', 1, '2020-07-15 11:33:02', '2020-07-15 11:33:02'),
(NULL, 'ALONSO ISAAC', 'NOVOA SOTO', '71274113', 'DNI', '994610853', '2020-06-30', NULL, 'alongo@gmail.com', 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-06-30 14:29:56', '2020-06-30 14:29:56'),
(NULL, 'ANITA', 'SOTO', '05328382', 'DNI', '1335', '1980-06-30', NULL, 'ADGAD', 'RECOMENDACION DE TERCEROS', 1, '2020-06-30 19:00:15', '2020-06-30 19:00:15'),
(NULL, 'Amilcar Jefferson', 'Inga Salazar', '40632484', 'DNI', '965982425', '1980-04-20', NULL, 'ingamilcar@gmail.com', 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-06-30 20:13:23', '2020-06-30 20:13:23'),
(NULL, 'indira', 'rondona', '41748415', 'DNI', '993277619', '1983-03-03', NULL, NULL, 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-07-07 11:52:40', '2020-07-07 11:52:40'),
(NULL, 'CALEB', 'INGA RONDONA', '62619545', 'DNI', '993277619', '2020-07-11', 'AV. MARISCAL CACERES 820', NULL, 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-07-11 10:05:10', '2020-07-11 10:05:10'),
(NULL, 'PEPE', 'FLORES', '14115212', 'DNI', '993277619', '2020-07-11', 'AV. MARISCAL CACERES 820', 'A', 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-07-11 11:09:23', '2020-07-11 11:09:23'),
(NULL, 'RUBEN', 'GRANDEZ', '80805412', 'DNI', '993277619', '2020-07-11', 'AV. MARISCAL CACERES 820', NULL, 'RECOMENDACION DE TERCEROS', 1, '2020-07-11 11:19:20', '2020-07-11 11:19:20'),
(NULL, 'CLARK', 'GARCIA', '44741455', 'DNI', '5555555', '2020-07-15', 'CALLE CALVO DE ARAUJO', 'CLARK@GMAIL.COM', 'ANUNCIO EN REDES U OTROS MEDIOS', 1, '2020-07-15 11:45:36', '2020-07-15 11:45:36'),
(NULL, 'JOSE', 'CORTES', '05392048', 'DNI', '8888888', '2020-07-15', 'CALLE CALVO DE ARAUJO', 'JOSECORTEZ@GMAIL.COM', 'RECOMENDACION DE TERCEROS', 1, '2020-07-15 11:46:43', '2020-07-15 11:46:43');

CREATE TABLE cargos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE=InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO cargos VALUES (NULL, 'BARBERO', NOW(), NOW());
INSERT INTO cargos VALUES (NULL, 'SECRETARIA', NOW(), NOW());

CREATE TABLE empleados (
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR(20),
	ape_paterno VARCHAR(50),
	ape_materno VARCHAR(50),
	nombres VARCHAR(50),
	num_doc VARCHAR(15),
	tipo_doc VARCHAR(30),
	telefono VARCHAR(20),
	sexo VARCHAR(10),
	fecha_nac DATE,
	direccion VARCHAR(50),
	correo VARCHAR(50),
	fecha_ingreso_laboral DATE,
	cargo INT,
	foto VARCHAR(255),
	activo TINYINT(1),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_empleados_cargos FOREIGN KEY (cargo) REFERENCES cargos (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO empleados VALUES
(NULL, '', 'RODRIGUEZ', 'A', 'RONNY', '12345678', 'DNI', '965111222', 'MASCULINO', NOW(), 'Calle Miraflores', 'benny@gmail.com', '2020-06-30', 1, '', 1, '2020-06-30 14:18:37', '2020-07-15 11:17:36'),
(NULL, '', 'CULQUI', 'CULQUI', 'DINO', '21212125', 'DNI', '55555555', 'MASCULINO', NOW(), 'CALLE CALVO DE ARAUJO', 'DINO@GMAIL.COM', '2020-07-15', 1, '', 1, '2020-07-15 11:18:59', '2020-07-15 11:18:59'),
(NULL, '', 'RODRIGUEZ', 'CULQUI', 'REBECCA', '123456789', 'DNI', '50505050', 'FEMENINO', NOW(), 'ECHENIQUE 552', 'REBECA@GMAIL.COM', '2020-07-15', 2, '', 1, '2020-07-15 11:19:44', '2020-07-15 11:19:44');


CREATE TABLE roles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO roles VALUES (NULL, 'Administrador', NOW(), NOW());
INSERT INTO roles VALUES (NULL, 'Secretaria', NOW(), NOW());
INSERT INTO roles VALUES (NULL, 'Barbero', NOW(), NOW());

CREATE TABLE permisos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO permisos VALUES (NULL, 'Dashboard', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Citas', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Ventas', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Gastos', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Caja', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Clientes', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Compras', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Proveedores', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Almacén', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Servicios', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Asignaciones', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Reportes', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Configuración', NOW(), NOW());
INSERT INTO permisos VALUES (NULL, 'Consumos Internos', NOW(), NOW());

CREATE TABLE usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre_display VARCHAR(255),
	empleado INT,
	rol INT,
	username VARCHAR(20),
	password VARCHAR(255),
	activo TINYINT(1),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_usuarios_empleados FOREIGN KEY (empleado) REFERENCES empleados (id),
	CONSTRAINT fk_usuarios_rol FOREIGN KEY (rol) REFERENCES roles (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO usuarios VALUES (NULL, 'Usuario Admin', NULL, 1, 'admin', 'admin', 1, NOW(), NOW());

CREATE TABLE usuario_permisos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	usuario_id INT,
	permiso_id INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_up_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_up_permiso FOREIGN KEY (permiso_id) REFERENCES permisos (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO usuario_permisos VALUES
(NULL, 1, 1, NOW(), NOW()),
(NULL, 1, 2, NOW(), NOW()),
(NULL, 1, 3, NOW(), NOW()),
(NULL, 1, 4, NOW(), NOW()),
(NULL, 1, 5, NOW(), NOW()),
(NULL, 1, 6, NOW(), NOW()),
(NULL, 1, 7, NOW(), NOW()),
(NULL, 1, 8, NOW(), NOW()),
(NULL, 1, 9, NOW(), NOW()),
(NULL, 1, 10, NOW(), NOW()),
(NULL, 1, 11, NOW(), NOW()),
(NULL, 1, 12, NOW(), NOW()),
(NULL, 1, 13, NOW(), NOW()),
(NULL, 1, 14, NOW(), NOW());

CREATE TABLE servicios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR(20),
	nombre VARCHAR(100),
	precio DECIMAL(10,2),
	tiempo_promedio INT,
	activo TINYINT(1),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO servicios VALUES
(NULL, NULL, 'CORTE CLASICO', 20.00, 35, 1, '2020-06-30 14:16:35', '2020-07-15 11:20:09'),
(NULL, NULL, 'CORTE DEGRADADO', 25.00, 40, 1, '2020-07-15 11:21:12', '2020-07-15 11:21:12'),
(NULL, NULL, 'PERFILADO DE BARBA', 10.00, 20, 1, '2020-07-15 11:21:32', '2020-07-15 11:22:19'),
(NULL, NULL, 'CORTE DE BARBA', 20.00, 30, 1, '2020-07-15 11:22:09', '2020-07-15 11:22:30');

CREATE TABLE herramientas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	tipo varchar(50),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO herramientas VALUES
(NULL, 'GILLETE', 'IMPLEMENTO', '2020-06-30 14:20:21', '2020-06-30 14:20:21'),
(NULL, 'CREMA DE AFEITAR', 'INSUMO', '2020-06-30 14:20:32', '2020-06-30 14:20:32');

CREATE TABLE asignaciones (
	id INT PRIMARY KEY AUTO_INCREMENT,
	empleado INT,
	herramienta INT,
	fecha DATE,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_asignaciones_empleados FOREIGN KEY (empleado) REFERENCES empleados (id),
	CONSTRAINT fk_asignaciones_herramienta FOREIGN KEY (herramienta) REFERENCES herramientas (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE promociones (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE citas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR(20),
	cliente INT,
	empleado INT,
	fecha DATE,
	hora TIME,
	hora_termino TIME,
	estado VARCHAR(20), /* ATENDIDO, PENDIENTE */
	promocion INT,
	total DECIMAL(10,2),
	created_by INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_citas_cliente FOREIGN KEY (cliente) REFERENCES clientes (id),
	CONSTRAINT fk_citas_empleado FOREIGN KEY (empleado) REFERENCES empleados (id),
	CONSTRAINT fk_citas_promocion FOREIGN KEY (promocion) REFERENCES promociones (id),
	CONSTRAINT fk_citas_usuarios FOREIGN KEY (created_by) REFERENCES usuarios (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE citas_detalles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cita INT,
	servicio INT,
	cantidad INT,
	precio DECIMAL(10,2),
	importe DECIMAL(10,2),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_citas_detalles_cita FOREIGN KEY (cita) REFERENCES citas (id) ON DELETE CASCADE,
	CONSTRAINT fk_citas_detalles_servicio FOREIGN KEY (servicio) REFERENCES servicios (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE productos_categorias (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO productos_categorias VALUES
(NULL, 'CUIDADO PERSONAL', '2020-06-30 14:25:12', '2020-06-30 14:25:12'),
(NULL, 'ACCESORIOS BARBERIA', '2020-07-15 10:51:38', '2020-07-15 10:51:38'),
(NULL, 'HERRAMIENTAS Y MAQUINAS', '2020-07-15 10:52:09', '2020-07-15 10:52:09');

CREATE TABLE productos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	categoria INT,
	nombre VARCHAR(100),
	precio DECIMAL(10,2),
	stock INT,
	activo TINYINT(1),
	unidad_medida VARCHAR(20),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_productos_productos_categorias FOREIGN KEY (categoria) REFERENCES productos_categorias (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO productos VALUES
(NULL, 1, 'MINOXIDIL', 50.00, 10, 1, 'UNIDAD', '2020-06-30 14:25:35', '2020-07-09 22:18:56'),
(NULL, 1, 'ALCOHOL 96 °  100ml', 20.00, 100, 1, 'UNIDAD', '2020-07-04 09:40:54', '2020-07-15 11:48:48'),
(NULL, 2, 'PEINE DE CARBON', 20.00, 0, 1, 'UNIDAD', '2020-07-15 10:52:50', '2020-07-15 11:11:12'),
(NULL, 1, 'GEL ROLDA 250GR', 20.00, 0, 1, 'UNIDAD', '2020-07-15 10:53:17', '2020-07-15 11:33:07');

CREATE TABLE consumos_internos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	empleado_id INT,
	producto_id INT,
	fecha DATE,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_ci_empleados FOREIGN KEY (empleado_id) REFERENCES empleados (id),
	CONSTRAINT fk_ci_productos FOREIGN KEY (producto_id) REFERENCES productos (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE productos_codigos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	producto_id INT,
	codigo VARCHAR(100),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_productos_codigos_productos FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO productos_codigos VALUES
(1, 1, '096619929214', '2020-07-04 09:39:30', '2020-07-04 09:39:30'),
(2, 2, '781159477270', '2020-07-04 09:40:54', '2020-07-04 09:40:54');

CREATE TABLE ventas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	hora TIME,
	tipo_comprobante VARCHAR(20),
	nro_comprobante VARCHAR(30),
	promocion INT,
	cliente INT,
	total DECIMAL(10,2),
	tipo_venta VARCHAR(10), /* EFECTIVO, CREDITO */
	created_by INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_ventas_cliente FOREIGN KEY (cliente) REFERENCES clientes (id),
	CONSTRAINT fk_ventas_usuarios FOREIGN KEY (created_by) REFERENCES usuarios (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE ventas_detalles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	venta INT,
	producto INT,
	cantidad INT,
	precio DECIMAL(10,2),
	importe DECIMAL(10,2),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_ventas_detalles_venta FOREIGN KEY (venta) REFERENCES ventas (id) ON DELETE CASCADE,
	CONSTRAINT fk_ventas_detalles_producto FOREIGN KEY (producto) REFERENCES productos (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;


CREATE TABLE proveedores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	ruc VARCHAR(11),
	email VARCHAR(30),
	direccion VARCHAR(50),
	telefono VARCHAR(15),
	activo TINYINT(1),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE=InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO proveedores VALUES (NULL, 'Test Supplier', '11111111111', 'test@test.com', 'Test Address', '999999999', 1, NOW(), NOW());

CREATE TABLE compras (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha_emi DATE,
	fecha_inter DATE,
	hora_inter TIME,
	proveedor INT,
	tipo_doc VARCHAR(30),
	nro_doc_pref VARCHAR(10),
	nro_doc_suf VARCHAR(20),
	total INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_compras_proveedor FOREIGN KEY (proveedor) REFERENCES proveedores (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

/*
UPDATE compras SET proveedor = 1;
ALTER TABLE compras MODIFY COLUMN proveedor INT, ADD CONSTRAINT fk_compras_proveedor FOREIGN KEY (proveedor) REFERENCES proveedores (id)
*/

INSERT INTO compras VALUES
(1, '2020-06-30', '2020-06-30', '14:26:09', 'BARBISHOP SAC', 'GUIA DE REMISION', 'GR001', '129817435', 480, '2020-06-30 14:27:19', '2020-06-30 14:27:19'),
(2, '2020-07-04', '2020-07-04', '09:41:13', 'IAC INVERSIONES E.I.R.L.', 'GUIA DE REMISION', '12654', '156421', 1500, '2020-07-04 09:44:47', '2020-07-04 09:44:47');

CREATE TABLE compras_detalles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	compra INT,
	producto INT,
	cantidad INT,
	precio DECIMAL(10,2),
	importe DECIMAL(10,2),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_compras_detalles_venta FOREIGN KEY (compra) REFERENCES compras (id) ON DELETE CASCADE,
	CONSTRAINT fk_compras_detalles_producto FOREIGN KEY (producto) REFERENCES productos (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO compras_detalles VALUES
(1, 1, 1, 10, 48.00, 480.00, '2020-06-30 14:27:19', '2020-06-30 14:27:19'),
(2, 2, 2, 100, 15.00, 1500.00, '2020-07-04 09:44:47', '2020-07-04 09:44:47');


CREATE TABLE caja_aperturas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	total DECIMAL(10,2),
	created_by INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_caja_aperturas_usuarios FOREIGN KEY (created_by) REFERENCES usuarios (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE caja_cierres (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	bil_200 INT,
	bil_100 INT,
	bil_50 INT,
	bil_20 INT,
	bil_10 INT,
	mon_05 INT,
	mon_02 INT,
	mon_01 INT,
	mon_50 INT,
	mon_20 INT,
	mon_10 INT,
	total DECIMAL(10,2),
	created_by INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_caja_cierres_usuarios FOREIGN KEY (created_by) REFERENCES usuarios (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE gastos_tipos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO gastos_tipos VALUES
(NULL, 'GASTOS VARIOS', '2020-06-30 14:19:35', '2020-06-30 14:19:35'),
(NULL, 'PAGO PERSONAL', '2020-07-15 11:30:06', '2020-07-15 11:30:18');

CREATE TABLE gastos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	nro_comprobante VARCHAR(15),
	tipo_comprobante VARCHAR(30),
	tipo_gasto INT,
	descripcion VARCHAR(30),
	total DECIMAL(10,2),
	created_by INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_gastos_gastos_tipos FOREIGN KEY (tipo_gasto) REFERENCES gastos_tipos (id),
	CONSTRAINT fk_gastos_usuarios FOREIGN KEY (created_by) REFERENCES usuarios (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE inventarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	hora TIME,
	comentario TEXT,
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO inventarios VALUES
(NULL, '2020-07-01', '15:37:38', 'Inventario Test', '2020-07-01 15:38:10', '2020-07-01 15:38:10'),
(NULL, '2020-07-15', '10:53:30', 'InventarioJunio15', '2020-07-15 11:11:12', '2020-07-15 11:11:12');

CREATE TABLE inventarios_detalles (
	id INT PRIMARY KEY AUTO_INCREMENT,
	producto INT,
	stock INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_inventarios_detalles_producto FOREIGN KEY (producto) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO inventarios_detalles VALUES
(NULL, 1, 5, '2020-07-01 15:38:10', '2020-07-01 15:38:10'),
(NULL, 4, 2, '2020-07-15 11:11:12', '2020-07-15 11:11:12'),
(NULL, 2, 20, '2020-07-15 11:11:12', '2020-07-15 11:11:12'),
(NULL, 3, 2, '2020-07-15 11:11:12', '2020-07-15 11:11:12');

CREATE TABLE kardex (
	id INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(15),
	fecha DATE,
	hora TIME,
	producto INT,
	entrada INT,
	salida INT,
	saldo INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_kardex_producto FOREIGN KEY (producto) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO kardex VALUES
(NULL, 'Entradas', '2020-06-30', '14:26:09', 1, 10, 0, 10, '2020-06-30 14:27:19', '2020-06-30 14:27:19'),
(NULL, 'Entradas', '2020-07-04', '09:41:13', 2, 100, 0, 100, '2020-07-04 09:44:47', '2020-07-04 09:44:47');

CREATE TABLE opiniones (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cliente INT,
	empleado INT,
	nivel VARCHAR(20), /*BUENO, MALO, EXCELENTE*/
	comentario TEXT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_opiniones_cliente FOREIGN KEY (cliente) REFERENCES clientes (id),
	CONSTRAINT fk_opiniones_empleado FOREIGN KEY (empleado) REFERENCES empleados (id)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE global (
	id INT PRIMARY KEY AUTO_INCREMENT,
	pago_comision INT,
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO global VALUES (NULL, 50, NOW(), NOW());


--  /////////////////////////////////////////////////////////////////////////////
--  /////////////////////////////////////////////////////////////////////////////
--  /////////////////////////////////////////////////////////////////////////////
--  /////////////////////////////////////////////////////////////////////////////
--  /////////////////////////////////////////////////////////////////////////////
--  /////////////////////////////////////////////////////////////////////////////

/*
ALTER TABLE servicios ADD pago_comision INT AFTER tiempo_promedio;
UPDATE servicios SET pago_comision = 0;

INSERT INTO permisos VALUES (NULL, 'Consumos Internos', NOW(), NOW());
INSERT INTO usuario_permisos VALUES (NULL, 1, 14, NOW(), NOW());


CREATE TABLE unidades_medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	unidad VARCHAR(30),
	created_at DATETIME,
	updated_at DATETIME
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO unidades_medida VALUES
(NULL, 'CAJA', NOW(), NOW()),
(NULL, 'UNIDAD', NOW(), NOW());

UPDATE productos SET unidad_medida = 2;
ALTER TABLE productos MODIFY COLUMN unidad_medida INT,
ADD CONSTRAINT fk_productos_unidades_medida FOREIGN KEY (unidad_medida) REFERENCES unidades_medida (id);

ALTER TABLE inventarios_detalles ADD inventario INT AFTER id,
ADD CONSTRAINT fk_id_inventario FOREIGN KEY (inventario) REFERENCES inventarios (id) ON DELETE CASCADE;
*/




/*

DROP VIEW view_kardex;
CREATE VIEW view_kardex AS
SELECT
	'Consumo Interno' AS 'tipo',
	ci.fecha AS 'fecha',
	'-' AS 'doc',
	ci.cantidad AS 'cantidad',
	(SELECT p.nombre FROM productos p WHERE p.id = producto_id LIMIT 1) AS 'producto',
	ci.producto_id AS 'producto_id',
	ci.created_at,
	ci.updated_at
FROM consumos_internos ci
UNION ALL
SELECT
	'Venta' AS 'tipo',
	(SELECT v.fecha FROM ventas v WHERE v.id = vd.venta LIMIT 1) AS 'fecha',
	'-' AS 'doc',
	vd.cantidad AS 'cantidad',
	(SELECT p.nombre FROM productos p WHERE p.id = vd.producto LIMIT 1) AS 'producto',
	vd.producto AS 'producto_id',
	vd.created_at,
	vd.updated_at
FROM ventas_detalles vd
UNION ALL
SELECT
	'Compra' AS tipo,
	(SELECT c.fecha_inter FROM compras c WHERE c.id = cd.compra LIMIT 1) AS 'fecha',
	(SELECT CONCAT(c.tipo_doc, ' ', c.nro_doc_pref, '-', c.nro_doc_suf) FROM compras c WHERE c.id = cd.compra LIMIT 1) AS 'doc',
	cd.cantidad AS 'cantidad',
	(SELECT p.nombre FROM productos p WHERE p.id = cd.producto LIMIT 1) AS 'producto',
	cd.producto AS 'producto_id',
	(SELECT CONCAT(c.fecha_inter, ' ', c.hora_inter) FROM compras c WHERE c.id = cd.compra LIMIT 1) AS 'created_at',
	(SELECT c.updated_at FROM compras c WHERE c.id = cd.compra LIMIT 1) AS 'updated_at'
FROM compras_detalles cd
UNION ALL
SELECT
	'Inventario' AS tipo,
	(SELECT i.fecha FROM inventarios i WHERE i.id = id.inventario LIMIT 1) AS fecha,
	'INVENTARIO' AS 'doc',
	id.stock AS cantidad,
	(SELECT p.nombre FROM productos p WHERE p.id = id.producto LIMIT 1) AS 'producto',
	id.producto AS 'producto_id',
	(SELECT CONCAT(i.fecha, ' ', i.hora) FROM inventarios i WHERE i.id = id.inventario LIMIT 1) AS 'created_at',
	(SELECT i.updated_at FROM inventarios i WHERE i.id = id.inventario LIMIT 1) AS 'updated_at'
FROM inventarios_detalles id;

ALTER TABLE productos ADD comision_barbero INT DEFAULT 25 AFTER unidad_medida;
ALTER TABLE consumos_internos ADD cantidad INT DEFAULT 1 AFTER empleado_id;
ALTER TABLE citas ADD tarjeta TINYINT(1) DEFAULT 0 AFTER promocion;
ALTER TABLE citas ADD metodo_pago VARCHAR(10) AFTER tarjeta;
UPDATE citas SET metodo_pago = 'TARJETA' WHERE tarjeta = 1;
UPDATE citas SET metodo_pago = 'EFECTIVO' WHERE metodo_pago = 'CONTADO' OR metodo_pago IS NULL;


CREATE TABLE pago_personal (
	id INT PRIMARY KEY AUTO_INCREMENT,
	empleado INT,
	fecha DATE,
	monto DECIMAL(10, 2),
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_pago_personal_empleado FOREIGN KEY (empleado) REFERENCES empleados (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

*/




/*
SELECT
	CONCAT(emp.nombres,' ',emp.ape_paterno) AS 'barbero',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 1), 0) AS 'ene',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 2), 0) AS 'feb',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 3), 0) AS 'mar',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 4), 0) AS 'abr',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 5), 0) AS 'may',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 6), 0) AS 'jun',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 7), 0) AS 'jul',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 8), 0) AS 'ago',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 9), 0) AS 'sep',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 10), 0) AS 'oct',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 11), 0) AS 'nov',
	IFNULL((SELECT SUM(detalle.cantidad) FROM citas ci INNER JOIN citas_detalles detalle ON ci.id = detalle.cita WHERE ci.empleado = emp.id AND YEAR(ci.fecha) = 2020 AND MONTH(ci.fecha) = 12), 0) AS 'dic'
FROM empleados emp WHERE cargo = 1 ORDER BY emp.nombres LIMIT 10;
*/


/* ALTER TABLE unidades_medida ADD factor INT DEFAULT 1 AFTER unidad;

CREATE TABLE productos_presentaciones (
	id INT PRIMARY KEY,
	producto_id INT,
	unidad_medida_id INT,
	costo DECIMAL(10,2),
	precio_venta DECIMAL(10,2),
	stock INT DEFAULT 0,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT pro_pre_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE,
	CONSTRAINT pro_pre_unidad_medida FOREIGN KEY (unidad_medida_id) REFERENCES unidades_medida (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO productos_presentaciones SELECT p.id, p.id, p.unidad_medida, p.precio, p.precio, p.stock, NOW(), NOW() FROM productos p;
ALTER TABLE productos_presentaciones MODIFY id INT AUTO_INCREMENT;

ALTER TABLE consumos_internos DROP FOREIGN KEY fk_ci_productos;
ALTER TABLE ventas_detalles DROP FOREIGN KEY fk_ventas_detalles_producto;
ALTER TABLE compras_detalles DROP FOREIGN KEY fk_compras_detalles_producto;
ALTER TABLE inventarios_detalles DROP FOREIGN KEY fk_inventarios_detalles_producto;

ALTER TABLE consumos_internos ADD CONSTRAINT fk_ci_productos_pre FOREIGN KEY (producto_id) REFERENCES productos_presentaciones (id);
ALTER TABLE ventas_detalles ADD CONSTRAINT fk_ventas_detalles_producto_pre FOREIGN KEY (producto) REFERENCES productos_presentaciones (id);
ALTER TABLE compras_detalles ADD CONSTRAINT fk_compras_detalles_producto_pre FOREIGN KEY (producto) REFERENCES productos_presentaciones (id);
ALTER TABLE inventarios_detalles ADD CONSTRAINT fk_inventarios_detalles_producto_pre FOREIGN KEY (producto) REFERENCES productos_presentaciones (id);



*/



/* SELECT e.nombres AS 'item', COUNT(c.id) AS 'cantidad' FROM citas c INNER JOIN empleados e ON c.empleado = e.id WHERE MONTH(c.fecha) = 8 GROUP BY c.empleado
UNION ALL
SELECT 'TIENDA' AS 'item', COUNT(v.id) FROM ventas v WHERE MONTH(v.fecha) = 8;

SELECT e.nombres AS 'barbero', COUNT(c.id) AS 'cantidad', WEEKDAY(c.fecha) AS 'dia' FROM citas c INNER JOIN empleados e ON c.empleado = e.id WHERE (c.fecha BETWEEN '2020-08-17' AND '2020-08-23') AND WEEKDAY(c.fecha) = 0 AND c.empleado = 1; */


/*ALTER TABLE citas_detalles ADD descuento INT DEFAULT 0 AFTER precio;
ALTER TABLE ventas_detalles ADD descuento INT DEFAULT 0 AFTER precio;

CREATE TABLE clientes_recomendados (
	id INT PRIMARY KEY AUTO_INCREMENT,
	recomendado INT,
	recomendador INT,
	estado VARCHAR(10) DEFAULT 'VIGENTE',
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_cr_recomendado FOREIGN KEY (recomendado) REFERENCES clientes (id) ON DELETE CASCADE,
	CONSTRAINT fk_cr_recomendador FOREIGN KEY (recomendador) REFERENCES clientes (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE promociones
ADD visible TINYINT(1) DEFAULT 1 AFTER nombre,
ADD especifico TINYINT(1) DEFAULT 0 AFTER visible,
ADD dsct_general INT DEFAULT 0 AFTER especifico,
ADD fecha_inicio DATE AFTER dsct_general,
ADD fecha_fin DATE AFTER fecha_inicio;

INSERT INTO promociones VALUES (NULL, 'RECOMENDACIONES', 0, 1, 0, NULL, NULL, NOW(), NOW()), (NULL, 'CLIENTES VIP', 0, 1, 0, NULL, NULL, NOW(), NOW());

CREATE TABLE promociones_config (
	id VARCHAR(255) PRIMARY KEY,
	valor VARCHAR(255),
	promocion INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_promociones_config_promo FOREIGN KEY (promocion) REFERENCES promociones (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO promociones_config VALUES
('RECOM_MIN', 3, 1, NOW(), NOW()),
('VIP_MIN', 3, 2, NOW(), NOW());

CREATE TABLE promociones_servicios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	promocion INT,
	servicio INT,
	descuento INT,
	created_at DATETIME,
	updated_at DATETIME,
	CONSTRAINT fk_promociones_promocion FOREIGN KEY (promocion) REFERENCES promociones (id) ON DELETE CASCADE,
	CONSTRAINT fk_promociones_servicio FOREIGN KEY (servicio) REFERENCES servicios (id) ON DELETE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;*/

-- INSERT INTO promociones VALUES (NULL, 'CUMPLEAÑOS', 0, 1, 0, NULL, NULL, NOW(), NOW());

-- INSERT INTO promociones_config VALUES
-- ('CUMPLE_DIAS_PRE', 3, 3, NOW(), NOW());



-- PAGO A BARBERO POR DÍA
/* SELECT v.fecha, v.empleado_id, v.empleado_nombre, SUM(v.pago_barbero) AS 'pago_barbero', IFNULL((SELECT 1 FROM pago_personal pp WHERE pp.empleado = v.empleado_id AND pp.fecha = v.fecha LIMIT 1), 0) AS 'pagado'
FROM view_servicios_ventas v
WHERE v.empleado_cargo = 1 AND v.fecha = '2020-08-20'
GROUP BY v.fecha, v.empleado_id
ORDER BY v.fecha, v.empleado_nombre; */


-- TODOS LOS PAGOS A LOS BARBEROS
/* SELECT v.fecha, v.empleado_id, v.empleado_nombre, SUM(v.pago_barbero) AS 'pago_barbero', IFNULL((SELECT 1 FROM pago_personal pp WHERE pp.empleado = v.empleado_id AND pp.fecha = v.fecha LIMIT 1), 0) AS 'pagado'
FROM view_servicios_ventas v
WHERE v.empleado_cargo = 1
GROUP BY v.fecha, v.empleado_id
ORDER BY v.fecha, v.empleado_nombre; */


-- DETALLE DE SERVICIOS Y VENTAS DE BARBEROS POR DÍA
/* SELECT v.empleado_nombre, SUM(v.cantidad) AS 'cantidad', v.servicio_nombre, v.precio, v.descuento, SUM(v.importe) AS 'subtotal', v.pago_comision, SUM(v.pago_empleado) AS 'pago_empleado'
FROM view_servicios_barberos v WHERE v.fecha = '2020-08-21' GROUP BY v.empleado_id, v.servicio_id, v.precio, v.promo_id, v.descuento, v.importe; */



-- PARA DESGREGADOS EN BUSCADOR DE PRODUCTOS
/* SELECT p.nombre, um.unidad, (p.stock / um.factor) AS 'stock'
FROM productos p
INNER JOIN productos_presentaciones pp ON p.id = pp.producto_id 
INNER JOIN unidades_medida um ON pp.unidad_medida_id = um.id
ORDER BY p.nombre; */

-- ALTER TABLE productos_presentaciones ADD comision_barbero INT DEFAULT 0 AFTER precio_venta;
-- UPDATE productos_presentaciones pp INNER JOIN productos p ON pp.producto_id = p.id SET pp.comision_barbero = p.comision_barbero;
-- ALTER TABLE productos_presentaciones ADD margen_ganancia DECIMAL(10, 2) DEFAULT 0.0 AFTER precio_venta;
-- UPDATE productos_presentaciones SET margen_ganancia = (precio_venta / costo) - 1 WHERE precio_venta > 0 AND costo > 0;


-- SELECT pp.id, p.nombre, pp.precio_venta AS 'precio', um.unidad AS 'unidad_medida', (alm.cantidad / um.factor) AS 'stock'
-- FROM productos_presentaciones pp
-- INNER JOIN productos p ON pp.producto_id = p.id
-- INNER JOIN unidades_medida um ON pp.unidad_medida_id = um.id
-- INNER JOIN (
--     SELECT p.id, p.nombre, SUM(um.factor * pp.stock) AS 'cantidad'
-- 	FROM productos_presentaciones pp
-- 	INNER JOIN productos p ON pp.producto_id = p.id
-- 	INNER JOIN unidades_medida um ON pp.unidad_medida_id = um.id
-- 	GROUP BY p.id
--     ORDER BY p.nombre
-- ) alm ON p.id = alm.id
-- WHERE p.activo = 1
-- ORDER BY p.nombre, um.unidad


-- CREATE VIEW view_servicios_ventas AS
-- SELECT c.fecha, 'SERVICIOS' AS 'tipo', e.id AS 'empleado_id', CONCAT(e.nombres,' ',e.ape_paterno, ' ', e.ape_materno) AS 'empleado_nombre', e.cargo AS 'empleado_cargo', cr.cantidad, s.id AS 'concepto_id', s.nombre AS 'concepto_descripcion', NULL AS 'concepto_unidad', cr.precio, p.id AS 'promo_id', p.nombre AS 'promo_nombre', cr.descuento, cr.importe, (s.pago_comision / 100) AS 'comision_barbero', (cr.importe * (s.pago_comision / 100)) AS 'pago_barbero'
-- FROM citas c
-- INNER JOIN citas_detalles cr ON c.id = cr.cita
-- INNER JOIN servicios s ON cr.servicio = s.id
-- LEFT JOIN promociones p ON c.promocion = p.id
-- INNER JOIN empleados e ON c.empleado = e.id
-- WHERE c.estado = 'ATENDIDO'
-- UNION ALL
-- SELECT v.fecha, 'VENTAS' AS 'tipo', e.id AS 'empleado_id', CONCAT(e.nombres,' ',e.ape_paterno, ' ', e.ape_materno) AS 'empleado_nombre', e.cargo AS 'empleado_cargo', vd.cantidad, prod.id AS 'concepto_id', prod.nombre AS 'concepto_descripcion', um.unidad AS 'concepto_unidad', prod.precio, prom.id AS 'promo_id', prom.nombre AS 'promo_nombre', vd.descuento, vd.importe, (pp.comision_barbero / 100) AS 'comision_barbero', (vd.importe * (pp.comision_barbero / 100)) AS 'pago_barbero'
-- FROM ventas v
-- INNER JOIN ventas_detalles vd ON v.id = vd.venta
-- INNER JOIN productos_presentaciones pp ON vd.producto = pp.id
-- INNER JOIN productos prod ON pp.producto_id = prod.id
-- INNER JOIN unidades_medida um ON pp.unidad_medida_id = um.id
-- LEFT JOIN promociones prom ON v.promocion = prom.id
-- INNER JOIN usuarios usu ON v.created_by = usu.id
-- LEFT JOIN empleados e ON usu.empleado = e.id;

-- INSERT INTO promociones VALUES (NULL, 'TRABAJADORES', 0, 1, 0, NULL, NULL, NOW(), NOW());

-- CREATE TABLE promociones_clientes (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	promocion INT,
-- 	cliente INT,
-- 	created_at DATETIME,
-- 	updated_at DATETIME,
-- 	CONSTRAINT fk_promoc_cli_promocion FOREIGN KEY (promocion) REFERENCES promociones (id) ON DELETE CASCADE,
-- 	CONSTRAINT fk_promoc_cli_cliente FOREIGN KEY (cliente) REFERENCES clientes (id) ON DELETE CASCADE
-- ) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- CREATE TABLE clientes_vip (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	codigo VARCHAR(30),
-- 	cliente INT,
-- 	fecha_desde DATE,
-- 	fecha_hasta DATE,
-- 	activo TINYINT(1),
-- 	created_at DATETIME,
-- 	updated_at DATETIME,
-- 	CONSTRAINT fk_cli_vip_cliente FOREIGN KEY (cliente) REFERENCES clientes (id) ON DELETE CASCADE
-- ) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;


-- CREATE TABLE pago_local (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	fecha DATE,
-- 	monto DECIMAL(10,2),
-- 	created_at DATETIME,
-- 	updated_at DATETIME
-- ) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- CREATE TABLE pagos_adicionales_tipos (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	nombre VARCHAR(100),
-- 	created_at DATETIME,
-- 	updated_at DATETIME
-- ) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- CREATE TABLE pagos_adicionales (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	tipo INT,
-- 	fecha DATE,
-- 	monto DECIMAL(10,2),
-- 	created_at DATETIME,
-- 	updated_at DATETIME,
-- 	CONSTRAINT fk_pa_ad_patipo FOREIGN KEY (tipo) REFERENCES pagos_adicionales_tipos (id)
-- ) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- ALTER TABLE inventarios_detalles
-- ADD stock_prev INT DEFAULT 0 AFTER stock,
-- ADD stock_difer INT DEFAULT 0 AFTER stock_prev;

-- ALTER TABLE productos_presentaciones
-- ADD puede_asignar TINYINT(1) DEFAULT 0 AFTER stock;

-- ALTER TABLE asignaciones
-- CHANGE herramienta producto_id INT(11) NULL DEFAULT NULL;
-- ALTER TABLE asignaciones
-- DROP FOREIGN KEY fk_asignaciones_herramienta;
-- ALTER TABLE asignaciones
-- ADD CONSTRAINT fk_asignaciones_producto FOREIGN KEY (producto_id) REFERENCES productos_presentaciones(id);
-- ALTER TABLE asignaciones
-- ADD cantidad INT DEFAULT 1 AFTER empleado;

-- DROP VIEW view_kardex;
-- CREATE VIEW view_kardex AS
-- SELECT
-- 	'CONSUMO INTERNO' AS 'tipo',
-- 	ci.fecha AS 'fecha',
-- 	'-' AS 'doc',
-- 	p.nombre AS 'producto',
-- 	p.id AS 'producto_id',
-- 	ci.created_at,
-- 	ci.updated_at,
-- 	'0' AS 'entrada',
-- 	ci.cantidad * um.factor AS 'salida',
-- 	'0' AS 'saldo'
-- FROM consumos_internos ci
-- INNER JOIN productos_presentaciones pre ON ci.producto_id = pre.id
-- INNER JOIN unidades_medida um ON pre.unidad_medida_id = um.id
-- INNER JOIN productos p ON pre.producto_id = p.id
-- UNION ALL
-- SELECT
-- 	'VENTA' AS 'tipo',
-- 	v.fecha AS 'fecha',
-- 	'-' AS 'doc',
-- 	p.nombre AS 'producto',
-- 	p.id AS 'producto_id',
-- 	vd.created_at,
-- 	vd.updated_at,
-- 	'0' AS 'entrada',
-- 	vd.cantidad * um.factor AS 'salida',
-- 	'0' AS 'saldo'
-- FROM ventas_detalles vd
-- INNER JOIN ventas v ON vd.venta = v.id
-- INNER JOIN productos_presentaciones pre ON vd.producto = pre.id
-- INNER JOIN unidades_medida um ON pre.unidad_medida_id = um.id
-- INNER JOIN productos p ON pre.producto_id = p.id
-- GROUP BY v.id, v.fecha, p.id
-- UNION ALL
-- SELECT
-- 	'COMPRA' AS tipo,
-- 	c.fecha_inter AS 'fecha',
-- 	CONCAT(c.tipo_doc, ' ', c.nro_doc_pref, '-', c.nro_doc_suf) AS 'doc',
-- 	p.nombre AS 'producto',
-- 	p.id AS 'producto_id',
-- 	CONCAT(c.fecha_inter, ' ', c.hora_inter) AS 'created_at',
-- 	c.updated_at AS 'updated_at',
-- 	cd.cantidad * um.factor AS 'entrada',
-- 	'0' AS 'salida',
-- 	'0' AS 'saldo'
-- FROM compras_detalles cd
-- INNER JOIN compras c ON cd.compra = c.id
-- INNER JOIN productos_presentaciones pre ON cd.producto = pre.id
-- INNER JOIN unidades_medida um ON pre.unidad_medida_id = um.id
-- INNER JOIN productos p ON pre.producto_id = p.id
-- GROUP BY c.id, c.fecha_inter, p.id
-- UNION ALL
-- SELECT
-- 	'INVENTARIO' AS tipo,
-- 	i.fecha AS fecha,
-- 	'-' AS 'doc',
-- 	p.nombre AS 'producto',
-- 	p.id AS 'producto_id',
-- 	CONCAT(i.fecha, ' ', i.hora) AS 'created_at',
-- 	i.updated_at AS 'updated_at',
-- 	'0' AS 'entrada',
-- 	'0' AS 'salida',
-- 	id.stock * um.factor AS 'saldo'
-- FROM inventarios_detalles id
-- INNER JOIN inventarios i ON id.inventario = i.id
-- INNER JOIN productos_presentaciones pre ON id.producto = pre.id
-- INNER JOIN unidades_medida um ON pre.unidad_medida_id = um.id
-- INNER JOIN productos p ON pre.producto_id = p.id
-- GROUP BY i.id, i.fecha, p.id
-- UNION ALL
-- SELECT
-- 	'ASIGNACION' AS 'tipo',
-- 	a.fecha AS 'fecha',
-- 	'-' AS 'doc',
-- 	p.nombre AS 'producto',
-- 	p.id AS 'producto_id',
-- 	a.created_at,
-- 	a.updated_at,
-- 	'0' AS 'entrada',
-- 	a.cantidad * um.factor AS 'salida',
-- 	'0' AS 'saldo'
-- FROM asignaciones a
-- INNER JOIN productos_presentaciones pre ON a.producto_id = pre.id
-- INNER JOIN unidades_medida um ON pre.unidad_medida_id = um.id
-- INNER JOIN productos p ON pre.producto_id = p.id;

-- ALTER TABLE productos_presentaciones
-- ADD puede_vender TINYINT(1) DEFAULT 0 AFTER stock,
-- ADD puede_comprar TINYINT(1) DEFAULT 0 AFTER puede_vender,
-- ADD puede_consumir TINYINT(1) DEFAULT 0 AFTER puede_asignar;
