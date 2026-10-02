USE bd_etn;

-- 1.  Promedio de calificaciones de un alumno


DELIMITER //

CREATE FUNCTION PromedioAlumno(DNI_Alumno INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);

    SELECT AVG(Nota)
    INTO promedio
    FROM Calificaciones
    WHERE DNI_A = DNI_Alumno;

    RETURN IFNULL(promedio, 0);
END//

DELIMITER ;


SELECT PromedioAlumno(28000001) AS Promedio;
-- +----------+
-- | Promedio |
-- +----------+
-- |     7.17 |
-- +----------+




-- 2. Porcentaje de asistencia de un alumno


DELIMITER //

CREATE FUNCTION PorcentajeAsistencia(DNI_Alumno INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE faltas INT;
    DECLARE porcentaje DECIMAL(5,2);

    SELECT Faltas
    INTO faltas
    FROM Alumnos
    WHERE DNI = DNI_Alumno;

    SET porcentaje = 100 - ((faltas / 20) * 100);

    RETURN IFNULL(porcentaje, 100);
END//

DELIMITER ;


SELECT PorcentajeAsistencia(28000001) AS Asistencia;
-- +------------+
-- | Asistencia |
-- +------------+
-- |     100.00 |
-- +------------+




-- 3.  Cantidad de alumnos por curso

DELIMITER //

CREATE FUNCTION CantidadAlumnosCurso(Curso VARCHAR(5))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cant INT;

    SELECT COUNT(*)
    INTO cant
    FROM Alumnos
    WHERE Anio_Division = Curso;

    RETURN cant;
END//

DELIMITER ;


SELECT CantidadAlumnosCurso('1A') AS Total_Alumnos;
-- +---------------+
-- | Total_Alumnos |
-- +---------------+
-- |            12 |
-- +---------------+
