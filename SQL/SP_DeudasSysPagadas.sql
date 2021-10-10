USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasSysPagadas]    Script Date: 21/9/2021 10:07:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeudasSysPagadas]
	@Lapso VARCHAR(20) = NULL,
	@Pagada INT = NULL,
	@Identificador VARCHAR(20) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT DISTINCT PeriodosAcademicos.Descripcion AS Lapso, a2.Fullnombre, Terceros.Identificador, Carreras.Descripcion, Aranceles.Id_Arancel,Aranceles.Descripcion AS Cuota, 
				DetallesFactura.Monto,
				   DetallesFactura.Monto AS MontoFacturas, DetallesFactura.Monto - DetallesFactura.Monto2 AS Total
				   ,DetallesFactura.Id_Inscripcion, DetallesFactura.Id_Cuenta,DetallesFactura.Abono
				
				FROM      DetallesFactura INNER JOIN
						  InscripcionesAdministrativas ON DetallesFactura.Id_Inscripcion = InscripcionesAdministrativas.Id_Inscripcion INNER JOIN
						  PeriodosAcademicos ON InscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo INNER JOIN
						  CarrerasAlumnos ON CarrerasAlumnos.Id_CarrerasAlumnos = InscripcionesAdministrativas.Id_CarrerasAlumnos INNER JOIN
						  Carreras ON Carreras.Id_Carrera = CarrerasAlumnos.Id_Carrera INNER JOIN
						  Aranceles ON Aranceles.Id_Arancel = DetallesFactura.Id_Arancel INNER JOIN
						  Alumnos ON CarrerasAlumnos.Id_Alumno = Alumnos.Id_Alumno INNER JOIN
						  Terceros ON Alumnos.Id_Tercero = Terceros.Id_Terceros INNER JOIN
						  PRD.dbo.Alumnos AS a2 ON Terceros.Identificador = a2.Cedula INNER JOIN
						  PRD.dbo.Registro_Telefonos as rt ON a2.IdAl = rt.IdIden 
							
					WHERE  [dbo].[DetallesFactura].Id_Arancel IN 
					(SELECT Aranceles.Id_Arancel FROM Aranceles WHERE 
						Aranceles.Descripcion like('%PRIMERA CUOTA%')
						OR Aranceles.Descripcion like('%SEGUNDA CUOTA%')
						OR Aranceles.Descripcion like('%TERCERA CUOTA%')
						OR Aranceles.Descripcion like('%CUARTA CUOTA%')
						OR Aranceles.Descripcion like('%QUINTA CUOTA%'))
						AND PeriodosAcademicos.Descripcion = @Lapso	
						AND [dbo].[DetallesFactura].Abono != @Pagada --AND Terceros.Identificador = '12787587'
							ORDER BY Aranceles.Id_Arancel DESC
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END