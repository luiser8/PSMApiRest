USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[InscripcionesSAIASys]    Script Date: 10/12/2021 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InscripcionesSAIASys]
	@Lapso VARCHAR(25) = NULL,
	@Plan1 INT = NULL,
	@Plan2 INT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @Lapso IS NOT NULL
			BEGIN
				SELECT DISTINCT CuentasporCobrar.Id_Inscripcion
					FROM CuentasporCobrar INNER JOIN
						  InscripcionesAdministrativas ON CuentasporCobrar.Id_Inscripcion = InscripcionesAdministrativas.Id_Inscripcion INNER JOIN
						  PeriodosAcademicos ON InscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo 
							WHERE PeriodosAcademicos.Descripcion = @Lapso AND
								InscripcionesAdministrativas.Id_Plan = @Plan1 OR
								InscripcionesAdministrativas.Id_Plan = @Plan2
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END