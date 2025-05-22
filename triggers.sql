#Este trigger guarda los usuarios antes de borrarlos
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

#Este trigger guarda la fecha de cuando se actualizo la tabla empleado
DELIMITER //
CREATE TRIGGER FechaNuevoEmpleado
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
  SET NEW.FechaDeActualizacion = NOW();
END;
//
DELIMITER ;

#Este trigger cuenta cuantos empleados se han agregado
DELIMITER //
CREATE TRIGGER ContadorEmpleados 
AFTER INSERT ON Empleados FOR EACH ROW
BEGIN
  UPDATE Contador SET TotalEmpleados = TotalEmpleados + 1;
END;
//
DELIMITER ;