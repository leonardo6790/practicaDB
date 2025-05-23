#1. Funcion SUM Suma los valores de la columna precio y lo convierte en total ventas
SELECT SUM(Pagos) AS TotalVentas
FROM Ventas;

#2. UPPER Convierte toda la columna de el nombre de los clientes en mayusculas
SELECT UPPER(NomCliente) AS NomClienteMayuscula
FROM Clientes;

#3. NOW muestra la fecha y hora actual del sistema
SELECT NOW() AS fecha_actual;

#4. DATEDIFF muestra lo diferencia entre dos fechas 
SELECT DATEDIFF(NOW(), FechaNacimiento) AS DiasTranscurridos
FROM Empleados;

#5. COALSCE devuelve el valor no nulo de la tabla que se necesite
SELECT COALESCE(Telefono, 'Sin teléfono') AS Contacto
FROM Clientes;
