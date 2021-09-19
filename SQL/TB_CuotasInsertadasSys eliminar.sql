CREATE TABLE [dbo].[CuotaInsertadaSys]
     ( 
        CuotaInsertadaId		INT IDENTITY(1,1)           NOT NULL  , 
		Id_Arancel				INT							NOT NULL  ,
		Lapso					VARCHAR(55)					NOT NULL  ,
		Monto					FLOAT						NOT NULL  ,
		FechaVencimiento		DATETIME					NOT NULL  ,
		FechaCreacion			DATETIME					NOT NULL  	DEFAULT (GETDATE()) ,
		Estado					TINYINT						NOT NULL	DEFAULT 1,
			CONSTRAINT PK_CuotaInsertadaSys PRIMARY KEY CLUSTERED (CuotaInsertadaId ASC) ON [PRIMARY],
     )		
GO