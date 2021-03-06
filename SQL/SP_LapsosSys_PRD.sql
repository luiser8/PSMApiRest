USE [PRD]
GO
/****** Object:  StoredProcedure [dbo].[LapsosSys]    Script Date: 15/7/2021 10:01:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LapsosSys]
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT Lapso, Activo, Cerrado, tipo_lapso
					FROM   Lapsos 
						WHERE Activo = 1 AND tipo_lapso = 'REGULAR'
							ORDER BY Activo DESC
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END