#1. Este es una vista basica de una tabla de empleados 
CREATE VIEW vistaEmpleados AS
SELECT ID_EMpleado, nombre, apellido, departamento FROM Empleados;

#2.Esta es una vista en la cual se visualisan los empleados pero solo los de ventas
CREATE VIEW EmpleadosVentas AS
SELECT ID_Empleado, Nombre, Apellido, Rol FROM Empleados
WHERE Rol = Ventas; 

#3. Esta vista muestra el salario promedio de los empleados que estan solamente en ventas
CREATE VIEW SalarioPromedioVentas AS
SELECT Rol, AVG(Ventas) AS Promedio FROM Empleados
GROUP BY Rol;

#4. Esta vista realiza una tabla para visualizar el salario anual de cada empleado con el rol de ventas
CREATE VIEW SalariosAnualesVentas AS
SELECT ID_Empleado, Nombre, Apellido, Salario, Salario * 12 AS PromedioAnual
FROM Empleados;

#5. Esta vista muestra la lista de ordenes con clientes
CREATE VIEW VistaOrdenesConClientes AS
SELECT o.ID_Orden, o.Fecha, c.NomCliente
FROM Ordenes AS o
JOIN Clientes c ON o.ID_Cliente = c.ID_Cliente;
