USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosAddSys]    Script Date: 7/9/2021 10:16:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuariosAddSys]
	@RolId INT = NULL,
	@Usuario VARCHAR(155) = NULL,
	@Cedula VARCHAR(25) = NULL,
	@Nombres VARCHAR(155) = NULL,
	@Apellidos VARCHAR(155) = NULL,
	@Contrasena VARCHAR(200) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			INSERT INTO [dbo].[UsuariosSys]
				   ([RolId]
				   ,[Cedula]
				   ,[Nombres]
				   ,[Apellidos]
				   ,[Usuario]
				   ,[Contrasena]
				   ,[Bloqueado]
				   ,[FechaCreacion]
				   ,[Estado])
				VALUES(@RolId, @Cedula, @Nombres, @Apellidos, @Usuario, @Contrasena, 0, GETDATE(), 1)
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END