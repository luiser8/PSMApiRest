USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[IdInscripcionSys]    Script Date: 18/9/2021 5:40:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[IdInscripcionSys]
	@Lapso VARCHAR(20) = NULL,
	@Identificador VARCHAR(20) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT Terceros.Id_Terceros, CarrerasAlumnos.Id_Carrera, InscripcionesAdministrativas.Id_Inscripcion, 
				InscripcionesAdministrativas.Id_Plan,
				PlanesdePago.Descripcion AS PlanDePago, 
				TiposIngreso.Id_TipoIngreso, TiposIngreso.Descripcion AS TipoIngreso

				FROM Alumnos INNER JOIN
					CarrerasAlumnos ON Alumnos.Id_Alumno = CarrerasAlumnos.Id_Alumno 
					INNER JOIN
					InscripcionesAdministrativas ON CarrerasAlumnos.Id_CarrerasAlumnos = InscripcionesAdministrativas.Id_CarrerasAlumnos
					INNER JOIN 
					PeriodosAcademicos ON InscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo
					INNER JOIN
					Terceros ON Alumnos.Id_Tercero = Terceros.Id_Terceros 
					INNER JOIN
					PlanesdePago ON InscripcionesAdministrativas.Id_Plan = PlanesdePago.Id_Plan 
					INNER JOIN
					TiposIngreso ON InscripcionesAdministrativas.Id_TipoIngreso = TiposIngreso.Id_TipoIngreso

						WHERE Terceros.Identificador = @Identificador 
							AND PeriodosAcademicos.Descripcion = @Lapso
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END