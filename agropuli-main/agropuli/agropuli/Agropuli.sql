USE [master]
GO
/****** Object:  Database [Agropuli]    Script Date: 12/1/2020 10:08:47 PM ******/
CREATE DATABASE [Agropuli]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agropuli', FILENAME = N'E:\MSSQL.MSSQLSERVER\DATA\Agropuli.mdf' , SIZE = 5376KB , MAXSIZE = 204800KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Agropuli_log', FILENAME = N'D:\MSSQL.MSSQLSERVER\DATA\Agropuli_log.ldf' , SIZE = 1024KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Agropuli] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agropuli].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agropuli] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agropuli] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agropuli] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agropuli] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agropuli] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agropuli] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Agropuli] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agropuli] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agropuli] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agropuli] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agropuli] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agropuli] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agropuli] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agropuli] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agropuli] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agropuli] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agropuli] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agropuli] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agropuli] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agropuli] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agropuli] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agropuli] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agropuli] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agropuli] SET  MULTI_USER 
GO
ALTER DATABASE [Agropuli] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agropuli] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agropuli] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agropuli] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Agropuli] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Agropuli]
GO
/****** Object:  User [Agropuli]    Script Date: 12/1/2020 10:08:49 PM ******/
CREATE USER [Agropuli] FOR LOGIN [Agropuli] WITH DEFAULT_SCHEMA=[Agropuli]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 12/1/2020 10:08:49 PM ******/
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Agropuli]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Agropuli]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Agropuli]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Agropuli]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Agropuli]
GO
/****** Object:  Schema [Agropuli]    Script Date: 12/1/2020 10:08:49 PM ******/
CREATE SCHEMA [Agropuli]
GO
/****** Object:  Table [Agropuli].[Appointment]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Agropuli].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[NationalId] [nvarchar](12) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Town] [nvarchar](100) NULL,
	[Vereda] [nvarchar](100) NULL,
	[Farm] [nvarchar](100) NULL,
	[GPS] [nvarchar](100) NULL,
	[Administrator] [nvarchar](100) NULL,
	[Crop] [nvarchar](100) NULL,
	[Variety] [nvarchar](100) NULL,
	[Ha] [float] NULL,
	[Quote] [nvarchar](100) NULL,
	[Product] [nvarchar](100) NULL,
	[CallDate] [datetime] NULL,
	[SecondaryCrop] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[RequestAppointment] [bit] NULL,
	[AssignTechnician] [bit] NULL,
	[NextAppointment] [datetime] NULL,
 CONSTRAINT [PK_SellerAppointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crop]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Crop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favor]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Favor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Reference] [nvarchar](15) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Total] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
	[PayuState] [nvarchar](50) NULL,
	[PayuResponseCode] [nvarchar](100) NULL,
	[PayuReference] [nvarchar](50) NULL,
	[PayuTransaction] [nvarchar](50) NULL,
	[PayuPaymentMethod] [nvarchar](50) NULL,
	[PayuPaymentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Reference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderReference] [nvarchar](15) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderReference] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pest]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[Price] [money] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[NationalId] [nvarchar](12) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[NationalId] [nvarchar](12) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Town] [nvarchar](100) NULL,
	[Vereda] [nvarchar](100) NULL,
	[Phone] [nvarchar](12) NULL,
	[Farm] [nvarchar](100) NULL,
	[Crop] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkWithUs]    Script Date: 12/1/2020 10:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkWithUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[JobId] [int] NULL,
	[VehicleId] [int] NULL,
	[IsTechnician] [bit] NOT NULL,
 CONSTRAINT [PK_WorkWithUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Productos Agropuli (Tierra de diatomeas, humus, leonarditas y mixturas granuladas) ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Agropuli fabricado a tu medida')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Promociones mes octubre 2020')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Diatopet''s arena para gatos')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Herramientas Palmeras ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Laboratorio de suelos ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Fertilizantes líquidos o solubles ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Fertilizantes granulados o fabricados a tu medida')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Enmiendas orgánicas ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Enmiendas minerales ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (11, N'Bioinsumos')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (12, N'Seguridad industrial ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (13, N'Tu Contador Agrícola ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (14, N'Filtración de aguas servidas, lixiviadas y biorremediacion de derrames')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Crop] ON 

INSERT [dbo].[Crop] ([Id], [Name]) VALUES (1, N'Arveja')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (2, N'Avena')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (3, N'Banano')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (4, N'Banano Orga')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (5, N'Batata')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (6, N'Berenjena')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (7, N'Brachiaria')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (8, N'Brocoli')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (9, N'Café')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (10, N'Caña de azucar')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (11, N'Cebada')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (12, N'Cebolla')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (13, N'Ciruelo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (14, N'Citricos')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (15, N'Coliflor')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (16, N'Durazno')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (17, N'Esparragos')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (18, N'Espinacas')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (19, N'Elefante')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (20, N'Festuca alta')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (21, N'Fresa')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (22, N'Frijol')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (23, N'Guinea')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (24, N'Habichuela')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (25, N'Helecho cuero')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (26, N'Kikuyo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (27, N'Lechuga')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (28, N'Lulo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (29, N'Maiz')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (30, N'Mango')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (31, N'Mani')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (32, N'Manzano')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (33, N'Maracuya')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (34, N'Melon')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (35, N'Mora')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (36, N'Ñame')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (37, N'Orchoro')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (38, N'Otro')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (39, N'Palma')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (40, N'Pangola')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (41, N'Papa')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (42, N'Papaya')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (43, N'Para')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (44, N'Pepino')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (45, N'Pero')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (46, N'Pimentón')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (47, N'Piña')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (48, N'Platano')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (49, N'Raigras natural')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (50, N'Raigras ingles')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (51, N'Remolacha')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (52, N'Repollo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (53, N'Sandia')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (54, N'Sorgo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (55, N'Soya')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (56, N'Tabaco')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (57, N'Tomate')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (58, N'Tomate de arbol')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (59, N'Trebol')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (60, N'Trigo')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (61, N'Yuca')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (62, N'Zanahoria')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (63, N'Heno')
INSERT [dbo].[Crop] ([Id], [Name]) VALUES (64, N'Silo')
SET IDENTITY_INSERT [dbo].[Crop] OFF
GO
SET IDENTITY_INSERT [dbo].[Favor] ON 

INSERT [dbo].[Favor] ([Id], [Created], [Username], [Description]) VALUES (17, CAST(N'2020-10-22T08:05:52.670' AS DateTime), N'Agropuli', N'Pan')
INSERT [dbo].[Favor] ([Id], [Created], [Username], [Description]) VALUES (18, CAST(N'2020-11-05T07:23:45.773' AS DateTime), N'Agropuli', N'Hola ')
SET IDENTITY_INSERT [dbo].[Favor] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([Id], [Name]) VALUES (1, N'Pica de hojas')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (2, N'Limpias')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (3, N'Cosecha')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (4, N'Fertilización')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (5, N'Fumigaciones')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (6, N'Censos')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (7, N'Sanidad')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (8, N'Tractorista')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (9, N'Encuestador')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (10, N'Transportador')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (1, CAST(N'2020-08-04T02:13:06.513' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (2, CAST(N'2020-08-04T02:24:09.983' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (3, CAST(N'2020-08-04T02:45:16.540' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (4, CAST(N'2020-08-04T02:51:19.087' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (5, CAST(N'2020-08-04T03:04:25.473' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (6, CAST(N'2020-08-07T19:48:46.117' AS DateTime), N'Log de prueba')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (7, CAST(N'2020-08-07T19:50:09.417' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (8, CAST(N'2020-08-07T20:11:47.567' AS DateTime), N'Log de prueba')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (9, CAST(N'2020-08-07T20:12:40.300' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (10, CAST(N'2020-08-07T20:13:26.880' AS DateTime), N'Log de prueba')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (11, CAST(N'2020-08-07T20:14:41.053' AS DateTime), N'The given key was not present in the dictionary.')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (12, CAST(N'2020-08-08T23:41:23.080' AS DateTime), N'System.Collections.Generic.KeyNotFoundException: The given key was not present in the dictionary.
   at System.ThrowHelper.ThrowKeyNotFoundException()
   at System.Collections.Generic.Dictionary`2.get_Item(TKey key)
   at AgropuliApp.Controllers.OrderController.PayuConfirmation() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\OrderController.cs:line 308
   at System.Web.Mvc.ActionMethodDispatcher.<>c__DisplayClass10_0.<WrapVoidAction>b__0(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (13, CAST(N'2020-08-14T07:59:42.153' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (14, CAST(N'2020-08-14T08:00:03.090' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (15, CAST(N'2020-08-14T08:50:13.093' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (16, CAST(N'2020-08-15T14:32:02.260' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (17, CAST(N'2020-08-15T17:41:55.987' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (18, CAST(N'2020-08-16T06:50:24.463' AS DateTime), N'System.Exception: Test
   at AgropuliApp.Areas.Admin.Controllers.AppController.Logs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Areas\Admin\Controllers\AppController.cs:line 43
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (20, CAST(N'2020-09-23T10:04:58.597' AS DateTime), N'System.Runtime.InteropServices.ExternalException (0x80004005): A generic error occurred in GDI+.
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at AgropuliApp.Helper.ResizeImage(Stream imageStream, String imageName, String imagePath, Int32 size) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Helper.cs:line 74
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 103
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (23, CAST(N'2020-10-19T06:38:23.960' AS DateTime), N'System.Runtime.InteropServices.ExternalException (0x80004005): A generic error occurred in GDI+.
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at AgropuliApp.Helper.ResizeImage(Stream imageStream, String imageName, String imagePath, Int32 size) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Helper.cs:line 74
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 103
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (25, CAST(N'2020-10-19T06:46:50.810' AS DateTime), N'System.InvalidOperationException: Attaching an entity of type ''AgropuliApp.Models.OrderProduct'' failed because another entity of the same type already has the same primary key value. This can happen when using the ''Attach'' method or setting the state of an entity to ''Unchanged'' or ''Modified'' if any entities in the graph have conflicting key values. This may be because some entities are new and have not yet received database-generated key values. In this case use the ''Add'' method or the ''Added'' entity state to track the graph and then set the state of non-new entities to ''Unchanged'' or ''Modified'' as appropriate.
   at System.Data.Entity.Core.Objects.ObjectContext.AttachSingleObject(IEntityWrapper wrappedEntity, EntitySet entitySet)
   at System.Data.Entity.Core.Objects.DataClasses.RelatedEnd.AddEntityToObjectStateManager(IEntityWrapper wrappedEntity, Boolean doAttach)
   at System.Data.Entity.Core.Objects.DataClasses.RelatedEnd.AddGraphToObjectStateManager(IEntityWrapper wrappedEntity, Boolean relationshipAlreadyExists, Boolean addRelationshipAsUnchanged, Boolean doAttach)
   at System.Data.Entity.Core.Objects.DataClasses.RelatedEnd.IncludeEntity(IEntityWrapper wrappedEntity, Boolean addRelationshipAsUnchanged, Boolean doAttach)
   at System.Data.Entity.Core.Objects.DataClasses.EntityCollection`1.Include(Boolean addRelationshipAsUnchanged, Boolean doAttach)
   at System.Data.Entity.Core.Objects.DataClasses.RelationshipManager.AddRelatedEntitiesToObjectStateManager(Boolean doAttach)
   at System.Data.Entity.Core.Objects.ObjectContext.AttachTo(String entitySetName, Object entity)
   at System.Data.Entity.Internal.Linq.InternalSet`1.<>c__DisplayClassa.<Attach>b__9()
   at System.Data.Entity.Internal.Linq.InternalSet`1.ActOnSet(Action action, EntityState newState, Object entity, String methodName)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Attach(Object entity)
   at System.Data.Entity.Internal.InternalEntityEntry.set_State(EntityState value)
   at System.Data.Entity.Infrastructure.DbEntityEntry`1.set_State(EntityState value)
   at AgropuliApp.Controllers.OrderController.Pay() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\OrderController.cs:line 126
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (28, CAST(N'2020-10-22T07:10:22.313' AS DateTime), N'System.Runtime.InteropServices.ExternalException (0x80004005): A generic error occurred in GDI+.
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at AgropuliApp.Helper.ResizeImage(Stream imageStream, String imageName, String imagePath, Int32 size) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Helper.cs:line 74
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 103
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (31, CAST(N'2020-10-22T07:41:45.687' AS DateTime), N'System.Runtime.InteropServices.ExternalException (0x80004005): A generic error occurred in GDI+.
   at System.Drawing.Image.Save(String filename, ImageCodecInfo encoder, EncoderParameters encoderParams)
   at AgropuliApp.Helper.ResizeImage(Stream imageStream, String imageName, String imagePath, Int32 size) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Helper.cs:line 74
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 103
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (32, CAST(N'2020-10-22T08:06:41.403' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes\Agropuli..jpg''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.WorkWithUs(WorkWithUs workWithUs, HttpPostedFileBase uploadedFile) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 156
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (33, CAST(N'2020-10-22T08:07:19.277' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201022_0807_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (34, CAST(N'2020-10-22T08:07:46.917' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (35, CAST(N'2020-10-22T09:38:33.043' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (36, CAST(N'2020-10-22T09:38:38.417' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (37, CAST(N'2020-10-22T09:38:42.277' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (38, CAST(N'2020-10-22T09:46:55.470' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (39, CAST(N'2020-10-22T09:49:20.207' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201022_0949_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (40, CAST(N'2020-10-22T10:00:44.900' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (41, CAST(N'2020-10-22T11:22:38.333' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (42, CAST(N'2020-10-22T11:23:45.380' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (43, CAST(N'2020-10-22T15:05:51.107' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (44, CAST(N'2020-10-23T09:22:13.833' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (45, CAST(N'2020-10-23T09:25:32.243' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (46, CAST(N'2020-10-23T09:25:54.523' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201023_0925_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (47, CAST(N'2020-10-24T09:03:57.637' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (48, CAST(N'2020-10-25T09:57:06.283' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (49, CAST(N'2020-10-26T16:08:38.717' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201026_1608_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (50, CAST(N'2020-10-26T17:26:00.437' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (51, CAST(N'2020-10-27T05:03:03.503' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (52, CAST(N'2020-10-28T07:28:13.143' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (53, CAST(N'2020-11-05T07:17:03.690' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201105_0717_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (54, CAST(N'2020-11-05T07:23:02.897' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (55, CAST(N'2020-11-05T07:23:07.317' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (56, CAST(N'2020-11-05T07:23:13.553' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (57, CAST(N'2020-11-06T18:18:19.270' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\photos\Agropuli_20201106_1818_0''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.Init(String path, FileMode mode, FileAccess access, Int32 rights, Boolean useRights, FileShare share, Int32 bufferSize, FileOptions options, SECURITY_ATTRIBUTES secAttrs, String msgPath, Boolean bFromProxy, Boolean useLongPath, Boolean checkHost)
   at System.IO.FileStream..ctor(String path, FileMode mode, FileAccess access, FileShare share, Int32 bufferSize, FileOptions options, String msgPath, Boolean bFromProxy)
   at System.IO.FileStream..ctor(String path, FileMode mode)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at AgropuliApp.Controllers.AppController.Accountant(HttpPostedFileBase[] uploadedFiles) in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 102
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (58, CAST(N'2020-11-06T18:20:10.223' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (59, CAST(N'2020-11-11T21:21:03.730' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 67
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (60, CAST(N'2020-11-11T21:21:07.600' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 67
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (61, CAST(N'2020-11-11T21:21:13.723' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 67
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (62, CAST(N'2020-11-11T21:21:27.237' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 67
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (63, CAST(N'2020-11-11T21:33:40.607' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 69
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (64, CAST(N'2020-11-11T21:33:47.630' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 69
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (65, CAST(N'2020-11-11T21:37:57.923' AS DateTime), N'System.InvalidOperationException: Sequence contains no elements
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__0[TResult](IEnumerable`1 sequence)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   at System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.First[TSource](IQueryable`1 source, Expression`1 predicate)
   at AgropuliApp.Controllers.AppController.Menu() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 69
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (66, CAST(N'2020-11-12T05:04:34.293' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
INSERT [dbo].[Log] ([Id], [LogDateTime], [Message]) VALUES (67, CAST(N'2020-11-20T05:16:55.870' AS DateTime), N'System.IO.DirectoryNotFoundException: Could not find a part of the path ''G:\PleskVhosts\agropuli.com.co\agropuli\resumes''.
   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileSystemEnumerableIterator`1.CommonInit()
   at System.IO.FileSystemEnumerableIterator`1..ctor(String path, String originalUserPath, String searchPattern, SearchOption searchOption, SearchResultHandler`1 resultHandler, Boolean checkHost)
   at System.IO.Directory.GetFiles(String path, String searchPattern)
   at AgropuliApp.Controllers.AppController.WorkWithUs() in C:\Projects\andrescode\Detallitos.co\agropuli\AgropuliApp\Controllers\AppController.cs:line 129
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)')
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200624015653108', CAST(N'2020-06-24T06:56:53.110' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 24000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200624233121084', CAST(N'2020-06-25T04:31:21.087' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 240000.0000, CAST(N'2020-06-24T23:33:10.490' AS DateTime), N'APPROVED', N'La transacción fue aprobada.', N'120196940', N'd3fe7de2-5600-4a07-8935-619ad9380ba9', N'VISA', N'CREDIT_CARD')
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200625141856311', CAST(N'2020-06-25T19:18:56.327' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 240000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200628111850356', CAST(N'2020-06-28T16:18:50.357' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 156000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200722072447611', CAST(N'2020-07-22T12:24:47.627' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803182006124', CAST(N'2020-08-03T23:20:06.127' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 120000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803183200489', CAST(N'2020-08-03T23:32:00.490' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 240000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803210016602', CAST(N'2020-08-04T02:00:16.603' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 240000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803210956652', CAST(N'2020-08-04T02:09:56.653' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota', N'Calle 154', 1200000.0000, NULL, N'INVALID_EXPIRATION_DATE_OR_SECURITY_CODE', NULL, N'120309570', N'1046a591-4706-4b8c-8c34-38813c5e1ccd', NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803212010419', CAST(N'2020-08-04T02:20:10.420' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota', N'Calle 154', 56000.0000, NULL, N'APPROVED', NULL, N'120309591', N'fbf5c88a-9345-4afe-bd3b-1016ebbbb382', NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803214139630', CAST(N'2020-08-04T02:41:39.630' AS DateTime), N'andrescortes', N'andrescortes', N'andrescor24@gmail.com', N'3174716811', N'Bogota', N'Calle 154', 96000.0000, NULL, N'APPROVED', NULL, N'120309635', N'ab92d783-19dc-417c-a6e4-8e451681fd71', NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803214804710', CAST(N'2020-08-04T02:48:04.710' AS DateTime), N'andrescortes', N'andrescortes', N'andrescor24@gmail.com', N'3174716811', N'Bogota', N'Calle 154', 36000.0000, NULL, N'INVALID_CARD', NULL, N'120309676', N'9bdfa2ae-107e-418e-a1e3-20989fb524b7', NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200803220126689', CAST(N'2020-08-04T03:01:26.690' AS DateTime), N'andrescortes', NULL, N'andrescor24@gmail.com', N'3174716811', N'Bogota', N'Calle 154', 96000.0000, NULL, N'APPROVED', NULL, N'120309694', N'4daaf7df-d7f0-42bb-a3f7-f17e4e42b561', NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200805144103350', CAST(N'2020-08-05T19:41:03.367' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 6800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200806070836250', CAST(N'2020-08-06T12:08:36.280' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 240000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200807144022722', CAST(N'2020-08-07T19:40:22.737' AS DateTime), N'andrescortes', NULL, NULL, NULL, NULL, NULL, 120000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200807144728070', CAST(N'2020-08-07T19:47:28.087' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota, Colombia', N'Calle 154', 56000.0000, CAST(N'2020-08-07T14:48:46.117' AS DateTime), N'PAYMENT_NETWORK_REJECTED', N'La red financiera rechazó la transacción.', N'120327746', N'985f153c-d416-4b7e-a631-9af091775130', N'VISA', N'CREDIT_CARD')
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200807150837049', CAST(N'2020-08-07T20:08:37.050' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota, Colombia', N'Calle 154', 68000.0000, CAST(N'2020-08-07T15:11:47.567' AS DateTime), N'PAYMENT_NETWORK_REJECTED', N'La red financiera rechazó la transacción.', N'120327788', N'2b3da84d-b42b-4487-bb65-0341b2871783', N'VISA', N'CREDIT_CARD')
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200807151204425', CAST(N'2020-08-07T20:12:04.427' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota, Colombia', N'Calle 154', 84000.0000, CAST(N'2020-08-07T15:13:26.880' AS DateTime), N'EXPIRED_CARD', N'La tarjeta expiró.', N'120327794', N'c1ecbf66-82f5-452a-abca-814f6d38ee23', N'VISA', N'CREDIT_CARD')
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200807174433307', CAST(N'2020-08-07T22:44:33.307' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 16000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200808133358067', CAST(N'2020-08-08T18:33:58.067' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 6800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200808183830859', CAST(N'2020-08-08T23:38:30.860' AS DateTime), N'andrescortes', N'Carlos Andrés Cortés', N'andrescor24@gmail.com', N'3174716811', N'Bogota, Colombia', N'Calle 154', 96000.0000, CAST(N'2020-08-08T18:40:26.377' AS DateTime), N'APROBADO', N'La transacción fue aprobada.', N'120330891', N'7d980e79-b04d-427f-8eac-59c7c973f5e2', N'VISA', N'CREDIT_CARD')
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200808190555171', CAST(N'2020-08-09T00:05:55.173' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 48000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200825124138628', CAST(N'2020-08-25T12:41:38.643' AS DateTime), N'VIVIANA', NULL, NULL, NULL, NULL, NULL, 57034.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200825155403827', CAST(N'2020-08-25T15:54:03.827' AS DateTime), N'VIVIANA', NULL, NULL, NULL, NULL, NULL, 50480.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'200827061406047', CAST(N'2020-08-27T06:14:06.047' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 615992.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'201005132201225', CAST(N'2020-10-05T11:22:01.227' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 76999.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'201019084541231', CAST(N'2020-10-19T06:45:41.230' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'201019135138899', CAST(N'2020-10-19T11:51:38.900' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 76999.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'201019162628390', CAST(N'2020-10-19T14:26:28.390' AS DateTime), N'Agropuli', NULL, NULL, NULL, NULL, NULL, 9000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Reference], [Created], [Username], [Customer], [Email], [Phone], [City], [Address], [Total], [PaymentDateTime], [PayuState], [PayuResponseCode], [PayuReference], [PayuTransaction], [PayuPaymentMethod], [PayuPaymentType]) VALUES (N'201108164635160', CAST(N'2020-11-08T14:46:35.160' AS DateTime), N'JUPRICAM ', NULL, NULL, NULL, NULL, NULL, 153998.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200624015653108', 2, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200624233121084', 1, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200625141856311', 1, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200628111850356', 1, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200628111850356', 2, 3)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200722072447611', 10, 3)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803182006124', 1, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803183200489', 1, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803210016602', 1, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803210956652', 12, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803212010419', 8, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803214139630', 3, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803214804710', 2, 3)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200803220126689', 3, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200805144103350', 2, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200806070836250', 7, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200807144022722', 10, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200807144728070', 3, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200807150837049', 2, 10)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200807151204425', 5, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200807174433307', 9, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200808133358067', 2, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200808183830859', 14, 2)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200808190555171', 14, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200825124138628', 24, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200825155403827', 44, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'200827061406047', 1, 8)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'201005132201225', 1, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'201019135138899', 1, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'201019162628390', 2, 1)
INSERT [dbo].[OrderProduct] ([OrderReference], [ProductId], [Quantity]) VALUES (N'201108164635160', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Pest] ON 

INSERT [dbo].[Pest] ([Id], [Name]) VALUES (1, N'Demotispa')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (2, N'Acaros')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (3, N'Cephaloleia')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (4, N'Sibine')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (5, N'Leptophasa')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (6, N'Rynchosphurus')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (7, N'Strategus')
INSERT [dbo].[Pest] ([Id], [Name]) VALUES (8, N'Otros')
SET IDENTITY_INSERT [dbo].[Pest] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (1, N'Tierra de Diatomeas Agropuli 25kg ', N'Polvo mojable. Saco X 25 Kg Malla 200, no incluye envío. Si la compra son mas de 10 sacos, incluye envio a ciudades capitales. ', 76999.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (2, N'Tierra de diatomeas Agropuli, 2kg', N'Polvo mojable. Bolsa X 2 Kg Malla 200, no incluye envío. ', 9000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (3, N'Tierra de Diatomeas Agropuli 8 kg', N'Polvo mojable. Bolsa X 8 Kg Malla 200, no incluye envío. ', 28000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (4, N'Tierra De Diatomeas Agropuli granulada 8kg', N'Bolsa X 8 Kg Granulada, no incluye envío. ', 28000.0000, 1, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (5, N'Tierra De Diatomeas Agropuli GH granulada x 40kg  ', N'Recomendada para arroz y pasturas
Agropuli GH, Saco X 40Kg Granulada, no incluye envío, En cantidades menores a 10 sacos, mas cantidades envios a municipio y ciudades en vias principales. 
', 123200.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (6, N'Tierra De Diatomeas Agropuli + humus 40kg tdda H1 ', N'Saco X 40 Kg Granulada con Humus + Agropuli, no incluye envío. Si la compra son mas de 10 sacos, incluye envio a ciudades capitales. ', 131300.0000, 1, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (7, N'Humus Agropuli 20lt', N'Garrafa X 20 Lt no incluye envío. Si la compra son mas de 6 garrafas, incluye envio a ciudades capitales. ', 240000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (8, N'Arena para gatos DIATOPET´S  8 KG', N'Bolsa X 8 Kg Granulada, no incluye envío. Si la compra son mas de 10 bolsas, incluye envio a ciudades capitales. 
', 28000.0000, 4, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (9, N'Arena para gatos DIATOPET´S 4KG', N'Bolsa X 4 Kg Granulada, no incluye envío. ', 16000.0000, 4, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (10, N'1 agropuli organico Foliar ', N'plaga a controlar y cultivo', 120000.0000, 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (11, N'agropuli a tu medida', N'Por favor, indiquenos la enmienda o fertilizante a a mezclar con la tierra de diatomeas Agropuli. Minimo 40 sacos', 0.0000, 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (12, N'Promoción TDDA en polvo 10 + 3 con aplicación ', N'Por la compra de cada 10 sacos de 25kg de Agropuli en polvo, recibe 3 sacos de obsequio, te lo Aplicamos edaficamente y foliar,en forma espolvoreada, cultivo de palma o banano y Plátano, en la z2 santander y cesar, z8 magdalena y Bolívar. Z3 meta casanare. Incluye envio a los Municipios del cesar. ', 1088000.0000, 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (13, N'Promoción tierra de diatomeas Agropuli 10+3', N'Por la compra de cada 10 sacos TDDA 1 Natural, recibe 3 sacos de obsequio Saco X25 Kg,  incluye transporte nacional a ciudades en las vias principales. ', 769999.0000, 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (14, N'Palín Malayo Jaya Mata/KLS 3"', N'05050106', 38022.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (15, N'Análisis de suelos ', N'Análisis de muestra ', 98000.0000, 6, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (16, N'Tdda para polinizar', N'1 kg de TDDA (En la mezcla de 3 gr de polen, ana y talco por flor). Remplazaremos el 75% del talco por Agropuli.
Es decir por cada kg de mezcla pondremos: 43g de polen, 67gr de Ana, 223gr de talco y 667gr de Agropuli. ', 3080.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (17, N'Super promoción 10+3', N'Por la compra de contado anticipado, de cada 10 sacos, recibe 3 de obsequio 10 + 3 = 13 
No incluye transporte 
', 769990.0000, 9, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (18, N'Cuchillo Malayo Jaya Mata JM222B', N'05050102', 73932.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (19, N'Cuchillo Malayo Jaya Mata JM222C', N'05050103', 73932.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (20, N'Cuchillo Malayo KLS', N'05050104', 73932.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (21, N'Cuchillo Malayo Ingles', N'05050105', 73932.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (22, N'Palín Malayo Jaya Mata/KLS 4"', N'05050107', 44359.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (23, N'Palín Malayo Mata/KLS 4,5"', N'05050108', 50696.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (24, N'Palin Malayo Jaya Mata/KLS 5"', N'05050109', 57034.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (25, N'Palín Malayo Jaya Mata/KLS 6"', N'05050110', 67595.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (26, N'Vara Macho Malaya (JM/KLS) 1, 1/4" Silver', N'05050111', 145518.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (27, N'Vara Hembra Malaya (JM/KLS) 1, 1/4" Silver', N'05050112', 154906.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (28, N'Vara Ext/Patera Malaya 1, 3/4" Silver', N'05050113', 164294.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (29, N'Vara Macho Malaya (JM/KLS) 1, 1/4" Gold', N'05050114', 178376.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (30, N'Vara Hembra Malaya (JM/KLS) 1, 1/2" Gold', N'05050115', 187765.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (31, N'Vara Ovalada Ecuatoriana Macho (1, 1/4)', N'05050116', 133280.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (32, N'Vara Ovalada Ecuatoriana Hembra (1, 1/2)', N'05050117', 147560.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (33, N'Patera 1, 3/4', N'05050118', 183260.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (34, N'Sostenedor S Cuchillo JM', N'05050119', 22680.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (35, N'Sostenedor B Cuchillo JM', N'05050120', 22680.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (36, N'Sostenedor KLS', N'05050121', 22680.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (37, N'Abrazadera S JM', N'05050122', 30240.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (38, N'Abrazadera B JM', N'05050123', 21420.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (39, N'Abrazadera KLS Palanca ', N'05050124', 20160.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (40, N'Abrazadera KLS Sostenedor', N'05050125', 12600.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (41, N'Tapón KLS', N'05050126', 5600.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (42, N'Canasta Recolectora JM', N'05050127', 28000.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (43, N'Canasta Recolectora KLS', N'05050128', 28000.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (44, N'Lanza de Cosecha Jaya Mata', N'05050129', 5040.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (45, N'Garfio de Cosecha Jaya Mata', N'05050130', 15565.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (46, N'Pera Checa #10', N'05200105', 51750.0000, 5, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (47, N'Tecni - Diez EM x Litro', N'05200101', 27059.0000, 7, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (48, N'Tecni - Quince EM x Litro', N'05200102', 27059.0000, 7, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (49, N'Tecni - Bor 13 x Litro', N'05200103', 32941.0000, 7, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (50, N'Potagreen x Litro', N'05200104', 23529.0000, 7, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (51, N'Guante Palmero 15 Manga Cañamo', N'05150101', 23520.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (52, N'Guante Palmero 20 Manga Cañamo', N'05150102', 25060.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (53, N'Guante Palmero Corto', N'05150103', 21280.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (54, N'Guante Ing. Reforzado Corto', N'05150104', 15680.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (55, N'Guante Ing. Reforzado Manga 15 CM', N'05150105', 20160.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (56, N'Guante Ing. Doble Refuerzo', N'05150106', 18620.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (57, N'Guante Ing. Sencillo Corto', N'05150107', 12600.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (58, N'Guante Carnaza VQ 15 CM', N'05150108', 15960.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (59, N'Guante Carnaza VQ Corto', N'05150109', 13440.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (60, N'Funda Machete Rula 24"', N'05150110', 16380.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (61, N'Funda Machete Barrigon 16, 18, 20, 22', N'05150111', 15120.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (62, N'Funda para Machete 3 Canales de 16, 18, 20', N'05150112', 15120.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (63, N'Funda para Peinilla 16, 18 y 20"', N'05150113', 13160.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (64, N'Funda Cuchillo Jaya Mata - A', N'05150114', 19600.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (65, N'Funda Palín Jaya Mata', N'05150115', 15680.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (66, N'Funda Cuchillo KLS', N'05150116', 32662.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (67, N'Funda Cuchillo Cuerina Nal. ', N'05150117', 30450.0000, 12, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (68, N'Humus Agropuli x 1 litro ', N'Acdidos humicos y fulvicos
X 1 litro ', 12000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (69, N'Promoción TDDA 5+1', N'Compra 5 sacos de 25kg de tierra de diatomeas Agropuli y recibe un saco de obsequio. ', 384995.0000, 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (70, N'Promoción TDDA + H granulado 10+3', N'Por la compra de cada 10 sacos de 40 kg, granulada TDDA + H recibe 3 de obsequio ', 1313000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (71, N'Kit de control de derrames', N'Manga de 1.5mt x 10 cm de diámetro ', 26000.0000, 14, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (72, N'Humus Agropuli caja x 24 litros ', N'Humus Agropuli caja x 24 litros ', 240000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (73, N'Leonarditas Agropuli ', N'Leonardita  saco x 50 kg
Materia primas, no incluye  transporte. ', 86000.0000, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (74, N'Azufre', N'Saco por 50kg
Malla 150', 65000.0000, 9, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [CategoryId], [IsActive]) VALUES (75, N'Azufre micronizado', N'Ssco x 50kg
Malla400', 86000.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Referral] ON 

INSERT [dbo].[Referral] ([Id], [Created], [Username], [NationalId], [FullName], [Phone]) VALUES (1, CAST(N'2020-09-26T09:24:45.927' AS DateTime), N'andrescortes', N'31425967', N'Esperanza', N'3112530085')
INSERT [dbo].[Referral] ([Id], [Created], [Username], [NationalId], [FullName], [Phone]) VALUES (2, CAST(N'2020-10-19T06:32:38.257' AS DateTime), N'Agropuli', N'51752757', N'Nubia Rodríguez ', N'3107819421 ')
SET IDENTITY_INSERT [dbo].[Referral] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Cliente')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Vendedor')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Tecnico')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (1, N'Poda 1 anillo, 3 a 10 hojas', 1, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (2, N'Poda 2 anillos, 11 a 20 hojas', 1, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (3, N'Poda 3 anillos, 21 hojas en adelante', 1, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (4, N'Poda palma de 1 a 3 años', 1, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (5, N'Limpia plato guadaña', 2, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (6, N'Limpia y rastra', 2, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (7, N'Limpia guadaña/ha', 2, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (8, N'Limpia mecanizada/ha', 2, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (9, N'Cosecha < 3 años', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (10, N'Cosecha 4 a 10 años', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (11, N'Cosecha > 11 años', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (12, N'Poda Cosecha', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (13, N'Alze Cosecha', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (14, N'Transporte a extractora/ton', 3, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (15, N'Fertilizacion manual < 500gr', 4, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (16, N'Fertilizacion manual > 600gr', 4, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (17, N'Fumigacion/ha con tractor estacionaria', 5, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (18, N'Fumigacion/ha con motor espalda', 5, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (19, N'Fumigacion/ha con motor espolvoreada', 5, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (20, N'Censo Sanidad/ha, plagas', 6, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (21, N'Censo Sanidad/ha, enfermedades', 6, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (22, N'Cirugias sola, grado 1 y 2', 7, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (23, N'Tratamiento con cirugias, grado 3 y 4', 7, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (24, N'Tratamientos con cirugias y al anillo', 7, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (25, N'Polinizador por flor', 8, 1)
INSERT [dbo].[Service] ([Id], [Name], [CategoryId], [IsActive]) VALUES (26, N'Unidad de Filtración según requerimiento ', 9, 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (1, N'Podas por cuadrillas (poda y pica por palma)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (2, N'Limpias (Palma o ha)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (3, N'Cosecha (Tonelada)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (4, N'Fertilizacion (Palma)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (5, N'Fumigacion (ha)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (6, N'Censo Sanidad (ha)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (7, N'Sanidad (Palma)')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (8, N'Polinizacion')
INSERT [dbo].[ServiceCategory] ([Id], [Name]) VALUES (9, N'Filtración y Biorremediacion de aguas y lixiviados ')
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'admin', N'admin', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Adriana ', N'1018459635', 2, N'1018459635', N'Adriana salamanca', N'admasabe21@gmail.com', N'Calle 2 #5-26', N'Ubalá, Cundinamarca, Colombia', NULL, N'3108164364', NULL, N'Plátano ', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Adrianasalamanca', N'Agropuli2020', 2, N'1018459634', N'Adriana salamanca', N'adrianasalamancab@gmail.com', N'Calle 2 #5-23', N'Ubalá, Cundinamarca, Colombia', N'Centro', N'3108164364', NULL, N'Cafe', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Agronel', N'Agronel1321', 2, N'7061831', N'Nelson Enrique Díaz ', N'agronelconsultorias@gmail.com', N'Cll2 D #14-60', N'San Alberto, Cesar, Colombia', N'Betancourt', N'3168593304', N'Agronel', N'Palma de Aceite', N'San Alberto')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Agropuli', N'Cesar123', 2, N'19438319 ', N'Cesar Labrador ', N'tierradediatomeas@gmail.com', N'Calle 58 sur 16 51 ', N'Bogota, Colombia', N'San Benito ', N'3003122321 ', N'Agropuli ', N'Palma', N'Bogotá ')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Agropuli1', N'Nubia123', 2, N'51752757', N'Nubia Rodríguez', N'estellaantolinez@gmail.com', N'Calle 58 1651', N'Bogota, Colombia', N'Usaquen', N'3204806107', N'Asomadero', N'Cafe', N'Bogotá')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Alexcontador', N'Alex880327*', 2, N'1056074506', N'Alexander Rincon Martínez', N'alexcontador0327@gmail.com', N'CR 142 137 54', N'Bogota, Colombia', N'Bogotá', N'3204379920', N'Bogotá', N'Bogotá', N'Bogotá')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'almacendeprovisionagricola@gmail.com', N'exito2013', 2, N'13364708', N'Huber Fernando Sánchez Pérez', N'almacendeprovisionagricola@gmail.com', N'Calle 8A N o.14-75', N'Ocaña, North Santander, Colombia', NULL, N'3132803462', NULL, N'Frutales', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'andrescortes', N'800619', 2, N'79938753', N'Carlos Andrés Cortés', NULL, N'Calle 154', N'Bogota, Colombia', NULL, N'3174716811', NULL, N'Plátano', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Arley Rico', N'08357792', 2, N'91540835', N'Arley Steven Rico Barajas', N'arleyrico1230@gmail.com', N'Calle 2A # 647 ', N'San Alberto, Cesar, Colombia', NULL, N'3184084037', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Campo ', N'Diatomea', 2, N'76297021', N'Segundo Josafat López Molina ', N'lopezsegundo973@gmail.com', NULL, NULL, N'Camposano', N'3186069947', N'El tambor ', N'Café ', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'César julio Montoya Ruiz', N'César 51', 2, N'19492355', N'César julio Montoya Ruiz', N'cesarjuliomontoyaruiz2@gmail.com', NULL, N'San Juan de Arama, Meta, Colombia', N'Santander', N'3163593786', N'Altamira', N'Pastos', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Cesarl', N'1020', 2, N'1020779744 ', N'Cesa augusto labrador', NULL, N'Calle 140 11 32', N'Bogota, Colombia', N'Bogota', N'3013272757 ', N'Bogota', N'Banano', N'Bogota')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Cmatiz', N'25002020', 2, N'39792108', N'Maria Constanza Matiz Bretón ', N'constanzamatiz@gmail.com', N'Calle 77# 10 - 20', N'Bogota, Colombia', NULL, N'3203334093', N'Valiente', N'Laurel', N'Cundinamarca')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Diana marcela', N'2408', 2, N'1098716934', N'Diana marcela rodriguez', N'dmarcelarodriguez2015@gmail.com', N'Cll 5 #1b101', N'San Alberto, Cesar, Colombia', NULL, N'3204562797', NULL, N'Palmicultor', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Diego lopez ', N'1112785256', 2, N'1112785356', N'Diego fernando lopez amaya ', N'lopezdiegofer201163@gmail.com', N'carrera 2B # 19-15', N'Dosquebradas, Risaralda, Colombia', N'N/A', N'3168714246', N'N/A', N'cafe ', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Eligio Arias Arias', N'4758', 2, N'2126250', N'Eligio Arias Arias', N'eligioariasarias@gmail.com', N'Vereda San Ignacio-La Estrella Fresno-Tolima.', NULL, NULL, N'3108152020', N'Villasander', N'Cacao', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Francy Quintero', N'1976', 2, N'42128207', N'Francy Elena Quintero Vargas ', N'elenaquinterofranci@gmail.com', N'La Polonia ', N'La Celia, Risaralda, Colombia', N'La Polonia', N'3145094335', N'El Bosque', N'Café ', N'La Celia.  Vereda la Polonia ')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'gonzalezdiego', N'simon3001047179', 2, N'79602693', N'Diego Alfonso González Rojas', N'apiariomilfloresibague@gmail.com', N'Manzana 30 casa 27 etapa 1. B/Villa Café', NULL, NULL, N'3164684809', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Héctor', N'1084897101', 2, N'1084897101', N'Héctor cuspian Caicedo', N'hectorcuspian@gmail.com', N'Vereda palmito Timaná', NULL, NULL, N'3203984468', N'El roble', N'Café plátano ', N'Vereda palmito')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'jaigxx@hotmail.com', N'Saralucia1', 2, N'18470250', N'Jorge Alberto Isaza Garay', N'jaigxx@hotmail.com', N'CRA 23d 10-20', N'Armenia, Quindio, Colombia', N'Chaquiro', N'3022106890', N'El jordan', N'Limon', N'Quimbaya')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Jalprado', N'Jalprado1', 2, N'80744399', N'Julián prado', NULL, N'Calle 134 ', N'Bogota, Colombia', N'Bogota', N'3108446049', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Javier Díaz ', N'Javiersteven21', 2, N'1098705588 ', N'Javier Steven Diaz duque ', N'javidiaz0521@gmail.com', N'Calle 12 # 2 n 45', N'San Alberto, Cesar, Colombia', NULL, N'3184725139 ', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Julián ', N'Julian880524', 2, N'1065235383', N'Yesid Julián ', N'yesidjulian2011@hotmail.com', N'Calle 1 d 1a 86', N'San Alberto, Cesar, Colombia', N'San Alberto ', N'3178240525', N'Girasol', N'Palma', N'San Alberto ')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'JUPRICAM ', N'1818Juan', 2, N'17446497', N'Juan Prieto Campos ', N'juan.prieto37@gmail.com', N'CR 15 20a 17', N'Acacias, Acacías, Meta, Colombia', N'Montelibano ', N'3162233623', N'Los Caimos ', N'Cacao', N'Lote 1')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'maobern@hotmail.com', N'24530*9ug', 2, N'79062600', N'Mauricio Bernal Caviedes', N'maobern@hotmail.com', N'Cra 101 N. 69-21', N'Bogota, Colombia', NULL, N'3115978202', N'La Pradera de Potosí Club Residencial q', NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Mauricio ', N'Murillo ', 2, N'80135361', N'Jair Mauricio Murillo Rodriguez ', N'jairmurillo@gruogaia.com', N'Cr 4 con calle 8A ', N'Planadas, Tolima, Colombia', N'Pueblitos ', N'3123699720', N'La Suiza ', N'Café, pastos ', NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Melany', N'Jaday', 2, N'1083900229', N'Melany', N'hectorcuspian@gmail.com', N'Criollos pitálito', N'Pitalito, Huila, Colombia', N'Recuerdo', N'3132419073', N'Vella vista', N'Café ', N'Pitálito')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Nilson Rey', N'19420158', 2, N'19420158', N'Nilson Rey Castellanos', N'nilrey2471@gmail.com', N'Calle 9#12-35', N'Granada, Cundinamarca, Colombia', N'Santa lucia', N'3102690806', N'La alcancia', N'Gulupa', N'San José  bajó ')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'nmorales', N'132543', 2, N'80236711', N'Nelson Morales', N'njmoralesm@gmail.com', N'Santa Sofía ', N'Villapinzón, Cundinamarca, Colombia', N'La Joya', N'3114468680', N'Santa Sofía ', N'Papa', N'Villapinzón ')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'omarcalderon', N'oc123', 2, N'12121965', N'Omar Ventura Calderón Medina', N'omarventuracalderonmedina@gmail.com', N'Calle 25 A #5-54, entre 5tay 6ta B. Belalcazar', N'Ibagué, Ibague, Tolima, Colombia', NULL, N'3209002377', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Oscar', N'Mariajose2017', 2, N'1061687932', N'Oscar ', N'oscarbuitron@misena.edu.co', N'Cinco días', N'Timbio, Timbío, Cauca, Colombia', N'Cinco días', N'3154763549', N'Limon', NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Prueba1', N'1018459635', 2, N'1018459632', N'Adriana Ensayo 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'VIVIANA', N'VIVIANA', 2, N'1026134451', N'Vivíana Milena Gallego Arcila', N'biviana18_18@hotmail.com', N'Carrera 8 A Bis 156 35 piso 2', N'Bogota, Colombia', NULL, N'3207332686', NULL, NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Wp', N'123', 2, N'18612682', N'John Wilmar Preciado Rendon', N'jwpreciado1985@gmail.com', N'Calle 7 #12-40', N'Belen de Umbria, Belén de Umbría, Risaralda, Colombia', N'Providencia', N'3108483634', N'Villa luz', N'Cafe', N' Belen de umbria')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [NationalId], [FullName], [Email], [Address], [Town], [Vereda], [Phone], [Farm], [Crop], [Location]) VALUES (N'Yubeidys', N'Yubeidys21', 2, N'1065238203', N'Yubeidys guevara', N'tecnico1.agropuli.sa@gmail.com', N'Pedregoza', N'San Alberto, Cesar, Colombia', NULL, N'3225961594', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (1, N'Moto')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (2, N'Motocarro')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (3, N'Camioneta 1 TON')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (4, N'Camion de 5 TON')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (5, N'Camion de 8 TON')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (6, N'Camion de mas de 10 TON')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (7, N'Grua')
INSERT [dbo].[Vehicle] ([Id], [Name]) VALUES (8, N'Tractor')
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkWithUs] ON 

INSERT [dbo].[WorkWithUs] ([Id], [Created], [Username], [Description], [JobId], [VehicleId], [IsTechnician]) VALUES (12, CAST(N'2020-10-22T08:06:41.387' AS DateTime), N'Agropuli', N'1', 10, 1, 1)
SET IDENTITY_INSERT [dbo].[WorkWithUs] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Department]
GO
ALTER TABLE [dbo].[Favor]  WITH CHECK ADD  CONSTRAINT [FK_Favor_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Favor] CHECK CONSTRAINT [FK_Favor_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderReference])
REFERENCES [dbo].[Order] ([Reference])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_Referral_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_Referral_User]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ServiceCategory] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[WorkWithUs]  WITH CHECK ADD  CONSTRAINT [FK_WorkWithUs_Job] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([Id])
GO
ALTER TABLE [dbo].[WorkWithUs] CHECK CONSTRAINT [FK_WorkWithUs_Job]
GO
ALTER TABLE [dbo].[WorkWithUs]  WITH CHECK ADD  CONSTRAINT [FK_WorkWithUs_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[WorkWithUs] CHECK CONSTRAINT [FK_WorkWithUs_User]
GO
ALTER TABLE [dbo].[WorkWithUs]  WITH CHECK ADD  CONSTRAINT [FK_WorkWithUs_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO
ALTER TABLE [dbo].[WorkWithUs] CHECK CONSTRAINT [FK_WorkWithUs_Vehicle]
GO
USE [master]
GO
ALTER DATABASE [Agropuli] SET  READ_WRITE 
GO
