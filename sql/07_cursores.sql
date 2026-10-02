USE bd_etn;

-- 1)

-- Faltas por cada curso

DELIMITER //
CREATE PROCEDURE Total_Faltas_Curso(IN pAnioDivision VARCHAR(5))
BEGIN
    DECLARE vFaltas FLOAT;
    DECLARE total FLOAT DEFAULT 0;
    DECLARE fin INT DEFAULT 0;
    DECLARE existe INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT Faltas FROM Alumnos WHERE Anio_Division = pAnioDivision;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    SELECT COUNT(*) INTO existe
    FROM Alumnos
    WHERE Anio_Division = pAnioDivision;

    IF existe = 0 THEN
        SELECT CONCAT('El curso ', pAnioDivision, ' no existe o no tiene alumnos.') AS Mensaje;
    ELSE
        OPEN cur;
        bucle: LOOP
            FETCH cur INTO vFaltas;
            IF fin = 1 THEN
                LEAVE bucle;
            END IF;
            SET total = total + vFaltas;
        END LOOP;
        CLOSE cur;

        SELECT total AS Total_Faltas;
    END IF;
END//
DELIMITER ;

call Total_Faltas_Curso("5B");

-- +--------------+
-- | Total_Faltas |
-- +--------------+
-- |          140 |
-- +--------------+

call Total_Faltas_Curso("5z");
-- +-------------------------------------------+
-- | Mensaje                                   |
-- +-------------------------------------------+
-- | El curso 5z no existe o no tiene alumnos. |
-- +-------------------------------------------+

-- 2)

-- Promedio general por materia

DELIMITER //
CREATE PROCEDURE Promedio_Materias()
BEGIN
    DECLARE vID_Materia INT;
    DECLARE vNombre VARCHAR(50);
    DECLARE promedio FLOAT;
    DECLARE fin INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT ID_Materia, Nombre FROM Materias;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    OPEN cur;
    bucle: LOOP
        FETCH cur INTO vID_Materia, vNombre;
        IF fin = 1 THEN
            LEAVE bucle;
        END IF;

        SELECT vNombre AS Materia, AVG(Nota) AS Promedio
        FROM Calificaciones
        WHERE ID_Materia = vID_Materia;
    END LOOP;
    CLOSE cur;
END//
DELIMITER ;

-- +-------------+----------+
-- | Materia     | Promedio |
-- +-------------+----------+
-- | Matemática  |   7.0278 |
-- +-------------+----------+
-- 1 row in set (0.004 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | Física  |   7.1000 |
-- +---------+----------+
-- 1 row in set (0.008 sec)

-- +------------+----------+
-- | Materia    | Promedio |
-- +------------+----------+
-- | Algoritmos |   7.1667 |
-- +------------+----------+
-- 1 row in set (0.012 sec)

-- +------------+----------+
-- | Materia    | Promedio |
-- +------------+----------+
-- | Suspension |   6.4333 |
-- +------------+----------+
-- 1 row in set (0.016 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | Redes   |   7.5000 |
-- +---------+----------+
-- 1 row in set (0.020 sec)

-- +---------------+----------+
-- | Materia       | Promedio |
-- +---------------+----------+
-- | Base de Datos |   8.0000 |
-- +---------------+----------+
-- 1 row in set (0.028 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | Inglés  |   6.7222 |
-- +---------+----------+
-- 1 row in set (0.031 sec)

-- +---------------------+----------+
-- | Materia             | Promedio |
-- +---------------------+----------+
-- | Lengua y Literatura |   7.0000 |
-- +---------------------+----------+
-- 1 row in set (0.035 sec)

-- +----------+----------+
-- | Materia  | Promedio |
-- +----------+----------+
-- | Historia |   7.3667 |
-- +----------+----------+
-- 1 row in set (0.041 sec)

-- +------------+----------+
-- | Materia    | Promedio |
-- +------------+----------+
-- | Geografía  |   7.8000 |
-- +------------+----------+
-- 1 row in set (0.044 sec)

-- +--------------------+----------+
-- | Materia            | Promedio |
-- +--------------------+----------+
-- | Educación Física   |   6.8333 |
-- +--------------------+----------+
-- 1 row in set (0.046 sec)

-- +----------------+----------+
-- | Materia        | Promedio |
-- +----------------+----------+
-- | Dibujo Tecnico |   7.3333 |
-- +----------------+----------+
-- 1 row in set (0.051 sec)

-- +---------------------+----------+
-- | Materia             | Promedio |
-- +---------------------+----------+
-- | Educacion Ciudadana |   7.5000 |
-- +---------------------+----------+
-- 1 row in set (0.058 sec)

-- +----------+----------+
-- | Materia  | Promedio |
-- +----------+----------+
-- | Biologia |   7.2667 |
-- +----------+----------+
-- 1 row in set (0.061 sec)

-- +------------------------+----------+
-- | Materia                | Promedio |
-- +------------------------+----------+
-- | Proyecto Informatico I |   7.6667 |
-- +------------------------+----------+
-- 1 row in set (0.064 sec)

-- +---------------------+----------+
-- | Materia             | Promedio |
-- +---------------------+----------+
-- | Educacion Artistica |   9.2500 |
-- +---------------------+----------+
-- 1 row in set (0.067 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | Quimica |   8.2778 |
-- +---------+----------+
-- 1 row in set (0.073 sec)

-- +----------------------+----------+
-- | Materia              | Promedio |
-- +----------------------+----------+
-- | Logica Computacional |   7.3333 |
-- +----------------------+----------+
-- 1 row in set (0.076 sec)

-- +------------------------------+----------+
-- | Materia                      | Promedio |
-- +------------------------------+----------+
-- | Organizacion de computadoras |   6.8333 |
-- +------------------------------+----------+
-- 1 row in set (0.079 sec)

-- +--------------------------------+----------+
-- | Materia                        | Promedio |
-- +--------------------------------+----------+
-- | Economica y Gestion de las Org |   7.5000 |
-- +--------------------------------+----------+
-- 1 row in set (0.083 sec)

-- +--------------------------------+----------+
-- | Materia                        | Promedio |
-- +--------------------------------+----------+
-- | Programacion Orientada a Objet |   7.2500 |
-- +--------------------------------+----------+
-- 1 row in set (0.089 sec)

-- +--------------------------------+----------+
-- | Materia                        | Promedio |
-- +--------------------------------+----------+
-- | Administracion y Gestion de Ba |   7.7500 |
-- +--------------------------------+----------+
-- 1 row in set (0.093 sec)

-- +----------------------+----------+
-- | Materia              | Promedio |
-- +----------------------+----------+
-- | Analisis de Sistemas |   7.8333 |
-- +----------------------+----------+
-- 1 row in set (0.097 sec)

-- +-------------------------+----------+
-- | Materia                 | Promedio |
-- +-------------------------+----------+
-- | Proyecto Informatico II |   8.4167 |
-- +-------------------------+----------+
-- 1 row in set (0.101 sec)

-- +----------------------+----------+
-- | Materia              | Promedio |
-- +----------------------+----------+
-- | Ciudadania y Trabajo |   6.4630 |
-- +----------------------+----------+
-- 1 row in set (0.107 sec)

-- +----------------------+----------+
-- | Materia              | Promedio |
-- +----------------------+----------+
-- | Ciencia y Tecnologia |   7.3333 |
-- +----------------------+----------+
-- 1 row in set (0.110 sec)

-- +--------------------------------+----------+
-- | Materia                        | Promedio |
-- +--------------------------------+----------+
-- | Gestion de los Procesos Produc |   8.1667 |
-- +--------------------------------+----------+
-- 1 row in set (0.114 sec)

-- +------------------------+----------+
-- | Materia                | Promedio |
-- +------------------------+----------+
-- | Desarrollo de Sistemas |   7.5000 |
-- +------------------------+----------+
-- 1 row in set (0.121 sec)

-- +---------------------------+----------+
-- | Materia                   | Promedio |
-- +---------------------------+----------+
-- | Programación sobre Redes  |   6.8333 |
-- +---------------------------+----------+
-- 1 row in set (0.125 sec)

-- +---------------------------------+----------+
-- | Materia                         | Promedio |
-- +---------------------------------+----------+
-- | Administración de Sistemas y d  |   7.5000 |
-- +---------------------------------+----------+
-- 1 row in set (0.129 sec)

-- +---------------+----------+
-- | Materia       | Promedio |
-- +---------------+----------+
-- | Termodinamica |   6.0000 |
-- +---------------+----------+
-- 1 row in set (0.135 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | motores |   7.8333 |
-- +---------+----------+
-- 1 row in set (0.139 sec)

-- +---------------------------+----------+
-- | Materia                   | Promedio |
-- +---------------------------+----------+
-- | Electronica del automotor |   6.5000 |
-- +---------------------------+----------+
-- 1 row in set (0.142 sec)

-- +----------+----------+
-- | Materia  | Promedio |
-- +----------+----------+
-- | Dinamica |   7.6667 |
-- +----------+----------+
-- 1 row in set (0.145 sec)

-- +----------------------+----------+
-- | Materia              | Promedio |
-- +----------------------+----------+
-- | elementos de maquina |   6.6667 |
-- +----------------------+----------+
-- 1 row in set (0.151 sec)

-- +------------------------------+----------+
-- | Materia                      | Promedio |
-- +------------------------------+----------+
-- | tecnologia de los materiales |   7.1667 |
-- +------------------------------+----------+
-- 1 row in set (0.155 sec)

-- +---------+----------+
-- | Materia | Promedio |
-- +---------+----------+
-- | Taller  |   6.2500 |
-- +---------+----------+
-- 1 row in set (0.159 sec)