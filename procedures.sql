#Este procedimiento registra una nueva vente en un establecimiento

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


#Este procedimiento ayuda a buscar la facturacion total de un mes en el que el usuario lo requiera
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