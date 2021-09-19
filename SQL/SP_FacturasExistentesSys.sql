USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[FacturasExistentesSys]    Script Date: 14/9/2021 8:31:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FacturasExistentesSys]
	@Id_Inscripcion INT = NULL,
	@Id_Arancel INT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT DetallesFactura.Id_Factura
				FROM DetallesFactura
						WHERE DetallesFactura.Id_Inscripcion = @Id_Inscripcion
							AND DetallesFactura.Id_Arancel = @Id_Arancel
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END