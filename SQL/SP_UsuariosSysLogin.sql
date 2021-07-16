USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosSysLogin]    Script Date: 30/6/2021 10:48:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UsuariosSysLogin]
	@Usuario VARCHAR(100) = NULL,
	@Contrasena VARCHAR(200) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT [UsuarioId],[Cedula],[Nombres],[Apellidos],[Usuario],[Contrasena],[Bloqueado],[FechaCreacion],[Estado]
				  FROM [dbo].[UsuariosSys]     		
						WHERE [Usuario] = @Usuario AND [Contrasena] = @Contrasena
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END