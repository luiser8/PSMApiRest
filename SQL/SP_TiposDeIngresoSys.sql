USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[TiposDeIngresoSys]    Script Date: 18/9/2021 8:29:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TiposDeIngresoSys]
	@Lapso VARCHAR(25) = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @Lapso IS NOT NULL
			BEGIN
				SELECT Id_TipoIngreso, Descripcion, Activo 
						FROM TiposIngreso 
								WHERE Descripcion LIKE '%'+@Lapso+'%' 
									ORDER BY Id_TipoIngreso
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END