USE [master]
GO
/****** Object:  Database [Karting]    Script Date: 25.01.2022 14:55:44 ******/
CREATE DATABASE [Karting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Karting', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Karting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Karting_log', FILENAME = N'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Karting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Karting] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Karting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Karting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Karting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Karting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Karting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Karting] SET ARITHABORT OFF 
GO
ALTER DATABASE [Karting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Karting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Karting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Karting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Karting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Karting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Karting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Karting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Karting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Karting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Karting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Karting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Karting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Karting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Karting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Karting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Karting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Karting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Karting] SET  MULTI_USER 
GO
ALTER DATABASE [Karting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Karting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Karting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Karting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Karting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Karting] SET QUERY_STORE = OFF
GO
USE [Karting]
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
USE [Karting]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID_Event] [int] IDENTITY(1,1) NOT NULL,
	[Event_Name] [nvarchar](50) NOT NULL,
	[ID_EventType] [nchar](5) NOT NULL,
	[ID_Race] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[MaxParticipants] [smallint] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID_Event] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Type]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Type](
	[ID_Event_type] [nchar](5) NOT NULL,
	[Event_Type_Name] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Event_Type_1] PRIMARY KEY CLUSTERED 
(
	[ID_Event_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Race]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Race](
	[ID_Race] [int] IDENTITY(1,1) NOT NULL,
	[Race_Name] [varchar](80) NOT NULL,
	[Sity] [varchar](50) NOT NULL,
	[ID_Country] [nchar](3) NOT NULL,
	[Year_Held] [smallint] NOT NULL,
 CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED 
(
	[ID_Race] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ID_Result] [int] IDENTITY(1,1) NOT NULL,
	[ID_Registration] [int] NOT NULL,
	[ID_Event] [int] NOT NULL,
	[BidNumber] [smallint] NOT NULL,
	[RaceTime] [time](7) NOT NULL,
 CONSTRAINT [PK_RegistrationEvent] PRIMARY KEY CLUSTERED 
(
	[ID_Result] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ResultsVIew]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ResultsVIew]
AS
SELECT dbo.Race.Race_Name, dbo.Event_Type.Event_Type_Name, dbo.Result.RaceTime, dbo.Result.BidNumber, dbo.Result.ID_Registration
FROM dbo.Race INNER JOIN
dbo.Event ON dbo.Race.ID_Race = dbo.Event.ID_Race INNER JOIN
dbo.Event_Type ON dbo.Event.ID_EventType = dbo.Event_Type.ID_Event_type INNER JOIN
dbo.Result ON dbo.Event.ID_Event = dbo.Result.ID_Event
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[ID_Registration] [int] IDENTITY(1,1) NOT NULL,
	[ID_Racer] [int] NOT NULL,
	[Registration_Date] [date] NOT NULL,
	[ID_Registration_Status] [int] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[ID_Charity] [int] NOT NULL,
	[SponsorshipTarget] [decimal](10, 2) NOT NULL,
	[ID_EvenType] [nchar](5) NULL,
	[ID_InventoryType] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[ID_Registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racer]    Script Date: 25.01.2022 14:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racer](
	[ID_Racer] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[ID_Country] [nchar](3) NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Racer] PRIMARY KEY CLUSTERED 
(
	[ID_Racer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration_Status]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration_Status](
	[ID_Registration_Status] [int] IDENTITY(1,1) NOT NULL,
	[Statu_Name] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Registration_Status] PRIMARY KEY CLUSTERED 
(
	[ID_Registration_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AllRacers]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllRacers]
AS
SELECT dbo.Event_Type.Event_Type_Name, dbo.Race.Race_Name, dbo.Racer.First_Name, dbo.Racer.Last_Name, dbo.Registration_Status.Statu_Name
FROM dbo.Event INNER JOIN
dbo.Event_Type ON dbo.Event.ID_EventType = dbo.Event_Type.ID_Event_type INNER JOIN
dbo.Race ON dbo.Event.ID_Race = dbo.Race.ID_Race INNER JOIN
dbo.Registration ON dbo.Event_Type.ID_Event_type = dbo.Registration.ID_EvenType INNER JOIN
dbo.Racer ON dbo.Registration.ID_Racer = dbo.Racer.ID_Racer INNER JOIN
dbo.Registration_Status ON dbo.Registration.ID_Registration_Status = dbo.Registration_Status.ID_Registration_Status
WHERE (dbo.Race.Race_Name = 'Kart Skills 2022')
GO
/****** Object:  Table [dbo].[Country]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID_Country] [nchar](3) NOT NULL,
	[Country_Name] [varchar](50) NOT NULL,
	[Country_Flag] [varchar](50) NOT NULL,
 CONSTRAINT [PK_contry] PRIMARY KEY CLUSTERED 
(
	[ID_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RacerView]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RacerView]
AS
SELECT dbo.Racer.ID_Racer, SUBSTRING(dbo.Racer.First_Name, 0, { fn LENGTH(dbo.Racer.First_Name) } + 1) + ' ' + SUBSTRING(dbo.Racer.Last_Name, 0, { fn LENGTH(dbo.Racer.Last_Name) } + 1)
+ ' -' + ' ' + '(' + SUBSTRING(dbo.Country.Country_Name, 0, { fn LENGTH(dbo.Country.Country_Name) } + 1) + ')' AS Expr2
FROM dbo.Racer INNER JOIN
dbo.Country ON dbo.Racer.ID_Country = dbo.Country.ID_Country
GO
/****** Object:  Table [dbo].[Sponsorship]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorship](
	[ID_Sponsorship] [int] IDENTITY(1,1) NOT NULL,
	[SponsorName] [nvarchar](150) NOT NULL,
	[Amount] [decimal](10, 2) NULL,
	[ID_Racer] [int] NULL,
 CONSTRAINT [PK_Sponsorship] PRIMARY KEY CLUSTERED 
(
	[ID_Sponsorship] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Charity]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charity](
	[ID_Сharity] [int] IDENTITY(1,1) NOT NULL,
	[Charity_Name] [nvarchar](100) NOT NULL,
	[Charity_Description] [nvarchar](3000) NULL,
	[Charity_Logo] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Charity] PRIMARY KEY CLUSTERED 
(
	[ID_Сharity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TotalCharityMoney]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TotalCharityMoney]
AS
SELECT        SUM(dbo.Sponsorship.Amount) AS Expr1, dbo.Charity.Charity_Name, dbo.Charity.Charity_Logo
FROM            dbo.Charity INNER JOIN
                         dbo.Registration ON dbo.Charity.ID_Сharity = dbo.Registration.ID_Charity INNER JOIN
                         dbo.Racer ON dbo.Registration.ID_Racer = dbo.Racer.ID_Racer INNER JOIN
                         dbo.Sponsorship ON dbo.Racer.ID_Racer = dbo.Sponsorship.ID_Racer
GROUP BY dbo.Charity.Charity_Name, dbo.Charity.Charity_Logo
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID_Gender] [nchar](1) NOT NULL,
	[Gender_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID_Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ID_InventoryType] [int] IDENTITY(1,1) NOT NULL,
	[InventoryName] [varchar](50) NULL,
	[InventoryDescription] [varchar](50) NULL,
	[InventoryPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ID_InventoryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [nchar](1) NOT NULL,
	[Role_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staffid] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[ID_Gender] [nchar](1) NOT NULL,
	[Positionid] [smallint] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Comments] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staffid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[ID_Item] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Bracelet] [int] NOT NULL,
	[Helmet] [int] NOT NULL,
	[Equipment] [int] NOT NULL,
	[ID_Inventory] [int] NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[ID_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[First_Name] [nvarchar](30) NULL,
	[Last_Name] [nvarchar](30) NULL,
	[ID_Role] [nchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 25.01.2022 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[ID_Volunteer] [nchar](3) NOT NULL,
	[First_Name] [nvarchar](80) NOT NULL,
	[Last_Name] [nvarchar](80) NOT NULL,
	[ID_Country] [nchar](3) NOT NULL,
	[Gender_ID] [nchar](1) NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[ID_Volunteer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Charity] ON 

INSERT [dbo].[Charity] ([ID_Сharity], [Charity_Name], [Charity_Description], [Charity_Logo]) VALUES (1, N'Bill & Melinda Gates Foundation[Edited]', N'Bill & Melinda Gates Foundation is the largest private foundation in the world, founded by Bill and Melinda Gates. It was launched in 2000 and is said to be the largest transparently operated private foundation in the world. The primary aims of the foundation are, globally, to enhance healthcare and reduce extreme poverty, and in America, to expand educational opportunities and access to information technology. The foundation, based in Seattle, Washington, is controlled by its three trustees: Bill Gates, Melinda Gates and Warren Buffett. Other principal officers include Co-Chair William H. Gates, Sr. and Chief Executive Officer Susan Desmond-Hellmann.', N'C:\Users\Alesha\source\repos\SessionsWorldScills\FirstSessionWorldScills\Icons\BillAndMilinda.png')
INSERT [dbo].[Charity] ([ID_Сharity], [Charity_Name], [Charity_Description], [Charity_Logo]) VALUES (2, N'GAVI', N'GAVI or Global Alliance for Vaccines and Immunization is a public-private global health partnership committed to increasing access to immunisation in poor countries', N'C:\Users\Alesha\source\repos\SessionsWorldScills\FirstSessionWorldScills\Icons\GAVI.png')
INSERT [dbo].[Charity] ([ID_Сharity], [Charity_Name], [Charity_Description], [Charity_Logo]) VALUES (3, N'The Red Cross', N'Relief in times of crisis, care when it''s needed most and commitment when others turn away. Red Cross is there for people in need, no matter who you are, no matter where you live.

The Red Cross Red Crescent Movement helps tens of millions of people around the world each year and we also care for local communities in our local country and further afield.

With millions of volunteers worldwide and thousands of members, volunteers and supporters, we can reach people and places like nobody else.', N'C:\Users\Alesha\source\repos\SessionsWorldScills\FirstSessionWorldScills\Icons\the-red-cross-logo.png')
INSERT [dbo].[Charity] ([ID_Сharity], [Charity_Name], [Charity_Description], [Charity_Logo]) VALUES (5, N'Oxfam International', N'Oxfam is an international confederation of 17 organizations working together with partners and local communities in more than 90 countries.', N'C:\Users\Alesha\source\repos\SessionsWorldScills\FirstSessionWorldScills\Icons\oxfam-international-logo.png')
INSERT [dbo].[Charity] ([ID_Сharity], [Charity_Name], [Charity_Description], [Charity_Logo]) VALUES (7, N'Querstadtein Berlin', N'Querstadtein is the first project of Stadtsichten e.V., a registered non-profit association.', N'querstadtein-logo.png')
SET IDENTITY_INSERT [dbo].[Charity] OFF
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'AND', N'Andorra', N'flag_andorra.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ARG', N'Argentina', N'flag_argentina.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'AUS', N'Australia', N'flag_australia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'AUT', N'Austria', N'flag_austria.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'BEL', N'Belgium', N'flag_belgium.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'BOT', N'Botswana', N'flag_botswana.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'BRA', N'Brazil', N'flag_brazil.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'BUL', N'Bulgaria', N'flag_bulgaria.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CAF', N'Central African Republic', N'flag_central_african_republic.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CAN', N'Canada', N'flag_canada.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CHI', N'Chile', N'flag_chile.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CHN', N'China', N'flag_china.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CIV', N'Ivory Coast', N'flag_ivory_coast.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CMR', N'Cameroon', N'flag_cameroon.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'COL', N'Colombia', N'flag_colombia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CRO', N'Croatia', N'flag_croatia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'CZE', N'Czech Republic', N'flag_czech_republic.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'DEN', N'Denmark', N'flag_denmark.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'DOM', N'Dominican Republic', N'flag_dominican_republic.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ECU', N'Ecuador', N'flag_ecuador.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'EGY', N'Egypt', N'flag_egypt.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ESA', N'El Salvador', N'flag_el_salvador.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ESP', N'Spain', N'flag_spain.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'EST', N'Estonia', N'flag_estonia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'FIN', N'Finland', N'flag_finland.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'FRA', N'France', N'flag_france.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GBR', N'United Kingdom', N'flag_united_kingdom.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GBS', N'Guinea-Bissau', N'flag_guinea.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GEQ', N'Equatorial Guinea', N'flag_equatorial_guinea.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GER', N'Germany', N'flag_germany.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GRE', N'Greece', N'flag_greece.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GUA', N'Guatemala', N'flag_guatemala.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'GUI', N'Guinea', N'flag_guinea-bissau.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'HKG', N'Hong Kong', N'flag_hong_kong.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'HON', N'Honduras', N'flag_honduras.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'HUN', N'Hungary', N'flag_hungary.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'INA', N'Indonesia', N'flag_indonesia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'IND', N'India', N'flag_india.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'IRL', N'Ireland', N'flag_ireland.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ISR', N'Israel', N'flag_israel.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ITA', N'Italy', N'flag_italy.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'JAM', N'Jamaica', N'flag_jamaica.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'JOR', N'Jordan', N'flag_jordan.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'JP ', N'Japan', N'flag_japan.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'JPN', N'Japan', N'flag_japan.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'KEN', N'Kenya', N'flag_kenya.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'KOR', N'South Korea', N'flag_south_korea.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'KSA', N'Saudi Arabia', N'flag_saudi_arabia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'LAT', N'Latvia', N'flag_latvia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'LIE', N'Liechtenstein', N'flag_liechtenstein.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'LTU', N'Lithuania', N'flag_lithuania.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'LUX', N'Luxembourg', N'flag_luxembourg.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MAC', N'Macau', N'flag_macau.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MAD', N'Madagascar', N'flag_madagascar.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MAS', N'Malaysia', N'flag_malaysia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MDA', N'Moldova', N'flag_moldova.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MEX', N'Mexico', N'flag_mexico.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MKD', N'Macedonia', N'flag_macedonia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MLI', N'Mali', N'flag_mali.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MLT', N'Malta', N'flag_malta.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MNE', N'Montenegro', N'flag_montenegro.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MON', N'Monaco', N'flag_monaco.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'MRI', N'Mauritius', N'flag_mauritius.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'NCA', N'Nicaragua', N'flag_nicaragua.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'NED', N'Netherlands', N'flag_netherlands.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'NIG', N'Niger', N'flag_niger.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'NOR', N'Norway', N'flag_norway.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'NZL', N'New Zealand', N'flag_new_zealand.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'PAN', N'Panama', N'flag_panama.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'PAR', N'Paraguay', N'flag_paraguay.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'PER', N'Peru', N'flag_peru.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'PHI', N'Philippines', N'flag_philippines.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'POL', N'Poland', N'flag_poland.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'POR', N'Portugal', N'flag_portugal.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'PUR', N'Puerto Rico', N'flag_puerto_rico.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'QAT', N'Qatar', N'flag_qatar.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'ROU', N'Romania', N'flag_romania.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'RSA', N'South Africa', N'flag_south_africa.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'RUS', N'Russia', N'flag_russia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'SEN', N'Senegal', N'flag_senegal.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'SIN', N'Singapore', N'flag_singapore.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'SUI', N'Switzerland', N'flag_switzerland.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'SVK', N'Slovakia', N'flag_slovakia.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'SWE', N'Sweden', N'flag_sweden.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'THA', N'Thailand', N'flag_thailand.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'TPE', N'Chinese Taipei', N'flag_chinese_taipei.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'TUR', N'Turkey', N'flag_turkey.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'UAE', N'United Arab Emirates', N'flag_united_arab_emirates.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'URU', N'Uruguay', N'flag_uruguay.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'USA', N'United States', N'flag_usa.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'VAT', N'Vatican', N'flag_vatican.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'VEN', N'Venezuela', N'flag_venezuela.png')
INSERT [dbo].[Country] ([ID_Country], [Country_Name], [Country_Flag]) VALUES (N'VIE', N'Vietnam', N'flag_vietnam.png')
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (1, N'Cairo 2.5KM Race', N'2.5KM', 4, CAST(N'2015-03-17T00:00:00.000' AS DateTime), CAST(5000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (2, N'
Giza desert 6.5KM Race', N'6.5KM', 4, CAST(N'2015-03-25T00:00:00.000' AS DateTime), CAST(8000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (4, N'Red Send 4KM Race ', N'4KM  ', 4, CAST(N'2015-03-10T00:00:00.000' AS DateTime), CAST(6500.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (5, N'Rio 6.5KM Race', N'6.5KM', 10, CAST(N'2014-08-17T00:00:00.000' AS DateTime), CAST(2700.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (7, N'Rio''s Beach 4KM Race', N'4KM  ', 10, CAST(N'2014-08-10T00:00:00.000' AS DateTime), CAST(3500.00 AS Decimal(10, 2)), 6)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (8, N'Carnaval 2.5KM Race', N'2.5KM', 10, CAST(N'2014-08-21T00:00:00.000' AS DateTime), CAST(12000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (9, N'Around of Paris 6.5KM Race', N'6.5KM', 11, CAST(N'2013-12-21T00:00:00.000' AS DateTime), CAST(4000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (10, N'Place Carrousel 2.5KM Race', N'2.5KM', 11, CAST(N'2013-12-15T00:00:00.000' AS DateTime), CAST(3000.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (13, N'Munich 2.5KM Race', N'2.5KM', 1, CAST(N'2012-11-19T00:00:00.000' AS DateTime), CAST(4500.00 AS Decimal(10, 2)), 8)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (15, N'BMW Factory 4KM Race', N'4KM  ', 1, CAST(N'2012-11-26T00:00:00.000' AS DateTime), CAST(7000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (19, N'Olympiaturm 6.5 KM', N'6.5KM', 1, CAST(N'2012-11-12T00:00:00.000' AS DateTime), CAST(3500.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (20, N'Red Race 4KM', N'4KM  ', 14, CAST(N'2016-10-18T00:00:00.000' AS DateTime), CAST(6000.00 AS Decimal(10, 2)), 8)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (21, N'Moscow Сity 2.5KM Race', N'2.5KM', 14, CAST(N'2016-10-21T00:00:00.000' AS DateTime), CAST(3500.00 AS Decimal(10, 2)), 6)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (22, N'Tokyo City 2.5KM', N'2.5KM', 16, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(15000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (24, N'Tokyo City 4KM', N'4KM  ', 16, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(25000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[Event] ([ID_Event], [Event_Name], [ID_EventType], [ID_Race], [StartDateTime], [Cost], [MaxParticipants]) VALUES (27, N'Tokyo City 6.5KM', N'6.5KM', 16, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), 25)
SET IDENTITY_INSERT [dbo].[Event] OFF
INSERT [dbo].[Event_Type] ([ID_Event_type], [Event_Type_Name]) VALUES (N'2.5KM', N'2.5km Race')
INSERT [dbo].[Event_Type] ([ID_Event_type], [Event_Type_Name]) VALUES (N'4KM  ', N'4km Race')
INSERT [dbo].[Event_Type] ([ID_Event_type], [Event_Type_Name]) VALUES (N'6.5KM', N'6.5km Race')
INSERT [dbo].[Gender] ([ID_Gender], [Gender_Name]) VALUES (N'F', N'Female
')
INSERT [dbo].[Gender] ([ID_Gender], [Gender_Name]) VALUES (N'M', N'Male')
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([ID_InventoryType], [InventoryName], [InventoryDescription], [InventoryPrice]) VALUES (1, N'Вариант А', N'Номер пилота + Браслет', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Inventory] ([ID_InventoryType], [InventoryName], [InventoryDescription], [InventoryPrice]) VALUES (2, N'Вариант В', N'Номер пилота + Шлем + Браслет', CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[Inventory] ([ID_InventoryType], [InventoryName], [InventoryDescription], [InventoryPrice]) VALUES (3, N'Вариант С', N'Номер пилота + Экипировка + Браслет', CAST(50 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Race] ON 

INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (1, N'Kart Skills 2012', N'Munich', N'GER', 2012)
INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (4, N'Kart Skills 2013', N'Cairo', N'EGY', 2015)
INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (10, N'Kart Skills 2014', N'Rio de Janeiro', N'BRA', 2014)
INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (11, N'Kars Skills 2015', N'Paris', N'FRA', 2013)
INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (14, N'Kart Skills 2016', N'Moscow', N'RUS', 2016)
INSERT [dbo].[Race] ([ID_Race], [Race_Name], [Sity], [ID_Country], [Year_Held]) VALUES (16, N'Kart Skills 2022', N'Tokyo', N'JP ', 2022)
SET IDENTITY_INSERT [dbo].[Race] OFF
SET IDENTITY_INSERT [dbo].[Racer] ON 

INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (7, N'Liam', N'Jeferson', N'M', CAST(N'1997-05-04' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (8, N'Anna', N'Ivanova', N'F', CAST(N'1992-04-15' AS Date), N'RUS', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (9, N'Irakly', N'Vahsha', N'M', CAST(N'1991-03-04' AS Date), N'ISR', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (10, N'Ernest', N'Huano', N'M', CAST(N'1987-04-07' AS Date), N'ESP', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (11, N'Gamlet', N'Sertio', N'M', CAST(N'1979-08-06' AS Date), N'ITA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (12, N'Christian', N'Neel', N'M', CAST(N'1984-12-21' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (13, N'Enrice', N'Mussoliny', N'M', CAST(N'1989-04-05' AS Date), N'ITA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (16, N'Lui', N'Andersen', N'M', CAST(N'1978-07-05' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (19, N'Enrike', N'Atlandes', N'M', CAST(N'1985-11-07' AS Date), N'ARG', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (20, N'Angela', N'Smith', N'F', CAST(N'1975-12-31' AS Date), N'FRA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (21, N'Lucius', N'Marko', N'M', CAST(N'1987-08-16' AS Date), N'ESP', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (23, N'Andrey', N'Mishkevich', N'M', CAST(N'1991-03-15' AS Date), N'CZE', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (26, N'Rita', N'Skitter', N'F', CAST(N'1987-12-03' AS Date), N'AUT', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (27, N'Yamato', N'Zi', N'M', CAST(N'1985-06-07' AS Date), N'JPN', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (28, N'Kuriko', N'Perno', N'F', CAST(N'1987-08-03' AS Date), N'ESP', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (29, N'Viktor', N'Zulinc', N'M', CAST(N'1983-12-01' AS Date), N'CZE', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (30, N'Elen', N'Huso', N'F', CAST(N'1978-05-18' AS Date), N'ARG', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (33, N'Ahmad', N'Adkin', N'M', CAST(N'1976-09-27' AS Date), N'IRL', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (34, N'Alphonso', N'Allison', N'M', CAST(N'1983-09-12' AS Date), N'SVK', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (36, N'Alfreda', N'BURNHAM', N'F', CAST(N'1980-05-21' AS Date), N'MAD', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (37, N'April', N'Bitsuile', N'F', CAST(N'1995-09-27' AS Date), N'CHI', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (40, N'Aron', N'Brooks', N'M', CAST(N'1988-09-06' AS Date), N'MEX', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (41, N'Angel', N'Candlish', N'F', CAST(N'1975-02-15' AS Date), N'CMR', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (42, N'Austin', N'Crews', N'M', CAST(N'1985-10-13' AS Date), N'GRE', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (43, N'Alisha', N'Conard', N'F', CAST(N'1975-01-07' AS Date), N'JAM', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (44, N'Anika', N'Crockett', N'F', CAST(N'1993-04-01' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (45, N'Brian', N'Lipke', N'M', CAST(N'1981-09-24' AS Date), N'PHI', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (46, N'Bryan', N'Mccoy', N'M', CAST(N'1979-05-05' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (48, N'Chiquita', N'Cline', N'F', CAST(N'1990-10-16' AS Date), N'HKG', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (51, N'Cruz', N'Cook', N'F', CAST(N'1985-10-17' AS Date), N'KEN', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (55, N'Charlie', N'Mcknight', N'F', CAST(N'1984-01-20' AS Date), N'TPE', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (57, N'Gus', N'Titus', N'M', CAST(N'1976-07-15' AS Date), N'AUS', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (58, N'Hugh', N'Bourbon', N'M', CAST(N'1972-09-30' AS Date), N'URU', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (59, N'Robin', N'Carmona', N'M', CAST(N'1981-03-18' AS Date), N'SIN', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (60, N'Simon', N'Steoud', N'M', CAST(N'1974-12-29' AS Date), N'KOR', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (61, N'Zora', N'Chapman', N'F', CAST(N'1980-07-03' AS Date), N'GBR', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (62, N'Waldo', N'Marby', N'M', CAST(N'1986-03-03' AS Date), N'MAC', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (63, N'Willy', N'Spears', N'M', CAST(N'1973-07-06' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (64, N'Vera', N'Prado', N'F', CAST(N'1987-06-29' AS Date), N'MEX', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (66, N'Valeria', N'Sahagun', N'F', CAST(N'1976-08-29' AS Date), N'URU', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (68, N'Raley', N'Steel', N'M', CAST(N'1979-08-01' AS Date), N'ESA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (69, N'Harry', N'Miller', N'M', CAST(N'1988-12-11' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (70, N'Eva', N'Miller', N'F', CAST(N'1991-03-25' AS Date), N'USA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (71, N'Adam', N'Vergon', N'M', CAST(N'1969-05-01' AS Date), N'ARG', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (72, N'Vahshee', N'Ahoul', N'M', CAST(N'1975-06-04' AS Date), N'IND', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (73, N'Gretta', N'Veljor', N'F', CAST(N'1975-08-27' AS Date), N'GER', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (75, N'Arman', N'Durs', N'M', CAST(N'1984-02-14' AS Date), N'IRL', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (76, N'Uki', N'Cumoto', N'F', CAST(N'1995-01-01' AS Date), N'JPN', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (78, N'Agnus', N'Wert', N'M', CAST(N'1983-12-24' AS Date), N'TPE', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (79, N'Jerom', N'Votye', N'M', CAST(N'1986-09-05' AS Date), N'FRA', NULL)
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (107, N'Racertestname', N'Racertestsurname', N'M', CAST(N'1997-07-12' AS Date), N'CAN', N'C:\Users\Ketsune\Pictures\maoyuu_08_030.png')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (108, N'aA!123q', N'aA!123q', N'M', CAST(N'1997-12-12' AS Date), N'AND', N'')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (109, N'Awe', N'Awe', N'F', CAST(N'1997-10-10' AS Date), N'AND', N'')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (110, N'Arcg', N'Arcg', N'M', CAST(N'1997-10-10' AS Date), N'AND', N'')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (111, N'Archie', N'Good', N'M', CAST(N'1997-10-12' AS Date), N'AND', N'C:\Users\Ketsune\Pictures\Mikhail-Aleshin.png')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (112, N'Aleks', N'William', N'M', CAST(N'1998-12-12' AS Date), N'AUT', N'C:\Users\Alesha\Pictures\2015-06-08-20-01-48-d181d')
INSERT [dbo].[Racer] ([ID_Racer], [First_Name], [Last_Name], [Gender], [DateOfBirth], [ID_Country], [Photo]) VALUES (113, N'Killua', N'Mufato', N'F', CAST(N'1997-08-08' AS Date), N'AND', N'C:\Users\Alesha\Pictures\300px-map_greco-persian_w')
SET IDENTITY_INSERT [dbo].[Racer] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (1, 7, CAST(N'2015-06-16' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 1, CAST(500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (4, 8, CAST(N'2015-06-07' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 3, CAST(1500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (7, 9, CAST(N'2015-09-17' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(700.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (8, 10, CAST(N'2015-07-05' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(863.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (9, 11, CAST(N'2015-12-25' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 7, CAST(439.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (12, 12, CAST(N'2015-01-08' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 5, CAST(752.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (13, 13, CAST(N'2015-05-09' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 7, CAST(600.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (14, 16, CAST(N'2015-10-05' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 5, CAST(800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (15, 19, CAST(N'2015-02-10' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 1, CAST(420.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (16, 20, CAST(N'2015-01-19' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 3, CAST(750.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (18, 21, CAST(N'2015-02-12' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 3, CAST(500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (19, 23, CAST(N'2015-06-08' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 5, CAST(350.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (21, 26, CAST(N'2015-12-05' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(400.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (23, 27, CAST(N'2015-05-07' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 1, CAST(250.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (27, 28, CAST(N'2015-06-18' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 3, CAST(1000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (28, 29, CAST(N'2015-02-01' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 7, CAST(850.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (29, 30, CAST(N'2015-05-01' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (30, 33, CAST(N'2015-02-19' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 2, CAST(150.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (31, 34, CAST(N'2015-04-16' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 1, CAST(650.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (32, 36, CAST(N'2015-08-01' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 5, CAST(2500.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (33, 37, CAST(N'2015-08-27' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(280.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (34, 40, CAST(N'2016-01-01' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 7, CAST(1000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (35, 41, CAST(N'2015-04-28' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 1, CAST(780.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (36, 42, CAST(N'2015-06-18' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(560.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (37, 43, CAST(N'2015-03-27' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 5, CAST(800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (39, 44, CAST(N'2015-06-16' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 2, CAST(580.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (40, 45, CAST(N'2015-02-28' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 1, CAST(400.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (41, 46, CAST(N'2015-08-05' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(1800.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (42, 48, CAST(N'2015-12-23' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 7, CAST(4000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (43, 51, CAST(N'2015-10-12' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 2, CAST(100.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (44, 55, CAST(N'2016-01-01' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 3, CAST(600.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (45, 57, CAST(N'2015-05-19' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 5, CAST(400.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (46, 59, CAST(N'2015-07-18' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 7, CAST(1350.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (48, 60, CAST(N'2015-09-11' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 1, CAST(2100.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (49, 61, CAST(N'2016-01-12' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(200.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (50, 62, CAST(N'2015-08-15' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 5, CAST(180.00 AS Decimal(10, 2)), N'4KM  ', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (51, 63, CAST(N'2015-07-13' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(1200.00 AS Decimal(10, 2)), N'2.5KM', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (52, 64, CAST(N'2015-05-27' AS Date), 2, CAST(15.00 AS Decimal(10, 2)), 1, CAST(520.00 AS Decimal(10, 2)), N'2.5KM', 2)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (56, 66, CAST(N'2015-11-15' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 7, CAST(100.00 AS Decimal(10, 2)), N'4KM  ', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (57, 68, CAST(N'2016-02-01' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(280.00 AS Decimal(10, 2)), N'2.5KM', 2)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (58, 69, CAST(N'2015-07-18' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 5, CAST(2100.00 AS Decimal(10, 2)), N'6.5KM', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (59, 70, CAST(N'2015-01-02' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 2, CAST(1100.00 AS Decimal(10, 2)), N'4KM  ', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (60, 71, CAST(N'2015-06-17' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(400.00 AS Decimal(10, 2)), N'2.5KM', 2)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (62, 72, CAST(N'2015-01-04' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 5, CAST(600.00 AS Decimal(10, 2)), N'6.5KM', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (63, 73, CAST(N'2015-08-13' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 7, CAST(320.00 AS Decimal(10, 2)), N'2.5KM', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (64, 75, CAST(N'2015-03-29' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 1, CAST(840.00 AS Decimal(10, 2)), N'4KM  ', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (65, 76, CAST(N'2015-07-14' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 2, CAST(1900.00 AS Decimal(10, 2)), N'6.5KM', 2)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (66, 78, CAST(N'2015-03-30' AS Date), 1, CAST(15.00 AS Decimal(10, 2)), 3, CAST(1500.00 AS Decimal(10, 2)), N'2.5KM', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (67, 79, CAST(N'2015-08-16' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 7, CAST(2200.00 AS Decimal(10, 2)), N'4KM  ', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (68, 58, CAST(N'2015-01-28' AS Date), 4, CAST(15.00 AS Decimal(10, 2)), 1, CAST(280.00 AS Decimal(10, 2)), N'6.5KM', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (69, 7, CAST(N'2022-01-22' AS Date), 1, CAST(25.00 AS Decimal(10, 2)), 1, CAST(123.00 AS Decimal(10, 2)), N'2.5KM', 1)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (70, 7, CAST(N'2022-01-22' AS Date), 1, CAST(90.00 AS Decimal(10, 2)), 1, CAST(1223.00 AS Decimal(10, 2)), N'4KM  ', 3)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (71, 112, CAST(N'2022-01-25' AS Date), 1, CAST(70.00 AS Decimal(10, 2)), 2, CAST(70000.00 AS Decimal(10, 2)), N'4KM  ', 2)
INSERT [dbo].[Registration] ([ID_Registration], [ID_Racer], [Registration_Date], [ID_Registration_Status], [Cost], [ID_Charity], [SponsorshipTarget], [ID_EvenType], [ID_InventoryType]) VALUES (72, 113, CAST(N'2022-01-25' AS Date), 1, CAST(70.00 AS Decimal(10, 2)), 3, CAST(500.00 AS Decimal(10, 2)), N'4KM  ', 2)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Registration_Status] ON 

INSERT [dbo].[Registration_Status] ([ID_Registration_Status], [Statu_Name]) VALUES (1, N'Registered')
INSERT [dbo].[Registration_Status] ([ID_Registration_Status], [Statu_Name]) VALUES (2, N'Payment Confirmed')
INSERT [dbo].[Registration_Status] ([ID_Registration_Status], [Statu_Name]) VALUES (4, N'Race Attended')
SET IDENTITY_INSERT [dbo].[Registration_Status] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (1, 1, 1, 1, CAST(N'12:34:54' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (2, 4, 1, 12, CAST(N'00:10:15' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (3, 7, 2, 23, CAST(N'00:05:07' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (5, 8, 4, 4, CAST(N'00:03:17' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (7, 9, 4, 25, CAST(N'00:04:13' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (8, 1, 2, 1, CAST(N'00:05:14' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (9, 28, 15, 31, CAST(N'00:03:39' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (10, 12, 19, 19, CAST(N'00:06:01' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (11, 13, 5, 34, CAST(N'00:05:47' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (14, 12, 2, 66, CAST(N'00:05:47' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (52, 27, 19, 55, CAST(N'00:03:07' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (54, 41, 10, 1, CAST(N'00:02:55' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (55, 21, 2, 99, CAST(N'00:06:56' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (56, 39, 5, 456, CAST(N'00:04:59' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (57, 40, 1, 693, CAST(N'00:02:14' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (58, 29, 8, 12, CAST(N'00:04:51' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (59, 33, 21, 54, CAST(N'00:02:13' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (60, 7, 10, 66, CAST(N'00:03:10' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (61, 4, 13, 45, CAST(N'00:04:01' AS Time))
INSERT [dbo].[Result] ([ID_Result], [ID_Registration], [ID_Event], [BidNumber], [RaceTime]) VALUES (62, 19, 9, 71, CAST(N'00:07:01' AS Time))
SET IDENTITY_INSERT [dbo].[Result] OFF
INSERT [dbo].[Role] ([ID_Role], [Role_Name]) VALUES (N'A', N'Administrator')
INSERT [dbo].[Role] ([ID_Role], [Role_Name]) VALUES (N'C', N'Coordinator')
INSERT [dbo].[Role] ([ID_Role], [Role_Name]) VALUES (N'R', N'Racer')
SET IDENTITY_INSERT [dbo].[Sponsorship] ON 

INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (1, N'Angel Jhons', CAST(180.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (2, N'Uri Kovrov', CAST(25.00 AS Decimal(10, 2)), 8)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (3, N'Asha Timbert', CAST(150.00 AS Decimal(10, 2)), 9)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (4, N'Artur Genby', CAST(1000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (5, N'Gely Brick', CAST(290.00 AS Decimal(10, 2)), 11)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (6, N'Bondy Black', CAST(236.00 AS Decimal(10, 2)), 12)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (7, N'Ban Trick', CAST(8000.00 AS Decimal(10, 2)), 13)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (8, N'Oliver Greds', CAST(5200.00 AS Decimal(10, 2)), 21)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (9, N'Grindel Frool', CAST(15000.00 AS Decimal(10, 2)), 23)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (10, N'Emanuel Rick', CAST(50.00 AS Decimal(10, 2)), 28)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (11, N'Elena Tvordova', CAST(150.00 AS Decimal(10, 2)), 29)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (27, N'Archibald Goodnight', CAST(30.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (28, N'Itou MIki', CAST(90.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (29, N'fweq', CAST(15.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (30, N'FEW fe', CAST(145.00 AS Decimal(10, 2)), 13)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (31, N'texttext', CAST(20.00 AS Decimal(10, 2)), 112)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (32, N'texttext', CAST(20.00 AS Decimal(10, 2)), 37)
INSERT [dbo].[Sponsorship] ([ID_Sponsorship], [SponsorName], [Amount], [ID_Racer]) VALUES (33, N'yayaya', CAST(20.00 AS Decimal(10, 2)), 13)
SET IDENTITY_INSERT [dbo].[Sponsorship] OFF
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'L.Jeferson@gmail.com', N'$1Qr3%9%r', N'Liam', N'Jeferson', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Ivanova@gmail.com', N'%pO53f', N'Anna', N'Ivanova', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'I.Vahsha@gmail.com', N'34@7jpG', N'Irakly', N'Vahsha', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'E.Huano@gmail.com', N'72%V876^sE$', N'Ernest', N'Huano', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'G.Sertio@gmail.com', N'!44Qzvg2%!9', N'Gamlet', N'Sertio', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'C.Neel@gmail.com', N'E@AJ#4c#5ad', N'Christian', N'Neel', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'E.Mussoliny@gmail.com', N'!H5N@@$1%@', N'Enrice', N'Mussoliny', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'L.Andersen@gmail.com', N'!pUzeL$^', N'Lui', N'Andersen', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'E.Atlandes@gmail.com', N'$@^3Ul^', N'Enrike', N'Atlandes', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Smith@gmail.com', N'UE$2T5!e$P', N'Angela', N'Smith', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'L.Marko@gmail.com', N'NpRQo$!', N'Lucius', N'Marko', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Mishkevich@gmail.com', N'i1nO5$', N'Andrey', N'Mishkevich', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'R.Skitter@gmail.com', N'GP6oAQ2', N'Rita', N'Skitter', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'Y.Zi@gmail.com', N'o^zQ1!D', N'Yamato', N'Zi', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'K.Perno@gmail.com', N'vXkN9%g', N'Kuriko', N'Perno', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'V.Zulinc@gmail.com', N'Oc#LJH3I', N'Viktor', N'Zulinc', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'E.Huso@gmail.com', N'9uaC410#WL', N'Elen', N'Huso', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Adkin@gmail.com', N'B5ob@@2z', N'Ahmad', N'Adkin', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Allison@gmail.com', N'D10!61!', N'Alphonso', N'Allison', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.BURNHAM@gmail.com', N'o0Xl^%@x%n9', N'Alfreda', N'BURNHAM', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Bitsuile@gmail.com', N'^T%Vl%@s', N'April', N'Bitsuile', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Brooks@gmail.com', N'YE!Xx!4$', N'Aron', N'Brooks', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Candlish@gmail.com', N'Qf7Q#c$19@^', N'Angel', N'Candlish', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Crews@gmail.com', N'L0g$d@cj1R', N'Austin', N'Crews', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Conard@gmail.com', N'^@ujJ1%W3^^', N'Alisha', N'Conard', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Crockett@gmail.com', N'F3ohCd!', N'Anika', N'Crockett', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'B.Lipke@gmail.com', N'I7t515x', N'Brian', N'Lipke', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'B.Mccoy@gmail.com', N'@8$QR^3!c', N'Bryan', N'Mccoy', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'C.Cline@gmail.com', N'T@M$YBa6', N'Chiquita', N'Cline', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'C.Cook@gmail.com', N'SuU@!IC', N'Cruz', N'Cook', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'C.Mcknight@gmail.com', N'55n8mXY!sEB', N'Charlie', N'Mcknight', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'G.Titus@gmail.com', N'Br8Xl!0', N'Gus', N'Titus', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'H.Bourbon@gmail.com', N'49uj!w', N'Hugh', N'Bourbon', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'R.Carmona@gmail.com', N'2836Xqt', N'Robin', N'Carmona', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'S.Steoud@gmail.com', N'%mXS3nK', N'Simon', N'Steoud', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'Z.Chapman@gmail.com', N's9A64@69W1', N'Zora', N'Chapman', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'W.Marby@gmail.com', N'^k#Gi2^#n', N'Waldo', N'Marby', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'W.Spears@gmail.com', N'3%y1pv#H9', N'Willy', N'Spears', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'V.Prado@gmail.com', N'u015D@EK', N'Vera', N'Prado', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'V.Sahagun@gmail.com', N'iupTL%K5', N'Valeria', N'Sahagun', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'R.Steel@gmail.com', N'IY7%#98B6', N'Raley', N'Steel', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'H.Miller@gmail.com', N'yb%7%yq0', N'Harry', N'Miller', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'E.Miller@gmail.com', N'$D5^37V9G!%', N'Eva', N'Miller', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Vergon@gmail.com', N'Qq!vc@4o', N'Adam', N'Vergon', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'V.Ahoul@gmail.com', N'1gM^#5%%t7', N'Vahshee', N'Ahoul', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'G.Veljor@gmail.com', N'fk94j!8^', N'Gretta', N'Veljor', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Durs@gmail.com', N'w2NL$vySH^K', N'Arman', N'Durs', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'U.Cumoto@gmail.com', N'69!bXu', N'Uki', N'Cumoto', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Wert@gmail.com', N'Isq%5IG!n', N'Agnus', N'Wert', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'J.Votye@gmail.com', N'^d$23wn7gt', N'Jerom', N'Votye', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'A.Admin@gmail.com', N'Oc#LJH3I', N'AdminName', N'AdminSurname', N'A')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'testracer1@gmail.com', N'Ar!3aaa', N'Racertestname', N'Racertestsurname', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'awsd@gmail.com', N'A!123q', N'aA!123q', N'aA!123q', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'awsd@gmail.com', N'Qa!123', N'Awe', N'Awe', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'ads@gmail.com', N'Arc!123', N'Arcg', N'Arcg', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'wafdwfea@gmail.com', N'Aer1!rwe', N'Archie', N'Good', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'C.Coordinator@gmail.com', N'Oc#LJH3I', N'CoordinatorName', N'CoordinatorSurname', N'C')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'texttext@gmail.com', N'Jj!1234', N'Aleks', N'William', N'R')
INSERT [dbo].[User] ([Email], [Password], [First_Name], [Last_Name], [ID_Role]) VALUES (N'aygdfhagdfyh@gmail.com', N'AAuu123!', N'Killua', N'Mufato', N'R')
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Event_Type1] FOREIGN KEY([ID_EventType])
REFERENCES [dbo].[Event_Type] ([ID_Event_type])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Event_Type1]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Race] FOREIGN KEY([ID_Race])
REFERENCES [dbo].[Race] ([ID_Race])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Race]
GO
ALTER TABLE [dbo].[Race]  WITH CHECK ADD  CONSTRAINT [FK_Race_Country] FOREIGN KEY([ID_Country])
REFERENCES [dbo].[Country] ([ID_Country])
GO
ALTER TABLE [dbo].[Race] CHECK CONSTRAINT [FK_Race_Country]
GO
ALTER TABLE [dbo].[Racer]  WITH CHECK ADD  CONSTRAINT [FK_Racer_Country] FOREIGN KEY([ID_Country])
REFERENCES [dbo].[Country] ([ID_Country])
GO
ALTER TABLE [dbo].[Racer] CHECK CONSTRAINT [FK_Racer_Country]
GO
ALTER TABLE [dbo].[Racer]  WITH CHECK ADD  CONSTRAINT [FK_Racer_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([ID_Gender])
GO
ALTER TABLE [dbo].[Racer] CHECK CONSTRAINT [FK_Racer_Gender]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Charity] FOREIGN KEY([ID_Charity])
REFERENCES [dbo].[Charity] ([ID_Сharity])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Charity]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Event_Type] FOREIGN KEY([ID_EvenType])
REFERENCES [dbo].[Event_Type] ([ID_Event_type])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Event_Type]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Inventory] FOREIGN KEY([ID_InventoryType])
REFERENCES [dbo].[Inventory] ([ID_InventoryType])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Inventory]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Racer1] FOREIGN KEY([ID_Racer])
REFERENCES [dbo].[Racer] ([ID_Racer])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Racer1]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Registration_Status] FOREIGN KEY([ID_Registration_Status])
REFERENCES [dbo].[Registration_Status] ([ID_Registration_Status])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Registration_Status]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Event_Event] FOREIGN KEY([ID_Event])
REFERENCES [dbo].[Event] ([ID_Event])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Registration_Event_Event]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Event_Registration] FOREIGN KEY([ID_Registration])
REFERENCES [dbo].[Registration] ([ID_Registration])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Registration_Event_Registration]
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_Racer] FOREIGN KEY([ID_Racer])
REFERENCES [dbo].[Racer] ([ID_Racer])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_Racer]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Gender] FOREIGN KEY([ID_Gender])
REFERENCES [dbo].[Gender] ([ID_Gender])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Gender]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Inventory] FOREIGN KEY([ID_Inventory])
REFERENCES [dbo].[Inventory] ([ID_InventoryType])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Inventory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Country] FOREIGN KEY([ID_Country])
REFERENCES [dbo].[Country] ([ID_Country])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Country]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Gender] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[Gender] ([ID_Gender])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Gender]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
Begin PaneConfigurations =
Begin PaneConfiguration = 0
NumPanes = 4
Configuration = "(H (1[44] 4[21] 2[18] 3) )"
End
Begin PaneConfiguration = 1
NumPanes = 3
Configuration = "(H (1 [50] 4 [25] 3))"
End
Begin PaneConfiguration = 2
NumPanes = 3
Configuration = "(H (1 [50] 2 [25] 3))"
End
Begin PaneConfiguration = 3
NumPanes = 3
Configuration = "(H (4 [30] 2 [40] 3))"
End
Begin PaneConfiguration = 4
NumPanes = 2
Configuration = "(H (1 [56] 3))"
End
Begin PaneConfiguration = 5
NumPanes = 2
Configuration = "(H (2 [66] 3))"
End
Begin PaneConfiguration = 6
NumPanes = 2
Configuration = "(H (4 [50] 3))"
End
Begin PaneConfiguration = 7
NumPanes = 1
Configuration = "(V (3))"
End
Begin PaneConfiguration = 8
NumPanes = 3
Configuration = "(H (1[56] 4[18] 2) )"
End
Begin PaneConfiguration = 9
NumPanes = 2
Configuration = "(H (1 [75] 4))"
End
Begin PaneConfiguration = 10
NumPanes = 2
Configuration = "(H (1[66] 2) )"
End
Begin PaneConfiguration = 11
NumPanes = 2
Configuration = "(H (4 [60] 2))"
End
Begin PaneConfiguration = 12
NumPanes = 1
Configuration = "(H (1) )"
End
Begin PaneConfiguration = 13
NumPanes = 1
Configuration = "(V (4))"
End
Begin PaneConfiguration = 14
NumPanes = 1
Configuration = "(V (2))"
End
ActivePaneConfig = 0
End
Begin DiagramPane =
Begin Origin =
Top = 0
Left = 0
End
Begin Tables =
Begin Table = "Event"
Begin Extent =
Top = 6
Left = 38
Bottom = 134
Right = 212
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Event_Type"
Begin Extent =
Top = 202
Left = 224
Bottom = 298
Right = 409
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Race"
Begin Extent =
Top = 21
Left = 360
Bottom = 151
Right = 534
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Registration"
Begin Extent =
Top = 38
Left = 612
Bottom = 290
Right = 817
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Racer"
Begin Extent =
Top = 6
Left = 855
Bottom = 136
Right = 1029
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Registration_Status"
Begin Extent =
Top = 190
Left = 983
Bottom = 286
Right = 1188
End
DisplayFlags = 280
TopColumn = 0
End
End
End
Begin SQLPane =
End
Begin DataPane =
Begin ParameterDefaults = ""
End
Begin ColumnWidths = 15
Width = 284
Width = 1500
Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllRacers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 2310
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
End
End
Begin CriteriaPane =
Begin ColumnWidths = 11
Column = 1440
Alias = 900
Table = 1170
Output = 720
Append = 1400
NewValue = 1170
SortType = 1350
SortOrder = 1410
GroupBy = 1350
Filter = 1350
Or = 1350
Or = 1350
Or = 1350
End
End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllRacers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllRacers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
Begin PaneConfigurations =
Begin PaneConfiguration = 0
NumPanes = 4
Configuration = "(H (1[40] 4[20] 2[20] 3) )"
End
Begin PaneConfiguration = 1
NumPanes = 3
Configuration = "(H (1 [50] 4 [25] 3))"
End
Begin PaneConfiguration = 2
NumPanes = 3
Configuration = "(H (1 [50] 2 [25] 3))"
End
Begin PaneConfiguration = 3
NumPanes = 3
Configuration = "(H (4 [30] 2 [40] 3))"
End
Begin PaneConfiguration = 4
NumPanes = 2
Configuration = "(H (1 [56] 3))"
End
Begin PaneConfiguration = 5
NumPanes = 2
Configuration = "(H (2 [66] 3))"
End
Begin PaneConfiguration = 6
NumPanes = 2
Configuration = "(H (4 [50] 3))"
End
Begin PaneConfiguration = 7
NumPanes = 1
Configuration = "(V (3))"
End
Begin PaneConfiguration = 8
NumPanes = 3
Configuration = "(H (1[56] 4[18] 2) )"
End
Begin PaneConfiguration = 9
NumPanes = 2
Configuration = "(H (1 [75] 4))"
End
Begin PaneConfiguration = 10
NumPanes = 2
Configuration = "(H (1[66] 2) )"
End
Begin PaneConfiguration = 11
NumPanes = 2
Configuration = "(H (4 [60] 2))"
End
Begin PaneConfiguration = 12
NumPanes = 1
Configuration = "(H (1) )"
End
Begin PaneConfiguration = 13
NumPanes = 1
Configuration = "(V (4))"
End
Begin PaneConfiguration = 14
NumPanes = 1
Configuration = "(V (2))"
End
ActivePaneConfig = 0
End
Begin DiagramPane =
Begin Origin =
Top = 0
Left = 0
End
Begin Tables =
Begin Table = "Racer"
Begin Extent =
Top = 6
Left = 38
Bottom = 195
Right = 212
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Country"
Begin Extent =
Top = 6
Left = 251
Bottom = 159
Right = 424
End
DisplayFlags = 280
TopColumn = 0
End
End
End
Begin SQLPane =
End
Begin DataPane =
Begin ParameterDefaults = ""
End
Begin ColumnWidths = 9
Width = 284
Width = 1500
Width = 2895
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
End
End
Begin CriteriaPane =
Begin ColumnWidths = 11
Column = 1440
Alias = 900
Table = 1170
Output = 720
Append = 1400
NewValue = 1170
SortType = 1350
SortOrder = 1410
GroupBy = 1350
Filter = 1350
Or = 1350
Or = 1350
Or = 1350
End
End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RacerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RacerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties =
Begin PaneConfigurations =
Begin PaneConfiguration = 0
NumPanes = 4
Configuration = "(H (1[40] 4[20] 2[20] 3) )"
End
Begin PaneConfiguration = 1
NumPanes = 3
Configuration = "(H (1 [50] 4 [25] 3))"
End
Begin PaneConfiguration = 2
NumPanes = 3
Configuration = "(H (1 [50] 2 [25] 3))"
End
Begin PaneConfiguration = 3
NumPanes = 3
Configuration = "(H (4 [30] 2 [40] 3))"
End
Begin PaneConfiguration = 4
NumPanes = 2
Configuration = "(H (1 [56] 3))"
End
Begin PaneConfiguration = 5
NumPanes = 2
Configuration = "(H (2 [66] 3))"
End
Begin PaneConfiguration = 6
NumPanes = 2
Configuration = "(H (4 [50] 3))"
End
Begin PaneConfiguration = 7
NumPanes = 1
Configuration = "(V (3))"
End
Begin PaneConfiguration = 8
NumPanes = 3
Configuration = "(H (1[56] 4[18] 2) )"
End
Begin PaneConfiguration =
9
NumPanes = 2
Configuration = "(H (1 [75] 4))"
End
Begin PaneConfiguration = 10
NumPanes = 2
Configuration = "(H (1[66] 2) )"
End
Begin PaneConfiguration = 11
NumPanes = 2
Configuration = "(H (4 [60] 2))"
End
Begin PaneConfiguration = 12
NumPanes = 1
Configuration = "(H (1) )"
End
Begin PaneConfiguration = 13
NumPanes = 1
Configuration = "(V (4))"
End
Begin PaneConfiguration = 14
NumPanes = 1
Configuration = "(V (2))"
End
ActivePaneConfig = 0
End
Begin DiagramPane =
Begin Origin =
Top = 0
Left = 0
End
Begin Tables =
Begin Table = "Race"
Begin Extent =
Top = 6
Left = 38
Bottom = 183
Right = 212
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Event"
Begin Extent =
Top = 57
Left = 253
Bottom = 245
Right = 427
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Event_Type"
Begin Extent =
Top = 199
Left = 494
Bottom = 295
Right = 679
End
DisplayFlags = 280
TopColumn = 0
End
Begin Table = "Result"
Begin Extent =
Top = 28
Left = 531
Bottom = 183
Right = 705
End
DisplayFlags = 280
TopColumn = 0
End
End
End
Begin SQLPane =
End
Begin DataPane =
Begin ParameterDefaults = ""
End
Begin ColumnWidths = 9
Width = 284
Width = 1500
Width = 2310
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
Width = 1500
End
End
Begin CriteriaPane =
Begin ColumnWidths = 11
Column = 1440
Alias = 900
Table = 1170
Output = 720
Append = 1400
NewValue = 1170
SortType = 1350
SortOrder = 1410
GroupBy = 1350
Filter = 1350
Or = 1350
Or = 1350
Or = 1350
End
E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResultsVIew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResultsVIew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResultsVIew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Charity"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Registration"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 136
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Racer"
            Begin Extent = 
               Top = 6
               Left = 543
               Bottom = 136
               Right = 733
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sponsorship"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TotalCharityMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TotalCharityMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TotalCharityMoney'
GO
USE [master]
GO
ALTER DATABASE [Karting] SET  READ_WRITE 
GO
