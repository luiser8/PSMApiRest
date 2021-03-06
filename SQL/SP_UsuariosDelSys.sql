USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[UsuariosDelSys]    Script Date: 7/9/2021 10:16:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuariosDelSys]
	@UsuarioId INT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			IF @UsuarioId IS NOT NULL
				BEGIN
					DELETE FROM [dbo].[UsuariosSys] 		
					WHERE [dbo].[UsuariosSys].UsuarioId = @UsuarioId
				END
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END