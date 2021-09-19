USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[PlanesPagosSys]    Script Date: 18/9/2021 6:33:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PlanesPagosSys]
	@Lapso VARCHAR(25) = NULL,
	@Tipo TINYINT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @Lapso IS NOT NULL
			BEGIN
				IF @Tipo = 1
					BEGIN
						SELECT DISTINCT inscripcionesAdministrativas.Id_Periodo, inscripcionesAdministrativas.Id_Plan, PlanesdePago.Descripcion
						FROM inscripcionesAdministrativas INNER JOIN
							PeriodosAcademicos ON inscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo INNER JOIN
							PlanesdePago ON inscripcionesAdministrativas.Id_Plan = PlanesdePago.Id_Plan
								WHERE PeriodosAcademicos.Descripcion = @Lapso AND 
										PlanesdePago.Descripcion NOT LIKE '%BECA%' AND
										PlanesdePago.Descripcion NOT LIKE '%SAIA%'
									ORDER BY inscripcionesAdministrativas.Id_Plan
					END
				IF @Tipo = 2
					BEGIN
						SELECT DISTINCT inscripcionesAdministrativas.Id_Periodo, inscripcionesAdministrativas.Id_Plan, PlanesdePago.Descripcion
						FROM inscripcionesAdministrativas INNER JOIN
							PeriodosAcademicos ON inscripcionesAdministrativas.Id_Periodo = PeriodosAcademicos.Id_Periodo INNER JOIN
							PlanesdePago ON inscripcionesAdministrativas.Id_Plan = PlanesdePago.Id_Plan
								WHERE PeriodosAcademicos.Descripcion = @Lapso
									ORDER BY inscripcionesAdministrativas.Id_Plan
					END
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END