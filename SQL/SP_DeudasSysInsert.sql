USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[SaldoNegativoInsert]    Script Date: 30/6/2021 12:27:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeudasSysInsert]
	@Id_Inscripcion INT = NULL,
	@Id_Arancel INT = NULL,
	@Monto FLOAT = NULL,
	@FechaVencimiento VARCHAR(100) = NULL
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
		IF @Id_Inscripcion IS NOT NULL AND @Id_Arancel IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[CuentasporCobrar](Id_Inscripcion,Id_Arancel,Monto,FechaVencimiento)
				VALUES(@Id_Inscripcion, @Id_Arancel, @Monto, CAST(@FechaVencimiento AS DATETIME))
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END
GO