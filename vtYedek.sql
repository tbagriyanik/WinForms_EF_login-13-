USE [master]
GO
/****** Object:  Database [vt]    Script Date: 6.04.2022 21:40:28 ******/
CREATE DATABASE [vt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\vt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\vt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vt] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vt] SET ARITHABORT OFF 
GO
ALTER DATABASE [vt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vt] SET  MULTI_USER 
GO
ALTER DATABASE [vt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vt] SET QUERY_STORE = OFF
GO
USE [vt]
GO
/****** Object:  Table [dbo].[kategori]    Script Date: 6.04.2022 21:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAdi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanici]    Script Date: 6.04.2022 21:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciAdi] [nvarchar](50) NULL,
	[parola] [nvarchar](50) NULL,
	[rol] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablo]    Script Date: 6.04.2022 21:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Ucret] [float] NULL,
 CONSTRAINT [PK_tablo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urun]    Script Date: 6.04.2022 21:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[urunAdi] [nvarchar](50) NULL,
	[fiyat] [float] NULL,
	[detay] [text] NULL,
	[kategoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[kategori] ON 

INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (1, N'Elektronik')
INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (2, N'Beyaz Eşya')
INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (3, N'Otomobil')
INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (4, N'Mobilya')
INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (7, N'2342')
INSERT [dbo].[kategori] ([Id], [kategoriAdi]) VALUES (10, N'Boya')
SET IDENTITY_INSERT [dbo].[kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[kullanici] ON 

INSERT [dbo].[kullanici] ([Id], [kullaniciAdi], [parola], [rol]) VALUES (1, N'abc', N'123', N'1')
INSERT [dbo].[kullanici] ([Id], [kullaniciAdi], [parola], [rol]) VALUES (2, N'a', N'1', N'2')
SET IDENTITY_INSERT [dbo].[kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[tablo] ON 

INSERT [dbo].[tablo] ([id], [Ad], [Ucret]) VALUES (1, N'ali', 111)
INSERT [dbo].[tablo] ([id], [Ad], [Ucret]) VALUES (2, N'veli', 223)
INSERT [dbo].[tablo] ([id], [Ad], [Ucret]) VALUES (3, N'sdfsdf', 233)
INSERT [dbo].[tablo] ([id], [Ad], [Ucret]) VALUES (11, N'23', 233)
INSERT [dbo].[tablo] ([id], [Ad], [Ucret]) VALUES (12, N'sdfsdf', 23)
SET IDENTITY_INSERT [dbo].[tablo] OFF
GO
SET IDENTITY_INSERT [dbo].[urun] ON 

INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (1, N'Masaüstü Bilgisayar', 15000, N'i5', 1)
INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (2, N'Beko Buzdolabı', 2000, N'2 kapılı', 2)
INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (3, N'Arçelik Çamaşır Makinesi', 3000, N'1000 devir', 4)
INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (9, N'dasddada', 2342, NULL, 10)
INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (10, N'adasdasdada', 234234, NULL, 10)
INSERT [dbo].[urun] ([Id], [urunAdi], [fiyat], [detay], [kategoriID]) VALUES (12, N'sdfsdfsf', 3432434, NULL, 10)
SET IDENTITY_INSERT [dbo].[urun] OFF
GO
ALTER TABLE [dbo].[urun]  WITH CHECK ADD  CONSTRAINT [FK_urun_kategori] FOREIGN KEY([kategoriID])
REFERENCES [dbo].[kategori] ([Id])
GO
ALTER TABLE [dbo].[urun] CHECK CONSTRAINT [FK_urun_kategori]
GO
USE [master]
GO
ALTER DATABASE [vt] SET  READ_WRITE 
GO
