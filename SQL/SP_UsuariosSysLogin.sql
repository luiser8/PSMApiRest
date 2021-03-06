USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosSysLogin]    Script Date: 7/9/2021 10:16:14 p. m. ******/
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
				SELECT [dbo].[UsuariosSys].[UsuarioId],[dbo].[RolesSys].Rol, 
							[dbo].[UsuariosSys].[Cedula], [dbo].[UsuariosSys].[Nombres],
								[dbo].[UsuariosSys].[Apellidos], [dbo].[UsuariosSys].[Usuario],
									[dbo].[UsuariosSys].[Contrasena], [dbo].[UsuariosSys].[Bloqueado],
										[dbo].[UsuariosSys].[FechaCreacion], [dbo].[UsuariosSys].[Estado]
				  FROM [dbo].[UsuariosSys] 
						INNER JOIN [dbo].[RolesSys] ON [dbo].[UsuariosSys].RolId = [dbo].[RolesSys].RolId 	 		
						WHERE [Usuario] = @Usuario AND [Contrasena] = @Contrasena
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END