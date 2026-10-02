USE bd_etn;

-- USUARIO ALUMNO
-- Cambios: Se elimina el acceso general, y se otorga acceso restringido
CREATE USER 'alumno'@'localhost';

GRANT SELECT ON bd_etn.Materias TO 'alumno'@'localhost'; -- Otorga el permiso de lectura en la tabla Materias. Esto permite al alumno ver los nombres de las asignaturas que se dictan en la escuela.
GRANT SELECT ON bd_etn.Calificaciones TO 'alumno'@'localhost'; -- Otorga el permiso de lectura en la tabla Calificaciones. Este es un permiso que permite al alumno consultar sus propias notas y su rendimiento académico cuatrimestral.
GRANT SELECT ON bd_etn.Cursos TO 'alumno'@'localhost';-- Otorga el permiso de lectura en la tabla Cursos. Esto le permite al alumno confirmar información de su curso.
GRANT SELECT ON bd_etn.Alumnos TO 'alumno'@'localhost';-- Otorga el permiso de lectura en la tabla Alumnos. Este permiso base le permite consultar sus propios datos personales.

SHOW GRANTS FOR 'alumno'@'localhost';
-- +-------------------------------------------------------------------+
-- | Grants for alumno@localhost                                       |
-- +-------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `alumno`@`localhost`                        |
-- | GRANT SELECT ON `bd_etn`.`calificaciones` TO `alumno`@`localhost` |
-- | GRANT SELECT ON `bd_etn`.`materias` TO `alumno`@`localhost`       |
-- | GRANT SELECT ON `bd_etn`.`alumnos` TO `alumno`@`localhost`        |
-- | GRANT SELECT ON `bd_etn`.`cursos` TO `alumno`@`localhost`         |
-- +-------------------------------------------------------------------+
FLUSH PRIVILEGES;

-- USUARIO PROFESOR

CREATE USER 'profesor'@'localhost' IDENTIFIED BY '35ethola';    

GRANT SELECT ON bd_etn.* TO 'profesor'@'localhost';-- Otorga el permiso de lectura sobre toda la base de datos.  Esto permite al profesor ver listas de alumnos, cursos, materias y otra información general de la escuela.
GRANT UPDATE, DELETE, INSERT ON bd_etn.Calificaciones TO 'profesor'@'localhost';-- Otorga permisos de modificación total exclusivamente en la tabla Calificaciones. Esto es esencial para que el profesor pueda ingresar, corregir y eliminar las notas de sus alumnos.

SHOW GRANTS FOR 'profesor'@'localhost';
-- +-----------------------------------------------------------------------------------------------------------------+
-- | Grants for profesor@localhost                                                                                   |
-- +-----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `profesor`@`localhost` IDENTIFIED BY PASSWORD '*64F8DDE759FC00DAA3782BD6C6C0EC72D65A99C4' |
-- | GRANT SELECT ON `bd_etn`.* TO `profesor`@`localhost`                                                            |
-- | GRANT INSERT, UPDATE, DELETE ON `bd_etn`.`calificaciones` TO `profesor`@`localhost`                             |
-- +-----------------------------------------------------------------------------------------------------------------+

FLUSH PRIVILEGES;


-- USUARIO DIRECTIVO

CREATE USER 'directivo'@'localhost' IDENTIFIED BY 'directivos35';

GRANT ALL PRIVILEGES ON bd_etn.* TO 'directivo'@'localhost';-- Otorga control total sobre toda la base de datos. Esto es necesario para que el Directivo pueda administrar la escuela a nivel de sistema.

SHOW GRANTS FOR 'directivo'@'localhost';
-- +------------------------------------------------------------------------------------------------------------------+
-- | Grants for directivo@localhost                                                                                   |
-- +------------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `directivo`@`localhost` IDENTIFIED BY PASSWORD '*6FF9847527B6A5EE16E0FDC387213DA2624D0B91' |
-- | GRANT ALL PRIVILEGES ON `bd_etn`.* TO `directivo`@`localhost`                                                    |
-- +------------------------------------------------------------------------------------------------------------------+

FLUSH PRIVILEGES;

-- SELECT

SELECT USER FROM mysql.user;
-- +-----------+
-- | User      |
-- +-----------+
-- | root      |
-- | root      |
-- | alumno    |
-- | directivo |
-- | pma       |
-- | profesor  |
-- | root      |
-- +-----------+

