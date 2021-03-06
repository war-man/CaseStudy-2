USE [master]
GO
/****** Object:  Database [CaseStudy]    Script Date: 10/9/2019 9:49:24 AM ******/
CREATE DATABASE [CaseStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaseStudy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CaseStudy.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CaseStudy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CaseStudy_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CaseStudy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaseStudy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaseStudy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaseStudy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaseStudy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaseStudy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaseStudy] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaseStudy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaseStudy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaseStudy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaseStudy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaseStudy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaseStudy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaseStudy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaseStudy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaseStudy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaseStudy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CaseStudy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaseStudy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaseStudy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaseStudy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaseStudy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaseStudy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaseStudy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaseStudy] SET RECOVERY FULL 
GO
ALTER DATABASE [CaseStudy] SET  MULTI_USER 
GO
ALTER DATABASE [CaseStudy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaseStudy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaseStudy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaseStudy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CaseStudy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CaseStudy', N'ON'
GO
USE [CaseStudy]
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoPhan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[DangHoatDong] [bit] NOT NULL CONSTRAINT [DF_BoPhan_DangHoatDong]  DEFAULT ((1)),
	[DaXoa] [bit] NOT NULL CONSTRAINT [DF_BoPhan_DaXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_BoPhan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[DangHoatDong] [bit] NOT NULL CONSTRAINT [DF_ChucVu_DangHoatDong]  DEFAULT ((1)),
	[DaXoa] [bit] NOT NULL CONSTRAINT [DF_ChucVu_DaXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVuNhanVien]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVuNhanVien](
	[NhanVienId] [int] NOT NULL,
	[ChucVuId] [int] NOT NULL,
	[BoPhanId] [int] NOT NULL,
 CONSTRAINT [PK_ChucVuNhanVien] PRIMARY KEY CLUSTERED 
(
	[NhanVienId] ASC,
	[ChucVuId] ASC,
	[BoPhanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemDanh]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemDanh](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NOT NULL,
	[QuanLyId] [int] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[Ngay] [date] NOT NULL,
	[NgayTao] [date] NULL,
	[NgaySua] [date] NULL,
 CONSTRAINT [PK_DiemDanh] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemDanhLog]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemDanhLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NOT NULL,
	[QuanLyId] [int] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[Ngay] [date] NOT NULL,
	[NgaySua] [date] NOT NULL,
	[DiemDanhId] [int] NOT NULL,
 CONSTRAINT [PK_DiemDanhLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonXinPhep]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonXinPhep](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NOT NULL,
	[QuanLyId] [int] NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[SoPhepConLai] [tinyint] NULL,
	[SoNgayDaNghi] [tinyint] NULL,
	[NgayGui] [date] NOT NULL,
	[NgayPhanHoi] [date] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TraLoi] [nvarchar](max) NULL,
 CONSTRAINT [PK_DonXinPhep] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](100) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NULL,
	[SoChungMinh] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MaSoThue] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[NgayTao] [date] NOT NULL,
	[NgaySua] [date] NOT NULL,
	[DangLamViec] [bit] NOT NULL CONSTRAINT [DF_NhanVien_DangLamViec]  DEFAULT ((1)),
	[DaXoa] [bit] NOT NULL CONSTRAINT [DF_NhanVien_DaXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_ThongTinNhanVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhepNam]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhepNam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NOT NULL,
	[Nam] [int] NOT NULL,
	[SoPhep] [tinyint] NOT NULL,
 CONSTRAINT [PK_PhepNam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyenTruyCap]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTruyCap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quyen] [nvarchar](50) NOT NULL,
	[DangHoatDong] [bit] NOT NULL CONSTRAINT [DF_QuyenTruyCap_DangHoatDong]  DEFAULT ((1)),
 CONSTRAINT [PK_QuyenTruyCap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] NOT NULL,
	[QuyenId] [int] NOT NULL CONSTRAINT [DF_TaiKhoan_QuyenId]  DEFAULT ((1)),
	[Email] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[DangHoatDong] [bit] NOT NULL CONSTRAINT [DF_TaiKhoan_DangHoatDong]  DEFAULT ((1)),
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienId] [int] NULL,
	[Thang] [tinyint] NULL,
	[Nam] [int] NULL,
	[CoMat] [tinyint] NULL,
	[Tre] [tinyint] NULL,
	[KhongPhep] [tinyint] NULL,
	[CoPhep] [tinyint] NULL,
	[TheoQuyDinh] [tinyint] NULL,
	[SoPhepConLai] [tinyint] NULL,
 CONSTRAINT [PK_ThongKe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BoPhan] ON 

INSERT [dbo].[BoPhan] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (1, N'Nhân sự', 1, 0)
INSERT [dbo].[BoPhan] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (2, N'Hành chính', 1, 0)
INSERT [dbo].[BoPhan] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (3, N'Kinh doanh', 1, 0)
SET IDENTITY_INSERT [dbo].[BoPhan] OFF
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (1, N'Trưởng phòng', 1, 0)
INSERT [dbo].[ChucVu] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (2, N'Phó phòng', 1, 0)
INSERT [dbo].[ChucVu] ([Id], [Ten], [DangHoatDong], [DaXoa]) VALUES (3, N'Nhân viên', 1, 0)
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
INSERT [dbo].[ChucVuNhanVien] ([NhanVienId], [ChucVuId], [BoPhanId]) VALUES (1, 3, 3)
INSERT [dbo].[ChucVuNhanVien] ([NhanVienId], [ChucVuId], [BoPhanId]) VALUES (2, 2, 3)
INSERT [dbo].[ChucVuNhanVien] ([NhanVienId], [ChucVuId], [BoPhanId]) VALUES (3, 1, 1)
SET IDENTITY_INSERT [dbo].[DiemDanh] ON 

INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (1, 1, 2, 1, CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (2, 1, 2, 1, CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (3, 1, 2, 2, CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (5, 2, 2, 1, CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (6, 2, 2, 1, CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (7, 2, 2, 1, CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (8, 3, 3, 1, CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date), CAST(N'2019-10-01' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (9, 3, 3, 1, CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date), CAST(N'2019-10-02' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (10, 3, 3, 1, CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (12, 1, 2, 4, CAST(N'2019-11-01' AS Date), CAST(N'2019-11-01' AS Date), CAST(N'2019-11-01' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (14, 1, 2, 3, CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date), CAST(N'2019-10-03' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (15, 1, 2, 2, CAST(N'2019-11-02' AS Date), CAST(N'2019-11-02' AS Date), CAST(N'2019-11-02' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (16, 1, 2, 1, CAST(N'2019-11-03' AS Date), CAST(N'2019-11-03' AS Date), CAST(N'2019-11-03' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (17, 1, 2, 1, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (18, 1, 2, 5, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (19, 1, 2, 5, CAST(N'2019-10-04' AS Date), CAST(N'2019-10-04' AS Date), CAST(N'2019-10-04' AS Date))
INSERT [dbo].[DiemDanh] ([Id], [NhanVienId], [QuanLyId], [TrangThai], [Ngay], [NgayTao], [NgaySua]) VALUES (20, 1, 2, 1, CAST(N'2019-10-05' AS Date), CAST(N'2019-10-05' AS Date), CAST(N'2019-10-05' AS Date))
SET IDENTITY_INSERT [dbo].[DiemDanh] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([Id], [Ho], [Ten], [GioiTinh], [NgaySinh], [SoChungMinh], [SoDienThoai], [Email], [DiaChi], [MaSoThue], [HinhAnh], [NgayTao], [NgaySua], [DangLamViec], [DaXoa]) VALUES (1, N'Nguyễn Quốc', N'Báo', 1, CAST(N'1992-02-10' AS Date), N'0213564857', N'0321547589', N'nqb.10i1@gmail.com', N'3 Lê Lợi, TP.Huế', N'012548759', NULL, CAST(N'2019-10-07' AS Date), CAST(N'2019-10-07' AS Date), 1, 0)
INSERT [dbo].[NhanVien] ([Id], [Ho], [Ten], [GioiTinh], [NgaySinh], [SoChungMinh], [SoDienThoai], [Email], [DiaChi], [MaSoThue], [HinhAnh], [NgayTao], [NgaySua], [DangLamViec], [DaXoa]) VALUES (2, N'Lê Nguyễn Phước', N'Thành', 1, CAST(N'1995-02-03' AS Date), N'0321458759', N'0358475856', N'lnpttor@gmail.com', N'6 Đào Tấn, TP.Huế', N'021365748', NULL, CAST(N'2019-10-07' AS Date), CAST(N'2019-10-07' AS Date), 1, 0)
INSERT [dbo].[NhanVien] ([Id], [Ho], [Ten], [GioiTinh], [NgaySinh], [SoChungMinh], [SoDienThoai], [Email], [DiaChi], [MaSoThue], [HinhAnh], [NgayTao], [NgaySua], [DangLamViec], [DaXoa]) VALUES (3, N'Nguyễn', N'Tú', 1, CAST(N'2000-01-01' AS Date), N'0325145236', N'0251425325', N'nguyentu19962710@gmail.com', N'10 Hùng Vương, TP.Huế', N'021542545', NULL, CAST(N'2019-10-07' AS Date), CAST(N'2019-10-07' AS Date), 1, 0)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhepNam] ON 

INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (1, 1, 2019, 12)
INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (2, 1, 2020, 13)
INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (3, 2, 2019, 13)
INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (4, 2, 2020, 13)
INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (5, 3, 2019, 13)
INSERT [dbo].[PhepNam] ([Id], [NhanVienId], [Nam], [SoPhep]) VALUES (6, 3, 2020, 13)
SET IDENTITY_INSERT [dbo].[PhepNam] OFF
SET IDENTITY_INSERT [dbo].[QuyenTruyCap] ON 

INSERT [dbo].[QuyenTruyCap] ([Id], [Quyen], [DangHoatDong]) VALUES (1, N'Nhân viên', 1)
INSERT [dbo].[QuyenTruyCap] ([Id], [Quyen], [DangHoatDong]) VALUES (2, N'Quản lý', 1)
INSERT [dbo].[QuyenTruyCap] ([Id], [Quyen], [DangHoatDong]) VALUES (3, N'Nhân sự', 1)
SET IDENTITY_INSERT [dbo].[QuyenTruyCap] OFF
INSERT [dbo].[TaiKhoan] ([Id], [QuyenId], [Email], [MatKhau], [DangHoatDong]) VALUES (1, 1, N'nqb.10i1@gmail.com', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([Id], [QuyenId], [Email], [MatKhau], [DangHoatDong]) VALUES (2, 2, N'lnpttor@gmail.com', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([Id], [QuyenId], [Email], [MatKhau], [DangHoatDong]) VALUES (3, 3, N'nguyentu19962710@gmail.com', N'123456', 1)
SET IDENTITY_INSERT [dbo].[ThongKe] ON 

INSERT [dbo].[ThongKe] ([Id], [NhanVienId], [Thang], [Nam], [CoMat], [Tre], [KhongPhep], [CoPhep], [TheoQuyDinh], [SoPhepConLai]) VALUES (1, 1, 10, 2019, 3, 1, 1, 1, 1, 11)
INSERT [dbo].[ThongKe] ([Id], [NhanVienId], [Thang], [Nam], [CoMat], [Tre], [KhongPhep], [CoPhep], [TheoQuyDinh], [SoPhepConLai]) VALUES (2, 2, 10, 2019, 3, 0, 0, 0, 0, 13)
INSERT [dbo].[ThongKe] ([Id], [NhanVienId], [Thang], [Nam], [CoMat], [Tre], [KhongPhep], [CoPhep], [TheoQuyDinh], [SoPhepConLai]) VALUES (3, 3, 10, 2019, 3, 0, 0, 0, 0, 13)
INSERT [dbo].[ThongKe] ([Id], [NhanVienId], [Thang], [Nam], [CoMat], [Tre], [KhongPhep], [CoPhep], [TheoQuyDinh], [SoPhepConLai]) VALUES (4, 1, 11, 2019, 2, 1, 0, 1, 1, 10)
SET IDENTITY_INSERT [dbo].[ThongKe] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BoPhan]    Script Date: 10/9/2019 9:49:24 AM ******/
ALTER TABLE [dbo].[BoPhan] ADD  CONSTRAINT [IX_BoPhan] UNIQUE NONCLUSTERED 
(
	[Ten] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NhanVien]    Script Date: 10/9/2019 9:49:24 AM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [IX_NhanVien] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TaiKhoan]    Script Date: 10/9/2019 9:49:24 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [IX_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChucVuNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVuNhanVien_BoPhan] FOREIGN KEY([BoPhanId])
REFERENCES [dbo].[BoPhan] ([Id])
GO
ALTER TABLE [dbo].[ChucVuNhanVien] CHECK CONSTRAINT [FK_ChucVuNhanVien_BoPhan]
GO
ALTER TABLE [dbo].[ChucVuNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVuNhanVien_ChucVu] FOREIGN KEY([ChucVuId])
REFERENCES [dbo].[ChucVu] ([Id])
GO
ALTER TABLE [dbo].[ChucVuNhanVien] CHECK CONSTRAINT [FK_ChucVuNhanVien_ChucVu]
GO
ALTER TABLE [dbo].[ChucVuNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVuNhanVien_NhanVien] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[ChucVuNhanVien] CHECK CONSTRAINT [FK_ChucVuNhanVien_NhanVien]
GO
ALTER TABLE [dbo].[DiemDanh]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanh_NhanVien] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[DiemDanh] CHECK CONSTRAINT [FK_DiemDanh_NhanVien]
GO
ALTER TABLE [dbo].[DiemDanh]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanh_NhanVien1] FOREIGN KEY([QuanLyId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[DiemDanh] CHECK CONSTRAINT [FK_DiemDanh_NhanVien1]
GO
ALTER TABLE [dbo].[DiemDanhLog]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanhLog_DiemDanh] FOREIGN KEY([DiemDanhId])
REFERENCES [dbo].[DiemDanh] ([Id])
GO
ALTER TABLE [dbo].[DiemDanhLog] CHECK CONSTRAINT [FK_DiemDanhLog_DiemDanh]
GO
ALTER TABLE [dbo].[DonXinPhep]  WITH CHECK ADD  CONSTRAINT [FK_DonXinPhep_NhanVien] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[DonXinPhep] CHECK CONSTRAINT [FK_DonXinPhep_NhanVien]
GO
ALTER TABLE [dbo].[DonXinPhep]  WITH CHECK ADD  CONSTRAINT [FK_DonXinPhep_NhanVien1] FOREIGN KEY([QuanLyId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[DonXinPhep] CHECK CONSTRAINT [FK_DonXinPhep_NhanVien1]
GO
ALTER TABLE [dbo].[PhepNam]  WITH CHECK ADD  CONSTRAINT [FK_PhepNam_NhanVien] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[PhepNam] CHECK CONSTRAINT [FK_PhepNam_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([Id])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_QuyenTruyCap] FOREIGN KEY([QuyenId])
REFERENCES [dbo].[QuyenTruyCap] ([Id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_QuyenTruyCap]
GO
ALTER TABLE [dbo].[ThongKe]  WITH CHECK ADD  CONSTRAINT [FK_ThongKe_NhanVien] FOREIGN KEY([NhanVienId])
REFERENCES [dbo].[NhanVien] ([Id])
GO
ALTER TABLE [dbo].[ThongKe] CHECK CONSTRAINT [FK_ThongKe_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDiemDanhTheoNhanVienId]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChiTietDiemDanhTheoNhanVienId]
(
	@Id INT,
	@Thang INT,
	@Nam INT
)
AS
BEGIN
SELECT [Id]
      ,[NhanVienId]
      ,[QuanLyId]
      ,CASE WHEN TrangThai = 1 THEN N'Có Mặt'
	  WHEN TrangThai = 2 THEN N'Trễ'
	  WHEN TrangThai = 3 THEN N'Vắng Không Phép'
	  WHEN TrangThai = 4 THEN N'Vắng Có Phép'
	  WHEN TrangThai = 5 THEN N'Vắng Theo Quy Định'
		END AS TrangThai
      ,FORMAT(Ngay,'ddd dd/MM/yyyy')AS Ngay
      ,[NgayTao]
      ,[NgaySua]
  FROM [dbo].[DiemDanh]
  WHERE NhanVienId = @Id AND MONTH(Ngay) = @Thang AND YEAR(Ngay) = @Nam
END

GO
/****** Object:  StoredProcedure [dbo].[LayNhanVienTheoId]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayNhanVienTheoId]
	@Id INT
AS 
BEGIN
SELECT [Id]
	  ,CONCAT(Ho,' ',Ten) AS HoTen
      ,
		CASE WHEN GioiTinh = 0 THEN N'Nữ'
			ELSE N'Nam'
		END AS GioiTinh
      ,[NgaySinh]
      ,[SoChungMinh]
      ,[SoDienThoai]
      ,[Email]
      ,[DiaChi]
      ,[MaSoThue]
      ,[HinhAnh]
      ,[NgayTao]
      ,[NgaySua]
      ,[DangLamViec]
      ,[DaXoa]
  FROM [dbo].[NhanVien]
  WHERE Id = @Id AND DaXoa = 0 AND DangLamViec = 1
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeNhanVienTheoId]    Script Date: 10/9/2019 9:49:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKeNhanVienTheoId]
(
	@Id INT
)
AS
BEGIN
SELECT 
	  TK.[Id]
	  ,CONCAT(NV.Ho,' ',NV.Ten) AS HoTen
      ,TK.[NhanVienId]
      ,TK.[Thang]
      ,TK.[Nam]
      ,TK.[CoMat]
      ,TK.[Tre]
      ,TK.[KhongPhep]
      ,TK.[CoPhep]
      ,TK.[TheoQuyDinh]
      ,TK.[SoPhepConLai]
  FROM [dbo].[ThongKe] TK JOIN dbo.NhanVien NV ON NV.Id = TK.NhanVienId
  WHERE TK.NhanVienId = @Id AND NV.DaXoa = 0 AND NV.DangLamViec = 1
END

GO
USE [master]
GO
ALTER DATABASE [CaseStudy] SET  READ_WRITE 
GO
