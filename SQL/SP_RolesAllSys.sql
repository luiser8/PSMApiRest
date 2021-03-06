USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[RolesAllSys]    Script Date: 7/9/2021 10:16:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RolesAllSys]

AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT [dbo].[RolesSys].[RolId],[dbo].[RolesSys].Rol, [dbo].[RolesSys].Nombre, 
						[dbo].[RolesSys].Bloqueado, [dbo].[RolesSys].FechaCreacion, [dbo].[RolesSys].Estado
				  FROM [dbo].[RolesSys] 
						WHERE [dbo].[RolesSys].Rol != 1			
							ORDER BY [dbo].[RolesSys].[RolId]
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END