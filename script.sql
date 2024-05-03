USE [master]
GO
/****** Object:  Database [RECETAS]    Script Date: 26/09/2018 13:08:59 ******/
CREATE DATABASE [RECETAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RECETAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EFOR\MSSQL\DATA\RECETAS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RECETAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EFOR\MSSQL\DATA\RECETAS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RECETAS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RECETAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RECETAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RECETAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RECETAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RECETAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RECETAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [RECETAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RECETAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RECETAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RECETAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RECETAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RECETAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RECETAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RECETAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RECETAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RECETAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RECETAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RECETAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RECETAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RECETAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RECETAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RECETAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RECETAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RECETAS] SET RECOVERY FULL 
GO
ALTER DATABASE [RECETAS] SET  MULTI_USER 
GO
ALTER DATABASE [RECETAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RECETAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RECETAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RECETAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RECETAS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RECETAS', N'ON'
GO
ALTER DATABASE [RECETAS] SET QUERY_STORE = OFF
GO
USE [RECETAS]
GO
/****** Object:  Table [dbo].[INGREDIENTES]    Script Date: 26/09/2018 13:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGREDIENTES](
	[ID_INGREDIENTE] [int] NOT NULL,
	[NOMBRE_INGREDIENTE] [varchar](30) NOT NULL,
	[PRECIO_GRAMO] [money] NOT NULL,
	[ID_TIPO_INGREDIENTE] [int] NOT NULL,
	[ID_PAIS] [char](2) NULL,
 CONSTRAINT [PK_INGREDIENTES] PRIMARY KEY CLUSTERED 
(
	[ID_INGREDIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUCCIONES]    Script Date: 26/09/2018 13:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUCCIONES](
	[ID_RECETA] [int] NOT NULL,
	[ID_INGREDIENTE] [int] NOT NULL,
	[CANTIDAD] [int] NULL,
	[NOTA] [varchar](max) NULL,
	[ORDEN] [int] NOT NULL,
 CONSTRAINT [PK_INSTRUCCIONES] PRIMARY KEY CLUSTERED 
(
	[ID_RECETA] ASC,
	[ID_INGREDIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAISES]    Script Date: 26/09/2018 13:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAISES](
	[ID_PAIS] [char](2) NOT NULL,
	[NOMBRE_PAIS] [varchar](30) NOT NULL,
 CONSTRAINT [PK_PAISES] PRIMARY KEY CLUSTERED 
(
	[ID_PAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECETAS]    Script Date: 26/09/2018 13:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECETAS](
	[ID_RECETA] [int] NOT NULL,
	[NOMBRE_RECETA] [varchar](50) NOT NULL,
	[ID_PAIS] [char](2) NULL,
	[FECHA_CREACION] [datetime] NOT NULL,
	[DESCRIPCION] [varchar](max) NOT NULL,
 CONSTRAINT [PK_RECETAS] PRIMARY KEY CLUSTERED 
(
	[ID_RECETA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_INGREDIENTES]    Script Date: 26/09/2018 13:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_INGREDIENTES](
	[ID_TIPO_INGREDIENTE] [int] NOT NULL,
	[NOMBRE] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TIPOS_INGREDIENTES] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_INGREDIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (1, N'LECHUGA', 10.0000, 5, N'1 ')
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (2, N'TERNERA', 100.0000, 1, N'1 ')
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (3, N'CHOCOLATE', 30.0000, 6, N'2 ')
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (4, N'HARINA', 5.0000, 7, N'1 ')
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (5, N'TOMATE', 3.0000, 5, N'2 ')
INSERT [dbo].[INGREDIENTES] ([ID_INGREDIENTE], [NOMBRE_INGREDIENTE], [PRECIO_GRAMO], [ID_TIPO_INGREDIENTE], [ID_PAIS]) VALUES (6, N'PAN DE BARRA', 1.0000, 9, N'1 ')
INSERT [dbo].[INSTRUCCIONES] ([ID_RECETA], [ID_INGREDIENTE], [CANTIDAD], [NOTA], [ORDEN]) VALUES (1, 1, 2, N'CORTARLA EN TROZOS PEQUEÑOS', 1)
INSERT [dbo].[INSTRUCCIONES] ([ID_RECETA], [ID_INGREDIENTE], [CANTIDAD], [NOTA], [ORDEN]) VALUES (1, 5, 3, N'TROZEARLO EN RODAJAS PEQUEÑAS', 2)
INSERT [dbo].[INSTRUCCIONES] ([ID_RECETA], [ID_INGREDIENTE], [CANTIDAD], [NOTA], [ORDEN]) VALUES (2, 2, 1, N'FREIRLA LA TERNERA A FUEGO MEDIO', 2)
INSERT [dbo].[INSTRUCCIONES] ([ID_RECETA], [ID_INGREDIENTE], [CANTIDAD], [NOTA], [ORDEN]) VALUES (2, 6, 1, N'CORTAR 1/3 DE LA BARRA', 1)
INSERT [dbo].[INSTRUCCIONES] ([ID_RECETA], [ID_INGREDIENTE], [CANTIDAD], [NOTA], [ORDEN]) VALUES (3, 3, 1, N'DERRETIR EL CHOCOLATE', 1)
INSERT [dbo].[PAISES] ([ID_PAIS], [NOMBRE_PAIS]) VALUES (N'1 ', N'ESPAÑA')
INSERT [dbo].[PAISES] ([ID_PAIS], [NOMBRE_PAIS]) VALUES (N'2 ', N'FRANCIA')
INSERT [dbo].[PAISES] ([ID_PAIS], [NOMBRE_PAIS]) VALUES (N'3 ', N'EEUU')
INSERT [dbo].[PAISES] ([ID_PAIS], [NOMBRE_PAIS]) VALUES (N'4 ', N'ALEMANIA')
INSERT [dbo].[RECETAS] ([ID_RECETA], [NOMBRE_RECETA], [ID_PAIS], [FECHA_CREACION], [DESCRIPCION]) VALUES (1, N'ENSALADA', N'1 ', CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'ENSALADA ILUSTRADA')
INSERT [dbo].[RECETAS] ([ID_RECETA], [NOMBRE_RECETA], [ID_PAIS], [FECHA_CREACION], [DESCRIPCION]) VALUES (2, N'PEPITO TERNERA', N'1 ', CAST(N'2015-01-01T00:00:00.000' AS DateTime), N'BOCADILLO DE TERNERA')
INSERT [dbo].[RECETAS] ([ID_RECETA], [NOMBRE_RECETA], [ID_PAIS], [FECHA_CREACION], [DESCRIPCION]) VALUES (3, N'COULANT', N'2 ', CAST(N'2012-03-01T00:00:00.000' AS DateTime), N'POSTRE DE CHOCOLATE')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (1, N'CARNES')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (2, N'PESCADO')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (3, N'FRUTA')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (4, N'PASTA')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (5, N'VERDURAS')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (6, N'DULCES')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (7, N'ESPESANTES')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (8, N'LACTEOS')
INSERT [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE], [NOMBRE]) VALUES (9, N'PANES')
ALTER TABLE [dbo].[INGREDIENTES]  WITH CHECK ADD  CONSTRAINT [FK_INGREDIENTES_PAISES] FOREIGN KEY([ID_PAIS])
REFERENCES [dbo].[PAISES] ([ID_PAIS])
GO
ALTER TABLE [dbo].[INGREDIENTES] CHECK CONSTRAINT [FK_INGREDIENTES_PAISES]
GO
ALTER TABLE [dbo].[INGREDIENTES]  WITH CHECK ADD  CONSTRAINT [FK_INGREDIENTES_TIPOS_INGREDIENTES] FOREIGN KEY([ID_TIPO_INGREDIENTE])
REFERENCES [dbo].[TIPOS_INGREDIENTES] ([ID_TIPO_INGREDIENTE])
GO
ALTER TABLE [dbo].[INGREDIENTES] CHECK CONSTRAINT [FK_INGREDIENTES_TIPOS_INGREDIENTES]
GO
ALTER TABLE [dbo].[INSTRUCCIONES]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCCIONES_INGREDIENTES] FOREIGN KEY([ID_INGREDIENTE])
REFERENCES [dbo].[INGREDIENTES] ([ID_INGREDIENTE])
GO
ALTER TABLE [dbo].[INSTRUCCIONES] CHECK CONSTRAINT [FK_INSTRUCCIONES_INGREDIENTES]
GO
ALTER TABLE [dbo].[INSTRUCCIONES]  WITH CHECK ADD  CONSTRAINT [FK_INSTRUCCIONES_RECETAS] FOREIGN KEY([ID_RECETA])
REFERENCES [dbo].[RECETAS] ([ID_RECETA])
GO
ALTER TABLE [dbo].[INSTRUCCIONES] CHECK CONSTRAINT [FK_INSTRUCCIONES_RECETAS]
GO
ALTER TABLE [dbo].[RECETAS]  WITH CHECK ADD  CONSTRAINT [FK_RECETAS_PAISES] FOREIGN KEY([ID_PAIS])
REFERENCES [dbo].[PAISES] ([ID_PAIS])
GO
ALTER TABLE [dbo].[RECETAS] CHECK CONSTRAINT [FK_RECETAS_PAISES]
GO
ALTER TABLE [dbo].[INGREDIENTES]  WITH CHECK ADD  CONSTRAINT [CK_INGREDIENTES] CHECK  (([PRECIO_GRAMO]>=(0)))
GO
ALTER TABLE [dbo].[INGREDIENTES] CHECK CONSTRAINT [CK_INGREDIENTES]
GO
ALTER TABLE [dbo].[RECETAS]  WITH CHECK ADD  CONSTRAINT [CK_RECETAS] CHECK  (([FECHA_CREACION]<=getdate()))
GO
ALTER TABLE [dbo].[RECETAS] CHECK CONSTRAINT [CK_RECETAS]
GO
USE [master]
GO
ALTER DATABASE [RECETAS] SET  READ_WRITE 
GO
