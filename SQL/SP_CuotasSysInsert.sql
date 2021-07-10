USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSysInsert]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CuotasSysInsert]
	@CuotaId INT = NULL,
	@Monto FLOAT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @CuotaId IS NOT NULL AND @Monto IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[CuotaSys](CuotaId,Monto)
				VALUES(@CuotaId, @Monto)
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO