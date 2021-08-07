USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[LapsosSys]    Script Date: 8/6/2021 11:22:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LapsosSys]
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT Id_Periodo, Descripcion AS Lapso, Activo, Bloqueado AS Cerrado, Tipo AS tipo_lapso
					FROM   PeriodosAcademicos 
						WHERE Activo = 1 
							ORDER BY Id_Periodo DESC
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END