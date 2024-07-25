USE gestion_tareas;

/* Insertar datos en la tabla usuario */
INSERT INTO usuario (nombre_apellido, email, calle, altura, codigo_postal, localidad, provincia, activo) VALUES
('Juan Perez', 'juan.perez@example.com', 'Av. Siempre Viva', 742, '1001', 'Springfield', 'Buenos Aires', 1),
('Maria Gomez', 'maria.gomez@example.com', 'Calle Falsa', 123, '2002', 'Shelbyville', 'Buenos Aires', 1),
('Carlos Martinez', 'carlos.martinez@example.com', 'Calle Principal', 456, '3003', 'Capital Federal', 'Buenos Aires', 1),
('Ana Lopez', 'ana.lopez@example.com', 'Avenida del Libertador', 789, '4004', 'La Plata', 'Buenos Aires', 1),
('Luis Rodriguez', 'luis.rodriguez@example.com', 'Calle Corrientes', 101, '5005', 'Rosario', 'Santa Fe', 1),
('Sofia Fernandez', 'sofia.fernandez@example.com', 'Calle Santa Fe', 202, '6006', 'Mar del Plata', 'Buenos Aires', 1);

INSERT INTO estado (descripcion, activo) VALUES
('Pendiente', 1),
('En Progreso', 1),
('Completado', 1),
('Cancelado', 1),
('En Espera', 1),
('Revisado', 1);

INSERT INTO tipo_tarea (descripcion, activo) VALUES
('Desarrollo', 1),
('Mantenimiento', 1),
('Documentación', 1),
('Pruebas', 1),
('Revisión', 1),
('Soporte', 1);

INSERT INTO tarea (nombre_tarea, descripcion, tipo_tarea, estado, usuario_asignado) VALUES
('Desarrollar módulo de autenticación', 'Implementar el sistema de login y registro', 1, 2, 1),
('Actualizar documentación técnica', 'Agregar secciones sobre la nueva API', 3, 1, 2),
('Realizar pruebas unitarias', 'Testear los nuevos endpoints', 4, 2, 3),
('Revisión de código', 'Revisar el código para optimizar el rendimiento', 5, 5, 4),
('Soporte a usuarios', 'Ayudar a los usuarios con problemas técnicos', 6, 1, 6),
('Mantenimiento del servidor', 'Actualizar el sistema operativo y paquetes', 2, 2, 5);
