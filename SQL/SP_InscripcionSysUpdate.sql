USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[InscripcionSysUpdate]    Script Date: 18/9/2021 8:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InscripcionSysUpdate]
	@Id_Plan INT = NULL,
	@Id_Inscripcion INT = NULL,
	@Id_TipoIngreso  INT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY	
			IF @Id_Inscripcion IS NOT NULL
				BEGIN
					UPDATE [dbo].[InscripcionesAdministrativas] SET Id_Plan = @Id_Plan, 
							Id_TipoIngreso = @Id_TipoIngreso
						WHERE Id_Inscripcion = @Id_Inscripcion
				END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
