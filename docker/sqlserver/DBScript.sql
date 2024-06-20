USE [master]
GO
/****** Object:  Database [AseoSas]    Script Date: 19/06/2024 8:02:58 p. m. ******/
CREATE DATABASE [AseoSas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AseoSas', FILENAME = N'/var/opt/mssql/data/AseoSas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AseoSas_log', FILENAME = N'/var/opt/mssql/data/AseoSas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AseoSas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AseoSas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AseoSas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AseoSas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AseoSas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AseoSas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AseoSas] SET ARITHABORT OFF 
GO
ALTER DATABASE [AseoSas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AseoSas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AseoSas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AseoSas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AseoSas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AseoSas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AseoSas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AseoSas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AseoSas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AseoSas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AseoSas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AseoSas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AseoSas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AseoSas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AseoSas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AseoSas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AseoSas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AseoSas] SET RECOVERY FULL 
GO
ALTER DATABASE [AseoSas] SET  MULTI_USER 
GO
ALTER DATABASE [AseoSas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AseoSas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AseoSas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AseoSas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AseoSas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AseoSas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AseoSas', N'ON'
GO
ALTER DATABASE [AseoSas] SET QUERY_STORE = ON
GO
ALTER DATABASE [AseoSas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AseoSas]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 19/06/2024 8:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK__Categori__3214EC0782EEE7A8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/06/2024 8:02:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Precio] [float] NULL,
	[Cantidad] [int] NULL,
	[CategoriaId] [int] NULL,
 CONSTRAINT [PK__Producto__3214EC079053FE69] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1003, N'Productos de Aseo Personal')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1004, N'Productos de Limpieza del Hogar')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1005, N'Productos de Cuidado del Cuerpo')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1006, N'Productos de Higiene Infantil')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1007, N'Categoría General')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1009, N'Jabón de Manos Artesanal', 37.24, 459, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1012, N'Esponja de Baño de Goma', 7.82, 1568, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1013, N'Crema Corporal de Madera', 47.01, 4679, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1015, N'Champú de Algodón Refinado', 62.64, 4189, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1016, N'Jabón de Tocador de Granito', 8.5, 8461, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1017, N'Toallas Suaves de Algodón', 99.23, 2273, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1018, N'Jabón Líquido de Manos', 36.37, 4541, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1019, N'Pañales de Goma Rústicos', 72.87, 1120, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1021, N'Esponja Facial de Acero', 4.84, 13, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1023, N'Zapatos de Baño de Granito', 58.86, 8148, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1024, N'Guantes de Plástico para Limpieza', 91.86, 376, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1025, N'Jabón de Manos de Lujo', 39.57, 9790, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1026, N'Gel de Baño de Manos', 72.36, 6704, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1028, N'Computadora de Limpieza de Madera', 4.08, 9261, 1004)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
/****** Object:  Index [IX_Productos_CategoriaId]    Script Date: 19/06/2024 8:02:59 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Productos_CategoriaId] ON [dbo].[Productos]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Categoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Categoria]
GO
USE [master]
GO
ALTER DATABASE [AseoSas] SET  READ_WRITE 
GO
