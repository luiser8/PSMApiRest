USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSysDelete]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CuotasSysDelete]
	@CuotaId INT = NULL
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
			DELETE FROM [dbo].[CuotaSys] WHERE CuotaId = @CuotaId
		END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO