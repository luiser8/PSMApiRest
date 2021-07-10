USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSysUpdate]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CuotasSysUpdate]
	@CuotaId INT = NULL,
	@Monto FLOAT = NULL,
	@Estado BIT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY	
		IF NOT EXISTS(SELECT CuotaId 
						FROM [dbo].[CuotaSys]
						WHERE CuotaId = @CuotaId)
				BEGIN
					RAISERROR ('Error! No existe este id cuenta', 16, 1);
					RETURN 1;
				END	
		BEGIN
				BEGIN
					UPDATE [dbo].[CuotaSys] SET Monto = @Monto, Estado = @Estado
						WHERE CuotaId = @CuotaId
				END
		END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO