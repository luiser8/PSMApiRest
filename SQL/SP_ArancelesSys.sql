USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[ArancelesSys]    Script Date: 10/12/2021 22:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ArancelesSys]
	@Lapso VARCHAR(20) = NULL,
	@Tipo TINYINT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			IF @Tipo = 1
				BEGIN
				SELECT DISTINCT dbo.Aranceles.Id_Arancel, 
								dbo.Aranceles.Descripcion, 
								dbo.Aranceles.Detalle, 
								ISNULL(dbo.PlantillaCuentasporCobrar.FechaVencimiento, GETDATE()) AS FechaVencimiento
					FROM dbo.Aranceles LEFT OUTER JOIN
							dbo.PlantillaCuentasporCobrar ON dbo.Aranceles.Id_Arancel = dbo.PlantillaCuentasporCobrar.Id_Arancel
						WHERE  (dbo.Aranceles.Detalle LIKE '%'+@Lapso+'%') 
									--AND (dbo.Aranceles.Descripcion LIKE '%CUOTA%')
										--AND (dbo.Aranceles.Descripcion NOT LIKE '%SAIA%')
										AND (dbo.Aranceles.Descripcion NOT LIKE '%BECA%')
							ORDER BY dbo.Aranceles.Id_Arancel
				END
			IF @Tipo = 3
				BEGIN
				SELECT DISTINCT dbo.Aranceles.Id_Arancel, 
									dbo.Aranceles.Descripcion, 
									dbo.Aranceles.Detalle, 
									ISNULL(dbo.PlantillaCuentasporCobrar.FechaVencimiento, GETDATE()) AS FechaVencimiento
						FROM dbo.Aranceles LEFT OUTER JOIN
								dbo.PlantillaCuentasporCobrar ON dbo.Aranceles.Id_Arancel = dbo.PlantillaCuentasporCobrar.Id_Arancel
							WHERE  (dbo.Aranceles.Detalle LIKE '%'+@Lapso+'%') 
										AND (dbo.Aranceles.Descripcion LIKE '%CUOTA SAIA%')
											--AND (dbo.Aranceles.Descripcion NOT LIKE '%SAIA%')
											--AND (dbo.Aranceles.Descripcion NOT LIKE '%BECA%')
								ORDER BY dbo.Aranceles.Id_Arancel
					END
		END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END