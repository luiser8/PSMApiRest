USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasInsertadasAllSys]    Script Date: 7/9/2021 12:14:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CuotasInsertadasAllSys]
	@Lapso VARCHAR(20) = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT DISTINCT dbo.CuotaInsertadaSys.Id_Arancel, 
						dbo.Aranceles.Descripcion,
						dbo.CuotaInsertadaSys.Monto, 
						dbo.CuotaInsertadaSys.FechaVencimiento
			FROM dbo.CuotaInsertadaSys 
					LEFT OUTER JOIN
					dbo.Aranceles ON dbo.CuotaInsertadaSys.Id_Arancel = dbo.Aranceles.Id_Arancel
					WHERE dbo.CuotaInsertadaSys.Lapso = @Lapso
						ORDER BY dbo.CuotaInsertadaSys.Id_Arancel
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END