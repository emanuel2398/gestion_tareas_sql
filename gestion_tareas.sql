/*Crear BD*/
CREATE DATABASE gestion_tareas;
USE gestion_tareas;
/*Crear Tabla usuarios*/
CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    calle VARCHAR(255) NOT NULL,
    altura INT NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(255) NOT NULL,
    provincia VARCHAR(255) NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE estado (
    idestado INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1
);
CREATE TABLE tipo_tarea (
    idtipo_tarea INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE tarea (
    idtarea INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tarea VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    tipo_tarea INT NOT NULL,
    fecha_hora_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_modificacion DATETIME NOT NULL ON UPDATE CURRENT_TIMESTAMP,
    estado INT NOT NULL,
    usuario_asignado INT,
    tarea_finalizada TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (tipo_tarea) REFERENCES tipo_tarea(idtipo_tarea),
    FOREIGN KEY (estado) REFERENCES estado(idestado),
    FOREIGN KEY (usuario_asignado) REFERENCES usuario(idusuario)
);

