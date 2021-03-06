USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[FacturasSys]    Script Date: 14/9/2021 8:31:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FacturasSys]
	@Id_Inscripcion INT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT DetallesFactura.Id_Factura, DetallesFactura.Id_Detalle, 
					DetallesFactura.Id_Arancel, DetallesFactura.Id_Inscripcion,
						DetallesFactura.Monto, DetallesFactura.Abono, 
							DetallesFactura.Anulada, Aranceles.Descripcion, Facturas.Hora
				FROM DetallesFactura INNER JOIN
					Facturas ON DetallesFactura.Id_Factura = Facturas.Id_Factura INNER JOIN 
					Aranceles ON DetallesFactura.Id_Arancel = Aranceles.Id_Arancel
						WHERE DetallesFactura.Id_Inscripcion = @Id_Inscripcion
							ORDER BY DetallesFactura.Id_Factura
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END