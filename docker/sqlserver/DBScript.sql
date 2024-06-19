USE [master]
GO
/****** Object:  Database [AseoSas]    Script Date: 19/06/2024 1:56:04 p. m. ******/
CREATE DATABASE [AseoSas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AseoSas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AseoSas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AseoSas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AseoSas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AseoSas] SET COMPATIBILITY_LEVEL = 160
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 19/06/2024 1:56:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/06/2024 1:56:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](80) NULL,
	[Precio] [float] NULL,
	[Cantidad] [int] NULL,
	[CategoriaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1003, N'Categoría 0')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1004, N'Categoría 1')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1005, N'Categoría 2')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1006, N'Categoría 3')
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1007, N'Categoría 4')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1009, N'Handmade Wooden Shoes', 37.239952087402344, 459, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1010, N'Practical Frozen Pants', 82.076080322265625, 9309, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1011, N'Awesome Steel Bike', 88.929008483886719, 9191, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1012, N'Awesome Rubber Soap', 7.8190960884094238, 1568, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1013, N'Rustic Wooden Cheese', 47.007350921630859, 4679, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1014, N'Ergonomic Granite Gloves', 88.045379638671875, 6499, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1015, N'Refined Cotton Cheese', 62.640625, 4189, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1016, N'Generic Granite Bacon', 8.4969205856323242, 8461, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1017, N'Handcrafted Soft Towels', 99.226226806640625, 2273, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1018, N'Sleek Wooden Soap', 36.372959136962891, 4541, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1019, N'Rustic Rubber Towels', 72.874160766601562, 1120, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1020, N'Practical Metal Chair', 25.56024169921875, 2736, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1021, N'Ergonomic Steel Hat', 4.8411445617675781, 13, 1003)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1022, N'Awesome Cotton Computer', 4.7864837646484375, 4466, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1023, N'Refined Granite Shoes', 58.859813690185547, 8148, 1006)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1024, N'Handcrafted Plastic Gloves', 91.861381530761719, 376, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1025, N'Incredible Fresh Tuna', 39.566085815429688, 9790, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1026, N'Handmade Frozen Sausages', 72.361251831054688, 6704, 1004)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1027, N'Practical Metal Tuna', 41.119026184082031, 7881, 1005)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [Cantidad], [CategoriaId]) VALUES (1028, N'Sleek Wooden Computer', 4.0815167427062988, 9261, 1004)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
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
