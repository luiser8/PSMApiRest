USE [PRD]
GO
/****** Object:  StoredProcedure [dbo].[LapsosSys]    Script Date: 30/6/2021 10:48:16 p. m. ******/
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
				SELECT Lapso, Activo, Cerrado, tipo_lapso
				FROM   Lapsos 
					ORDER BY Activo
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END