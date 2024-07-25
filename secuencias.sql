/*Muestra el nombre de la tarea, nombre y apellido del usuario
asignado, su email, la descripción del tipo de tarea y la descripción
del estado.*/
SELECT 
    tarea.nombre_tarea,
    usuario.nombre_apellido,
    usuario.email,
    tipo_tarea.Descripcion AS tipo_tarea,
    estado.Descripcion AS estado
FROM 
    tarea
JOIN 
    usuario ON tarea.usuario_asignado = usuario.idusuario
JOIN 
    tipo_tarea ON tarea.tipo_tarea = tipo_tarea.idtipo_tarea
JOIN 
    estado ON tarea.estado = estado.idestado;
/*Muestra la cantidad de tareas asignada a cada usuario (nombre y
apellido de usuario y la cantidad de tareas)*/
SELECT 
    usuario.nombre_apellido,
    COUNT(tarea.idtarea) AS cantidad_tareas
FROM 
    tarea
JOIN 
    usuario ON tarea.usuario_asignado = usuario.idusuario
GROUP BY 
    usuario.nombre_apellido;
/*En una sola consulta SQL, muestra el nombre y apellido de cada
usuario, el estado y la cantidad de tareas por estado.*/
SELECT 
    usuario.nombre_apellido,
    estado.descripcion AS estado,
    COUNT(tarea.idtarea) AS cantidad_tareas
FROM 
    tarea
JOIN 
    usuario ON tarea.usuario_asignado = usuario.idusuario
JOIN 
    estado ON tarea.estado = estado.idestado
GROUP BY 
    usuario.nombre_apellido, estado.descripcion;

/*Muestra aquellos usuarios que tienen más de 10 tareas sin finalizar.*/
SELECT 
    usuario.nombre_apellido,
    COUNT(tarea.idtarea) AS cantidad_tareas_sin_finalizar
FROM 
    tarea
JOIN 
    usuario ON tarea.usuario_asignado = usuario.idusuario
WHERE 
    tarea.tarea_finalizada = 0
GROUP BY 
    usuario.nombre_apellido
HAVING 
    COUNT(tarea.idtarea) > 10;

