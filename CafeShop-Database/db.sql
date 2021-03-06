USE [master]
GO
/****** Object:  Database [CafeShopManagement]    Script Date: 10/7/2018 5:46:46 PM ******/
CREATE DATABASE [CafeShopManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CafeShopManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CafeShopManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CafeShopManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CafeShopManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CafeShopManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CafeShopManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CafeShopManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CafeShopManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CafeShopManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CafeShopManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CafeShopManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CafeShopManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CafeShopManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CafeShopManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CafeShopManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CafeShopManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CafeShopManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CafeShopManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CafeShopManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CafeShopManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CafeShopManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CafeShopManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CafeShopManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CafeShopManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CafeShopManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CafeShopManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CafeShopManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CafeShopManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CafeShopManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CafeShopManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CafeShopManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CafeShopManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CafeShopManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CafeShopManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CafeShopManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CafeShopManagement] SET QUERY_STORE = OFF
GO
USE [CafeShopManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CafeShopManagement]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 10/7/2018 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/7/2018 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[TableId] [uniqueidentifier] NOT NULL,
	[FoodId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[OrderHistory]    Script Date: 10/7/2018 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[OrderHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderSessionId] [uniqueidentifier] NOT NULL,
	[TableId] [uniqueidentifier] NOT NULL,
	[FoodId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Table]    Script Date: 10/7/2018 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
drop table [Employee]
CREATE TABLE [Employee]
(
	[Id] [uniqueidentifier] NOT NULL,
	[Name] VARCHAR (30) NOT NULL,
	[Phone] VARCHAR(15) UNIQUE NOT NULL,
	[Email] VARCHAR(50) UNIQUE NOT NULL,
	[Type] VARCHAR(10) NOT NULL,
	[BirthDay] VARCHAR (10) NOT NULL,
	[Gender] VARCHAR(6) NOT NULL
	CONSTRAINT PK_E PRIMARY KEY (Id)
)


INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'20dbd024-caf0-4b98-8286-13778784e89d', N'Com bò', 45000, N'Đồ ăn')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'adfe8f44-951c-4fc4-9b4a-3522bed57b48', N'Com sườn', 45000, N'Đồ ăn')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'2f68c725-a70f-4876-bf69-369339414d6b', N'Coffee', 25000, N'Nước')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'ed3055f2-1d8a-4770-8310-6407948d3a92', N'Trà', 25000, N'Nước')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'9c326af8-cddd-40f3-b988-8dffb9d266c0', N'Bánh mì ốp la', 45000, N'Đồ ăn')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'd4f7abdc-f7b0-4613-9c52-a3cdb89c5ae9', N'Pepsi', 25000, N'Nước')
INSERT [dbo].[Food] ([Id], [Name], [Price], [Type]) VALUES (N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', N'Coca-Cola', 25000, N'Nước')


INSERT [dbo].[Order] ([Id], [TableId], [FoodId], [Quantity], [Date]) VALUES (N'281f4441-cc3c-4b53-bbd6-3bdcbc5db0fa', N'b75677bc-4759-4a82-9573-4fd4647fc37e', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 2, CAST(N'2018-10-07T17:45:23.940' AS DateTime))
INSERT [dbo].[Order] ([Id], [TableId], [FoodId], [Quantity], [Date]) VALUES (N'ee054b3d-de0a-4d9b-829e-5b6b1baff4fd', N'b75677bc-4759-4a82-9573-4fd4647fc37e', N'2f68c725-a70f-4876-bf69-369339414d6b', 1, CAST(N'2018-10-07T17:45:23.957' AS DateTime))


INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'6feece82-c15d-4416-b81f-005c2bb7af57', N'967250d2-0aa9-4706-a737-24828d692f7e', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 2, 45000, CAST(N'2018-10-07T16:26:14.767' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'8348f921-e751-491f-82b7-0f898820e825', N'0318c7b2-0a57-4517-b823-d943e5b312c7', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 3, 45000, CAST(N'2018-10-07T17:08:03.220' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'f038e16d-03df-4ce0-a4e8-1456fadd821a', N'0318c7b2-0a57-4517-b823-d943e5b312c7', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'20dbd024-caf0-4b98-8286-13778784e89d', 2, 45000, CAST(N'2018-10-07T17:08:03.270' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'67bd8d30-bfe4-4985-bade-16585aeeead6', N'0318c7b2-0a57-4517-b823-d943e5b312c7', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'2f68c725-a70f-4876-bf69-369339414d6b', 2, 25000, CAST(N'2018-10-07T17:08:03.253' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'1dcfe1d6-4e7b-45e4-b585-17da7f76c4db', N'f5204d97-85c4-4a85-8af8-7aa857e1e56a', N'b75677bc-4759-4a82-9573-4fd4647fc37e', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 1, 25000, CAST(N'2018-10-07T16:26:41.740' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'edfc85f5-ecd5-4caf-a3b8-2a0d5b46f943', N'dd55cd42-f1da-44fd-8e93-6255194b1dbb', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 1, 25000, CAST(N'2018-10-07T16:26:14.783' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'636a8509-a3b2-46d6-a30d-4dc77e035f69', N'32198a5d-61c2-4f77-b26e-e378ef33556b', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 2, 25000, CAST(N'2018-10-07T17:45:31.310' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'0be23206-030e-4e6a-9d1f-579a97370ed6', N'dd55cd42-f1da-44fd-8e93-6255194b1dbb', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'adfe8f44-951c-4fc4-9b4a-3522bed57b48', 3, 45000, CAST(N'2018-10-07T16:26:14.750' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'fc1fabf1-31b8-48f9-9d2a-5af159b238e5', N'967250d2-0aa9-4706-a737-24828d692f7e', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'2f68c725-a70f-4876-bf69-369339414d6b', 2, 25000, CAST(N'2018-10-07T16:26:14.730' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'6ac9a62a-81fc-46bf-b1f4-6bbdbecaf0bf', N'dd55cd42-f1da-44fd-8e93-6255194b1dbb', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 2, 45000, CAST(N'2018-10-07T16:26:14.767' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'008f6032-422e-4bd3-ac44-6e19b59c070d', N'973073a4-ff11-4eda-8dde-7123bbc9093f', N'8273fa5a-75db-4403-aeac-83c037eea6d7', N'2f68c725-a70f-4876-bf69-369339414d6b', 1, 25000, CAST(N'2018-10-07T17:08:08.560' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'491fffef-12c4-4c74-a294-70de9dfc38d0', N'dd55cd42-f1da-44fd-8e93-6255194b1dbb', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'2f68c725-a70f-4876-bf69-369339414d6b', 2, 25000, CAST(N'2018-10-07T16:26:14.730' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'b6e5d98f-e4d7-4259-a14b-7234390000dd', N'32198a5d-61c2-4f77-b26e-e378ef33556b', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 1, 45000, CAST(N'2018-10-07T17:45:31.293' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'b5909747-3872-4b4c-a43f-88e14c5529d5', N'973073a4-ff11-4eda-8dde-7123bbc9093f', N'8273fa5a-75db-4403-aeac-83c037eea6d7', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 3, 25000, CAST(N'2018-10-07T17:08:08.543' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'c852c851-8f7f-43e3-9a09-9ec2973d35f4', N'f5204d97-85c4-4a85-8af8-7aa857e1e56a', N'b75677bc-4759-4a82-9573-4fd4647fc37e', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 1, 45000, CAST(N'2018-10-07T16:26:41.723' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'44bc4372-0aae-4cf3-8431-afcb67a2ab5e', N'967250d2-0aa9-4706-a737-24828d692f7e', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 1, 25000, CAST(N'2018-10-07T16:26:14.783' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'79e0516a-aebb-4995-b6a2-c03e3a2a97d5', N'dd55cd42-f1da-44fd-8e93-6255194b1dbb', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'20dbd024-caf0-4b98-8286-13778784e89d', 4, 45000, CAST(N'2018-10-07T16:26:14.800' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'3dc04cb6-3d87-4acd-897e-ca2bdb65a3d0', N'967250d2-0aa9-4706-a737-24828d692f7e', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'adfe8f44-951c-4fc4-9b4a-3522bed57b48', 3, 45000, CAST(N'2018-10-07T16:26:14.750' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'6e267ab0-5d6c-44cc-b639-cace3a527596', N'967250d2-0aa9-4706-a737-24828d692f7e', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'20dbd024-caf0-4b98-8286-13778784e89d', 4, 45000, CAST(N'2018-10-07T16:26:14.800' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'771a430e-a0c2-473d-8820-e6ce205c2073', N'0318c7b2-0a57-4517-b823-d943e5b312c7', N'7b992905-7435-4de7-91d4-0d119383f7f2', N'fb56d7b7-84ee-4b4f-913f-efb06c43a51b', 2, 25000, CAST(N'2018-10-07T17:08:03.240' AS DateTime))
INSERT [dbo].[OrderHistory] ([Id], [OrderSessionId], [TableId], [FoodId], [Quantity], [Price], [Date]) VALUES (N'21c625de-7593-45b7-a0fc-ef1f16d58390', N'973073a4-ff11-4eda-8dde-7123bbc9093f', N'8273fa5a-75db-4403-aeac-83c037eea6d7', N'9c326af8-cddd-40f3-b988-8dffb9d266c0', 2, 45000, CAST(N'2018-10-07T17:08:08.527' AS DateTime))



INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'ec8aa02f-ec10-49d9-8e90-09202a77aa24', N'BÀN 13', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'7b992905-7435-4de7-91d4-0d119383f7f2', N'BÀN 1', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'd4b67a78-abcd-4be8-b1fc-1cb3f05447eb', N'BÀN 2', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'90e6316d-1bd1-468d-a1bf-26c8edcf2d6a', N'BÀN VIP 7', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'0f5f7bcf-816d-4afd-bab4-37224844f5c5', N'BÀN 11', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'c75b59f1-385e-4b15-8658-46afc25e7e82', N'BÀN 9', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'd06be797-d45e-4cb6-9080-4cdb71464c6b', N'BÀN VIP 6', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'b7d187e2-6bc3-4e04-a323-4f0d4c0da238', N'BÀN 12', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'b75677bc-4759-4a82-9573-4fd4647fc37e', N'BÀN 10', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'496bf898-992c-4918-82fc-555b2566aca9', N'BÀN VIP 2', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'dfa173c1-4193-4c10-8eb7-5b527c59cfaf', N'BÀN 4', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'365205ca-3b4e-4fd1-a599-77b0c4d7c3aa', N'BÀN VIP 1', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'8273fa5a-75db-4403-aeac-83c037eea6d7', N'BÀN 1', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'6f9644f7-b309-4bcd-b24a-a2a2ab1558fc', N'BÀN 5', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'469cd9c6-a409-4c0f-bf27-ae74f1c480dc', N'BÀN 7', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'c025da88-8cb1-4d42-bff4-b0bc825a04fc', N'BÀN VIP 5', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'ac83a003-99a4-4d76-ad22-b53567255099', N'BÀN VIP 8', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'acfe2833-a2c8-48b3-8d06-b5c4f4cd2074', N'BÀN 3', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'e812079e-c0a2-4657-b48f-bb5d3007ca8f', N'BÀN VIP 3', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'bd576c87-2c67-4aa0-b8c1-e3717f1b94d6', N'BÀN VIP 9', N'VIP', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'84abbeb0-875b-4526-92dc-ee06a14fced5', N'BÀN 6', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'dbb372a1-e8b8-4a1e-a16d-f2f90c90da5b', N'BÀN 8', N'', 1)
INSERT [dbo].[Table] ([Id], [Name], [Type], [SortOrder]) VALUES (N'4b3ed6f6-0328-45a1-9110-feab23d729ee', N'BÀN VIP 4', N'VIP', 1)

INSERT [dbo].[Employee] ([Id], [Name], [Phone], [Email],[BirthDay],[Gender],[Type]) VALUES (NEWID(), 'Hồ Hoàng Túc An', '0909542218', '16520003@gm.uit.edu.vn','29-8-1998','Nữ','Full Time')
INSERT [dbo].[Employee] ([Id], [Name], [Phone], [Email],[BirthDay],[Gender],[Type]) VALUES (NEWID(), 'Lê Thị Phụng', '0333621133', '16521775@gm.uit.edu.vn','15-8-1998','Nữ','Full Time')
INSERT [dbo].[Employee] ([Id], [Name], [Phone], [Email],[BirthDay],[Gender],[Type]) VALUES (NEWID(), 'Trịnh Thị Thu Hà', '0363095548', '16520323@gm.uit.edu.vn','30-11-1998','Nữ','Full Time')
INSERT [dbo].[Employee] ([Id], [Name], [Phone], [Email],[BirthDay],[Gender],[Type]) VALUES (NEWID(), 'Đỗ Thanh Xuân', '0987542208', '16521478@gm.uit.edu.vn','26-2-1998','Nữ','Full Time')

SELECT * FROM [Employee]
SELECT * FROM [Table]
SELECT * FROM [Order]
SELECT * FROM [OrderHistory]
SELECT * FROM [Food]
SELECT * FROM [Employee]

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([Id])


GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Food]
GO
USE [master]
GO
ALTER DATABASE [CafeShopManagement] SET  READ_WRITE 
GO

select *from [OrderHistory] 

select [Table].Name AS 'Table', [Food].Name AS 'Food',
[OrderHistory].OrderSessionId ,[OrderHistory].Quantity ,[OrderHistory].Price,[OrderHistory].Date 
from [OrderHistory] 
inner join [Table] on [Table].Id = [OrderHistory].TableId 
inner join [Food] on [Food].Id = [OrderHistory].FoodId 
group by [OrderHistory].OrderSessionId, [Table].Name,[Food].Name,[OrderHistory].Quantity ,[OrderHistory].Price,[OrderHistory].Date

select Name, Phone,Email,Type,BirthDay,Gender from [Employee] order by Name ASC

