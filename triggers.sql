#1. Este trigger guarda los usuarios antes de borrarlos
DELIMITER //
CREATE TRIGGER BackupEmpleado
BEFORE DELETE ON Empleados
FOR EACH ROW
BEGIN
  INSERT INTO EmpleadosBackup (ID_Empleado, Nombre, Salario )
  VALUES (OLD.ID_Empleado, OLD.Nombre, OLD.Salario, NOW());
END;
//
DELIMITER ;

#2. Este trigger guarda la fecha de cuando se actualizo la tabla empleado
DELIMITER //
CREATE TRIGGER FechaNuevoEmpleado
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
  SET NEW.FechaDeActualizacion = NOW();
END;
//
DELIMITER ;

#3. Este trigger cuenta cuantos empleados se han agregado
DELIMITER //
CREATE TRIGGER ContadorEmpleados 
AFTER INSERT ON Empleados FOR EACH ROW
BEGIN
  UPDATE Contador SET TotalEmpleados = TotalEmpleados + 1;
END;
//
DELIMITER ;

#4.Este trigger calcula el salario anual de el empleado al insertarlo
DELIMITER //
CREATE TRIGGER CalcularSalarioAnual
BEFORE INSERT ON Empleados
FOR EACH ROW
BEGIN
  SET NEW.SalarioAnual = NEW.Salario * 12;
END;
//
DELIMITER ;

#5. Este trigger muestra un mensaje si se intenta insertar un salario muy bajo
DELIMITER //
CREATE TRIGGER AntesDeInsertarEmpleado
BEFORE INSERT ON Empleados
FOR EACH ROW
BEGIN
  IF NEW.Salario < 1000 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Salario muy bajo';
  END IF;
END;
//
DELIMITER ;