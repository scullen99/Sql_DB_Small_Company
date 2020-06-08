-- Queries BBDD SmallCompany --
-- Sergio Esteban Tarrero --

/*
1 - Se necesita prejubilar a dos personas: estimar las menos costosas teniendo en cuenta la edad,
a los 65 años se jubilan, y que por cada año de antigüedad se debe pagar un 15% del sueldo
bruto anual en concepto de indemnización. */

use smallcompany;

Select * From
(
	Select 
		E.ID_Empleado,
		E.Nombre,
		E.Fecha_Ingreso,
		E.Fecha_Nacimiento,
		E.Sueldo,
		
		FLOOR(DATEDIFF(NOW(), E.Fecha_Ingreso) / 365) AS 'Antiguedad',
		FLOOR(DATEDIFF(NOW(), E.Fecha_Nacimiento) / 365) AS 'Edad',
		
		E.Sueldo * 0.15 * FLOOR(DATEDIFF(NOW(), E.Fecha_Ingreso) / 365) AS 'Indemnizacion'
	FROM
		Empleados E
    
) Tabla
WHERE Tabla.Edad>=65
order by Tabla.Indemnizacion ASC
limit 2;


/*
2 - Se va a arrancar un proyecto nuevo con un presupuesto de 150.000 euros para dos años y se 
necesitan 4 personas, averiguar si se podrían cubrir los puestos con las 4 personas disponibles
que tengan el sueldo más bajo. */

use smallcompany;

Select 
	SUM(Tabla.Sueldo2Años) AS 'SumaCuatroPrimerosSueldos', 
    IF(SUM(Tabla.Sueldo2Años) <= 150000,'SePuedeCubir','NoSePuedeCubrir') AS 'Proyecto'
From
(
    SELECT 
		E.ID_Empleado,
		E.Nombre,
		E.Sueldo,
        E.Sueldo * 24 AS 'Sueldo2Años'
	FROM
		Empleados E
	ORDER BY 
		E.Sueldo ASC
	LIMIT 4
) Tabla;


/*
3 - A final de año el IPC sube un 1,2%, aplicarlo al sueldo de todos los empleados. */

UPDATE Empleados
SET Sueldo = (Sueldo * 1.012);

/*
4 - Subir el sueldo 2000 € al año a los empleados con más de 15 años de antigüedad y 
sueldo inferior a 25.000€. */

UPDATE Empleados
SET Sueldo = ((Sueldo + 2000) / 12);
WHERE Sueldo * 12 <= 25000
AND FLOOR(DATEDIFF(NOW(), Fecha_Ingreso) / 365) >= 15;

/*
5 - Hacer todas las actualizaciones necesarias para cerrar un proyecto sin despedir a nadie, y 
devolviendo el presupuesto, si quedara, al proyecto de su mismo departamento que tenga
el menor presupuesto. */

-- Hay que realizar varias actualizaciones --

use smallcompany;

UPDATE ProyectosEmpleados 
SET 
    Fecha_Desincorporacion = CURDATE()
WHERE
    ID_Proyecto = 2;

--
use smallcompany;

UPDATE Proyectos 
SET 
    Fecha_Fin_Real = CURDATE()
WHERE
    ID_Proyecto = 2;

--

use smallcompany;

Select Tabla2.* From
(
	SELECT P.ID_Proyecto, E.ID_Departamento
	FROM Proyectos P, Empleados E
	where E.ID_Empleado = P.ID_Empleado_Responsable
		AND ID_Proyecto = 2
	ORDER BY P.Presupuesto ASC
) Tabla1,

(
	SELECT P.*, E.ID_Departamento
	from Proyectos P, Empleados E
	where E.ID_Empleado = P.ID_Empleado_Responsable
) Tabla2

WHERE Tabla1.ID_Departamento = Tabla2.ID_Departamento 
	AND Tabla.Fecha_Fin_Real > NOW()
ORDER BY Tabla2.Presupuesto ASC;

--

use smallcompany;

UPDATE Proyectos 
SET Presupuesto = Presupuesto + 1000
WHERE ID_Proyecto = 1;

--

use smallcompany;

UPDATE Proyectos 
SET Presupuesto = Presupuesto - 1000
WHERE ID_Proyecto = 1;

/*
6 - Obtener la lista de proyectos con menos de 4 empleados. */

use smallcompany;

SELECT P.ID_Proyecto, P.Nombre, Tabla1.Numero_Empleados
from Proyectos P,
    (
		SELECT 
			PE.ID_Proyecto, 
			COUNT(PE.ID_Empleado) AS 'NumeroDeEmpleados'
		from ProyectosEmpleados PE
		GROUP BY PE.ID_Proyecto
    ) Tabla1
WHERE Tabla1.Numero_Empleados < 4 
		AND Tabla1.ID_Proyecto=P.ID_Proyecto;

/*
7 - Se quieren buscar cinco puestos para los empleados de un proyecto, buscar las salas en las que
sería posible ubicarles, todos en la misma sala. */

SELECT Sala, COUNT(puesto) AS 'Disponibles'
FROM SMALLCOMPANY.Edificio
WHERE Asignado = 'no'
HAVING COUNT(puesto) >= 5;

/*
8 - Obtener para cada proyecto el empleado de menos antigüedad. */

