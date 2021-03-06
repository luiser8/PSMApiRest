USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasSysDelete]    Script Date: 14/9/2021 9:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeudasSysDelete]
	--@Id_Cuenta INT = NULL,
	@Pagada INT = NULL,
	@Id_Inscripcion INT = NULL,
	@Id_Arancel INT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY	
		/*IF NOT EXISTS(SELECT Id_Cuenta 
						FROM [dbo].[CuentasporCobrar]
						WHERE Id_Cuenta = @Id_Cuenta)
				BEGIN
					RAISERROR ('Error! No existe este id cuenta', 16, 1);
					RETURN 0;
				END	*/
		BEGIN
			IF @Pagada = 0
				BEGIN
					--DELETE FROM [dbo].[CuentasporCobrar] WHERE Id_Cuenta = @Id_Cuenta AND Pagada = @Pagada
					DELETE FROM [dbo].[CuentasporCobrar] WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel AND Pagada = @Pagada
				END
			ELSE IF @Pagada = 1 
				BEGIN
					--DELETE FROM [dbo].[CuentasporCobrar] WHERE Id_Cuenta = @Id_Cuenta AND Pagada = @Pagada
					IF EXISTS(SELECT Id_Cuenta 
						FROM [dbo].[CuentasporCobrar]
						WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel AND Pagada = @Pagada)
					BEGIN
						DELETE FROM [dbo].[CuentasporCobrar] WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel AND Pagada = @Pagada
					END
					DELETE FROM [dbo].[DetallesFactura] WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel
				END
		END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
