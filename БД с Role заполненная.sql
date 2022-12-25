USE [master]
GO
/****** Object:  Database [PharmacyPointsDB]    Script Date: 20.12.2022 18:15:54 ******/
CREATE DATABASE [PharmacyPointsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmacyPointsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PharmacyPointsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PharmacyPointsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PharmacyPointsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PharmacyPointsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmacyPointsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmacyPointsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyPointsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmacyPointsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmacyPointsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmacyPointsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmacyPointsDB] SET  MULTI_USER 
GO
ALTER DATABASE [PharmacyPointsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmacyPointsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmacyPointsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmacyPointsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PharmacyPointsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PharmacyPointsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PharmacyPointsDB] SET QUERY_STORE = OFF
GO
USE [PharmacyPointsDB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] NOT NULL,
	[NameClient] [nvarchar](50) NOT NULL,
	[TelephoneClient] [nvarchar](50) NOT NULL,
	[EmailClient] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[PharmacyID] [int] NOT NULL,
	[FullNameEmployee] [nvarchar](50) NOT NULL,
	[TelephoneEmployee] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[PharmacyID] [int] NOT NULL,
	[NamePharmacy] [nvarchar](50) NOT NULL,
	[AddressPharmacy] [nvarchar](50) NOT NULL,
	[TelephonePharmacy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[NameProduct] [nvarchar](50) NOT NULL,
	[PriceProduct] [money] NOT NULL,
	[AmountProduct] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] NOT NULL,
	[NameProvider] [nvarchar](50) NOT NULL,
	[TelephoneProvider] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.12.2022 18:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ClientID], [NameClient], [TelephoneClient], [EmailClient]) VALUES (1, N'Звездина Д.Я', N'79658817238', N'FTest@mail.com')
GO
INSERT [dbo].[Client] ([ClientID], [NameClient], [TelephoneClient], [EmailClient]) VALUES (2, N'Григорьева Ш.С', N'79955699816', N'ATest@mail.com')
GO
INSERT [dbo].[Client] ([ClientID], [NameClient], [TelephoneClient], [EmailClient]) VALUES (3, N'Курьев Н.Ф', N'79441466145', N'RTest@mail.com')
GO
INSERT [dbo].[Client] ([ClientID], [NameClient], [TelephoneClient], [EmailClient]) VALUES (4, N'Шварц А.Н', N'79551209614', N'MTest@mail.com')
GO
INSERT [dbo].[Client] ([ClientID], [NameClient], [TelephoneClient], [EmailClient]) VALUES (5, N'Вандам Ж.К', N'79997770770', N'ATest@mail.com')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (9, 3, N'Чехов Д.И', N'79456618747', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (10, 3, N'Достоевский Е.А', N'79417752891', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (11, 3, N'Бунин Д.И', N'7914457195', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (12, 1, N'Блок Н.Г', N'79996481551', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (13, 1, N'Романов В.В', N'71974147855', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (15, 2, N'Зарвигоров А.В', N'74165195961', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [PharmacyID], [FullNameEmployee], [TelephoneEmployee], [RoleID]) VALUES (16, 2, N'Мишустин Д.В', N'70014885513', 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [ClientID], [ProductID], [Date], [Price]) VALUES (1, 9, 1, 2, CAST(N'2019-01-29' AS Date), 1100.0000)
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [ClientID], [ProductID], [Date], [Price]) VALUES (2, 10, 5, 1, CAST(N'2022-02-16' AS Date), 4800.0000)
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [ClientID], [ProductID], [Date], [Price]) VALUES (3, 11, 2, 4, CAST(N'2019-05-03' AS Date), 1664.0000)
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [ClientID], [ProductID], [Date], [Price]) VALUES (4, 12, 3, 5, CAST(N'2021-12-17' AS Date), 3240.0000)
GO
INSERT [dbo].[Order] ([OrderID], [EmployeeID], [ClientID], [ProductID], [Date], [Price]) VALUES (5, 13, 4, 3, CAST(N'2020-07-12' AS Date), 7000.0000)
GO
INSERT [dbo].[Pharmacy] ([PharmacyID], [NamePharmacy], [AddressPharmacy], [TelephonePharmacy]) VALUES (1, N'Drug Store', N'г.Торонто, ул.Янг, д.13', N'345-8813-765')
GO
INSERT [dbo].[Pharmacy] ([PharmacyID], [NamePharmacy], [AddressPharmacy], [TelephonePharmacy]) VALUES (2, N'Planet of pills', N'г.Токио, ул.Амейко, д.6', N'74-88914-7426')
GO
INSERT [dbo].[Pharmacy] ([PharmacyID], [NamePharmacy], [AddressPharmacy], [TelephonePharmacy]) VALUES (3, N'Pharmacy', N'г.Амстердам, райо "9 улиц", д.17', N'4-193845-88')
GO
INSERT [dbo].[Product] ([ProductID], [ProviderID], [NameProduct], [PriceProduct], [AmountProduct]) VALUES (1, 2, N'Антибиотики', 800.0000, N'178')
GO
INSERT [dbo].[Product] ([ProductID], [ProviderID], [NameProduct], [PriceProduct], [AmountProduct]) VALUES (2, 1, N'Капли для глаз', 220.0000, N'93')
GO
INSERT [dbo].[Product] ([ProductID], [ProviderID], [NameProduct], [PriceProduct], [AmountProduct]) VALUES (3, 4, N'Спрей для горла', 350.0000, N'142')
GO
INSERT [dbo].[Product] ([ProductID], [ProviderID], [NameProduct], [PriceProduct], [AmountProduct]) VALUES (4, 3, N'Глицин', 150.0000, N'138')
GO
INSERT [dbo].[Product] ([ProductID], [ProviderID], [NameProduct], [PriceProduct], [AmountProduct]) VALUES (5, 5, N'Баночка для анализа', 27.0000, N'76')
GO
INSERT [dbo].[Provider] ([ProviderID], [NameProvider], [TelephoneProvider]) VALUES (1, N'ООО "Фарма"', N'7995758131')
GO
INSERT [dbo].[Provider] ([ProviderID], [NameProvider], [TelephoneProvider]) VALUES (2, N'ООО "Лекарь"', N'79996445399')
GO
INSERT [dbo].[Provider] ([ProviderID], [NameProvider], [TelephoneProvider]) VALUES (3, N'ООО "Жизнь"', N'79944756411')
GO
INSERT [dbo].[Provider] ([ProviderID], [NameProvider], [TelephoneProvider]) VALUES (4, N'ООО "Лечение"', N'79317448288')
GO
INSERT [dbo].[Provider] ([ProviderID], [NameProvider], [TelephoneProvider]) VALUES (5, N'ООО "Здоровье"', N'79981236577')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Фармацепт')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Кассир ')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Pharmacy] FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacy] ([PharmacyID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Pharmacy]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
USE [master]
GO
ALTER DATABASE [PharmacyPointsDB] SET  READ_WRITE 
GO
