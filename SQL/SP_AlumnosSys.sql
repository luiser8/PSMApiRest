USE [PRD]
GO
/****** Object:  StoredProcedure [dbo].[RecordsDA]    Script Date: 10/8/2021 10:28:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AlumnosSys]
	@Cedula VARCHAR(15) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
			BEGIN
					SELECT [dbo].[Alumnos].IdAl, [dbo].[Alumnos].Cedula, [dbo].[Alumnos].Fullnombre, ISNULL(CAST([dbo].[Alumnos].Foto AS VARBINARY(MAX)), 0) AS Foto,
							[dbo].[Alumnos].Sexo, [dbo].[Alumnos_Carreras].LapCur, [dbo].[Estados_Academicos].EstAca, [dbo].[Carreras].codcarrera
								 FROM [dbo].[Alumnos] WITH (NOLOCK)
								 INNER JOIN [dbo].[Alumnos_Carreras]  ON [dbo].[Alumnos].IdAl = [dbo].[Alumnos_Carreras].IdAl
								 LEFT OUTER JOIN [dbo].[Estados_Academicos]  ON [dbo].[Alumnos_Carreras].IdStAca = [dbo].[Estados_Academicos].IdStAca
								 LEFT OUTER JOIN [dbo].[Carreras]  ON [dbo].[Alumnos_Carreras].IdCar = [dbo].[Carreras].codcarrera
									WHERE [dbo].[Alumnos].Cedula = @Cedula
			END	
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END