USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasSysInsert]    Script Date: 01/01/2022 17:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CuotasSysInsert]
	@CuotaId INT = NULL,
	@Tipo TINYINT = NULL,
	@Tasa FLOAT = NULL,
	@Monto FLOAT = NULL,
	@Estado TINYINT = NULL
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
					UPDATE [dbo].[CuotaSys] SET Estado = @Estado
						WHERE CuotaId = @CuotaId

					INSERT INTO [dbo].[CuotaSys](Tipo,Tasa,Monto)
					VALUES(@Tipo, @Tasa, @Monto)
				END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
