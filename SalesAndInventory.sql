USE [master]
GO
/****** Object:  Database [SalesAndInventory]    Script Date: 15.04.2022 01:03:41 ******/
CREATE DATABASE [SalesAndInventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesAndInventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SalesAndInventory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalesAndInventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SalesAndInventory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SalesAndInventory] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesAndInventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesAndInventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesAndInventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesAndInventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesAndInventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesAndInventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesAndInventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesAndInventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesAndInventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesAndInventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesAndInventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesAndInventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesAndInventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesAndInventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesAndInventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesAndInventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalesAndInventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesAndInventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesAndInventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesAndInventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesAndInventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesAndInventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesAndInventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesAndInventory] SET RECOVERY FULL 
GO
ALTER DATABASE [SalesAndInventory] SET  MULTI_USER 
GO
ALTER DATABASE [SalesAndInventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesAndInventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesAndInventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesAndInventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalesAndInventory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SalesAndInventory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalesAndInventory', N'ON'
GO
ALTER DATABASE [SalesAndInventory] SET QUERY_STORE = OFF
GO
USE [SalesAndInventory]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](30) NOT NULL,
	[customer_mobile] [char](11) NOT NULL,
	[customer_email] [varchar](30) NOT NULL,
	[customer_address] [varchar](100) NOT NULL,
	[customer_username] [varchar](20) NOT NULL,
	[customer_password] [varchar](8) NOT NULL,
	[customer_permission_id] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[inventory_items] [varchar](30) NOT NULL,
	[inventory_description] [varchar](150) NULL,
	[inventory_type] [varchar](30) NOT NULL,
	[inventory_number] [varchar](15) NOT NULL,
	[inventory_permission_id] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_amount] [varchar](50) NOT NULL,
	[payment_description] [varchar](150) NULL,
	[payment_date] [datetime2](7) NOT NULL,
	[payment_customer_id] [int] NOT NULL,
	[patment_permission_id] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_role_id] [int] NOT NULL,
	[permission_title] [varchar](50) NOT NULL,
	[permission_module] [char](1) NOT NULL,
	[permission_description] [varchar](150) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_title] [varchar](50) NOT NULL,
	[role_description] [varchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[sale_id] [int] IDENTITY(1,1) NOT NULL,
	[sale_amount] [varchar](50) NOT NULL,
	[sale_type] [varchar](30) NOT NULL,
	[sale_description] [varchar](150) NULL,
	[sale_customer_id] [int] NOT NULL,
	[sale_permission_id] [int] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplier_id] [int] NOT NULL,
	[supplier_mobile] [char](11) NOT NULL,
	[supplier_name] [varchar](30) NOT NULL,
	[supplier_email] [varchar](30) NOT NULL,
	[supplier_address] [varchar](100) NOT NULL,
	[supplier_username] [varchar](20) NOT NULL,
	[supplier_password] [varchar](8) NOT NULL,
	[supplier_permission_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.04.2022 01:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_id] [int] NOT NULL,
	[user_name] [varchar](30) NOT NULL,
	[user_email] [varchar](30) NOT NULL,
	[user_dob] [date] NOT NULL,
	[user_address] [char](100) NULL,
	[user_permission_id] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_permission_module]  DEFAULT ((0)) FOR [permission_module]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Permission] FOREIGN KEY([customer_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Permission]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Permission] FOREIGN KEY([inventory_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Permission]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Permission] FOREIGN KEY([patment_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Permission]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Permission] FOREIGN KEY([sale_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Permission]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Permission] FOREIGN KEY([supplier_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Permission]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([user_permission_id])
REFERENCES [dbo].[Permission] ([permission_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
USE [master]
GO
ALTER DATABASE [SalesAndInventory] SET  READ_WRITE 
GO
