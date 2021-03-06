USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosEditSys]    Script Date: 8/9/2021 10:56:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UsuariosEditSys]
	@UsuarioId INT = NULL,
	@Usuario VARCHAR(155) = NULL,
	@Cedula VARCHAR(25) = NULL,
	@Nombres VARCHAR(155) = NULL,
	@Apellidos VARCHAR(155) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			IF @UsuarioId IS NOT NULL
				BEGIN
					UPDATE [dbo].[UsuariosSys] 
						SET Usuario = @Usuario, Cedula = @Cedula,
							Nombres = @Nombres, Apellidos = @Apellidos
					WHERE UsuarioId = @UsuarioId
				END
		END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END