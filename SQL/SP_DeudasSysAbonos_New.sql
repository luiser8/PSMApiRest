USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasSysAbonos]    Script Date: 7/28/2021 12:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeudasSysAbonos]
	@Id_Inscripcion BIGINT = NULL,
	@Id_Arancel INT = NULL,
	@Abono INT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT Id_Inscripcion,  Id_Arancel
						FROM [dbo].[DetallesFactura]
						WHERE Id_Inscripcion = @Id_Inscripcion 
							AND Id_Arancel = @Id_Arancel 
							AND Abono = @Abono)
				BEGIN
					--RAISERROR ('Error! No existe', 16, 1);
					RETURN 0;
				END	
		BEGIN
			SELECT 
				  /*[Id_Detalle]
				  ,[Id_Inscripcion]
				  ,[Id_Factura]
				  ,[Id_Arancel]
				  ,[Id_Cuenta]
				  ,[Descuento]
				  ,[Abono]
				  ,[Monto2]
				  ,[Monto]
				  ,[Cantidad]
				  ,[Anulada]
				  ,[Apuntador]*/
				  CAST(SUM(CONVERT(FLOAT, [Monto])) AS FLOAT) AS Monto
			  FROM [dbo].[DetallesFactura]
				WHERE Id_Inscripcion = @Id_Inscripcion AND
					Id_Arancel = @Id_Arancel AND
						Abono = @Abono
						/*GROUP BY  [Id_Detalle]
								  ,[Id_Inscripcion]
								  ,[Id_Factura]
								  ,[Id_Arancel]
								  ,[Id_Cuenta]
								  ,[Descuento]
								  ,[Abono]
								  ,[Monto2]
								  ,[Monto]
								  ,[Cantidad]
								  ,[Anulada]
								  ,[Apuntador]*/
		END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END