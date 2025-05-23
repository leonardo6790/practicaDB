#1. Este procedimiento registra una nueva vente en un establecimiento

USE `ejemplos`;
DROP procedure IF EXISTS `NuevaVenta`;

DELIMITER $$
USE `ejemplos`$$
CREATE PROCEDURE `NuevaVenta` (
	IN Cliente int(100),
    IN Producto int,
    IN ValorPago int
)
BEGIN
INSERT INTO Ventas(ID_Cliente,ID_Producto,ValorPago)VALUES(Cliente,Producto,ValorPago);
END$$

DELIMITER ;


#2. Este procedimiento ayuda a buscar la facturacion total de un mes en el que el usuario lo requiera
USE `ejemplos`;
DROP procedure IF EXISTS `ReporteMes`;

DELIMITER $$
USE `ejemplos`$$
CREATE PROCEDURE `ReporteMes` (
	IN Mes INT,
	IN Año INT
)
BEGIN
SELECT ID_Cliente, sum(Total) AS TotalVentas FROM Ventas
WHERE MONTH(Fecha) = p_Mes AND YEAR(Fecha) = Año
GROUP BY ID_Cliente;
END$$

DELIMITER ;

#3. Procedimiento sencillo el cual muestra todos los clientes
USE `ejemplos`;
DROP procedure IF EXISTS `MostrarClientes`;

DELIMITER $$
USE `ejemplos`$$
CREATE PROCEDURE `MostrarClientes` ()
BEGIN
	SELECT * FROM Clientes;
END$$

DELIMITER ;

DELIMITER //

#4. PrOcedimiento para insertar un nuevo empleado
USE `ejemplos`;
DROP procedure IF EXISTS `NuevoEmpleado`;

DELIMITER $$
USE `ejemplos`$$
CREATE PROCEDURE NuevoEmpleado (
	IN Nombre VARCHAR(25),
    IN Nombre2 VARCHAR(25), 
    IN Apellidos VARCHAR(50),
    IN Rol VARCHAR(25),
    IN Salario DOUBLE
)
BEGIN
	INSERT INTO Empleados(Nombre, Puesto, Nombre2, Apellidos, Salario) VALUES (Nombre1, Nombre2, Apellidos, Puesto, Salario);
END$$

DELIMITER ;

#5. Procedimiento para actualizar el stock solo si hay unidades nuevas
USE `ejemplos`;
DROP procedure IF EXISTS `ActualizarStock`;

DELIMITER $$
USE `ejemplos`$$
CREATE PROCEDURE `ActualizarStock` (
	IN ProductoID INT,
    IN UnidadesNuevas INT
)
BEGIN
IF unidadesNuevas > 0 THEN
UPDATE productos
SET stock = stock + unidadesNuevas
WHERE id = productoID; 
ELSE SELECT 'Las unidades nuevas deben ser mayores que cero' AS mensaje;
END IF;
END$$

DELIMITER ;
