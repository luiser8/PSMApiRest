USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[CuotasInsertadaSys]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CuotasInsertadaSys]
	@Id_Arancel INT = NULL,
	@Lapso VARCHAR(55) = NULL,
	@Monto FLOAT = NULL,
	@FechaVencimiento VARCHAR(100) = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @Id_Arancel IS NOT NULL AND @Lapso IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[CuotaInsertadaSys]
					(Id_Arancel, Lapso, Monto, FechaVencimiento)
				VALUES(@Id_Arancel, @Lapso, @Monto, CAST(@FechaVencimiento AS DATETIME))
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO