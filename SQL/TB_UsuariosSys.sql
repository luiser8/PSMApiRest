CREATE TABLE [dbo].[UsuariosSys]
     ( 
        UsuarioId				INT IDENTITY(1,1)           NOT NULL  , 
		Cedula					INT							NOT NULL  ,
		Nombres					VARCHAR(255)				NOT NULL  ,
		Apellidos				VARCHAR(255)				NOT NULL  ,
		Usuario					VARCHAR(255)				NOT NULL  ,
		Contrasena				VARCHAR(255)				NOT NULL  ,
		Bloqueado				TINYINT						NOT NULL	DEFAULT 0, --1 desbloqueado, 0 bloqueado
		FechaCreacion			DATETIME					NOT NULL  	DEFAULT (GETDATE()) ,
		Estado					TINYINT						NOT NULL	DEFAULT 1,
			CONSTRAINT PK_UsuariosSys PRIMARY KEY CLUSTERED (UsuarioId ASC) ON [PRIMARY],
     )		
GO

INSERT INTO [dbo].[UsuariosSys]
           ([Cedula]
		   ,[Nombres]
           ,[Apellidos]
           ,[Usuario]
           ,[Contrasena]
           ,[Bloqueado]
           ,[FechaCreacion]
           ,[Estado])
     VALUES
           (19651249
		   ,'Luis'
           ,'Rondón'
           ,'luis.r'
           ,'827ccb0eea8a706c4c34a16891f84e7b'
           ,0
           ,GETDATE()
           ,1)
GO