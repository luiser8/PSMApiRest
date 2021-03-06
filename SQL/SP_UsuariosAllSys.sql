USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosAllSys]    Script Date: 8/9/2021 9:03:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UsuariosAllSys]

AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT [dbo].[UsuariosSys].[UsuarioId],[dbo].[RolesSys].RolId,[dbo].[RolesSys].Rol,
							[dbo].[UsuariosSys].[Cedula], [dbo].[UsuariosSys].[Nombres],
								[dbo].[UsuariosSys].[Apellidos], [dbo].[UsuariosSys].[Usuario],
									[dbo].[UsuariosSys].[Contrasena], [dbo].[UsuariosSys].[Bloqueado],
										[dbo].[UsuariosSys].[FechaCreacion], [dbo].[UsuariosSys].[Estado]
				  FROM [dbo].[UsuariosSys] 
						INNER JOIN [dbo].[RolesSys] ON [dbo].[UsuariosSys].RolId = [dbo].[RolesSys].RolId 	
						WHERE [dbo].[RolesSys].Rol != 1 		
							ORDER BY [dbo].[UsuariosSys].[UsuarioId]
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END