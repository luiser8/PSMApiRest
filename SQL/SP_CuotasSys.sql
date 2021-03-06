USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSys]    Script Date: 01/01/2022 11:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CuotasSys]
	@Tipo TINYINT = NULL,
	@Estado TINYINT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			IF @Tipo != 0
				BEGIN
					SELECT CuotaId, Monto, Tipo, Tasa, FechaCreacion, Estado
						FROM [dbo].[CuotaSys]
							WHERE Tipo = @Tipo AND Estado = @Estado
								ORDER BY Tipo
				END
			IF @Tipo = 0
				BEGIN
					SELECT CuotaId, Monto, Tipo, Tasa, FechaCreacion, Estado
						FROM [dbo].[CuotaSys]
							WHERE Estado = @Estado
								ORDER BY Tipo
				END
		END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END