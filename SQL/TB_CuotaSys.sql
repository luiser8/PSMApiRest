CREATE TABLE [dbo].[CuotaSys]
     ( 
        CuotaId					INT IDENTITY(1,1)           NOT NULL  , 
		Tipo					TINYINT						NOT NULL  , --1 todos. 2 saia inter
		Tasa					FLOAT						NOT NULL  ,
		Monto					FLOAT						NOT NULL  ,
		FechaCreacion			DATETIME					NOT NULL  	DEFAULT (GETDATE()) ,
		Estado					TINYINT						NOT NULL	DEFAULT 1,
			CONSTRAINT PK_CuotaSys PRIMARY KEY CLUSTERED (CuotaId ASC) ON [PRIMARY],
     )		
GO