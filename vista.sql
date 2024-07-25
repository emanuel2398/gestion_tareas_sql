CREATE VIEW VistaTareasUsuario AS
SELECT
    u.idusuario,
    u.nombre_apellido AS NombreYApellido,
    t.idtarea,
    t.nombre_tarea AS NombreTarea,
    tt.descripcion AS DescripcionTipoTarea,
    e.descripcion AS DescripcionEstado,
    t.tarea_finalizada
FROM
    usuario u
JOIN
    tarea t ON u.idusuario = t.usuario_asignado
JOIN
    tipo_tarea tt ON t.tipo_tarea = tt.idtipo_tarea
JOIN
    estado e ON t.estado = e.idestado;
