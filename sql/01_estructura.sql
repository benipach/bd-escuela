DROP DATABASE IF EXISTS bd_etn;
CREATE DATABASE bd_etn;
USE bd_etn;

CREATE TABLE IF NOT EXISTS Directivos (

    DNI INT PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono INT NOT NULL

);

CREATE TABLE IF NOT EXISTS Docentes (

    DNI INT PRIMARY KEY,
    DNI_DIR INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono INT NOT NULL,

    FOREIGN KEY (DNI_DIR) REFERENCES Directivos(DNI)

);

CREATE TABLE IF NOT EXISTS Preceptores (

    DNI INT PRIMARY KEY,
    DNI_DIR INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono INT NOT NULL,

    FOREIGN KEY (DNI_DIR) REFERENCES Directivos(DNI)

);

CREATE TABLE IF NOT EXISTS Cursos (

    DNI_P INT NOT NULL,
    Anio_Division VARCHAR(5) PRIMARY KEY,
    Especialidad ENUM('Automotor', 'Computación'),
    Turno ENUM('Mañana', 'Tarde', 'Noche'),

    FOREIGN KEY (DNI_P) REFERENCES Preceptores(DNI)

);

CREATE TABLE IF NOT EXISTS Materias (

    ID_Materia INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL

);

CREATE TABLE IF NOT EXISTS Asignacion_Docentes (

    Anio_Division VARCHAR(5) NOT NULL,
    DNI_D INT NOT NULL,
    ID_Materia INT NOT NULL,

    PRIMARY KEY (Anio_Division, DNI_D, ID_Materia),
    FOREIGN KEY (Anio_Division) REFERENCES Cursos(Anio_Division),
    FOREIGN KEY (DNI_D) REFERENCES Docentes(DNI),
    FOREIGN KEY (ID_Materia) REFERENCES Materias(ID_Materia)

);

CREATE TABLE IF NOT EXISTS Alumnos (

    DNI INT PRIMARY KEY,
    Anio_Division VARCHAR(5) NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Telefono INT,
    Direccion VARCHAR(50),
    Fecha_Nacimiento DATE NOT NULL,
    Faltas FLOAT NOT NULL,

    FOREIGN KEY (Anio_Division) REFERENCES Cursos(Anio_Division)

);

CREATE TABLE IF NOT EXISTS Calificaciones (

    DNI_A INT NOT NULL,
    ID_Materia INT NOT NULL,
    Nota INT NOT NULL,
    Cuatrimestre INT NOT NULL,

    PRIMARY KEY (DNI_A, ID_Materia, Cuatrimestre),
    FOREIGN KEY (DNI_A) REFERENCES Alumnos(DNI),
    FOREIGN KEY (ID_Materia) REFERENCES Materias(ID_Materia)

);

