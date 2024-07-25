DELIMITER //

CREATE PROCEDURE ObtenerInformacionTareas(IN p_idusuario INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE total_finalizadas INT DEFAULT 0;
    DECLARE total_no_finalizadas INT DEFAULT 0;
    DECLARE tarea_id INT;
    DECLARE tarea_nombre VARCHAR(255);
    DECLARE tarea_fecha_modificacion DATETIME;
    DECLARE tarea_id_ultima_modificacion INT;
    DECLARE tarea_ultima_modificacion DATETIME;
    DECLARE tarea_finalizada TINYINT(1);
    DECLARE cur CURSOR FOR
        SELECT idtarea, fecha_hora_modificacion, tarea_finalizada
        FROM tarea
        WHERE usuario_asignado = p_idusuario;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO tarea_id, tarea_fecha_modificacion, tarea_finalizada;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF tarea_finalizada = 1 THEN
            SET total_finalizadas = total_finalizadas + 1;
        ELSE
            SET total_no_finalizadas = total_no_finalizadas + 1;
        END IF;
        IF tarea_fecha_modificacion > tarea_ultima_modificacion THEN
            SET tarea_ultima_modificacion = tarea_fecha_modificacion;
            SET tarea_id_ultima_modificacion = tarea_id;
        END IF;
    END LOOP;
    CLOSE cur;
    SELECT total_finalizadas AS tareas_finalizadas, total_no_finalizadas AS tareas_no_finalizadas;
    SELECT tarea_id_ultima_modificacion AS id_tarea_ultima_modificacion;
END //

DELIMITER ;