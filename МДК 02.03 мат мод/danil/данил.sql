USE [Trade]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK__User__UserRole__398D8EEE]
GO
ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_PickupPoint]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PickupPoint]') AND type in (N'U'))
DROP TABLE [dbo].[PickupPoint]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderProduct]') AND type in (N'U'))
DROP TABLE [dbo].[OrderProduct]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02.06.2024 21:19:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 02.06.2024 21:19:50 ******/
DROP DATABASE [Trade]
GO
/****** Object:  Database [Trade]    Script Date: 02.06.2024 21:19:50 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[DateOrders] [date] NULL,
	[NameClient] [varchar](100) NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK__Order__C3905BAFA61348B3] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Count] [varchar](50) NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] NOT NULL,
	[address] [varchar](100) NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NULL,
	[ProductPhoto] [nvarchar](50) NULL,
	[ProductManufacturer] [nvarchar](max) NULL,
	[ProductCost] [decimal](19, 4) NULL,
	[ProductDiscountAmount] [int] NULL,
	[ProductQuantityInStock] [int] NULL,
	[ProductStatus] [nvarchar](max) NULL,
	[Unit] [nvarchar](50) NULL,
	[MaxDiscountAmount] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[CountInPack] [nvarchar](50) NULL,
	[MinCount] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__2EA7DCD5712109A4] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02.06.2024 21:19:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (1, N'Новый ', CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-03' AS Date), N'', N'211')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (2, N'Завершен', CAST(N'2022-05-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04' AS Date), N'Никитин Артур Алексеевич', N'212')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (3, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), 5, CAST(N'2022-05-05' AS Date), N'', N'213')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (4, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 6, CAST(N'2022-05-06' AS Date), N'', N'214')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (5, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), 7, CAST(N'2022-05-07' AS Date), N'Киселев Максим Сергеевич', N'215')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (6, N'Новый ', CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, CAST(N'2022-05-08' AS Date), N'Борисов Тимур Егорович', N'216')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (7, N'Новый ', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 11, CAST(N'2022-05-09' AS Date), N'Климов Арсений Тимурович', N'217')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (8, N'Новый ', CAST(N'2022-05-16T00:00:00.000' AS DateTime), 20, CAST(N'2022-05-10' AS Date), N'', N'218')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (9, N'Завершен', CAST(N'2022-05-17T00:00:00.000' AS DateTime), 30, CAST(N'2022-05-11' AS Date), N'', N'219')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (10, N'Новый ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 33, CAST(N'2022-05-12' AS Date), N'', N'220')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (11, N'Новый', CAST(N'2024-03-08T17:45:43.047' AS DateTime), 2, CAST(N'2024-03-05' AS Date), N'Лихачёв Онисим Гордеевич', N'509')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (12, N'Новый', CAST(N'2024-03-08T21:10:00.760' AS DateTime), 1, CAST(N'2024-03-05' AS Date), N'Рожков Тихон Владиславович', N'238')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (13, N'Новый', CAST(N'2024-03-09T22:18:36.033' AS DateTime), 2, CAST(N'2024-03-06' AS Date), N'Лихачёв Онисим Гордеевич', N'844')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (14, N'Новый', CAST(N'2024-03-16T19:53:06.200' AS DateTime), 8, CAST(N'2024-03-13' AS Date), N'ьь ь', N'591')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (15, N'Новый', CAST(N'2024-03-16T20:55:11.307' AS DateTime), 1, CAST(N'2024-03-13' AS Date), N'ьь ь', N'377')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (16, N'Новый', CAST(N'2024-04-12T14:06:16.240' AS DateTime), 3, CAST(N'2024-04-06' AS Date), N'Костин Геласий Германнович', N'730')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (17, N'Новый', CAST(N'2024-04-14T22:31:55.223' AS DateTime), 2, CAST(N'2024-04-11' AS Date), N'ьь ь', N'224')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (18, N'Новый', CAST(N'2024-04-15T14:55:10.553' AS DateTime), 3, CAST(N'2024-04-12' AS Date), N'ьь ь', N'913')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (19, N'Новый', CAST(N'2024-04-15T19:04:57.617' AS DateTime), 2, CAST(N'2024-04-12' AS Date), N'hjhh', N'853')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (20, N'Новый', CAST(N'2024-04-22T15:39:02.440' AS DateTime), 3, CAST(N'2024-04-19' AS Date), N'ьь ь', N'237')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (21, N'Новый', CAST(N'2024-04-26T09:21:12.237' AS DateTime), 10, CAST(N'2024-04-23' AS Date), N'ьь ь', N'634')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (22, N'Новый', CAST(N'2024-04-29T09:27:03.523' AS DateTime), 3, CAST(N'2024-04-23' AS Date), N'ьь ь', N'136')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (23, N'Новый', CAST(N'2024-04-26T09:43:10.403' AS DateTime), 3, CAST(N'2024-04-23' AS Date), N'ьь ь', N'114')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (24, N'Новый', CAST(N'2024-04-29T18:25:40.667' AS DateTime), 4, CAST(N'2024-04-23' AS Date), N'ьь ь', N'622')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (25, N'Новый', CAST(N'2024-04-29T18:43:31.857' AS DateTime), 3, CAST(N'2024-04-23' AS Date), N'ьь ь', N'807')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (26, N'Новый', CAST(N'2024-04-30T12:21:49.870' AS DateTime), 3, CAST(N'2024-04-24' AS Date), N'ьь ь', N'679')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (27, N'Новый', CAST(N'2024-04-29T11:32:40.917' AS DateTime), 1, CAST(N'2024-04-26' AS Date), N'ьь ь', N'209')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (28, N'Новый', CAST(N'2024-05-08T21:31:40.733' AS DateTime), 2, CAST(N'2024-05-02' AS Date), N'у', N'779')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (29, N'Новый', CAST(N'2024-05-30T11:00:06.957' AS DateTime), 3, CAST(N'2024-05-24' AS Date), N'ьь ь', N'201')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [DateOrders], [NameClient], [Code]) VALUES (30, N'Новый', CAST(N'2024-05-30T11:22:38.593' AS DateTime), 4, CAST(N'2024-05-24' AS Date), N'ьь ь', N'305')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (1, N'Z472R4', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (2, N'A782R4', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (3, N'K849L6', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (4, N'Z469T7', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (5, N'S037R9', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (6, N'D799T6', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (7, N'P023T2', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (8, N'K702L6', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (9, N'L802Y5', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (10, N' M562Y7', NULL)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (11, N' M562Y7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (12, N'Z469T7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (13, N' M562Y7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (14, N' M562Y7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (15, N'K702L6', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (16, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (17, N'B702T6', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (18, N'7654', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (20, N'Z782T5', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (21, N'E679R3', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (21, N'E932T8', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (22, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (23, N' M562Y7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (24, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (24, N'7654', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (25, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (26, N' M562Y7', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (26, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (27, N'2323', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (28, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (29, N'1212', N'1')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Count]) VALUES (30, N'1212', N'1')
GO
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (1, N'344288, г. Вологда, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (2, N'614164, г.Вологда,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (3, N'394242, г. Вологда, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (4, N'660540, г. Вологда, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (5, N'125837, г. Вологда, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (6, N'125703, г. Вологда, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (7, N'625283, г. Вологда, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (8, N'614611, г. Вологда, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (9, N'454311, г.Вологда, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (10, N'660007, г.Вологда, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (11, N'603036, г. Вологда, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (12, N'450983, г.Вологда, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (13, N'394782, г. Вологда, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (14, N'603002, г. Вологда, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (15, N'450558, г. Вологда, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (16, N'394060, г.Вологда, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (17, N'410661, г. Вологда, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (18, N'625590, г. Вологда, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (19, N'625683, г. Вологда, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (20, N'400562, г. Вологда, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (21, N'614510, г. Вологда, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (22, N'410542, г. Вологда, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (23, N'620839, г. Вологда, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (24, N'443890, г. Вологда, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (25, N'603379, г. Вологда, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (26, N'603721, г. Вологда, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (27, N'410172, г. Вологда, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (28, N'420151, г. Вологда, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (29, N'125061, г. Вологда, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (30, N'630370, г. Вологда, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (31, N'614753, г. Вологда, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (32, N'426030, г. Вологда, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (33, N'450375, г. Вологда ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (34, N'625560, г. Вологда, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (35, N'630201, г. Вологда, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([ID], [address]) VALUES (36, N'190949, г. Вологда, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N' M562Y7', N'Мультиметр', N'Мультиметр JTC 1227A автомобильный', N'Аксессуары', N'', N'JTC', CAST(14200.0000 AS Decimal(19, 4)), 4, 4, N'шт.', N'5', N'30', NULL, NULL, N'1')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'1212', N'арина', N'2', N'Автосервис', N'A782R4.jpg', N'asd', CAST(1234567890.0000 AS Decimal(19, 4)), 20, 2, N'asd', N'шт', N'20', N'я', N'7', N'7')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'2323', N'bmv x3', N'3', N'Зарядные устройства', NULL, N'asd', CAST(45.0000 AS Decimal(19, 4)), 5, 40, N'asd', N'шт', N'3', N'у', N'4', N'4')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'7654', N'рр', N'в', N'Автосервис', N'O393R4.jpeg', N'asd', CAST(1000000000000.0000 AS Decimal(19, 4)), 6, 6, N'asd', N'6', N'6', N'6', N'6', N'6')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'A782R4', N'Аккумулятор', N'Аккумулятор автомобильный BIG FIGHTER 55р', N'Автозапчасти', N'A782R4.jpg', N'BIG FIGHTER', CAST(4500.0000 AS Decimal(19, 4)), 4, 4, N'шт.', N'30', N'35', NULL, NULL, N'1')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'B702T6', N'Домкрат', N'Домкрат ALCA 436000', N'Автосервис', N'', N'ALCA', CAST(2700.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'10', N'25', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'D374E4', N'Съемник подшипников', N'Съемник AIRLINE AT-GP2-05', N'Съемники подшипников', N'D374E4.jpeg', N'AIRLINE', CAST(1400.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'20', N'15', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'd4555', N'ggggggggggggg', N'666', N'Аксессуары', NULL, N'asd', CAST(555.0000 AS Decimal(19, 4)), 6, 56, N'asd', N'g', N'9', N'g', N'6', N'4')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'D799T6', N'Съемник подшипников', N'Съемник для подшипников JTC 9000', N'Съемники подшипников', N'', N'JTC', CAST(1800.0000 AS Decimal(19, 4)), 4, 3, N'шт.', N'25', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'E679R3', N'Автошампунь', N'Автошампунь GRASS 800026 Active Foam Truck', N'Автосервис', N'', N'GRASS', CAST(4000.0000 AS Decimal(19, 4)), 2, 5, N'шт.', N'15', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'E932T8', N'Полироль', N'Полироль GRASS 125101 Black Brilliance', N'Автосервис', N'', N'GRASS', CAST(2100.0000 AS Decimal(19, 4)), 3, 4, N'шт.', N'25', N'25', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'F026R4', N'Антифриз', N'Антифриз сине-зеленый MOBIL ANTIFREEZE EXTRA', N'Автосервис', N'', N'MOBIL', CAST(530.0000 AS Decimal(19, 4)), 5, 6, N'шт.', N'15', N'25', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'F2345', N'3443', N'232323', N'Автозапчасти', NULL, N'asd', CAST(23232.0000 AS Decimal(19, 4)), 23, 34, N'asd', N'g', N'23', N'23', N'23', N'23')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'F938T5', N'Антифриз', N'Антифриз красный TCL LLC01212', N'Автосервис', N'', N'TCL', CAST(1200.0000 AS Decimal(19, 4)), 5, 6, N'шт.', N'15', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'fdghh', N'bmv x3', N'3', N'Зарядные устройства', NULL, N'asd', CAST(0.0000 AS Decimal(19, 4)), 3, 0, N'asd', N'шт', N'3', N'у', N'4', N'4')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'H572T6', N'Парктроник', N'Парктроник AIRLINE APS-8L-02', N'Автозапчасти', N'', N'AIRLINE', CAST(2900.0000 AS Decimal(19, 4)), 5, 4, N'шт.', N'15', N'30', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K702L6', N'Ключ', N'Ключ JONNESWAY W233032 (30 / 32 мм)', N'Ручные инструменты', N'', N'JONNESWAY', CAST(1600.0000 AS Decimal(19, 4)), 5, 3, N'шт.', N'15', N'30', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K830R4', N'Колпак для колеса', N'Колпак для колеса AIRLINE Супер Астра R16 серебристый 2шт', N'Автозапчасти', N'K830R4.jpg', N'AIRLINE', CAST(915.0000 AS Decimal(19, 4)), 5, 5, N'уп.', N'20', N'5', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K849L6', N'Набор ключей', N'Набор ключей накидных STV 00-00010990 6шт.', N'Ручные инструменты', N'K849L6.jpeg', N'STV', CAST(780.0000 AS Decimal(19, 4)), 5, 6, N'уп.', N'15', N'5', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'L802Y5', N'Лопата', N'Лопата саперная AIRLINE AB-S-03', N'Аксессуары', N'', N'AIRLINE', CAST(870.0000 AS Decimal(19, 4)), 8, 4, N'шт.', N'5', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'O393R4', N'Отвертка', N'Отвертка JONNESWAY D04P2100', N'Ручные инструменты', N'O393R4.jpeg', N'JONNESWAY', CAST(460.0000 AS Decimal(19, 4)), 7, 3, N'шт.', N'15', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P023T2', N'Провода прикуривания', N'Провода прикуривания в сумке SMART CABLE 700 4,5м', N'Автозапчасти', N'', N'SMART', CAST(3400.0000 AS Decimal(19, 4)), 2, 5, N'шт.', N'20', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P307T5', N'Провода прикуривания', N'Провода прикуривания в сумке EXPERT 400А 2,5м', N'Автозапчасти', N'', N'EXPERT', CAST(700.0000 AS Decimal(19, 4)), 3, 6, N'шт.', N'10', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P439R4', N'Пассатижи', N'Пассатижи HAMMER Flex 601-050 160 мм (6 дюймов)', N'Аксессуары', N'', N'HAMMER', CAST(310.0000 AS Decimal(19, 4)), 5, 7, N'шт.', N'5', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Q11111', N'asd', N'asd', N'Аксессуары', N'A782R4.jpg', N'asd', CAST(123.2112 AS Decimal(19, 4)), 12, 12, N'asd', N'asd', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Q123', N'123', N'sadfasdf', N'Аксессуары', N'D374E4.jpeg', N'asd', CAST(120.0000 AS Decimal(19, 4)), 12, 123, N'asd', N'123', N'12', N'12', N'123', N'12')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Q123456', N'FGDHF', N'12122', N'Автозапчасти', NULL, N'asd', CAST(121212.0000 AS Decimal(19, 4)), 12, 12, N'asd', N'F', N'12', N'12', N'12', N'12')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S021R4', N'Адаптер для щеток', N'Адаптер для щеток стеклоочистителя ALCA Top Lock A/C блистер 2 шт', N'Автозапчасти', N'', N'ALCA', CAST(200.0000 AS Decimal(19, 4)), 3, 4, N'уп.', N'3', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S037R9', N'Щетка', N'Щётка AIRLINE AB-H-03', N'Аксессуары', N'S037R9.jpeg', N'AIRLINE', CAST(740.0000 AS Decimal(19, 4)), 5, 3, N'шт.', N'25', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S625T5', N'Щетка', N'щетка стеклоочистителя ALCA Start 16"/40см каркасная', N'Автозапчасти', N'', N'ALCA', CAST(249.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'20', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S826R4', N'Щетка', N'Щетка стеклоочистителя ALCA Super flat 19"/48см бескаркасная', N'Автозапчасти', N'', N'ALCA', CAST(530.0000 AS Decimal(19, 4)), 5, 5, N'шт.', N'2', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S983R4', N'Щетка', N'Щетка с/о BOSCH ECO 65C 650мм каркасная', N'Автозапчасти', N'S983R4.jpg', N'BOSCH', CAST(500.0000 AS Decimal(19, 4)), 6, 3, N'шт.', N'15', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'T589T6', N'Термометр', N'Термометр ALCA 577000', N'Аксессуары', N'', N'ALCA', CAST(1400.0000 AS Decimal(19, 4)), 6, 6, N'шт.', N'10', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'V892T6', N'Свеча зажигания', N'Свеча зажигания CHAMPION IGP F7RTC', N'Автозапчасти', N'', N'CHAMPION', CAST(130.0000 AS Decimal(19, 4)), 5, 8, N'шт.', N'5', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z326T9', N'Зарядное устройство', N'Устройство зарядное EXPERT ЗУ-300 6/12В 3,8А', N'Зарядные устройства', N'', N'EXPERT', CAST(2400.0000 AS Decimal(19, 4)), 4, 7, N'шт.', N'15', N'10', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z374R3', N'Зарядное устройство', N'Зарядное устройство AIRLINE ACH-15A-08', N'Зарядные устройства', N'Z374R3.jpeg', N'AIRLINE', CAST(4600.0000 AS Decimal(19, 4)), 3, 6, N'шт.', N'25', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z469T7', N'Устройство пуско-зарядное', N'Устройство пуско-зарядное AIRLINE 12В 8000мАч 350А', N'Зарядные устройства', N'Z469T7.jpg', N'AIRLINE', CAST(4000.0000 AS Decimal(19, 4)), 4, 5, N'шт.', N'25', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z472R4', N'Зарядное устройство', N'Зарядное устройство KOLNER KBCН 4', N'Зарядные устройства', N'Z472R4.jpeg', N'KOLNER', CAST(1250.0000 AS Decimal(19, 4)), 6, 3, N'шт.', N'30', N'25', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z782T5', N'Зажим', N'Зажим AIRLINE SA-400-P', N'Зарядные устройства', N'', N'AIRLINE', CAST(290.0000 AS Decimal(19, 4)), 5, 4, N'уп.', N'25', N'20', NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'ак3', N'як', N'4', N'Автозапчасти', NULL, N'asd', CAST(4.0000 AS Decimal(19, 4)), 3, 23, N'asd', N'к', N'3', N'в', N'4', N'в')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Лихачёв ', N'Онисим', N'Гордеевич', N'loginDErfg2018', N'5ovb1N', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Рожков ', N'Тихон', N'Владиславович', N'loginDEymi2018', N'nR0+pI', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Павлов ', N'Максим', N'Фёдорович', N'loginDEnbi2018', N'Ed*JQP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Шилов ', N'Матвей', N'Альбертович', N'loginDEhvg2018', N'SaHv6w', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Шаров ', N'Федосей', N'Юрьевич', N'loginDEmbg2018', N'Fou{d3', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Медведева ', N'Пелагея', N'Мартыновна', N'loginDEubq2018', N'{jzW2v', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Медведев ', N'Григорий', N'Агафонович', N'loginDEosl2018', N'O3O}we', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Соколова ', N'Марфа', N'Всеволодовна', N'loginDErog2018', N'&W4Wtq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Петухова ', N'Василиса', N'Еремеевна', N'loginDEsku2018', N'fUldqr', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Беспалова ', N'Галина', N'Дмитрьевна', N'loginDEatu2018', N'}nGbhZ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Андреева ', N'Александра', N'Владиславовна', N'loginDEhks2018', N'XV|+W4', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Селезнёв ', N'Федот', N'Валентинович', N'loginDEzbl2018', N'ih4xKJ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Вишняков ', N'Сергей', N'Иванович', N'loginDEoxa2018', N'mL+97r', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Зимин ', N'Василий', N'Русланович', N'loginDEssm2018', N'oBrTGr', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Фадеева ', N'Регина', N'Онисимовна', N'loginDEzxw2018', N'pX&AsH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Артемьев ', N'Варлам', N'Альбертович', N'loginDEkzo2018', N'n3es*S', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Щербаков ', N'Лукий', N'Онисимович', N'loginDEdaq2018', N'dWsvBS', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Горбунов ', N'Матвей', N'Сергеевич', N'loginDEnjd2018', N'0&3HHn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Зиновьева ', N'Варвара', N'Антоновна', N'loginDEluw2018', N'S3wj{I', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Фролов ', N'Юрий', N'Варламович', N'loginDEole2018', N'p+kvb6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Ларионова ', N'Василиса', N'Владимировна', N'loginDEebl2018', N'gffg123', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Силин ', N'Вячеслав', N'Валерьевич', N'loginDEfug2018', N'z|6cXV', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Герасимова ', N'Феврония', N'Валерьяновна', N'loginDEgfx2018', N'GFSZAB', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Пономарёва ', N'Вера', N'Руслановна', N'loginDEtww2018', N'4icZTg', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Медведьев ', N'Руслан', N'Богданович', N'loginDElyc2018', N'regr23', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Владимиров ', N'Геласий', N'Пантелеймонович', N'loginDEcbd2018', N'GwG*p6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Корнилов ', N'Иван', N'Игоревич', N'loginDEcay2018', N'ehtG*H', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Иван ', N'Вячеславовна', N'', N'loginDEmel2018', N'8zmoSV', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Ермакова ', N'Зинаида', N'Данииловна', N'loginDEhqk2018', N'KBc4A+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Пахомова ', N'Элеонора', N'Григорьевна', N'loginDEkny2018', N'v2+4Ro', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Гущина ', N'Вера', N'Ефимовна', N'loginDEmda2018', N'sG+NF0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Полякова ', N'Антонина', N'Андреевна', N'loginDEhhf2018', N'd+GS5y', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Зуева ', N'Марина', N'Ильяовна', N'loginDEilc2018', N'eyRufZ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Агафонов ', N'Агафон', N'Максимович', N'loginDEwfv2018', N'ZSUiGT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Архипов ', N'Агафон', N'Игоревич', N'loginDEozn2018', N'nndP3Q', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Лапина ', N'Иванна', N'Аристарховна', N'loginDEbtr2018', N'FdZrI3', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Маслова ', N'Мария', N'Аристарховна', N'loginDEcuf2018', N'aOdzYf', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Русаков ', N'Василий', N'Куприянович', N'loginDEtye2018', N'MEJjQt', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Николаева ', N'Евдокия', N'Пётровна', N'loginDEncq2018', N'GgG3m0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Прохоров ', N'Олег', N'Брониславович', N'loginDEtmt2018', N'}FOh*}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Зайцев ', N'Макар', N'Владленович', N'loginDEyqb2018', N'xLmuQq', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Жданов ', N'Сергей', N'Гордеевич', N'loginDExld2018', N'a8Vjkx', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Нестеров ', N'Авдей', N'Митрофанович', N'loginDEnig2018', N'Cm00D0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (54, N'Григорьева ', N'Глафира', N'Антоновна', N'loginDEmly2018', N'IZJ7O|', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (55, N'Зыков ', N'Геласий', N'Лаврентьевич', N'loginDElom2018', N'Yg}k84', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (56, N'Александрова ', N'Марфа', N'Протасьевна', N'loginDEvoa2018', N'RdGikC', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (57, N'Мухин ', N'Донат', N'Ростиславович', N'loginDEwmq2018', N'ds4KAb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (58, N'Костин ', N'Геласий', N'Германнович', N'loginDEdba2018', N'D7xF6u', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (59, N'Лазарев ', N'Протасий', N'Игоревич', N'loginDEnsr2018', N'VZKTog', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (60, N'Пестов ', N'Богдан', N'Германнович', N'loginDEqsc2018', N'UU|FkZ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (61, N'ь', N'ь', N'ь', N'1', N'c4ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (62, N'Егорова', N'Диана', N'Алексеевна', N'23', N'23', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (63, N'Игнатюгин', N'Илья', N'Денисович', N'123', N'123', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (64, N'Зеленцова', N'Елизавета', N'Евгеньевна', N'234567', N'1', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (65, N'о', N'о', N'о', N'34', N'34', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (66, N'Портнов', N'Максим', N'Александрович', N'9', N'9', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (67, N'Портнов', N'Максим', N'Александрович', N'9', N'9', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (68, N'аваа', N'ав', N'ваавв', N'9', N'9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (69, N'бойко', N'максим', N'сергеевич', N'9090', N'9090', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (70, N'Иванчиков', N'Егор', N'Михайлович', N'1414', N'7a674153c63cff1ad7f0e261c369ab2c', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (71, N'пррпр', N'прпр', N'пррппрп', N'12', N'c20ad4d76fe97759aa27a0c99bff6710', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (72, N'Катаев', N'Максим', N'Дмитриевич', N'8989', N'd81f9c1be2e08964bf9f24b15f0e4900', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (73, N'апрол', N'апро', N'апро', N'5678', N'2838023a778dfaecdc212708f721b788', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (74, N'у', N'у', N'у', N'123', N'c20ad4d76fe97759aa27a0c99bff6710', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (75, N'ц', N'ц', N'ц', N'3', N'eccbc87e4b5ce2fe28308fd9f2a7baf3', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
