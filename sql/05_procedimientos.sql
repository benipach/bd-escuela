USE bd_etn;

-- 1)

-- Mostrar notas de la materia por alumno

DELIMITER //
CREATE PROCEDURE Notas_Alumno(IN pDNI INT)
BEGIN
    SELECT m.Nombre AS Materia, c.Cuatrimestre, c.Nota
    FROM Calificaciones c
    INNER JOIN Materias m ON c.ID_Materia = m.ID_Materia
    WHERE c.DNI_A = pDNI
    ORDER BY c.Cuatrimestre, m.Nombre;
END //
DELIMITER ;

call Notas_Alumno(28000022);

-- +----------------------+--------------+------+
-- | Materia              | Cuatrimestre | Nota |
-- +----------------------+--------------+------+
-- | Biologia             |            1 |    8 |
-- | Ciudadania y Trabajo |            1 |    9 |
-- | Dibujo Tecnico       |            1 |    5 |
-- | Educacion Artistica  |            1 |    7 |
-- | Educación Física   |            1 |    6 |
-- | Física              |            1 |    8 |
-- | Geografía           |            1 |    7 |
-- | Historia             |            1 |    6 |
-- | Inglés              |            1 |    9 |
-- | Matemática          |            1 |    7 |
-- | Quimica              |            1 |   10 |
-- | Taller               |            1 |    6 |
-- | Biologia             |            2 |    6 |
-- | Ciudadania y Trabajo |            2 |    8 |
-- | Dibujo Tecnico       |            2 |    7 |
-- | Educacion Artistica  |            2 |   10 |
-- | Educación Física   |            2 |    5 |
-- | Física              |            2 |    7 |
-- | Geografía           |            2 |    8 |
-- | Historia             |            2 |    9 |
-- | Inglés              |            2 |    6 |
-- | Matemática          |            2 |    8 |
-- | Quimica              |            2 |    9 |
-- | Taller               |            2 |    5 |
-- +----------------------+--------------+------+

-- 2)

-- Insertar Calificacion

DELIMITER //
CREATE PROCEDURE Insertar_Calificacion(IN pDNI_A INT, IN pID_Materia INT, IN pNota INT, IN pCuatrimestre INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Alumnos WHERE DNI = pDNI_A) THEN
        SELECT 'El alumno con ese DNI no existe.' AS Mensaje;

    ELSEIF NOT EXISTS (SELECT 1 FROM Materias WHERE ID_Materia = pID_Materia) THEN
        SELECT 'La materia especificada no existe.' AS Mensaje;

    ELSEIF pNota < 1 OR pNota > 10 THEN
        SELECT 'Error: La nota debe estar entre 1 y 10.' AS Mensaje;

    ELSEIF pCuatrimestre NOT IN (1, 2) THEN
        SELECT 'El cuatrimestre debe ser 1 o 2.' AS Mensaje;

    ELSE

       INSERT INTO Calificaciones (DNI_A, ID_Materia, Nota, Cuatrimestre)
        VALUES (pDNI_A, pID_Materia, pNota, pCuatrimestre)
        ON DUPLICATE KEY UPDATE Nota = VALUES(Nota), Cuatrimestre = VALUES(Cuatrimestre);

        SELECT 'Calificación insertada correctamente.' AS Mensaje;
    END IF;
END //
DELIMITER ;

call Insertar_Calificacion(28000001, 14, 4, 2);
-- +---------------------------------------+
-- | Mensaje                               |
-- +---------------------------------------+
-- 
-- +---------------------------------------+

call Notas_Alumno(28000001);

-- +----------------------+--------------+------+
-- | Materia              | Cuatrimestre | Nota |
-- +----------------------+--------------+------+
-- | Biologia             |            1 |    7 |
-- | Ciudadania y Trabajo |            1 |    4 |
-- | Dibujo Tecnico       |            1 |    9 |
-- | Educacion Artistica  |            1 |   10 |
-- | Educación Física   |            1 |    6 |
-- | Física              |            1 |    7 |
-- | Geografía           |            1 |    8 |
-- | Historia             |            1 |    5 |
-- | Inglés              |            1 |    5 |
-- | Matemática          |            1 |    6 |
-- | Quimica              |            1 |    9 |
-- | Taller               |            1 |    6 |
-- | Biologia             |            2 |    4 |
-- | Ciudadania y Trabajo |            2 |    5 |
-- | Dibujo Tecnico       |            2 |    6 |
-- | Educacion Artistica  |            2 |    9 |
-- | Educación Física   |            2 |    7 |
-- | Física              |            2 |    8 |
-- | Geografía           |            2 |    9 |
-- | Historia             |            2 |    8 |
-- | Inglés              |            2 |    6 |
-- | Matemática          |            2 |    7 |
-- | Quimica              |            2 |   10 |
-- | Taller               |            2 |    7 |
-- +----------------------+--------------+------+

-- 3)

-- Mostrar Preceptores por cursos

DELIMITER //
CREATE PROCEDURE Listar_Cursos_Preceptores()
BEGIN
    SELECT c.Anio_Division, c.Especialidad, c.Turno,
           p.Nombre AS Nombre_Preceptor, p.Apellido AS Apellido_Preceptor
    FROM Cursos c
    INNER JOIN Preceptores p ON c.DNI_P = p.DNI
    ORDER BY c.Anio_Division;
END //
DELIMITER ;

call Listar_Cursos_Preceptores();

-- +---------------+--------------+---------+------------------+--------------------+
-- | Anio_Division | Especialidad | Turno   | Nombre_Preceptor | Apellido_Preceptor |
-- +---------------+--------------+---------+------------------+--------------------+
-- | 1A            | NULL         | Mañana | Ana              | López             |
-- | 1B            | NULL         | Mañana | Pedro            | Ramírez           |
-- | 1C            | NULL         | Tarde   | Sofía           | Méndez            |
-- | 1D            | NULL         | Tarde   | Ignacio          | Sosa               |
-- | 1E            | NULL         | Noche   | Valeria          | Ruiz               |
-- | 1F            | NULL         | Noche   | Matías          | Santos             |
-- | 2A            | NULL         | Mañana | Bruno            | Fernández         |
-- | 2B            | NULL         | Mañana | Camila           | Paz                |
-- | 2C            | NULL         | Tarde   | Martina          | Vega               |
-- | 2D            | NULL         | Tarde   | Franco           | Delgado            |
-- | 2E            | NULL         | Noche   | Paula            | Herrera            |
-- | 2F            | NULL         | Noche   | Nicolás         | Moreno             |
-- | 3A            | Computación | Mañana | Lucas            | Martínez          |
-- | 3B            | Automotor    | Mañana | Valeria          | Ruiz               |
-- | 3C            | Computación | Tarde   | Renata           | Quiroz             |
-- | 3D            | Automotor    | Tarde   | Ana              | López             |
-- | 3E            | Computación | Noche   | Julieta          | Luna               |
-- | 3F            | Automotor    | Noche   | Sofía           | Méndez            |
-- | 4A            | Computación | Mañana | Matías          | Santos             |
-- | 4B            | Automotor    | Mañana | Paula            | Herrera            |
-- | 4C            | Computación | Tarde   | Pedro            | Ramírez           |
-- | 4D            | Automotor    | Tarde   | Bruno            | Fernández         |
-- | 4E            | Computación | Noche   | Ignacio          | Sosa               |
-- | 4F            | Automotor    | Noche   | Martina          | Vega               |
-- | 5A            | Computación | Mañana | Nicolás         | Moreno             |
-- | 5B            | Automotor    | Mañana | Julieta          | Luna               |
-- | 5C            | Computación | Tarde   | Camila           | Paz                |
-- | 5D            | Automotor    | Tarde   | Lucas            | Martínez          |
-- | 5E            | Computación | Noche   | Franco           | Delgado            |
-- | 5F            | Automotor    | Noche   | Renata           | Quiroz             |
-- | 6A            | Computación | Mañana | Franco           | Delgado            |
-- | 6B            | Automotor    | Mañana | Franco           | Delgado            |
-- | 6C            | Computación | Tarde   | Franco           | Delgado            |
-- | 6D            | Automotor    | Tarde   | Franco           | Delgado            |
-- | 6E            | Computación | Noche   | Ana              | López             |
-- | 6F            | Automotor    | Noche   | Ana              | López             |
-- +---------------+--------------+---------+------------------+--------------------+

-- 4)

-- Mostrar docentes y sus directivos a cargo

DELIMITER //
CREATE PROCEDURE Listar_Docentes_Directivos()
BEGIN
    SELECT d.DNI, d.Nombre, d.Apellido, d.Cargo, dir.Nombre AS Nombre_Directivo, dir.Apellido AS Apellido_Directivo
    FROM Docentes d
    INNER JOIN Directivos dir ON d.DNI_DIR = dir.DNI
    ORDER BY dir.Apellido, d.Apellido;
END //
DELIMITER ;

call Listar_Docentes_Directivos();

-- +----------+-----------+------------+-----------+------------------+--------------------+
-- | DNI      | Nombre    | Apellido   | Cargo     | Nombre_Directivo | Apellido_Directivo |
-- +----------+-----------+------------+-----------+------------------+--------------------+
-- | 39182745 | Simón    | Peralta    | Profesor  | Gustavo          | Fernández         |
-- | 38472913 | Florencia | Silva      | Profesora | Gustavo          | Fernández         |
-- | 42173508 | Camila    | Escobar    | Profesora | María           | González          |
-- | 38451978 | Laura     | Fernández | Profesora | María           | González          |
-- | 40918362 | Sofía    | Quiroga    | Profesora | María           | González          |
-- | 37482915 | Tomás    | Villalba   | Profesor  | María           | González          |
-- | 27569413 | Juan      | Martínez  | Profesor  | Andrés          | López             |
-- | 39567238 | Facundo   | Mendoza    | Profesor  | Andrés          | López             |
-- | 39982731 | Bianca    | Navarro    | Suplente  | Andrés          | López             |
-- | 40712389 | Renata    | Salas      | Profesora | Andrés          | López             |
-- | 41782345 | Julián   | Benítez   | Profesor  | Laura            | Martínez          |
-- | 39456128 | Martina   | López     | Suplente  | Laura            | Martínez          |
-- | 40983214 | Mateo     | Sosa       | Profesor  | Laura            | Martínez          |
-- | 39827654 | Nicolás  | Aguirre    | Profesor  | Carlos           | Pérez             |
-- | 40567891 | Lucía    | Moreno     | Profesora | Carlos           | Pérez             |
-- | 41367289 | Valentina | Rivas      | Profesora | Carlos           | Pérez             |
-- | 39328174 | Lorenzo   | Giménez   | Profesor  | Silvia           | Ramírez           |
-- | 41283746 | Benjamín | Luna       | Profesor  | Silvia           | Ramírez           |
-- | 41876532 | Catalina  | Paz        | Profesora | Silvia           | Ramírez           |
-- | 40129837 | Agustina  | Cabrera    | Suplente  | Jorge            | Suárez            |
-- | 42839475 | Lautaro   | Ruiz       | Profesor  | Jorge            | Suárez            |
-- | 38679124 | Julieta   | Vega       | Profesora | Jorge            | Suárez            |
-- | 40291834 | Milagros  | Bustamante | Profesora | Patricia         | Torres             |
-- | 41628734 | Dante     | Ibarra     | Profesor  | Patricia         | Torres             |
-- | 41028374 | Elías    | Ojeda      | Profesor  | Patricia         | Torres             |
-- +----------+-----------+------------+-----------+------------------+--------------------+

