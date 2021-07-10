USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSys]    Script Date: 10/7/2021 5:57:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CuotasSys]

AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT CuotaId, Monto, FechaCreacion, Estado
				FROM [dbo].[CuotaSys]
					WHERE Estado = 1
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END