USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[ArancelesSys]    Script Date: 6/9/2021 6:11:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ArancelesSys]
	@Lapso VARCHAR(20) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
		SELECT DISTINCT dbo.Aranceles.Id_Arancel, 
						dbo.Aranceles.Descripcion, 
						dbo.Aranceles.Detalle, 
						ISNULL(dbo.PlantillaCuentasporCobrar.FechaVencimiento, GETDATE()) AS FechaVencimiento
			FROM dbo.Aranceles LEFT OUTER JOIN
					dbo.PlantillaCuentasporCobrar ON dbo.Aranceles.Id_Arancel = dbo.PlantillaCuentasporCobrar.Id_Arancel
				WHERE  (dbo.Aranceles.Detalle LIKE '%'+@Lapso+'%') 
								AND (dbo.Aranceles.Descripcion LIKE '%CUOTA%')
								AND (dbo.Aranceles.Descripcion NOT LIKE '%SAIA%')
					ORDER BY dbo.Aranceles.Id_Arancel
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END