CREATE TABLE [dbo].[RolesSys]
     ( 
        RolId					INT IDENTITY(1,1)           NOT NULL  , 
		Rol						INT							NOT NULL  ,
		Nombre					VARCHAR(55)					NOT NULL  ,
		Bloqueado				TINYINT						NOT NULL	DEFAULT 0, --1 desbloqueado, 0 bloqueado
		FechaCreacion			DATETIME					NOT NULL  	DEFAULT (GETDATE()) ,
		Estado					TINYINT						NOT NULL	DEFAULT 1,
			CONSTRAINT PK_RolesSys PRIMARY KEY CLUSTERED (RolId ASC) ON [PRIMARY],
     )		
GO

CREATE TABLE [dbo].[UsuariosSys]
     ( 
        UsuarioId				INT IDENTITY(1,1)           NOT NULL  , 
		RolId					INT 			           NOT NULL  , 
		Cedula					INT							NOT NULL  ,
		Nombres					VARCHAR(255)				NOT NULL  ,
		Apellidos				VARCHAR(255)				NOT NULL  ,
		Usuario					VARCHAR(255)				NOT NULL  ,
		Contrasena				VARCHAR(255)				NOT NULL  ,
		Bloqueado				TINYINT						NOT NULL	DEFAULT 0, --1 desbloqueado, 0 bloqueado
		FechaCreacion			DATETIME					NOT NULL  	DEFAULT (GETDATE()) ,
		Estado					TINYINT						NOT NULL	DEFAULT 1,
			CONSTRAINT PK_UsuariosSys PRIMARY KEY CLUSTERED (UsuarioId ASC) ON [PRIMARY],
			FOREIGN KEY (RolId) REFERENCES [dbo].[RolesSys](RolId)
     )		
GO

INSERT INTO [dbo].[RolesSys]
           ([Rol]
		   ,[Nombre]
           ,[Bloqueado]
           ,[FechaCreacion]
           ,[Estado])
     VALUES
	       (1
		   ,'Root'
           ,0
           ,GETDATE()
           ,1),
           (2
		   ,'Administrador'
           ,0
           ,GETDATE()
           ,1),
		   (3
		   ,'Operador'
           ,0
           ,GETDATE()
           ,1)
GO

INSERT INTO [dbo].[UsuariosSys]
           ([RolId]
		   ,[Cedula]
		   ,[Nombres]
           ,[Apellidos]
           ,[Usuario]
           ,[Contrasena]
           ,[Bloqueado]
           ,[FechaCreacion]
           ,[Estado])
     VALUES
	       (1
		   ,11111111
		   ,'Root'
           ,'R'
           ,'root'
           ,'2d33ac2051448b9571ba75afc0b457c5'
           ,0
           ,GETDATE()
           ,1),
           (2
		   ,19651249
		   ,'Luis'
           ,'Rondón'
           ,'luis.r'
           ,'827ccb0eea8a706c4c34a16891f84e7b'
           ,0
           ,GETDATE()
           ,1),
		   (2
		   ,21221211
		   ,'Joram'
           ,'Gimenez'
           ,'joram.g'
           ,'827ccb0eea8a706c4c34a16891f84e7b'
           ,0
           ,GETDATE()
           ,1),
		   (3
		   ,8220801
		   ,'Carol'
           ,'Lopez'
           ,'carol.l'
           ,'827ccb0eea8a706c4c34a16891f84e7b'
           ,0
           ,GETDATE()
           ,1)
GO