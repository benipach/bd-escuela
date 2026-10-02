USE bd_etn;

-- Triggers

-- 1. Que las notas sean entre 1 y 10.

DELIMITER //
CREATE TRIGGER trg_check_notas
BEFORE INSERT ON Calificaciones
FOR EACH ROW
BEGIN
    IF NEW.Nota < 1 OR NEW.Nota > 10 THEN
        SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = 'Valor fuera de rango: la nota debe estar entre 1 y 10';
    END IF;
END//
DELIMITER ;

-- ERROR 1644 (22003): Valor fuera de rango: la nota debe estar entre 1 y 10


-- 2. Que las faltas no sean negativas.

DELIMITER //
CREATE TRIGGER trg_check_faltas
BEFORE INSERT ON Alumnos
FOR EACH ROW
BEGIN
    IF NEW.Faltas < 0 THEN
        SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = 'Valor fuera de rango: el numero de faltas no pueden ser negativas';
    END IF;
END//
DELIMITER ;

-- ERROR 1644 (22003): Valor fuera de rango: el numero de faltas no pueden ser negativas