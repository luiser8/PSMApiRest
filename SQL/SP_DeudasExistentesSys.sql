USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasExistentesSys]    Script Date: 18/9/2021 2:44:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeudasExistentesSys]
	@Id_Inscripcion INT = NULL,
	@Id_Arancel INT = NULL
AS
SET NOCOUNT ON;
BEGIN
	BEGIN TRY
		BEGIN
			SELECT [Id_Cuenta]
			  ,[Id_Inscripcion]
			  ,[Id_Arancel]
			  ,[Pagada]
			  FROM [dbo].[CuentasporCobrar]
				WHERE Id_Inscripcion = @Id_Inscripcion AND Id_Arancel = @Id_Arancel
			END
	END TRY
		BEGIN CATCH
			SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
		END CATCH;
END