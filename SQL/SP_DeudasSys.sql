USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasSys]    Script Date: 15/7/2021 5:22:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeudasSys]
	@Lapso VARCHAR(20) = NULL,
	@Pagada INT = NULL,
	@Identificador VARCHAR(20) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT DISTINCT PeriodosAcademicos.Descripcion AS Lapso, a2.Fullnombre, Terceros.Identificador, Carreras.Descripcion, Aranceles.Id_Arancel,Aranceles.Descripcion AS Cuota, CuentasporCobrar.Monto,
				   CuentasporCobrar.MontoFacturas, CuentasporCobrar.Monto - CuentasporCobrar.MontoFacturas - CuentasporCobrar.MontoNotasCredito AS Total
				   ,CuentasporCobrar.MontoFacturas - 101712546.56 AS Recalculo, CuentasporCobrar.FechaVencimiento
				   ,CuentasporCobrar.Id_Inscripcion, CuentasporCobrar.Id_Cuenta,CuentasporCobrar.Pagada
				
				FROM         CuentasporCobrar INNER JOIN
						  InscripcionesAdministrativas ON CuentasporCobrar.Id_Inscripcion = InscripcionesAdministrativas.Id_Inscripcion INNER JOIN
						  PeriodosAcademicos ON InscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo INNER JOIN
						  CarrerasAlumnos ON CarrerasAlumnos.Id_CarrerasAlumnos = InscripcionesAdministrativas.Id_CarrerasAlumnos INNER JOIN
						  Carreras ON Carreras.Id_Carrera = CarrerasAlumnos.Id_Carrera INNER JOIN
						  Aranceles ON Aranceles.Id_Arancel = CuentasporCobrar.Id_Arancel INNER JOIN
						  Alumnos ON CarrerasAlumnos.Id_Alumno = Alumnos.Id_Alumno INNER JOIN
						  Terceros ON Alumnos.Id_Tercero = Terceros.Id_Terceros INNER JOIN
						  PRD.dbo.Alumnos AS a2 ON Terceros.Identificador = a2.Cedula INNER JOIN
						  PRD.dbo.Registro_Telefonos as rt ON a2.IdAl = rt.IdIden 
							
					WHERE  [dbo].[CuentasporCobrar].Id_Arancel IN 
					(SELECT Aranceles.Id_Arancel FROM Aranceles WHERE PeriodosAcademicos.Descripcion = @Lapso	
						AND ( @Identificador IS NULL OR terceros.Identificador = @Identificador ))
							ORDER BY Aranceles.Id_Arancel DESC
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END