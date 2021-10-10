USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[TercerosSysUpdate]    Script Date: 9/10/2021 7:49:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TercerosSysUpdate]
	@Id_Terceros INT = NULL,
	@Identificador VARCHAR(20) = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY	
			IF @Id_Terceros IS NOT NULL
				BEGIN
					UPDATE [dbo].[Terceros] SET Identificador = @Identificador WHERE Id_Terceros = @Id_Terceros
				END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
