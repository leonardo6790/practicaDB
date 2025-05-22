#este es una vista basica de una tabla de empleados 
CREATE VIEW vistaEmpleados AS
SELECT ID_EMpleado, nombre, apellido, departamento FROM Empleados;

#Esta es una vista en la cual se visualisan los empleados pero solo los de ventas
CREATE VIEW EmpleadosVentas AS
SELECT ID_Empleado, Nombre, Apellido, Rol FROM Empleados
WHERE Rol = Ventas; 

#Esta vista muestra el salario promedio de los empleados que estan solamente en ventas
CREATE VIEW SalarioPromedioVentas AS
SELECT Rol, AVG(Ventas) AS Promedio FROM Empleados
GROUP BY Rol;

#Esta vista realiza una tabla para visualizar el salario anual de cada empleado con el rol de ventas
CREATE VIEW SalariosAnualesVentas AS
SELECT ID_Empleado, Nombre, Apellido, Salario, Salario * 12 AS PromedioAnual
FROM Empleados;