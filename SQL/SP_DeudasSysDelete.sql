USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[SaldoNegativoDelete]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeudasSysDelete]
	@Id_Cuenta INT = NULL,
	@Pagada INT = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY	
		IF NOT EXISTS(SELECT Id_Cuenta 
						FROM [dbo].[CuentasporCobrar]
						WHERE Id_Cuenta = @Id_Cuenta)
				BEGIN
					RAISERROR ('Error! No existe este id cuenta', 16, 1);
					RETURN 1;
				END	
		BEGIN
			DELETE FROM [dbo].[CuentasporCobrar] WHERE Id_Cuenta = @Id_Cuenta AND Pagada = @Pagada
		END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO