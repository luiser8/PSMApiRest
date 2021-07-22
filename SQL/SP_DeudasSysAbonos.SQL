USE [AMIGO PSM BAR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeudasSysAbonos]
	@Id_Inscripcion BIGINT = NULL,
	@Id_Arancel INT = NULL,
	@Monto FLOAT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
				SELECT TOP 1000 [Id_Detalle]
				  ,[Id_Inscripcion]
				  ,[Id_Factura]
				  ,[Id_Arancel]
				  ,[Id_Cuenta]
				  ,[Descuento]
				  ,[Abono]
				  ,[Monto2]
				  ,[Monto], @Monto - Monto AS MontoNuevo
				  ,[Cantidad]
				  ,[Anulada]
				  ,[Apuntador]
			  FROM [AMIGO PSM BAR].[dbo].[DetallesFactura]
				WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END