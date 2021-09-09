USE [AMIGO PSM BAR]
GO
/****** Object:  StoredProcedure [dbo].[DeudasSysAllInsert]    Script Date: 19/8/2021 12:49:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeudasSysAllInsert]
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
				INSERT INTO [dbo].[CuentasporCobrar]
					(Id_Inscripcion,Id_Arancel,Id_Integrante,
						Id_fecha,Id_alumno, Monto,MontoFacturas,
						MontoNotasCredito,FechaVencimiento,Pagada,Ajuste)
				VALUES(@Id_Inscripcion, @Id_Arancel, 0, 0, 0, @Monto, 0 , 0, CAST(@FechaVencimiento AS DATETIME), 0, 0)
			END
	END TRY
	BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ERROR,
				ERROR_NUMBER() AS ERROR_NRO
	END CATCH;
END