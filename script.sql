USE [master]
GO
/****** Object:  Database [QuanLiThuoc]    Script Date: 7/12/2020 1:27:54 AM ******/
CREATE DATABASE [QuanLiThuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiThuoc', FILENAME = N'C:\New folder\BTLJava\QuanLiThuoc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLiThuoc_log', FILENAME = N'C:\New folder\BTLJava\QuanLiThuoc_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLiThuoc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiThuoc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiThuoc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLiThuoc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiThuoc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiThuoc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLiThuoc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiThuoc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiThuoc] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiThuoc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiThuoc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiThuoc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiThuoc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLiThuoc', N'ON'
GO
USE [QuanLiThuoc]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[SoLuong] [smallint] NULL,
	[DonGia] [money] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK__ChiTietH__339EB982CC6E7DDB] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuHuy]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuHuy](
	[MaLoThuoc] [nvarchar](50) NOT NULL,
	[MaPhieuHuy] [nvarchar](50) NOT NULL,
	[SoLuong] [float] NULL,
 CONSTRAINT [PK__ChiTietP__6A974C1CAB65FDF7] PRIMARY KEY CLUSTERED 
(
	[MaLoThuoc] ASC,
	[MaPhieuHuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaLoThuoc] [nvarchar](50) NOT NULL,
	[MaPhieuNhap] [nvarchar](50) NOT NULL,
	[SoLuong] [float] NULL,
	[DonGia] [money] NULL,
 CONSTRAINT [PK__ChiTietP__EAF6F8D3C2EDDF70] PRIMARY KEY CLUSTERED 
(
	[MaLoThuoc] ASC,
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[NgayLapHD] [datetime] NOT NULL,
	[VAT] [float] NOT NULL,
	[MaNV] [nvarchar](60) NOT NULL,
	[MaKH] [nvarchar](50) NULL,
	[TongTien] [money] NULL,
	[SoDiemTru] [money] NULL,
	[TongTienPhaiTra] [money] NULL,
	[TongTienChuaThue] [money] NULL,
 CONSTRAINT [PK__HoaDon__2725A6E0D775D48E] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[HoTenDem] [nvarchar](50) NULL,
	[TenKH] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](60) NULL,
	[GioiTinh] [bit] NULL,
	[DiemTichLuy] [float] NULL,
 CONSTRAINT [PK__KhachHan__2725CF1E7E0D73C2] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoThuoc]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoThuoc](
	[MaPhieuHuy] [nvarchar](50) NULL,
	[MaLoThuoc] [nvarchar](50) NULL,
	[NgaySanXuat] [date] NULL,
	[NgayHetHan] [date] NULL,
	[MaThuoc] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[MaPhieuNhap] [nvarchar](50) NOT NULL,
	[TongTien] [money] NULL,
	[DonGiaNhap] [money] NULL,
 CONSTRAINT [PK_LoThuoc] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loThuoc$]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loThuoc$](
	[F1] [float] NULL,
	[maNhaCungCap] [float] NULL,
	[ngaySanXuatTemp] [nvarchar](255) NULL,
	[ngayHetHanTemp] [nvarchar](255) NULL,
	[maThuoc] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](20) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](60) NOT NULL,
	[HoTenDem] [nvarchar](50) NULL,
	[TenNV] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](60) NULL,
	[GioiTinh] [bit] NULL,
	[LuongTrenGio] [money] NULL,
	[SoGioLam] [float] NULL,
	[TenTaiKhoan] [nchar](15) NULL,
	[SoDienThoai] [varchar](13) NULL,
 CONSTRAINT [PK__NhanVien__2725D70ADCAE7DD2] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuHuy]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuHuy](
	[MaPhieuHuy] [nvarchar](50) NOT NULL,
	[NgayHuy] [datetime] NULL,
	[MaNV] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK__PhieuHuy__126BA3C306F77357] PRIMARY KEY CLUSTERED 
(
	[MaPhieuHuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [nvarchar](50) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNV] [nvarchar](60) NOT NULL,
	[TongTienPhieuNhap] [money] NULL,
 CONSTRAINT [PK__PhieuNha__1470EF3BA9830A1A] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[F1] [float] NULL,
	[maThuoc] [nvarchar](255) NULL,
	[tenThuoc] [nvarchar](255) NULL,
	[hanSuDung] [nvarchar](255) NULL,
	[donGia] [nvarchar](255) NULL,
	[donViTinh] [nvarchar](255) NULL,
	[moTa] [nvarchar](255) NULL,
	[maLoai] [float] NULL,
	[maNCC] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTK] [nchar](15) NOT NULL,
	[MatKhau] [nchar](20) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [nvarchar](20) NOT NULL,
	[TenLoai] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 7/12/2020 1:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [nvarchar](50) NOT NULL,
	[MoTa] [ntext] NULL,
	[GiaThuoc] [money] NULL,
	[TenThuoc] [nvarchar](200) NULL,
	[HSD] [nvarchar](20) NULL,
	[DonViTinh] [nvarchar](20) NULL,
	[MaNCC] [nvarchar](20) NULL,
	[MaLoai] [nvarchar](20) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK__Thuoc__4BB1F620BAD67FA4] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'0b91a2d8-502a-47fb-8e75-6ae635b29ccf', N'VN-10754-10', 1, 12290.2000, 12290.2000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'18054321', N'VD-10107-10', 50, 10000.0000, 500000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'3ad07c95-c091-4629-bbcc-0f73d604368b', N'VD-10057-10', 1, 3770.0000, 3770.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'5050ea4f-71dc-4dad-915d-bf5c4038d8af', N'VD-13330-10', 4, 1638.0000, 6552.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'5470628a-7564-4c75-b087-21da6102b3fe', N'VD-10056-10', 1, 2762.5000, 2762.5000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'55cadea3-b113-47d8-b7be-6441f97e7010', N'VD-10058-10', 1, 2470.0000, 2470.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'687432b6-0dba-4fee-b2ba-fc83cc17bd26', N'VN-10592-10', 20, 8320.0000, 166400.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'a703237c-db57-4c84-84ee-d5997b767429', N'VD-10054-10', 1, 2210.0000, 2210.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'a703237c-db57-4c84-84ee-d5997b767429', N'VN-10747-10', 1, 1184040.0000, 1184040.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'a9c4bdfe-2f25-42c1-a3ee-c9a6bcb84a8c', N'VD-10053-10', 20, 2762.5000, 55250.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'a9c4bdfe-2f25-42c1-a3ee-c9a6bcb84a8c', N'VD-12766-10', 13, 1950.0000, 25350.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'b9a9d82f-1d71-4085-9d1e-ced091016361', N'VD-10056-10', 1, 2762.5000, 2762.5000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'bbe3afbf-5b67-4de0-bd7d-98ab549b6ca3', N'VD-10058-10', 1, 2470.0000, 2470.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'bcec30b3-ffc9-4110-be2e-2d6755a5573e', N'VN2-52-13', 1, 573000.0000, 573000.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'c49e6379-9476-468d-b7d3-e4ec9b0539e2', N'VD-10066-10', 1, 6800.0000, 6800.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'c49e6379-9476-468d-b7d3-e4ec9b0539e2', N'VD-10359-10', 22, 1300.0000, 28600.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'c8bb06f2-15a2-469f-a9d6-e4a7dabf9d23', N'VD-10057-10', 10, 3770.0000, 37700.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'cd0b9e8e-1062-43a4-a916-bcabc808c2ba', N'VD-10719-10', 1, 4550.0000, 4550.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'd2d5c07c-1c3e-4744-8894-f318b243ffc3', N'VD-10056-10', 2, 2762.5000, 5525.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'd4da0049-8258-4a65-a5dc-d3e7e4a77534', N'VD-10056-10', 1, 2762.5000, 2762.5000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'e2594ade-b234-4ad2-a254-9513f4f46114', N'VD-10058-10', 15, 2470.0000, 37050.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'e2594ade-b234-4ad2-a254-9513f4f46114', N'VD-14108-11', 20, 936.0000, 18720.0000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'e2f4447f-3e12-4d9d-bfa7-bb19be21a3bd', N'VD-10056-10', 1, 2762.5000, 2762.5000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaThuoc], [SoLuong], [DonGia], [TongTien]) VALUES (N'f426ffbf-a1f7-401a-888d-2691404306f0', N'VN-10592-10', 30, 8320.0000, 249600.0000)
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'0b91a2d8-502a-47fb-8e75-6ae635b29ccf', CAST(N'2020-07-01T11:29:06.307' AS DateTime), 0.03, N'18054321', NULL, 12658.9060, 0.0000, 12658.9060, 12290.2000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'18054321                                          ', CAST(N'2020-06-28T10:12:28.993' AS DateTime), 0.03, N'18054321', N'18054321', 0.0000, 0.0000, 0.0000, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'3ad07c95-c091-4629-bbcc-0f73d604368b', CAST(N'2020-06-28T00:00:00.000' AS DateTime), 0.03, N'18054322', NULL, 3883.1000, 0.0000, 3883.1000, 3770.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'5050ea4f-71dc-4dad-915d-bf5c4038d8af', CAST(N'2020-06-30T05:30:52.600' AS DateTime), 0.03, N'18054321', NULL, 6748.5600, 0.0000, 6748.5600, 6552.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'5470628a-7564-4c75-b087-21da6102b3fe', CAST(N'2020-07-01T11:04:32.890' AS DateTime), 0.03, N'18054321', N'18054323', 2845.3750, 845.0000, 2000.3750, 2762.5000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'55cadea3-b113-47d8-b7be-6441f97e7010', CAST(N'2020-07-01T11:28:31.100' AS DateTime), 0.03, N'18054321', N'18054323', 2544.1000, 544.0000, 2000.1000, 2470.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'687432b6-0dba-4fee-b2ba-fc83cc17bd26', CAST(N'2020-06-28T13:01:52.630' AS DateTime), 0.03, N'18054322', N'18054323', 171392.0000, 1392.0000, 170000.0000, 166400.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'a703237c-db57-4c84-84ee-d5997b767429', CAST(N'2020-07-01T03:08:27.477' AS DateTime), 0.03, N'18054321', N'18054321', 1221837.5000, 1838.0000, 1219999.5000, 1186250.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'a9c4bdfe-2f25-42c1-a3ee-c9a6bcb84a8c', CAST(N'2020-06-28T00:00:00.000' AS DateTime), 0.03, N'18054322', N'18054321', 83018.0000, 3018.0000, 80000.0000, 80600.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'b9a9d82f-1d71-4085-9d1e-ced091016361', CAST(N'2020-07-01T04:24:36.037' AS DateTime), 0.03, N'18054322', N'18054321', 2845.3750, 845.0000, 2000.3750, 2762.5000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'bbe3afbf-5b67-4de0-bd7d-98ab549b6ca3', CAST(N'2020-07-01T04:18:09.153' AS DateTime), 0.03, N'18054321', NULL, 2544.1000, 0.0000, 2544.1000, 2470.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'bcec30b3-ffc9-4110-be2e-2d6755a5573e', CAST(N'2020-07-05T00:45:04.620' AS DateTime), 0.03, N'18054322', NULL, 590190.0000, 0.0000, 590190.0000, 573000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'c49e6379-9476-468d-b7d3-e4ec9b0539e2', CAST(N'2020-07-05T14:31:41.407' AS DateTime), 0.03, N'18054322', NULL, 36462.0000, 0.0000, 36462.0000, 35400.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'c8bb06f2-15a2-469f-a9d6-e4a7dabf9d23', CAST(N'2020-07-02T02:11:33.943' AS DateTime), 0.03, N'18054321', N'18054323', 38831.0000, 0.0000, 38831.0000, 37700.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'cd0b9e8e-1062-43a4-a916-bcabc808c2ba', CAST(N'2020-07-01T11:08:35.500' AS DateTime), 0.03, N'18054321', NULL, 4686.5000, 0.0000, 4686.5000, 4550.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'd2d5c07c-1c3e-4744-8894-f318b243ffc3', CAST(N'2020-07-06T22:35:30.087' AS DateTime), 0.03, N'18054322', NULL, 5690.7500, 0.0000, 5690.7500, 5525.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'd4da0049-8258-4a65-a5dc-d3e7e4a77534', CAST(N'2020-07-01T11:13:50.197' AS DateTime), 0.03, N'18054321', N'18054322', 2845.3750, 845.0000, 2000.3750, 2762.5000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'e2594ade-b234-4ad2-a254-9513f4f46114', CAST(N'2020-06-28T00:00:00.000' AS DateTime), 0.03, N'18054322', N'18054322', 57443.1000, 2443.0000, 55000.1000, 55770.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'e2f4447f-3e12-4d9d-bfa7-bb19be21a3bd', CAST(N'2020-06-28T00:00:00.000' AS DateTime), 0.03, N'18054322', NULL, 2845.3750, 0.0000, 2845.3750, 2762.5000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [VAT], [MaNV], [MaKH], [TongTien], [SoDiemTru], [TongTienPhaiTra], [TongTienChuaThue]) VALUES (N'f426ffbf-a1f7-401a-888d-2691404306f0', CAST(N'2020-06-28T13:44:20.547' AS DateTime), 0.03, N'18054322', NULL, 257088.0000, 0.0000, 257088.0000, 249600.0000)
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTenDem], [TenKH], [NgaySinh], [DiaChi], [GioiTinh], [DiemTichLuy]) VALUES (N'18054321', N'Trương Đức', N'Hoàn', CAST(N'2000-01-25' AS Date), N'Tứ Kỳ - Hải Dương', 1, 26545.82875)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenDem], [TenKH], [NgaySinh], [DiaChi], [GioiTinh], [DiemTichLuy]) VALUES (N'18054322', N'Phạm Xuân', N'Vũ', CAST(N'2000-07-20' AS Date), N'Gò vấp - Bến Tre', 1, 3722.45375)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenDem], [TenKH], [NgaySinh], [DiaChi], [GioiTinh], [DiemTichLuy]) VALUES (N'18054323', N'Nguyễn Thị Quỳnh', N'Mai', CAST(N'1998-05-18' AS Date), N'Gò Vấp - Bình Phước', 0, 24643.20475)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenDem], [TenKH], [NgaySinh], [DiaChi], [GioiTinh], [DiemTichLuy]) VALUES (N'29206506-dc89-4f6c-9a27-ac732b4d2459', N'Lê Công', N'Thiện', CAST(N'2000-07-13' AS Date), N'Bến Lức - Long An', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenDem], [TenKH], [NgaySinh], [DiaChi], [GioiTinh], [DiemTichLuy]) VALUES (N'40df0ef7-2178-40c0-a024-d9067fb608b7', N'Quảng Thu', N'Xuân', CAST(N'2000-03-08' AS Date), N'Thanh Bình - Đồng Tháp', 0, 0)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, NULL, CAST(N'2020-07-13' AS Date), CAST(N'2020-07-23' AS Date), N'VD-10056-10', 15, N'08a7d1d0-68bf-4b40-a814-b177c9fe3366', 31875.0000, 2125.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, NULL, CAST(N'2020-07-13' AS Date), CAST(N'2020-07-23' AS Date), N'VD-11490-10', 12, N'08a7d1d0-68bf-4b40-a814-b177c9fe3366', 62400.0000, 5200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, NULL, CAST(N'2020-07-13' AS Date), CAST(N'2020-07-23' AS Date), N'VN-10479-10', 100, N'08a7d1d0-68bf-4b40-a814-b177c9fe3366', 393600.0000, 3936.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'999                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'GC-274-17', 50, N'18054321', 122050.0000, 2441.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1277                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'NC46-H06-15', 50, N'18054321', 1400000.0000, 28000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'939                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'NC49-H12-15', 50, N'18054321', 154250.0000, 3085.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'808                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2020-12-19' AS Date), N'QLĐB1-H07-19', 50, N'18054321', 44000000.0000, 880000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1221                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'QLĐB-366-13', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1442                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-367-13', 50, N'18054321', 230000.0000, 4600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'849                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-531-16', 50, N'18054321', 19500000.0000, 390000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'850                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-532-16', 50, N'18054321', 9000000.0000, 180000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'857                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-569-16', 50, N'18054321', 1400000.0000, 28000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'858                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-570-16', 50, N'18054321', 2400000.0000, 48000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1222                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-571-16', 50, N'18054321', 195000.0000, 3900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'863                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-579-16', 50, N'18054321', 7250000.0000, 145000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'852                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-610-17', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'884                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-661-18', 50, N'18054321', 30500000.0000, 610000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1336                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'QLĐB-744-19', 50, N'18054321', 1600000.0000, 32000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'940                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'V53-H12-16', 50, N'18054321', 152500.0000, 3050.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1276                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'V54-H12-16', 50, N'18054321', 1400000.0000, 28000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1157                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'V70-H12-16', 50, N'18054321', 12500.0000, 250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1280                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10051-10', 50, N'18054321', 45000.0000, 900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1298                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10052-10', 50, N'18054321', 20000.0000, 400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1301                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10053-10', 50, N'18054321', 106250.0000, 2125.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1310                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10054-10', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1343                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10056-10', 50, N'18054321', 106250.0000, 2125.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1289                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10057-10', 50, N'18054321', 145000.0000, 2900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1354                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10058-10', 50, N'18054321', 95000.0000, 1900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1356                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10059-10', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1364                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10060-10', 50, N'18054321', 105000.0000, 2100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1381                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10061-10', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1394                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10062-10', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1419                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10065-10', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1421                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10066-10', 50, N'18054321', 340000.0000, 6800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1433                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10067-10', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1189                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10107-10', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1022                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-10281-10', 50, N'18054321', 25000.0000, 500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1239                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10359-10', 50, N'18054321', 65000.0000, 1300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1241                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10428-10', 50, N'18054321', 157500.0000, 3150.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1149                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10638-10', 50, N'18054321', 48500.0000, 970.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1196                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10719-10', 50, N'18054321', 175000.0000, 3500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1200                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-10720-10', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'990                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10762-10', 50, N'18054321', 24000.0000, 480.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1001                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10858-10', 50, N'18054321', 25000.0000, 500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1002                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10859-10', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1003                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10860-10', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'920                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-10977-10', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1232                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-11340-10', 50, N'18054321', 330000.0000, 6600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1230                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11464-10', 50, N'18054321', 21000.0000, 420.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1188                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11476-10', 50, N'18054321', 220000.0000, 4400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1069                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11489-10', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1075                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11490-10', 50, N'18054321', 260000.0000, 5200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1278                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11491-10', 50, N'18054321', 13200.0000, 264.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1306                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11492-10', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1313                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11493-10', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1345                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11494-10', 50, N'18054321', 225000.0000, 4500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1362                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11495-10', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1370                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11497-10', 50, N'18054321', 110000.0000, 2200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1398                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11499-10', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1410                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-11501-10', 50, N'18054321', 42500.0000, 850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1247                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-11599-10', 50, N'18054321', 25200.0000, 504.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1023                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11640-10', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1170                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-11768-10', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1094                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-11800-10', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1201                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-11932-10', 50, N'18054321', 800000.0000, 16000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1125                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12081-10', 50, N'18054321', 1980000.0000, 39600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1279                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12194-10', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1248                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12282-10', 50, N'18054321', 28500.0000, 570.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1155                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-12373-10', 50, N'18054321', 231000.0000, 4620.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1223                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-12596-10', 50, N'18054321', 750000.0000, 15000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1017                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-12764-10', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1321                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12765-10', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1347                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12766-10', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1412                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12768-10', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1431                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-12769-10', 50, N'18054321', 27500.0000, 550.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1148                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-12966-10', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1235                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-12988-10', 50, N'18054321', 192500.0000, 3850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1171                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13018-10', 50, N'18054321', 475000.0000, 9500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'919                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13019-10', 50, N'18054321', 1250000.0000, 25000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'971                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13301-10', 50, N'18054321', 42500.0000, 850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1275                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13302-10', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1307                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13303-10', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1330                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13304-10', 50, N'18054321', 340000.0000, 6800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1331                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13305-10', 50, N'18054321', 525000.0000, 10500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1365                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13307-10', 50, N'18054321', 190000.0000, 3800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1367                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13308-10', 50, N'18054321', 255000.0000, 5100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1386                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13311-10', 50, N'18054321', 76500.0000, 1530.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1400                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13315-10', 50, N'18054321', 23000.0000, 460.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1402                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13316-10', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1414                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13317-10', 50, N'18054321', 750000.0000, 15000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'963                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13330-10', 50, N'18054321', 63000.0000, 1260.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1026                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13361-10', 50, N'18054321', 36750.0000, 735.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1014                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13744-11', 50, N'18054321', 13500.0000, 270.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1339                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13745-11', 50, N'18054321', 93000.0000, 1860.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1341                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13746-11', 50, N'18054321', 66000.0000, 1320.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1385                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13748-11', 50, N'18054321', 195000.0000, 3900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1390                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13749-11', 50, N'18054321', 165000.0000, 3300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1393                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13750-11', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1404                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13751-11', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1426                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13752-11', 50, N'18054321', 40000.0000, 800.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1428                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13753-11', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1056                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13770-11', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'912                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-13824-11', 50, N'18054321', 33000.0000, 660.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1048                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-13874-11', 50, N'18054321', 23600.0000, 472.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1064                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14045-11', 50, N'18054321', 62500.0000, 1250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'974                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14108-11', 50, N'18054321', 36000.0000, 720.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1437                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14139-11', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1036                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14163-11', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1285                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14216-11', 50, N'18054321', 9750.0000, 195.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1304                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14217-11', 50, N'18054321', 25000.0000, 500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1297                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14220-11', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1326                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14221-11', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1327                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14222-11', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1333                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14223-11', 50, N'18054321', 98500.0000, 1970.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1337                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14224-11', 50, N'18054321', 20250.0000, 405.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1295                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14225-11', 50, N'18054321', 92500.0000, 1850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1407                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14226-11', 50, N'18054321', 175000.0000, 3500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1290                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14229-11', 50, N'18054321', 22500.0000, 450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1062                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14244-11', 50, N'18054321', 3750000.0000, 75000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1054                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14257-11', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1121                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14378-11', 50, N'18054321', 960000.0000, 19200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'952                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14507-11', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'967                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14511-11', 50, N'18054321', 65000.0000, 1300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1109                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14512-11', 50, N'18054321', 362500.0000, 7250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1151                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14628-11', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1184                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14632-11', 50, N'18054321', 950000.0000, 19000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1019                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14663-11', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1318                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-14664-11', 50, N'18054321', 25000.0000, 500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1371                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14665-11', 50, N'18054321', 425000.0000, 8500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1409                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14666-11', 50, N'18054321', 21500.0000, 430.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1049                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-14765-11', 50, N'18054321', 43600.0000, 872.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1271                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15034-11', 50, N'18054321', 1449000.0000, 28980.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1131                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15052-11', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'964                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15204-11', 50, N'18054321', 98000.0000, 1960.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1160                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15352-11', 50, N'18054321', 1425000.0000, 28500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1323                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15362-11', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1405                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15363-11', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'917                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15499-11', 50, N'18054321', 87500.0000, 1750.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'983                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15582-11', 50, N'18054321', 51000.0000, 1020.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'985                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15583-11', 50, N'18054321', 57000.0000, 1140.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'827                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15693-11', 50, N'18054321', 21000.0000, 420.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1024                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-15871-11', 50, N'18054321', 850000.0000, 17000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1384                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-15984-11', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1203                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16005-11', 50, N'18054321', 31500.0000, 630.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1079                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16082-11', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'814                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16258-12', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1050                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16282-12', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1128                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-16313-12', 50, N'18054321', 2400000.0000, 48000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1077                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16333-12', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1037                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16381-12', 50, N'18054321', 23500.0000, 470.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'911                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-16478-12', 50, N'18054321', 390000.0000, 7800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1443                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16515-12', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1444                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16516-12', 50, N'18054321', 29750.0000, 595.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1176                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16621-12', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1078                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-16647-12', 50, N'18054321', 562500.0000, 11250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1110                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16656-12', 50, N'18054321', 1562500.0000, 31250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1070                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16803-12', 50, N'18054321', 22500.0000, 450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'992                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-12-04' AS Date), N'VD-16812-12', 50, N'18054321', 13150.0000, 263.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'996                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16814-12', 50, N'18054321', 6400.0000, 128.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1038                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16815-12', 50, N'18054321', 34250.0000, 685.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1179                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-16816-12', 50, N'18054321', 65600.0000, 1312.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1082                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-16826-12', 50, N'18054321', 12600.0000, 252.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1021                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17011-12', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1100                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17254-12', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1351                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17377-12', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1396                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17378-12', 50, N'18054321', 17500.0000, 350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'932                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17384-12', 50, N'18054321', 1312500.0000, 26250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'962                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17385-12', 50, N'18054321', 78750.0000, 1575.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1000                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17405-12', 50, N'18054321', 27000.0000, 540.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1034                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17430-12', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'981                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-17472-12', 50, N'18054321', 95000.0000, 1900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1178                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17787-12', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1208                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17818-12', 50, N'18054321', 3000000.0000, 60000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1072                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17856-12', 50, N'18054321', 34000.0000, 680.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1039                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-17864-12', 50, N'18054321', 105400.0000, 2108.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1382                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17880-12', 50, N'18054321', 940000.0000, 18800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'960                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-17887-12', 50, N'18054321', 63000.0000, 1260.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1059                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-17908-12', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1281                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18220-13', 50, N'18054321', 114000.0000, 2280.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'961                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18248-13', 50, N'18054321', 147000.0000, 2940.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1074                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18434-13', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1122                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18475-13', 50, N'18054321', 31500.0000, 630.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1114                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18521-13', 50, N'18054321', 80000.0000, 1600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1209                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18667-13', 50, N'18054321', 2250000.0000, 45000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1315                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18693-13', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1227                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-18767-13', 50, N'18054321', 29000.0000, 580.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1111                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-18820-13', 50, N'18054321', 65000.0000, 1300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1044                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-18919-13', 50, N'18054321', 35700.0000, 714.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1335                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-18925-13', 50, N'18054321', 1250000.0000, 25000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1228                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19015-13', 50, N'18054321', 130000.0000, 2600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1083                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-19107-13', 50, N'18054321', 27000.0000, 540.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'986                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19179-13', 50, N'18054321', 23250.0000, 465.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1292                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-19310-13', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1350                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-19311-13', 50, N'18054321', 72500.0000, 1450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1051                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19483-13', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1123                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19571-13', 50, N'18054321', 2000000.0000, 40000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1134                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19584-13', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1136                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19585-13', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1065                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19639-13', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1439                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19729-13', 50, N'18054321', 12300.0000, 246.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1424                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-19753-13', 50, N'18054321', 5000.0000, 100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1425                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-19754-13', 50, N'18054321', 5000.0000, 100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1191                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-19769-13', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1032                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20043-13', 50, N'18054321', 27500.0000, 550.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'968                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20124-13', 50, N'18054321', 35050.0000, 701.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1066                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20188-13', 50, N'18054321', 111500.0000, 2230.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1159                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20277-13', 50, N'18054321', 1350000.0000, 27000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1067                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20321-13', 50, N'18054321', 45000.0000, 900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1161                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-20430-14', 50, N'18054321', 1775000.0000, 35500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1272                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20502-14', 50, N'18054321', 850000.0000, 17000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1206                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20511-14', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'994                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-12-04' AS Date), N'VD-20645-14', 50, N'18054321', 18750.0000, 375.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'995                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-12-04' AS Date), N'VD-20646-14', 50, N'18054321', 22500.0000, 450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'921                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20653-14', 50, N'18054321', 67500.0000, 1350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1009                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20679-14', 50, N'18054321', 42500.0000, 850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1010                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20680-14', 50, N'18054321', 15000.0000, 300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1013                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-20681-14', 50, N'18054321', 68250.0000, 1365.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'909                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-20748-14', 50, N'18054321', 14300.0000, 286.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'910                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-20749-14', 50, N'18054321', 14300.0000, 286.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1029                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-20936-14', 50, N'18054321', 80000.0000, 1600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1434                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21047-14', 50, N'18054321', 1100000.0000, 22000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1207                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21122-14', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1087                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21216-14', 50, N'18054321', 450000.0000, 9000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1088                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21217-14', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1090                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21220-14', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1146                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21244-14', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1147                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21245-14', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1129                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21331-14', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1154                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21418-14', 50, N'18054321', 115000.0000, 2300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1175                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-21460-14', 50, N'18054321', 62500.0000, 1250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1197                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21528-14', 50, N'18054321', 155000.0000, 3100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1089                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21620-14', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1124                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21788-14', 50, N'18054321', 2835000.0000, 56700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1040                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21827-14', 50, N'18054321', 40500.0000, 810.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'906                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-21854-14', 50, N'18054321', 14300.0000, 286.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'907                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-21855-14', 50, N'18054321', 14300.0000, 286.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1133                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21884-14', 50, N'18054321', 35500.0000, 710.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1052                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21910-14', 50, N'18054321', 20350.0000, 407.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1135                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-21960-14', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1012                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22122-15', 50, N'18054321', 32500.0000, 650.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'908                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-22162-15', 50, N'18054321', 12500.0000, 250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'959                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22211-15', 50, N'18054321', 24500.0000, 490.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1007                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22293-15', 50, N'18054321', 135000.0000, 2700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1008                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22294-15', 50, N'18054321', 165000.0000, 3300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1015                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-22437-15', 50, N'18054321', 13500.0000, 270.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1334                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22438-15', 50, N'18054321', 30500.0000, 610.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1058                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-22667-15', 50, N'18054321', 35650.0000, 713.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1220                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22783-15', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1293                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22789-15', 50, N'18054321', 130000.0000, 2600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1377                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22790-15', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1378                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22791-15', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1380                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-22792-15', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1429                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-22793-15', 50, N'18054321', 725000.0000, 14500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1011                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22822-15', 50, N'18054321', 21750.0000, 435.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'811                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22915-15', 50, N'18054321', 62500.0000, 1250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1071                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-22934-15', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1080                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23266-15', 50, N'18054321', 102500.0000, 2050.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1198                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23346-15', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1035                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23472-15', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1260                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23473-15', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'972                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23483-15', 50, N'18054321', 102500.0000, 2050.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1282                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23484-15', 50, N'18054321', 43500.0000, 870.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1283                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23485-15', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1392                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23486-15', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1417                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23487-15', 50, N'18054321', 105000.0000, 2100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'977                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23528-15', 50, N'18054321', 105000.0000, 2100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'825                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23567-15', 50, N'18054321', 17500.0000, 350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1046                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-23568-15', 50, N'18054321', 43750.0000, 875.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'918                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-23657-15', 50, N'18054321', 32500.0000, 650.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1229                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-23739-15', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'801                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-23889-15', 50, N'18054321', 29500.0000, 590.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1025                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VD-24018-15', 50, N'18054321', 899400.0000, 17988.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'804                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24071-16', 50, N'18054321', 135000.0000, 2700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1363                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24111-16', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1422                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24112-16', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'823                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24125-16', 50, N'18054321', 1300000.0000, 26000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'824                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24126-16', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'829                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24127-16', 50, N'18054321', 140000.0000, 2800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'836                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24128-16', 50, N'18054321', 225000.0000, 4500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'841                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24129-16', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'843                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24130-16', 50, N'18054321', 230000.0000, 4600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'853                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24131-16', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'881                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24132-16', 50, N'18054321', 20000.0000, 400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'887                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24133-16', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'955                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24153-16', 50, N'18054321', 105000.0000, 2100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'982                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24204-16', 50, N'18054321', 81000.0000, 1620.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'826                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24206-16', 50, N'18054321', 26500.0000, 530.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1240                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24262-16', 50, N'18054321', 65000.0000, 1300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1073                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24375-16', 50, N'18054321', 126500.0000, 2530.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1172                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24489-16', 50, N'18054321', 600000.0000, 12000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1225                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24495-16', 50, N'18054321', 162500.0000, 3250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1152                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24522-16', 50, N'18054321', 82250.0000, 1645.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1193                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24572-16', 50, N'18054321', 80000.0000, 1600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'997                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24693-16', 50, N'18054321', 28000.0000, 560.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1311                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24701-16', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1355                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24702-16', 50, N'18054321', 95000.0000, 1900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1383                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24703-16', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1399                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24704-16', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1296                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24705-16', 50, N'18054321', 45000.0000, 900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'830                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24722-16', 50, N'18054321', 1200000.0000, 24000.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'833                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24723-16', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'835                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24724-16', 50, N'18054321', 190750.0000, 3815.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'844                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24725-16', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'848                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24726-16', 50, N'18054321', 1450000.0000, 29000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'861                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24727-16', 50, N'18054321', 2600000.0000, 52000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'864                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24728-16', 50, N'18054321', 3800000.0000, 76000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'869                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24729-16', 50, N'18054321', 3100000.0000, 62000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'872                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24730-16', 50, N'18054321', 693000.0000, 13860.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'883                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24731-16', 50, N'18054321', 1840000.0000, 36800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'885                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-24732-16', 50, N'18054321', 2000000.0000, 40000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1163                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24819-16', 50, N'18054321', 3100000.0000, 62000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1173                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-24956-16', 50, N'18054321', 475000.0000, 9500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1224                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25027-16', 50, N'18054321', 600000.0000, 12000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1202                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25031-16', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'941                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25057-16', 50, N'18054321', 5300.0000, 106.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'915                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25107-16', 50, N'18054321', 120000.0000, 2400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'973                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25112-16', 50, N'18054321', 42500.0000, 850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1302                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25113-16', 50, N'18054321', 72500.0000, 1450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1303                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25114-16', 50, N'18054321', 1400000.0000, 28000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1309                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25115-16', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1294                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25116-16', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1360                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25117-16', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1376                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25118-16', 50, N'18054321', 69250.0000, 1385.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1395                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25119-16', 50, N'18054321', 27000.0000, 540.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1401                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25120-16', 50, N'18054321', 23000.0000, 460.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1403                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25121-16', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1415                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25122-16', 50, N'18054321', 425250.0000, 8505.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1416                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25123-16', 50, N'18054321', 91000.0000, 1820.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'970                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25277-16', 50, N'18054321', 142500.0000, 2850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1242                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25284-16', 50, N'18054321', 200000.0000, 4000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1236                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25351-16', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1346                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25523-16', 50, N'18054321', 225000.0000, 4500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'916                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25594-16', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1299                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25601-16', 50, N'18054321', 20000.0000, 400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1312                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25602-16', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1314                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25603-16', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1320                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25604-16', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1369                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25605-16', 50, N'18054321', 105000.0000, 2100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1411                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25606-16', 50, N'18054321', 42500.0000, 850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1420                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25607-16', 50, N'18054321', 107500.0000, 2150.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1430                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25608-16', 50, N'18054321', 435000.0000, 8700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1432                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25609-16', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'832                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25622-16', 50, N'18054321', 200000.0000, 4000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'834                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25623-16', 50, N'18054321', 110000.0000, 2200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'837                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25624-16', 50, N'18054321', 260000.0000, 5200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'840                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25625-16', 50, N'18054321', 70000.0000, 1400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'851                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25626-16', 50, N'18054321', 247500.0000, 4950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'854                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25627-16', 50, N'18054321', 130000.0000, 2600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'866                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25628-16', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'867                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25629-16', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'871                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25630-16', 50, N'18054321', 5500000.0000, 110000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'873                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25631-16', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'877                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25632-16', 50, N'18054321', 450000.0000, 9000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'882                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25633-16', 50, N'18054321', 1900000.0000, 38000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'889                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25634-16', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'890                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25635-16', 50, N'18054321', 130000.0000, 2600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'896                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25636-16', 50, N'18054321', 225000.0000, 4500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'898                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25637-16', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'899                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-25638-16', 50, N'18054321', 375000.0000, 7500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'976                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25673-16', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1004                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-25997-16', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1018                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26090-17', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1308                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26091-17', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1322                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26092-17', 50, N'18054321', 10000.0000, 200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1273                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26093-17', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'847                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26104-17', 50, N'18054321', 199500.0000, 3990.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'878                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26105-17', 50, N'18054321', 2400000.0000, 48000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'879                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26106-17', 50, N'18054321', 3250000.0000, 65000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'893                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26107-17', 50, N'18054321', 120000.0000, 2400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1190                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26113-17', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'978                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26134-17', 50, N'18054321', 45900.0000, 918.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'979                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2021-12-14' AS Date), N'VD-26135-17', 50, N'18054321', 131500.0000, 2630.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'813                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26140-17', 50, N'18054321', 62500.0000, 1250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'925                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26141-17', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1045                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26163-17', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'922                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26474-17', 50, N'18054321', 180000.0000, 3600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1194                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26553-17', 50, N'18054321', 80000.0000, 1600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1005                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26588-17', 50, N'18054321', 60000.0000, 1200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1061                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26619-17', 50, N'18054321', 23850.0000, 477.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1284                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26720-17', 50, N'18054321', 13200.0000, 264.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1374                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26721-17', 50, N'18054321', 122500.0000, 2450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1379                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26722-17', 50, N'18054321', 87500.0000, 1750.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'842                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26742-17', 50, N'18054321', 10000.0000, 200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'856                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26743-17', 50, N'18054321', 136500.0000, 2730.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'859                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26744-17', 50, N'18054321', 1350000.0000, 27000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'901                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26745-17', 50, N'18054321', 1500000.0000, 30000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'874                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26746-17', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'886                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-26747-17', 50, N'18054321', 170000.0000, 3400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1055                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26762-17', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1057                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26763-17', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1177                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26787-17', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1187                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26788-17', 50, N'18054321', 242500.0000, 4850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'812                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26870-17', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1084                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-26894-17', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1181                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27017-17', 50, N'18054321', 2400000.0000, 48000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1185                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27018-17', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1237                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-27151-17', 50, N'18054321', 192500.0000, 3850.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1226                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27207-17', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'928                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27208-17', 50, N'18054321', 47500.0000, 950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1101                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27299-17', 50, N'18054321', 1890000.0000, 37800.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1153                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27354-17', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1195                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27536-17', 50, N'18054321', 155000.0000, 3100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1041                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27595-17', 50, N'18054321', 28500.0000, 570.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'993                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27730-17', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1016                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27742-17', 50, N'18054321', 13500.0000, 270.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1316                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27743-17', 50, N'18054321', 260000.0000, 5200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1338                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27744-17', 50, N'18054321', 20250.0000, 405.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1349                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27745-17', 50, N'18054321', 72500.0000, 1450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1387                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27746-17', 50, N'18054321', 207500.0000, 4150.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1397                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27747-17', 50, N'18054321', 48500.0000, 970.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1408                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27748-17', 50, N'18054321', 187500.0000, 3750.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1291                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27749-17', 50, N'18054321', 22500.0000, 450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'838                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27786-17', 50, N'18054321', 120000.0000, 2400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'839                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27787-17', 50, N'18054321', 200000.0000, 4000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'860                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27788-17', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'862                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27789-17', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'868                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27790-17', 50, N'18054321', 99000.0000, 1980.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'870                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27791-17', 50, N'18054321', 4700000.0000, 94000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'927                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27800-17', 50, N'18054321', 190000.0000, 3800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1027                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27844-17', 50, N'18054321', 36750.0000, 735.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'991                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-27875-17', 50, N'18054321', 82500.0000, 1650.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'966                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27911-17', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1436                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-27924-17', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1126                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28098-17', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1068                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28139-17', 50, N'18054321', 62500.0000, 1250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1156                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28159-17', 50, N'18054321', 90000.0000, 1800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'945                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28367-17', 50, N'18054321', 800000.0000, 16000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'984                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-28535-17', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1218                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28582-17', 50, N'18054321', 3100000.0000, 62000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1438                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VD-28758-18', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'998                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28809-18', 50, N'18054321', 49300.0000, 986.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1020                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28816-18', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1305                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28817-18', 50, N'18054321', 25000.0000, 500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1319                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-28818-18', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1342                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28819-18', 50, N'18054321', 66000.0000, 1320.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1348                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28820-18', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1361                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28821-18', 50, N'18054321', 175000.0000, 3500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1368                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28822-18', 50, N'18054321', 255000.0000, 5100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1413                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28823-18', 50, N'18054321', 312500.0000, 6250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1423                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-28824-18', 50, N'18054321', 1500000.0000, 30000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'846                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-28849-18', 50, N'18054321', 210000.0000, 4200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1132                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-28899-18', 50, N'18054321', 247500.0000, 4950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1183                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29085-18', 50, N'18054321', 135000.0000, 2700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1270                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29344-18', 50, N'18054321', 765000.0000, 15300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1262                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29479-18', 50, N'18054321', 1800000.0000, 36000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1199                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29496-18', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1006                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29515-18', 50, N'18054321', 500000.0000, 10000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1286                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29646-18', 50, N'18054321', 9750.0000, 195.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1288                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29647-18', 50, N'18054321', 17500.0000, 350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1329                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29648-18', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1332                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29649-18', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1340                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29650-18', 50, N'18054321', 93000.0000, 1860.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1344                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29651-18', 50, N'18054321', 100000.0000, 2000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1352                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29652-18', 50, N'18054321', 210000.0000, 4200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1353                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29653-18', 50, N'18054321', 195000.0000, 3900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1357                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29654-18', 50, N'18054321', 57500.0000, 1150.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1366                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29655-18', 50, N'18054321', 190000.0000, 3800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1375                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29656-18', 50, N'18054321', 169000.0000, 3380.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1391                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29657-18', 50, N'18054321', 165000.0000, 3300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1406                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29658-18', 50, N'18054321', 39500.0000, 790.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'845                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29682-18', 50, N'18054321', 87500.0000, 1750.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'855                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29683-18', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'865                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29684-18', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'900                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29685-18', 50, N'18054321', 4100000.0000, 82000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'875                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29686-18', 50, N'18054321', 241500.0000, 4830.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'876                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29687-18', 50, N'18054321', 210000.0000, 4200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'888                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-29688-18', 50, N'18054321', 6250000.0000, 125000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1169                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29711-18', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1047                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-29875-18', 50, N'18054321', 40500.0000, 810.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'943                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30009-18', 50, N'18054321', 345000.0000, 6900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'987                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-30095-18', 50, N'18054321', 110000.0000, 2200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1042                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30156-18', 50, N'18054321', 28100.0000, 562.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'975                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30195-18', 50, N'18054321', 72500.0000, 1450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1325                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30201-18', 50, N'18054321', 95000.0000, 1900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1300                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30269-18', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1287                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30270-18', 50, N'18054321', 44500.0000, 890.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1359                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30271-18', 50, N'18054321', 95000.0000, 1900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1372                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30272-18', 50, N'18054321', 425000.0000, 8500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1388                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30273-18', 50, N'18054321', 295000.0000, 5900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1389                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30274-18', 50, N'18054321', 375000.0000, 7500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'897                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-30295-18', 50, N'18054321', 10500000.0000, 210000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'948                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30296-18', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'949                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30297-18', 50, N'18054321', 165000.0000, 3300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'950                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30298-18', 50, N'18054321', 240000.0000, 4800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'951                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30299-18', 50, N'18054321', 194000.0000, 3880.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1435                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30412-18', 50, N'18054321', 155000.0000, 3100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1180                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30479-18', 50, N'18054321', 77500.0000, 1550.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1043                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-30628-18', 50, N'18054321', 75000.0000, 1500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'933                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-30650-18', 50, N'18054321', 1200000.0000, 24000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1324                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31060-18', 50, N'18054321', 40000.0000, 800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1358                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31061-18', 50, N'18054321', 120000.0000, 2400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1427                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31062-18', 50, N'18054321', 47500.0000, 950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'880                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-31065-18', 50, N'18054321', 50250.0000, 1005.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1182                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31257-18', 50, N'18054321', 125000.0000, 2500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'828                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-31591-19', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'831                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-31592-19', 50, N'18054321', 1995000.0000, 39900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'891                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-31593-19', 50, N'18054321', 283500.0000, 5670.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'894                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31594-19', 50, N'18054321', 945000.0000, 18900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'895                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31595-19', 50, N'18054321', 550000.0000, 11000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1053                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-31912-19', 50, N'18054321', 34500.0000, 690.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'937                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD3-19-18', 50, N'18054321', 70000000.0000, 1400000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1238                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VD-32031-19', 50, N'18054321', 262500.0000, 5250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1186                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-32039-19', 50, N'18054321', 1000000.0000, 20000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'926                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-32057-19', 50, N'18054321', 1375000.0000, 27500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1031                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-32111-19', 50, N'18054321', 335000.0000, 6700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'929                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-32203-19', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'944                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-32254-19', 50, N'18054321', 425000.0000, 8500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'892                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VD-32501-19', 50, N'18054321', 275000.0000, 5500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'902                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-3467-07', 50, N'18054321', 52500.0000, 1050.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1033                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VD-3518-07', 50, N'18054321', 27500.0000, 550.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1166                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-10076-10', 50, N'18054321', 158650.0000, 3173.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'924                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-10135-10', 50, N'18054321', 472500.0000, 9450.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1162                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-10368-10', 50, N'18054321', 130000.0000, 2600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1452                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-10479-10', 50, N'18054321', 196800.0000, 3936.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1104                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-10592-10', 50, N'18054321', 320000.0000, 6400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1257                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-10747-10', 50, N'18054321', 45540000.0000, 910800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1212                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-10754-10', 50, N'18054321', 472700.0000, 9454.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1214                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-10755-10', 50, N'18054321', 601700.0000, 12034.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1216                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-10756-10', 50, N'18054321', 232350.0000, 4647.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1118                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-10980-10', 50, N'18054321', 166850.0000, 3337.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1145                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-11032-10', 50, N'18054321', 47500.0000, 950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'914                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-11089-10', 50, N'18054321', 133850.0000, 2677.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'988                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-11171-10', 50, N'18054321', 17500.0000, 350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1263                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-11200-10', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1103                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-11339-10', 50, N'18054321', 55000.0000, 1100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1150                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-11467-10', 50, N'18054321', 516179450.0000, 10323589.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1108                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-11671-11', 50, N'18054321', 800000.0000, 16000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1244                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-11839-11', 50, N'18054321', 297500.0000, 5950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1063                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-12142-11', 50, N'18054321', 150000.0000, 3000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'817                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-12442-11', 50, N'18054321', 900000.0000, 18000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1268                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-12449-11', 50, N'18054321', 30000.0000, 600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1269                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-12450-11', 50, N'18054321', 34500.0000, 690.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1249                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-12717-11', 50, N'18054321', 478050.0000, 9561.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'946                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-12744-11', 50, N'18054321', 9000.0000, 180.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1174                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-13200-11', 50, N'18054321', 727500.0000, 14550.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1102                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-13443-11', 50, N'18054321', 20000.0000, 400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1098                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-13669-11', 50, N'18054321', 77000.0000, 1540.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1099                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-13670-11', 50, N'18054321', 100650.0000, 2013.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1091                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-13788-11', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1250                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-13904-11', 50, N'18054321', 325000.0000, 6500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1251                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-13905-11', 50, N'18054321', 475000.0000, 9500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1210                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-14010-11', 50, N'18054321', 112700.0000, 2254.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1116                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-14025-11', 50, N'18054321', 21250.0000, 425.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1259                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-14033-11', 50, N'18054321', 170000.0000, 3400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1447                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-14124-11', 50, N'18054321', 1050000.0000, 21000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1252                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-14268-11', 50, N'18054321', 3945050.0000, 78901.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1448                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-14630-12', 50, N'18054321', 45150.0000, 903.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'818                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-14667-12', 50, N'18054321', 675000.0000, 13500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1192                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-14811-12', 50, N'18054321', 1229800.0000, 24596.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1254                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-14903-12', 50, N'18054321', 4500000.0000, 90000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'905                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15010-12', 50, N'18054321', 160000.0000, 3200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1168                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-15194-12', 50, N'18054321', 370000.0000, 7400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'819                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-15332-12', 50, N'18054321', 475000.0000, 9500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1107                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15368-12', 50, N'18054321', 137500.0000, 2750.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1445                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-15376-12', 50, N'18054321', 45150.0000, 903.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1450                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-15378-12', 50, N'18054321', 180000.0000, 3600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1451                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-15379-12', 50, N'18054321', 295000.0000, 5900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'942                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-15416-12', 50, N'18054321', 231000.0000, 4620.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1261                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15421-12', 50, N'18054321', 300000.0000, 6000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1219                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15543-12', 50, N'18054321', 40000000.0000, 800000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1441                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15577-12', 50, N'18054321', 247500.0000, 4950.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'934                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15663-12', 50, N'18054321', 2400000.0000, 48000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'980                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15700-12', 50, N'18054321', 1750000.0000, 35000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1211                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15727-12', 50, N'18054321', 300850.0000, 6017.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'903                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15842-12', 50, N'18054321', 250000.0000, 5000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'904                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-15868-12', 50, N'18054321', 350000.0000, 7000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1113                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-16010-12', 50, N'18054321', 278250.0000, 5565.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1143                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-12-09' AS Date), N'VN-16257-13', 50, N'18054321', 337407000.0000, 6748140.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1245                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-16290-13', 50, N'18054321', 1830800.0000, 36616.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1081                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-16414-13', 50, N'18054321', 3250000.0000, 65000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1246                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-16498-13', 50, N'18054321', 2746000.0000, 54920.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1139                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-16554-13', 50, N'18054321', 405000.0000, 8100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1141                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-16555-13', 50, N'18054321', 565000.0000, 11300.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1086                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-16660-13', 50, N'18054321', 147500000.0000, 2950000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1120                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-16733-13', 50, N'18054321', 1250000.0000, 25000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'805                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-16752-13', 50, N'18054321', 850000.0000, 17000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'807                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-16753-13', 50, N'18054321', 800000.0000, 16000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'809                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-16754-13', 50, N'18054321', 950000.0000, 19000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'810                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-16755-13', 50, N'18054321', 890000.0000, 17800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1233                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2021-12-14' AS Date), N'VN-16807-13', 50, N'18054321', 5400000.0000, 108000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'989                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-16828-13', 50, N'18054321', 45000.0000, 900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'938                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-16899-13', 50, N'18054321', 2600000.0000, 52000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1096                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-17188-13', 50, N'18054321', 16000.0000, 320.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1092                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17208-13', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1093                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17209-13', 50, N'18054321', 620000.0000, 12400.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1255                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17240-13', 50, N'18054321', 8500000.0000, 170000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1256                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17241-13', 50, N'18054321', 11500000.0000, 230000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1130                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-17310-13', 50, N'18054321', 600000.0000, 12000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'821                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17422-13', 50, N'18054321', 5617500.0000, 112350.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'803                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17674-14', 50, N'18054321', 63000000.0000, 1260000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1243                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17713-14', 50, N'18054321', 2553400.0000, 51068.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1105                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-17793-14', 50, N'18054321', 110000.0000, 2200.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'806                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-17818-14', 50, N'18054321', 2600000.0000, 52000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1097                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-17848-14', 50, N'18054321', 35000.0000, 700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1253                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18026-14', 50, N'18054321', 476050.0000, 9521.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1127                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18371-14', 50, N'18054321', 750000.0000, 15000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1106                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-18579-14', 50, N'18054321', 185000.0000, 3700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'816                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18586-15', 50, N'18054321', 4750000.0000, 95000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1144                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18587-15', 50, N'18054321', 1097000.0000, 21940.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1158                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-18588-15', 50, N'18054321', 550000.0000, 11000.0000)
GO
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1165                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-18589-15', 50, N'18054321', 1700000.0000, 34000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1234                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18590-15', 50, N'18054321', 50000.0000, 1000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1164                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18806-15', 50, N'18054321', 3362250.0000, 67245.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'930                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-18861-15', 50, N'18054321', 1050000.0000, 21000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1167                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-19029-15', 50, N'18054321', 775000.0000, 15500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1446                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19126-15', 50, N'18054321', 68250.0000, 1365.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1137                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-19202-15', 50, N'18054321', 157850.0000, 3157.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1112                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-19294-15', 50, N'18054321', 338074500.0000, 6761490.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'957                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19302-15', 50, N'18054321', 162700.0000, 3254.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1231                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19326-15', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1076                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19565-16', 50, N'18054321', 342000.0000, 6840.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1258                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN-19793-16', 50, N'18054321', 45540000.0000, 910800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'822                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-19820-16', 50, N'18054321', 645000.0000, 12900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1115                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19914-16', 50, N'18054321', 355000.0000, 7100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1449                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19977-16', 50, N'18054321', 15956600.0000, 319132.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'913                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-19978-16', 50, N'18054321', 133850.0000, 2677.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1265                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20043-16', 50, N'18054321', 30502900.0000, 610058.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1030                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20093-16', 50, N'18054321', 85000.0000, 1700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1213                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-20385-17', 50, N'18054321', 472700.0000, 9454.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1215                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2024-06-01' AS Date), N'VN-20386-17', 50, N'18054321', 601700.0000, 12034.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1217                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20387-17', 50, N'18054321', 232350.0000, 4647.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'969                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20696-17', 50, N'18054321', 295000.0000, 5900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'956                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-20830-17', 50, N'18054321', 335000.0000, 6700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'923                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-20887-18', 50, N'18054321', 8400000.0000, 168000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1140                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20899-18', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1085                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20980-18', 50, N'18054321', 1077300.0000, 21546.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'965                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-20992-18', 50, N'18054321', 755000.0000, 15100.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1119                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-21117-18', 50, N'18054321', 750000.0000, 15000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1267                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-21122-18', 50, N'18054321', 400000.0000, 8000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1317                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-21238-18', 50, N'18054321', 784500.0000, 15690.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'947                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-21345-18', 50, N'18054321', 112500.0000, 2250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1142                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-21654-19', 50, N'18054321', 490000.0000, 9800.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'935                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-21764-19', 50, N'18054321', 2750000.0000, 55000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'953                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-21983-19', 50, N'18054321', 135000.0000, 2700.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1264                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN2-206-13', 50, N'18054321', 61005750.0000, 1220115.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1266                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN2-207-13', 50, N'18054321', 30502850.0000, 610057.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'815                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN2-52-13', 50, N'18054321', 28650000.0000, 573000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'936                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN2-53-13', 50, N'18054321', 27375000.0000, 547500.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'931                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2025-05-27' AS Date), N'VN2-643-17', 50, N'18054321', 550000.0000, 11000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'820                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN3-16-18', 50, N'18054321', 6750000.0000, 135000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1117                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5104-10', 50, N'18054321', 695000.0000, 13900.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1060                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5195-10', 50, N'18054321', 14750000.0000, 295000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1204                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-5197-10', 50, N'18054321', 47380000.0000, 947600.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1205                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-5220-10', 50, N'18054321', 21900000.0000, 438000.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1274                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5228-10', 50, N'18054321', 54550.0000, 1091.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1138                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5437-10', 50, N'18054321', 157850.0000, 3157.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1440                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2022-06-12' AS Date), N'VN-5440-10', 50, N'18054321', 957350.0000, 19147.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1418                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5534-10', 50, N'18054321', 35800.0000, 716.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'958                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5566-10', 50, N'18054321', 162700.0000, 3254.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'802                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-5621-10', 50, N'18054321', 4425750.0000, 88515.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'954                                               ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-9858-10', 50, N'18054321', 112500.0000, 2250.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, N'1028                                              ', CAST(N'2020-06-22' AS Date), CAST(N'2023-06-07' AS Date), N'VN-9905-10', 50, N'18054321', 38050.0000, 761.0000)
INSERT [dbo].[LoThuoc] ([MaPhieuHuy], [MaLoThuoc], [NgaySanXuat], [NgayHetHan], [MaThuoc], [SoLuong], [MaPhieuNhap], [TongTien], [DonGiaNhap]) VALUES (NULL, NULL, CAST(N'2020-07-13' AS Date), CAST(N'2020-07-23' AS Date), N'VD-10054-10', 25, N'f50988e9-507b-493b-9bac-136cd807308d', 42500.0000, 1700.0000)
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (1, 801, N'2020-06-22', N'2024-06-01', N'VD-23889-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (2, 802, N'2020-06-22', N'2023-06-07', N'VN-5621-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (3, 803, N'2020-06-22', N'2022-06-12', N'VN-17674-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (4, 804, N'2020-06-22', N'2023-06-07', N'VD-24071-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (5, 805, N'2020-06-22', N'2025-05-27', N'VN-16752-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (6, 806, N'2020-06-22', N'2022-06-12', N'VN-17818-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (7, 807, N'2020-06-22', N'2025-05-27', N'VN-16753-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (8, 808, N'2020-06-22', N'2020-12-19', N'QLĐB1-H07-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (9, 809, N'2020-06-22', N'2025-05-27', N'VN-16754-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (10, 810, N'2020-06-22', N'2025-05-27', N'VN-16755-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (11, 811, N'2020-06-22', N'2023-06-07', N'VD-22915-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (12, 812, N'2020-06-22', N'2023-06-07', N'VD-26870-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (13, 813, N'2020-06-22', N'2022-06-12', N'VD-26140-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (14, 814, N'2020-06-22', N'2023-06-07', N'VD-16258-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (15, 815, N'2020-06-22', N'2022-06-12', N'VN2-52-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (16, 816, N'2020-06-22', N'2022-06-12', N'VN-18586-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (17, 817, N'2020-06-22', N'2025-05-27', N'VN-12442-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (18, 818, N'2020-06-22', N'2025-05-27', N'VN-14667-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (19, 819, N'2020-06-22', N'2022-06-12', N'VN-15332-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (20, 820, N'2020-06-22', N'2022-06-12', N'VN3-16-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (21, 821, N'2020-06-22', N'2022-06-12', N'VN-17422-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (22, 822, N'2020-06-22', N'2023-06-07', N'VN-19820-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (23, 823, N'2020-06-22', N'2022-06-12', N'VD-24125-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (24, 824, N'2020-06-22', N'2022-06-12', N'VD-24126-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (25, 825, N'2020-06-22', N'2023-06-07', N'VD-23567-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (26, 826, N'2020-06-22', N'2023-06-07', N'VD-24206-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (27, 827, N'2020-06-22', N'2022-06-12', N'VD-15693-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (28, 828, N'2020-06-22', N'2022-06-12', N'VD-31591-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (29, 829, N'2020-06-22', N'2022-06-12', N'VD-24127-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (30, 830, N'2020-06-22', N'2022-06-12', N'VD-24722-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (31, 831, N'2020-06-22', N'2022-06-12', N'VD-31592-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (32, 832, N'2020-06-22', N'2022-06-12', N'VD-25622-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (33, 833, N'2020-06-22', N'2022-06-12', N'VD-24723-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (34, 834, N'2020-06-22', N'2022-06-12', N'VD-25623-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (35, 835, N'2020-06-22', N'2022-06-12', N'VD-24724-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (36, 836, N'2020-06-22', N'2022-06-12', N'VD-24128-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (37, 837, N'2020-06-22', N'2022-06-12', N'VD-25624-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (38, 838, N'2020-06-22', N'2022-06-12', N'VD-27786-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (39, 839, N'2020-06-22', N'2022-06-12', N'VD-27787-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (40, 840, N'2020-06-22', N'2022-06-12', N'VD-25625-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (41, 841, N'2020-06-22', N'2022-06-12', N'VD-24129-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (42, 842, N'2020-06-22', N'2022-06-12', N'VD-26742-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (43, 843, N'2020-06-22', N'2022-06-12', N'VD-24130-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (44, 844, N'2020-06-22', N'2022-06-12', N'VD-24725-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (45, 845, N'2020-06-22', N'2022-06-12', N'VD-29682-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (46, 846, N'2020-06-22', N'2022-06-12', N'VD-28849-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (47, 847, N'2020-06-22', N'2022-06-12', N'VD-26104-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (48, 848, N'2020-06-22', N'2022-06-12', N'VD-24726-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (49, 849, N'2020-06-22', N'2022-06-12', N'QLĐB-531-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (50, 850, N'2020-06-22', N'2022-06-12', N'QLĐB-532-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (51, 851, N'2020-06-22', N'2022-06-12', N'VD-25626-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (52, 852, N'2020-06-22', N'2022-06-12', N'QLĐB-610-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (53, 853, N'2020-06-22', N'2022-06-12', N'VD-24131-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (54, 854, N'2020-06-22', N'2022-06-12', N'VD-25627-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (55, 855, N'2020-06-22', N'2022-06-12', N'VD-29683-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (56, 856, N'2020-06-22', N'2022-06-12', N'VD-26743-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (57, 857, N'2020-06-22', N'2022-06-12', N'QLĐB-569-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (58, 858, N'2020-06-22', N'2022-06-12', N'QLĐB-570-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (59, 859, N'2020-06-22', N'2022-06-12', N'VD-26744-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (60, 860, N'2020-06-22', N'2022-06-12', N'VD-27788-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (61, 861, N'2020-06-22', N'2022-06-12', N'VD-24727-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (62, 862, N'2020-06-22', N'2022-06-12', N'VD-27789-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (63, 863, N'2020-06-22', N'2022-06-12', N'QLĐB-579-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (64, 864, N'2020-06-22', N'2022-06-12', N'VD-24728-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (65, 865, N'2020-06-22', N'2022-06-12', N'VD-29684-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (66, 866, N'2020-06-22', N'2022-06-12', N'VD-25628-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (67, 867, N'2020-06-22', N'2022-06-12', N'VD-25629-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (68, 868, N'2020-06-22', N'2022-06-12', N'VD-27790-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (69, 869, N'2020-06-22', N'2022-06-12', N'VD-24729-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (70, 870, N'2020-06-22', N'2022-06-12', N'VD-27791-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (71, 871, N'2020-06-22', N'2022-06-12', N'VD-25630-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (72, 872, N'2020-06-22', N'2022-06-12', N'VD-24730-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (73, 873, N'2020-06-22', N'2022-06-12', N'VD-25631-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (74, 874, N'2020-06-22', N'2022-06-12', N'VD-26746-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (75, 875, N'2020-06-22', N'2022-06-12', N'VD-29686-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (76, 876, N'2020-06-22', N'2022-06-12', N'VD-29687-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (77, 877, N'2020-06-22', N'2022-06-12', N'VD-25632-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (78, 878, N'2020-06-22', N'2022-06-12', N'VD-26105-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (79, 879, N'2020-06-22', N'2022-06-12', N'VD-26106-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (80, 880, N'2020-06-22', N'2022-06-12', N'VD-31065-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (81, 881, N'2020-06-22', N'2022-06-12', N'VD-24132-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (82, 882, N'2020-06-22', N'2022-06-12', N'VD-25633-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (83, 883, N'2020-06-22', N'2022-06-12', N'VD-24731-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (84, 884, N'2020-06-22', N'2022-06-12', N'QLĐB-661-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (85, 885, N'2020-06-22', N'2022-06-12', N'VD-24732-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (86, 886, N'2020-06-22', N'2022-06-12', N'VD-26747-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (87, 887, N'2020-06-22', N'2022-06-12', N'VD-24133-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (88, 888, N'2020-06-22', N'2022-06-12', N'VD-29688-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (89, 889, N'2020-06-22', N'2022-06-12', N'VD-25634-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (90, 890, N'2020-06-22', N'2022-06-12', N'VD-25635-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (91, 891, N'2020-06-22', N'2022-06-12', N'VD-31593-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (92, 892, N'2020-06-22', N'2022-06-12', N'VD-32501-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (93, 893, N'2020-06-22', N'2022-06-12', N'VD-26107-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (94, 894, N'2020-06-22', N'2023-06-07', N'VD-31594-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (95, 895, N'2020-06-22', N'2023-06-07', N'VD-31595-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (96, 896, N'2020-06-22', N'2022-06-12', N'VD-25636-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (97, 897, N'2020-06-22', N'2022-06-12', N'VD-30295-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (98, 898, N'2020-06-22', N'2022-06-12', N'VD-25637-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (99, 899, N'2020-06-22', N'2022-06-12', N'VD-25638-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (100, 900, N'2020-06-22', N'2022-06-12', N'VD-29685-18')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (101, 901, N'2020-06-22', N'2022-06-12', N'VD-26745-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (102, 902, N'2020-06-22', N'2023-06-07', N'VD-3467-07')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (103, 903, N'2020-06-22', N'2023-06-07', N'VN-15842-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (104, 904, N'2020-06-22', N'2023-06-07', N'VN-15868-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (105, 905, N'2020-06-22', N'2023-06-07', N'VN-15010-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (106, 906, N'2020-06-22', N'2024-06-01', N'VD-21854-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (107, 907, N'2020-06-22', N'2024-06-01', N'VD-21855-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (108, 908, N'2020-06-22', N'2024-06-01', N'VD-22162-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (109, 909, N'2020-06-22', N'2024-06-01', N'VD-20748-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (110, 910, N'2020-06-22', N'2024-06-01', N'VD-20749-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (111, 911, N'2020-06-22', N'2022-06-12', N'VD-16478-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (112, 912, N'2020-06-22', N'2022-06-12', N'VD-13824-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (113, 913, N'2020-06-22', N'2022-06-12', N'VN-19978-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (114, 914, N'2020-06-22', N'2024-06-01', N'VN-11089-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (115, 915, N'2020-06-22', N'2022-06-12', N'VD-25107-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (116, 916, N'2020-06-22', N'2022-06-12', N'VD-25594-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (117, 917, N'2020-06-22', N'2022-06-12', N'VD-15499-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (118, 918, N'2020-06-22', N'2022-12-09', N'VD-23657-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (119, 919, N'2020-06-22', N'2022-06-12', N'VD-13019-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (120, 920, N'2020-06-22', N'2022-06-12', N'VD-10977-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (121, 921, N'2020-06-22', N'2023-06-07', N'VD-20653-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (122, 922, N'2020-06-22', N'2023-06-07', N'VD-26474-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (123, 923, N'2020-06-22', N'2022-06-12', N'VN-20887-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (124, 924, N'2020-06-22', N'2022-06-12', N'VN-10135-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (125, 925, N'2020-06-22', N'2022-06-12', N'VD-26141-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (126, 926, N'2020-06-22', N'2023-06-07', N'VD-32057-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (127, 927, N'2020-06-22', N'2022-06-12', N'VD-27800-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (128, 928, N'2020-06-22', N'2023-06-07', N'VD-27208-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (129, 929, N'2020-06-22', N'2023-06-07', N'VD-32203-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (130, 930, N'2020-06-22', N'2022-06-12', N'VN-18861-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (131, 931, N'2020-06-22', N'2025-05-27', N'VN2-643-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (132, 932, N'2020-06-22', N'2023-06-07', N'VD-17384-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (133, 933, N'2020-06-22', N'2023-06-07', N'VD-30650-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (134, 934, N'2020-06-22', N'2023-06-07', N'VN-15663-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (135, 935, N'2020-06-22', N'2023-06-07', N'VN-21764-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (136, 936, N'2020-06-22', N'2022-06-12', N'VN2-53-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (137, 937, N'2020-06-22', N'2022-06-12', N'VD3-19-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (138, 938, N'2020-06-22', N'2023-06-07', N'VN-16899-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (139, 939, N'2020-06-22', N'2022-06-12', N'NC49-H12-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (140, 940, N'2020-06-22', N'2022-06-12', N'V53-H12-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (141, 941, N'2020-06-22', N'2023-06-07', N'VD-25057-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (142, 942, N'2020-06-22', N'2024-06-01', N'VN-15416-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (143, 943, N'2020-06-22', N'2023-06-07', N'VD-30009-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (144, 944, N'2020-06-22', N'2023-06-07', N'VD-32254-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (145, 945, N'2020-06-22', N'2023-06-07', N'VD-28367-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (146, 946, N'2020-06-22', N'2024-06-01', N'VN-12744-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (147, 947, N'2020-06-22', N'2022-06-12', N'VN-21345-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (148, 948, N'2020-06-22', N'2023-06-07', N'VD-30296-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (149, 949, N'2020-06-22', N'2023-06-07', N'VD-30297-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (150, 950, N'2020-06-22', N'2023-06-07', N'VD-30298-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (151, 951, N'2020-06-22', N'2023-06-07', N'VD-30299-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (152, 952, N'2020-06-22', N'2023-06-07', N'VD-14507-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (153, 953, N'2020-06-22', N'2022-06-12', N'VN-21983-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (154, 954, N'2020-06-22', N'2023-06-07', N'VN-9858-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (155, 955, N'2020-06-22', N'2023-06-07', N'VD-24153-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (156, 956, N'2020-06-22', N'2022-06-12', N'VN-20830-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (157, 957, N'2020-06-22', N'2022-06-12', N'VN-19302-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (158, 958, N'2020-06-22', N'2023-06-07', N'VN-5566-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (159, 959, N'2020-06-22', N'2023-06-07', N'VD-22211-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (160, 960, N'2020-06-22', N'2023-06-07', N'VD-17887-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (161, 961, N'2020-06-22', N'2023-06-07', N'VD-18248-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (162, 962, N'2020-06-22', N'2023-06-07', N'VD-17385-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (163, 963, N'2020-06-22', N'2023-06-07', N'VD-13330-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (164, 964, N'2020-06-22', N'2023-06-07', N'VD-15204-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (165, 965, N'2020-06-22', N'2023-06-07', N'VN-20992-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (166, 966, N'2020-06-22', N'2023-06-07', N'VD-27911-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (167, 967, N'2020-06-22', N'2022-06-12', N'VD-14511-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (168, 968, N'2020-06-22', N'2023-06-07', N'VD-20124-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (169, 969, N'2020-06-22', N'2023-06-07', N'VN-20696-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (170, 970, N'2020-06-22', N'2023-06-07', N'VD-25277-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (171, 971, N'2020-06-22', N'2022-06-12', N'VD-13301-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (172, 972, N'2020-06-22', N'2022-06-12', N'VD-23483-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (173, 973, N'2020-06-22', N'2022-06-12', N'VD-25112-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (174, 974, N'2020-06-22', N'2022-06-12', N'VD-14108-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (175, 975, N'2020-06-22', N'2023-06-07', N'VD-30195-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (176, 976, N'2020-06-22', N'2023-06-07', N'VD-25673-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (177, 977, N'2020-06-22', N'2022-06-12', N'VD-23528-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (178, 978, N'2020-06-22', N'2023-06-07', N'VD-26134-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (179, 979, N'2020-06-22', N'2021-12-14', N'VD-26135-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (180, 980, N'2020-06-22', N'2023-06-07', N'VN-15700-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (181, 981, N'2020-06-22', N'2022-12-09', N'VD-17472-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (182, 982, N'2020-06-22', N'2022-06-12', N'VD-24204-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (183, 983, N'2020-06-22', N'2022-06-12', N'VD-15582-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (184, 984, N'2020-06-22', N'2022-06-12', N'VD-28535-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (185, 985, N'2020-06-22', N'2022-06-12', N'VD-15583-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (186, 986, N'2020-06-22', N'2023-06-07', N'VD-19179-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (187, 987, N'2020-06-22', N'2022-06-12', N'VD-30095-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (188, 988, N'2020-06-22', N'2023-06-07', N'VN-11171-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (189, 989, N'2020-06-22', N'2023-06-07', N'VN-16828-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (190, 990, N'2020-06-22', N'2022-06-12', N'VD-10762-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (191, 991, N'2020-06-22', N'2022-06-12', N'VD-27875-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (192, 992, N'2020-06-22', N'2023-12-04', N'VD-16812-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (193, 993, N'2020-06-22', N'2023-06-07', N'VD-27730-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (194, 994, N'2020-06-22', N'2023-12-04', N'VD-20645-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (195, 995, N'2020-06-22', N'2023-12-04', N'VD-20646-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (196, 996, N'2020-06-22', N'2023-06-07', N'VD-16814-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (197, 997, N'2020-06-22', N'2023-06-07', N'VD-24693-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (198, 998, N'2020-06-22', N'2023-06-07', N'VD-28809-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (199, 999, N'2020-06-22', N'2023-06-07', N'GC-274-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (200, 1000, N'2020-06-22', N'2023-06-07', N'VD-17405-12')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (201, 1001, N'2020-06-22', N'2022-06-12', N'VD-10858-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (202, 1002, N'2020-06-22', N'2022-06-12', N'VD-10859-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (203, 1003, N'2020-06-22', N'2022-06-12', N'VD-10860-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (204, 1004, N'2020-06-22', N'2023-06-07', N'VD-25997-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (205, 1005, N'2020-06-22', N'2023-06-07', N'VD-26588-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (206, 1006, N'2020-06-22', N'2023-06-07', N'VD-29515-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (207, 1007, N'2020-06-22', N'2023-06-07', N'VD-22293-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (208, 1008, N'2020-06-22', N'2023-06-07', N'VD-22294-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (209, 1009, N'2020-06-22', N'2023-06-07', N'VD-20679-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (210, 1010, N'2020-06-22', N'2023-06-07', N'VD-20680-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (211, 1011, N'2020-06-22', N'2023-06-07', N'VD-22822-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (212, 1012, N'2020-06-22', N'2023-06-07', N'VD-22122-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (213, 1013, N'2020-06-22', N'2023-06-07', N'VD-20681-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (214, 1014, N'2020-06-22', N'2023-06-07', N'VD-13744-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (215, 1015, N'2020-06-22', N'2022-06-12', N'VD-22437-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (216, 1016, N'2020-06-22', N'2023-06-07', N'VD-27742-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (217, 1017, N'2020-06-22', N'2022-06-12', N'VD-12764-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (218, 1018, N'2020-06-22', N'2023-06-07', N'VD-26090-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (219, 1019, N'2020-06-22', N'2023-06-07', N'VD-14663-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (220, 1020, N'2020-06-22', N'2023-06-07', N'VD-28816-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (221, 1021, N'2020-06-22', N'2023-06-07', N'VD-17011-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (222, 1022, N'2020-06-22', N'2024-06-01', N'VD-10281-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (223, 1023, N'2020-06-22', N'2023-06-07', N'VD-11640-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (224, 1024, N'2020-06-22', N'2023-06-07', N'VD-15871-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (225, 1025, N'2020-06-22', N'2025-05-27', N'VD-24018-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (226, 1026, N'2020-06-22', N'2023-06-07', N'VD-13361-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (227, 1027, N'2020-06-22', N'2023-06-07', N'VD-27844-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (228, 1028, N'2020-06-22', N'2023-06-07', N'VN-9905-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (229, 1029, N'2020-06-22', N'2022-06-12', N'VD-20936-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (230, 1030, N'2020-06-22', N'2023-06-07', N'VN-20093-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (231, 1031, N'2020-06-22', N'2022-06-12', N'VD-32111-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (232, 1032, N'2020-06-22', N'2023-06-07', N'VD-20043-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (233, 1033, N'2020-06-22', N'2023-06-07', N'VD-3518-07')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (234, 1034, N'2020-06-22', N'2022-06-12', N'VD-17430-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (235, 1035, N'2020-06-22', N'2023-06-07', N'VD-23472-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (236, 1036, N'2020-06-22', N'2022-06-12', N'VD-14163-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (237, 1037, N'2020-06-22', N'2023-06-07', N'VD-16381-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (238, 1038, N'2020-06-22', N'2023-06-07', N'VD-16815-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (239, 1039, N'2020-06-22', N'2022-12-09', N'VD-17864-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (240, 1040, N'2020-06-22', N'2023-06-07', N'VD-21827-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (241, 1041, N'2020-06-22', N'2023-06-07', N'VD-27595-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (242, 1042, N'2020-06-22', N'2023-06-07', N'VD-30156-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (243, 1043, N'2020-06-22', N'2022-06-12', N'VD-30628-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (244, 1044, N'2020-06-22', N'2022-06-12', N'VD-18919-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (245, 1045, N'2020-06-22', N'2022-06-12', N'VD-26163-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (246, 1046, N'2020-06-22', N'2022-06-12', N'VD-23568-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (247, 1047, N'2020-06-22', N'2023-06-07', N'VD-29875-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (248, 1048, N'2020-06-22', N'2023-06-07', N'VD-13874-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (249, 1049, N'2020-06-22', N'2023-06-07', N'VD-14765-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (250, 1050, N'2020-06-22', N'2023-06-07', N'VD-16282-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (251, 1051, N'2020-06-22', N'2023-06-07', N'VD-19483-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (252, 1052, N'2020-06-22', N'2023-06-07', N'VD-21910-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (253, 1053, N'2020-06-22', N'2023-06-07', N'VD-31912-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (254, 1054, N'2020-06-22', N'2022-06-12', N'VD-14257-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (255, 1055, N'2020-06-22', N'2023-06-07', N'VD-26762-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (256, 1056, N'2020-06-22', N'2022-06-12', N'VD-13770-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (257, 1057, N'2020-06-22', N'2023-06-07', N'VD-26763-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (258, 1058, N'2020-06-22', N'2022-06-12', N'VD-22667-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (259, 1059, N'2020-06-22', N'2022-06-12', N'VD-17908-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (260, 1060, N'2020-06-22', N'2023-06-07', N'VN-5195-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (261, 1061, N'2020-06-22', N'2023-06-07', N'VD-26619-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (262, 1062, N'2020-06-22', N'2023-06-07', N'VD-14244-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (263, 1063, N'2020-06-22', N'2023-06-07', N'VN-12142-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (264, 1064, N'2020-06-22', N'2023-06-07', N'VD-14045-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (265, 1065, N'2020-06-22', N'2023-06-07', N'VD-19639-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (266, 1066, N'2020-06-22', N'2023-06-07', N'VD-20188-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (267, 1067, N'2020-06-22', N'2023-06-07', N'VD-20321-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (268, 1068, N'2020-06-22', N'2023-06-07', N'VD-28139-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (269, 1069, N'2020-06-22', N'2023-06-07', N'VD-11489-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (270, 1070, N'2020-06-22', N'2023-06-07', N'VD-16803-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (271, 1071, N'2020-06-22', N'2023-06-07', N'VD-22934-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (272, 1072, N'2020-06-22', N'2023-06-07', N'VD-17856-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (273, 1073, N'2020-06-22', N'2023-06-07', N'VD-24375-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (274, 1074, N'2020-06-22', N'2023-06-07', N'VD-18434-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (275, 1075, N'2020-06-22', N'2023-06-07', N'VD-11490-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (276, 1076, N'2020-06-22', N'2022-06-12', N'VN-19565-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (277, 1077, N'2020-06-22', N'2023-06-07', N'VD-16333-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (278, 1078, N'2020-06-22', N'2022-06-12', N'VD-16647-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (279, 1079, N'2020-06-22', N'2023-06-07', N'VD-16082-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (280, 1080, N'2020-06-22', N'2023-06-07', N'VD-23266-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (281, 1081, N'2020-06-22', N'2024-06-01', N'VN-16414-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (282, 1082, N'2020-06-22', N'2022-06-12', N'VD-16826-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (283, 1083, N'2020-06-22', N'2022-06-12', N'VD-19107-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (284, 1084, N'2020-06-22', N'2023-06-07', N'VD-26894-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (285, 1085, N'2020-06-22', N'2023-06-07', N'VN-20980-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (286, 1086, N'2020-06-22', N'2022-06-12', N'VN-16660-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (287, 1087, N'2020-06-22', N'2023-06-07', N'VD-21216-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (288, 1088, N'2020-06-22', N'2023-06-07', N'VD-21217-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (289, 1089, N'2020-06-22', N'2023-06-07', N'VD-21620-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (290, 1090, N'2020-06-22', N'2023-06-07', N'VD-21220-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (291, 1091, N'2020-06-22', N'2022-06-12', N'VN-13788-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (292, 1092, N'2020-06-22', N'2022-06-12', N'VN-17208-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (293, 1093, N'2020-06-22', N'2022-06-12', N'VN-17209-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (294, 1094, N'2020-06-22', N'2022-06-12', N'VD-11800-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (296, 1096, N'2020-06-22', N'2023-06-07', N'VN-17188-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (297, 1097, N'2020-06-22', N'2023-06-07', N'VN-17848-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (298, 1098, N'2020-06-22', N'2022-06-12', N'VN-13669-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (299, 1099, N'2020-06-22', N'2022-06-12', N'VN-13670-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (300, 1100, N'2020-06-22', N'2022-06-12', N'VD-17254-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (301, 1101, N'2020-06-22', N'2023-06-07', N'VD-27299-17')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (302, 1102, N'2020-06-22', N'2023-06-07', N'VN-13443-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (303, 1103, N'2020-06-22', N'2023-06-07', N'VN-11339-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (304, 1104, N'2020-06-22', N'2023-06-07', N'VN-10592-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (305, 1105, N'2020-06-22', N'2023-06-07', N'VN-17793-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (306, 1106, N'2020-06-22', N'2023-06-07', N'VN-18579-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (307, 1107, N'2020-06-22', N'2023-06-07', N'VN-15368-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (308, 1108, N'2020-06-22', N'2022-06-12', N'VN-11671-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (309, 1109, N'2020-06-22', N'2023-06-07', N'VD-14512-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (310, 1110, N'2020-06-22', N'2023-06-07', N'VD-16656-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (311, 1111, N'2020-06-22', N'2023-06-07', N'VD-18820-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (312, 1112, N'2020-06-22', N'2023-06-07', N'VN-19294-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (313, 1113, N'2020-06-22', N'2022-06-12', N'VN-16010-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (314, 1114, N'2020-06-22', N'2023-06-07', N'VD-18521-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (315, 1115, N'2020-06-22', N'2022-06-12', N'VN-19914-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (316, 1116, N'2020-06-22', N'2023-06-07', N'VN-14025-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (317, 1117, N'2020-06-22', N'2023-06-07', N'VN-5104-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (318, 1118, N'2020-06-22', N'2023-06-07', N'VN-10980-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (319, 1119, N'2020-06-22', N'2023-06-07', N'VN-21117-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (320, 1120, N'2020-06-22', N'2023-06-07', N'VN-16733-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (321, 1121, N'2020-06-22', N'2023-06-07', N'VD-14378-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (322, 1122, N'2020-06-22', N'2023-06-07', N'VD-18475-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (323, 1123, N'2020-06-22', N'2023-06-07', N'VD-19571-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (324, 1124, N'2020-06-22', N'2023-06-07', N'VD-21788-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (325, 1125, N'2020-06-22', N'2023-06-07', N'VD-12081-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (326, 1126, N'2020-06-22', N'2023-06-07', N'VD-28098-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (327, 1127, N'2020-06-22', N'2022-06-12', N'VN-18371-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (328, 1128, N'2020-06-22', N'2022-06-12', N'VD-16313-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (329, 1129, N'2020-06-22', N'2023-06-07', N'VD-21331-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (330, 1130, N'2020-06-22', N'2023-06-07', N'VN-17310-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (331, 1131, N'2020-06-22', N'2023-06-07', N'VD-15052-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (332, 1132, N'2020-06-22', N'2023-06-07', N'VD-28899-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (333, 1133, N'2020-06-22', N'2023-06-07', N'VD-21884-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (334, 1134, N'2020-06-22', N'2023-06-07', N'VD-19584-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (335, 1135, N'2020-06-22', N'2023-06-07', N'VD-21960-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (336, 1136, N'2020-06-22', N'2023-06-07', N'VD-19585-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (337, 1137, N'2020-06-22', N'2023-06-07', N'VN-19202-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (338, 1138, N'2020-06-22', N'2023-06-07', N'VN-5437-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (339, 1139, N'2020-06-22', N'2022-06-12', N'VN-16554-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (340, 1140, N'2020-06-22', N'2023-06-07', N'VN-20899-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (341, 1141, N'2020-06-22', N'2022-06-12', N'VN-16555-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (342, 1142, N'2020-06-22', N'2022-06-12', N'VN-21654-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (343, 1143, N'2020-06-22', N'2022-12-09', N'VN-16257-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (344, 1144, N'2020-06-22', N'2022-06-12', N'VN-18587-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (345, 1145, N'2020-06-22', N'2025-05-27', N'VN-11032-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (346, 1146, N'2020-06-22', N'2023-06-07', N'VD-21244-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (347, 1147, N'2020-06-22', N'2023-06-07', N'VD-21245-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (348, 1148, N'2020-06-22', N'2023-06-07', N'VD-12966-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (349, 1149, N'2020-06-22', N'2022-06-12', N'VD-10638-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (350, 1150, N'2020-06-22', N'2023-06-07', N'VN-11467-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (351, 1151, N'2020-06-22', N'2022-06-12', N'VD-14628-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (352, 1152, N'2020-06-22', N'2023-06-07', N'VD-24522-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (353, 1153, N'2020-06-22', N'2023-06-07', N'VD-27354-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (354, 1154, N'2020-06-22', N'2023-06-07', N'VD-21418-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (355, 1155, N'2020-06-22', N'2022-06-12', N'VD-12373-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (356, 1156, N'2020-06-22', N'2023-06-07', N'VD-28159-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (357, 1157, N'2020-06-22', N'2022-06-12', N'V70-H12-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (358, 1158, N'2020-06-22', N'2023-06-07', N'VN-18588-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (359, 1159, N'2020-06-22', N'2023-06-07', N'VD-20277-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (360, 1160, N'2020-06-22', N'2022-06-12', N'VD-15352-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (361, 1161, N'2020-06-22', N'2022-06-12', N'VD-20430-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (362, 1162, N'2020-06-22', N'2022-06-12', N'VN-10368-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (363, 1163, N'2020-06-22', N'2023-06-07', N'VD-24819-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (364, 1164, N'2020-06-22', N'2022-06-12', N'VN-18806-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (365, 1165, N'2020-06-22', N'2023-06-07', N'VN-18589-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (366, 1166, N'2020-06-22', N'2023-06-07', N'VN-10076-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (367, 1167, N'2020-06-22', N'2023-06-07', N'VN-19029-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (368, 1168, N'2020-06-22', N'2022-06-12', N'VN-15194-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (369, 1169, N'2020-06-22', N'2023-06-07', N'VD-29711-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (370, 1170, N'2020-06-22', N'2023-06-07', N'VD-11768-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (371, 1171, N'2020-06-22', N'2023-06-07', N'VD-13018-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (372, 1172, N'2020-06-22', N'2022-06-12', N'VD-24489-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (373, 1173, N'2020-06-22', N'2023-06-07', N'VD-24956-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (374, 1174, N'2020-06-22', N'2023-06-07', N'VN-13200-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (375, 1175, N'2020-06-22', N'2024-06-01', N'VD-21460-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (376, 1176, N'2020-06-22', N'2023-06-07', N'VD-16621-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (377, 1177, N'2020-06-22', N'2023-06-07', N'VD-26787-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (378, 1178, N'2020-06-22', N'2023-06-07', N'VD-17787-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (379, 1179, N'2020-06-22', N'2023-06-07', N'VD-16816-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (380, 1180, N'2020-06-22', N'2023-06-07', N'VD-30479-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (381, 1181, N'2020-06-22', N'2023-06-07', N'VD-27017-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (382, 1182, N'2020-06-22', N'2023-06-07', N'VD-31257-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (383, 1183, N'2020-06-22', N'2023-06-07', N'VD-29085-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (384, 1184, N'2020-06-22', N'2022-06-12', N'VD-14632-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (385, 1185, N'2020-06-22', N'2023-06-07', N'VD-27018-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (386, 1186, N'2020-06-22', N'2023-06-07', N'VD-32039-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (387, 1187, N'2020-06-22', N'2023-06-07', N'VD-26788-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (388, 1188, N'2020-06-22', N'2023-06-07', N'VD-11476-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (389, 1189, N'2020-06-22', N'2023-06-07', N'VD-10107-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (390, 1190, N'2020-06-22', N'2023-06-07', N'VD-26113-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (391, 1191, N'2020-06-22', N'2023-06-07', N'VD-19769-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (392, 1192, N'2020-06-22', N'2023-06-07', N'VN-14811-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (393, 1193, N'2020-06-22', N'2023-06-07', N'VD-24572-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (394, 1194, N'2020-06-22', N'2023-06-07', N'VD-26553-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (395, 1195, N'2020-06-22', N'2023-06-07', N'VD-27536-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (396, 1196, N'2020-06-22', N'2023-06-07', N'VD-10719-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (397, 1197, N'2020-06-22', N'2023-06-07', N'VD-21528-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (398, 1198, N'2020-06-22', N'2023-06-07', N'VD-23346-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (399, 1199, N'2020-06-22', N'2023-06-07', N'VD-29496-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (400, 1200, N'2020-06-22', N'2023-06-07', N'VD-10720-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (401, 1201, N'2020-06-22', N'2022-06-12', N'VD-11932-10')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (402, 1202, N'2020-06-22', N'2022-06-12', N'VD-25031-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (403, 1203, N'2020-06-22', N'2023-06-07', N'VD-16005-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (404, 1204, N'2020-06-22', N'2022-06-12', N'VN-5197-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (405, 1205, N'2020-06-22', N'2022-06-12', N'VN-5220-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (406, 1206, N'2020-06-22', N'2023-06-07', N'VD-20511-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (407, 1207, N'2020-06-22', N'2023-06-07', N'VD-21122-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (408, 1208, N'2020-06-22', N'2023-06-07', N'VD-17818-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (409, 1209, N'2020-06-22', N'2023-06-07', N'VD-18667-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (410, 1210, N'2020-06-22', N'2023-06-07', N'VN-14010-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (411, 1211, N'2020-06-22', N'2023-06-07', N'VN-15727-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (412, 1212, N'2020-06-22', N'2024-06-01', N'VN-10754-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (413, 1213, N'2020-06-22', N'2024-06-01', N'VN-20385-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (414, 1214, N'2020-06-22', N'2024-06-01', N'VN-10755-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (415, 1215, N'2020-06-22', N'2024-06-01', N'VN-20386-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (416, 1216, N'2020-06-22', N'2023-06-07', N'VN-10756-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (417, 1217, N'2020-06-22', N'2023-06-07', N'VN-20387-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (418, 1218, N'2020-06-22', N'2023-06-07', N'VD-28582-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (419, 1219, N'2020-06-22', N'2023-06-07', N'VN-15543-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (420, 1220, N'2020-06-22', N'2023-06-07', N'VD-22783-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (421, 1221, N'2020-06-22', N'2023-06-07', N'QLĐB-366-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (422, 1222, N'2020-06-22', N'2022-06-12', N'QLĐB-571-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (423, 1223, N'2020-06-22', N'2022-06-12', N'VD-12596-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (424, 1224, N'2020-06-22', N'2022-06-12', N'VD-25027-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (425, 1225, N'2020-06-22', N'2023-06-07', N'VD-24495-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (426, 1226, N'2020-06-22', N'2023-06-07', N'VD-27207-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (427, 1227, N'2020-06-22', N'2022-06-12', N'VD-18767-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (428, 1228, N'2020-06-22', N'2023-06-07', N'VD-19015-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (429, 1229, N'2020-06-22', N'2023-06-07', N'VD-23739-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (430, 1230, N'2020-06-22', N'2023-06-07', N'VD-11464-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (431, 1231, N'2020-06-22', N'2022-06-12', N'VN-19326-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (432, 1232, N'2020-06-22', N'2022-06-12', N'VD-11340-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (433, 1233, N'2020-06-22', N'2021-12-14', N'VN-16807-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (434, 1234, N'2020-06-22', N'2022-06-12', N'VN-18590-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (435, 1235, N'2020-06-22', N'2022-12-09', N'VD-12988-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (436, 1236, N'2020-06-22', N'2022-06-12', N'VD-25351-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (437, 1237, N'2020-06-22', N'2022-12-09', N'VD-27151-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (438, 1238, N'2020-06-22', N'2022-12-09', N'VD-32031-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (439, 1239, N'2020-06-22', N'2023-06-07', N'VD-10359-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (440, 1240, N'2020-06-22', N'2023-06-07', N'VD-24262-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (441, 1241, N'2020-06-22', N'2022-06-12', N'VD-10428-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (442, 1242, N'2020-06-22', N'2022-06-12', N'VD-25284-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (443, 1243, N'2020-06-22', N'2022-06-12', N'VN-17713-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (444, 1244, N'2020-06-22', N'2023-06-07', N'VN-11839-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (445, 1245, N'2020-06-22', N'2023-06-07', N'VN-16290-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (446, 1246, N'2020-06-22', N'2023-06-07', N'VN-16498-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (447, 1247, N'2020-06-22', N'2022-06-12', N'VD-11599-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (448, 1248, N'2020-06-22', N'2023-06-07', N'VD-12282-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (449, 1249, N'2020-06-22', N'2022-06-12', N'VN-12717-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (450, 1250, N'2020-06-22', N'2022-06-12', N'VN-13904-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (451, 1251, N'2020-06-22', N'2022-06-12', N'VN-13905-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (452, 1252, N'2020-06-22', N'2022-06-12', N'VN-14268-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (453, 1253, N'2020-06-22', N'2022-06-12', N'VN-18026-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (454, 1254, N'2020-06-22', N'2022-06-12', N'VN-14903-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (455, 1255, N'2020-06-22', N'2022-06-12', N'VN-17240-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (456, 1256, N'2020-06-22', N'2022-06-12', N'VN-17241-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (457, 1257, N'2020-06-22', N'2025-05-27', N'VN-10747-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (458, 1258, N'2020-06-22', N'2025-05-27', N'VN-19793-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (459, 1259, N'2020-06-22', N'2023-06-07', N'VN-14033-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (460, 1260, N'2020-06-22', N'2023-06-07', N'VD-23473-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (461, 1261, N'2020-06-22', N'2023-06-07', N'VN-15421-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (462, 1262, N'2020-06-22', N'2022-06-12', N'VD-29479-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (463, 1263, N'2020-06-22', N'2023-06-07', N'VN-11200-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (464, 1264, N'2020-06-22', N'2023-06-07', N'VN2-206-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (465, 1265, N'2020-06-22', N'2023-06-07', N'VN-20043-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (466, 1266, N'2020-06-22', N'2023-06-07', N'VN2-207-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (467, 1267, N'2020-06-22', N'2023-06-07', N'VN-21122-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (468, 1268, N'2020-06-22', N'2022-06-12', N'VN-12449-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (469, 1269, N'2020-06-22', N'2022-06-12', N'VN-12450-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (470, 1270, N'2020-06-22', N'2023-06-07', N'VD-29344-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (471, 1271, N'2020-06-22', N'2023-06-07', N'VD-15034-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (472, 1272, N'2020-06-22', N'2023-06-07', N'VD-20502-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (473, 1273, N'2020-06-22', N'2022-06-12', N'VD-26093-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (474, 1274, N'2020-06-22', N'2023-06-07', N'VN-5228-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (475, 1275, N'2020-06-22', N'2023-06-07', N'VD-13302-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (476, 1276, N'2020-06-22', N'2022-06-12', N'V54-H12-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (477, 1277, N'2020-06-22', N'2022-06-12', N'NC46-H06-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (478, 1278, N'2020-06-22', N'2023-06-07', N'VD-11491-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (479, 1279, N'2020-06-22', N'2023-06-07', N'VD-12194-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (480, 1280, N'2020-06-22', N'2022-06-12', N'VD-10051-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (481, 1281, N'2020-06-22', N'2023-06-07', N'VD-18220-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (482, 1282, N'2020-06-22', N'2022-06-12', N'VD-23484-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (483, 1283, N'2020-06-22', N'2022-06-12', N'VD-23485-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (484, 1284, N'2020-06-22', N'2023-06-07', N'VD-26720-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (485, 1285, N'2020-06-22', N'2023-06-07', N'VD-14216-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (486, 1286, N'2020-06-22', N'2023-06-07', N'VD-29646-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (487, 1287, N'2020-06-22', N'2023-06-07', N'VD-30270-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (488, 1288, N'2020-06-22', N'2023-06-07', N'VD-29647-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (489, 1289, N'2020-06-22', N'2023-06-07', N'VD-10057-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (490, 1290, N'2020-06-22', N'2023-06-07', N'VD-14229-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (491, 1291, N'2020-06-22', N'2023-06-07', N'VD-27749-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (492, 1292, N'2020-06-22', N'2022-06-12', N'VD-19310-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (493, 1293, N'2020-06-22', N'2023-06-07', N'VD-22789-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (494, 1294, N'2020-06-22', N'2023-06-07', N'VD-25116-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (495, 1295, N'2020-06-22', N'2023-06-07', N'VD-14225-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (496, 1296, N'2020-06-22', N'2022-06-12', N'VD-24705-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (497, 1297, N'2020-06-22', N'2023-06-07', N'VD-14220-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (498, 1298, N'2020-06-22', N'2023-06-07', N'VD-10052-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (499, 1299, N'2020-06-22', N'2023-06-07', N'VD-25601-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (500, 1300, N'2020-06-22', N'2023-06-07', N'VD-30269-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (501, 1301, N'2020-06-22', N'2023-06-07', N'VD-10053-10')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (502, 1302, N'2020-06-22', N'2022-06-12', N'VD-25113-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (503, 1303, N'2020-06-22', N'2022-06-12', N'VD-25114-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (504, 1304, N'2020-06-22', N'2023-06-07', N'VD-14217-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (505, 1305, N'2020-06-22', N'2023-06-07', N'VD-28817-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (506, 1306, N'2020-06-22', N'2023-06-07', N'VD-11492-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (507, 1307, N'2020-06-22', N'2023-06-07', N'VD-13303-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (508, 1308, N'2020-06-22', N'2023-06-07', N'VD-26091-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (509, 1309, N'2020-06-22', N'2023-06-07', N'VD-25115-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (510, 1310, N'2020-06-22', N'2022-06-12', N'VD-10054-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (511, 1311, N'2020-06-22', N'2022-06-12', N'VD-24701-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (512, 1312, N'2020-06-22', N'2023-06-07', N'VD-25602-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (513, 1313, N'2020-06-22', N'2023-06-07', N'VD-11493-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (514, 1314, N'2020-06-22', N'2023-06-07', N'VD-25603-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (515, 1315, N'2020-06-22', N'2023-06-07', N'VD-18693-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (516, 1316, N'2020-06-22', N'2023-06-07', N'VD-27743-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (517, 1317, N'2020-06-22', N'2023-06-07', N'VN-21238-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (518, 1318, N'2020-06-22', N'2022-06-12', N'VD-14664-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (519, 1319, N'2020-06-22', N'2022-06-12', N'VD-28818-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (520, 1320, N'2020-06-22', N'2022-06-12', N'VD-25604-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (521, 1321, N'2020-06-22', N'2023-06-07', N'VD-12765-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (522, 1322, N'2020-06-22', N'2023-06-07', N'VD-26092-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (523, 1323, N'2020-06-22', N'2023-06-07', N'VD-15362-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (524, 1324, N'2020-06-22', N'2023-06-07', N'VD-31060-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (525, 1325, N'2020-06-22', N'2023-06-07', N'VD-30201-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (526, 1326, N'2020-06-22', N'2023-06-07', N'VD-14221-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (527, 1327, N'2020-06-22', N'2022-06-12', N'VD-14222-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (529, 1329, N'2020-06-22', N'2023-06-07', N'VD-29648-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (530, 1330, N'2020-06-22', N'2023-06-07', N'VD-13304-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (531, 1331, N'2020-06-22', N'2023-06-07', N'VD-13305-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (532, 1332, N'2020-06-22', N'2023-06-07', N'VD-29649-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (533, 1333, N'2020-06-22', N'2023-06-07', N'VD-14223-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (534, 1334, N'2020-06-22', N'2023-06-07', N'VD-22438-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (535, 1335, N'2020-06-22', N'2022-06-12', N'VD-18925-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (536, 1336, N'2020-06-22', N'2022-06-12', N'QLĐB-744-19')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (537, 1337, N'2020-06-22', N'2023-06-07', N'VD-14224-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (538, 1338, N'2020-06-22', N'2023-06-07', N'VD-27744-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (539, 1339, N'2020-06-22', N'2023-06-07', N'VD-13745-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (540, 1340, N'2020-06-22', N'2023-06-07', N'VD-29650-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (541, 1341, N'2020-06-22', N'2023-06-07', N'VD-13746-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (542, 1342, N'2020-06-22', N'2023-06-07', N'VD-28819-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (543, 1343, N'2020-06-22', N'2022-06-12', N'VD-10056-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (544, 1344, N'2020-06-22', N'2023-06-07', N'VD-29651-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (545, 1345, N'2020-06-22', N'2023-06-07', N'VD-11494-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (546, 1346, N'2020-06-22', N'2023-06-07', N'VD-25523-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (547, 1347, N'2020-06-22', N'2023-06-07', N'VD-12766-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (548, 1348, N'2020-06-22', N'2023-06-07', N'VD-28820-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (549, 1349, N'2020-06-22', N'2023-06-07', N'VD-27745-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (550, 1350, N'2020-06-22', N'2022-06-12', N'VD-19311-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (551, 1351, N'2020-06-22', N'2022-06-12', N'VD-17377-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (552, 1352, N'2020-06-22', N'2023-06-07', N'VD-29652-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (553, 1353, N'2020-06-22', N'2023-06-07', N'VD-29653-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (554, 1354, N'2020-06-22', N'2023-06-07', N'VD-10058-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (555, 1355, N'2020-06-22', N'2023-06-07', N'VD-24702-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (556, 1356, N'2020-06-22', N'2023-06-07', N'VD-10059-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (557, 1357, N'2020-06-22', N'2023-06-07', N'VD-29654-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (558, 1358, N'2020-06-22', N'2023-06-07', N'VD-31061-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (559, 1359, N'2020-06-22', N'2023-06-07', N'VD-30271-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (560, 1360, N'2020-06-22', N'2023-06-07', N'VD-25117-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (561, 1361, N'2020-06-22', N'2023-06-07', N'VD-28821-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (562, 1362, N'2020-06-22', N'2023-06-07', N'VD-11495-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (563, 1363, N'2020-06-22', N'2023-06-07', N'VD-24111-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (564, 1364, N'2020-06-22', N'2023-06-07', N'VD-10060-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (565, 1365, N'2020-06-22', N'2023-06-07', N'VD-13307-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (566, 1366, N'2020-06-22', N'2023-06-07', N'VD-29655-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (567, 1367, N'2020-06-22', N'2023-06-07', N'VD-13308-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (568, 1368, N'2020-06-22', N'2023-06-07', N'VD-28822-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (569, 1369, N'2020-06-22', N'2023-06-07', N'VD-25605-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (570, 1370, N'2020-06-22', N'2023-06-07', N'VD-11497-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (571, 1371, N'2020-06-22', N'2023-06-07', N'VD-14665-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (572, 1372, N'2020-06-22', N'2023-06-07', N'VD-30272-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (574, 1374, N'2020-06-22', N'2023-06-07', N'VD-26721-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (575, 1375, N'2020-06-22', N'2023-06-07', N'VD-29656-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (576, 1376, N'2020-06-22', N'2023-06-07', N'VD-25118-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (577, 1377, N'2020-06-22', N'2023-06-07', N'VD-22790-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (578, 1378, N'2020-06-22', N'2023-06-07', N'VD-22791-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (579, 1379, N'2020-06-22', N'2023-06-07', N'VD-26722-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (580, 1380, N'2020-06-22', N'2022-06-12', N'VD-22792-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (581, 1381, N'2020-06-22', N'2022-06-12', N'VD-10061-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (582, 1382, N'2020-06-22', N'2022-06-12', N'VD-17880-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (583, 1383, N'2020-06-22', N'2022-06-12', N'VD-24703-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (584, 1384, N'2020-06-22', N'2022-06-12', N'VD-15984-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (585, 1385, N'2020-06-22', N'2023-06-07', N'VD-13748-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (586, 1386, N'2020-06-22', N'2022-06-12', N'VD-13311-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (587, 1387, N'2020-06-22', N'2022-06-12', N'VD-27746-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (588, 1388, N'2020-06-22', N'2023-06-07', N'VD-30273-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (589, 1389, N'2020-06-22', N'2023-06-07', N'VD-30274-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (590, 1390, N'2020-06-22', N'2023-06-07', N'VD-13749-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (591, 1391, N'2020-06-22', N'2023-06-07', N'VD-29657-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (592, 1392, N'2020-06-22', N'2023-06-07', N'VD-23486-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (593, 1393, N'2020-06-22', N'2023-06-07', N'VD-13750-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (594, 1394, N'2020-06-22', N'2023-06-07', N'VD-10062-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (595, 1395, N'2020-06-22', N'2023-06-07', N'VD-25119-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (596, 1396, N'2020-06-22', N'2022-06-12', N'VD-17378-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (597, 1397, N'2020-06-22', N'2023-06-07', N'VD-27747-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (598, 1398, N'2020-06-22', N'2023-06-07', N'VD-11499-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (599, 1399, N'2020-06-22', N'2023-06-07', N'VD-24704-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (600, 1400, N'2020-06-22', N'2023-06-07', N'VD-13315-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (601, 1401, N'2020-06-22', N'2023-06-07', N'VD-25120-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (602, 1402, N'2020-06-22', N'2023-06-07', N'VD-13316-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (603, 1403, N'2020-06-22', N'2023-06-07', N'VD-25121-16')
GO
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (604, 1404, N'2020-06-22', N'2022-06-12', N'VD-13751-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (605, 1405, N'2020-06-22', N'2023-06-07', N'VD-15363-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (606, 1406, N'2020-06-22', N'2023-06-07', N'VD-29658-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (607, 1407, N'2020-06-22', N'2023-06-07', N'VD-14226-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (608, 1408, N'2020-06-22', N'2023-06-07', N'VD-27748-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (609, 1409, N'2020-06-22', N'2023-06-07', N'VD-14666-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (610, 1410, N'2020-06-22', N'2022-06-12', N'VD-11501-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (611, 1411, N'2020-06-22', N'2022-06-12', N'VD-25606-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (612, 1412, N'2020-06-22', N'2023-06-07', N'VD-12768-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (613, 1413, N'2020-06-22', N'2023-06-07', N'VD-28823-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (614, 1414, N'2020-06-22', N'2023-06-07', N'VD-13317-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (615, 1415, N'2020-06-22', N'2023-06-07', N'VD-25122-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (616, 1416, N'2020-06-22', N'2023-06-07', N'VD-25123-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (617, 1417, N'2020-06-22', N'2022-06-12', N'VD-23487-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (618, 1418, N'2020-06-22', N'2023-06-07', N'VN-5534-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (619, 1419, N'2020-06-22', N'2023-06-07', N'VD-10065-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (620, 1420, N'2020-06-22', N'2023-06-07', N'VD-25607-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (621, 1421, N'2020-06-22', N'2023-06-07', N'VD-10066-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (622, 1422, N'2020-06-22', N'2023-06-07', N'VD-24112-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (623, 1423, N'2020-06-22', N'2022-06-12', N'VD-28824-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (624, 1424, N'2020-06-22', N'2022-06-12', N'VD-19753-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (625, 1425, N'2020-06-22', N'2022-06-12', N'VD-19754-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (626, 1426, N'2020-06-22', N'2023-06-07', N'VD-13752-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (627, 1427, N'2020-06-22', N'2023-06-07', N'VD-31062-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (628, 1428, N'2020-06-22', N'2023-06-07', N'VD-13753-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (629, 1429, N'2020-06-22', N'2022-06-12', N'VD-22793-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (630, 1430, N'2020-06-22', N'2023-06-07', N'VD-25608-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (631, 1431, N'2020-06-22', N'2022-06-12', N'VD-12769-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (632, 1432, N'2020-06-22', N'2022-06-12', N'VD-25609-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (633, 1433, N'2020-06-22', N'2023-06-07', N'VD-10067-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (634, 1434, N'2020-06-22', N'2023-06-07', N'VD-21047-14')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (635, 1435, N'2020-06-22', N'2023-06-07', N'VD-30412-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (636, 1436, N'2020-06-22', N'2023-06-07', N'VD-27924-17')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (637, 1437, N'2020-06-22', N'2023-06-07', N'VD-14139-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (638, 1438, N'2020-06-22', N'2024-06-01', N'VD-28758-18')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (639, 1439, N'2020-06-22', N'2023-06-07', N'VD-19729-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (640, 1440, N'2020-06-22', N'2022-06-12', N'VN-5440-10')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (641, 1441, N'2020-06-22', N'2023-06-07', N'VN-15577-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (642, 1442, N'2020-06-22', N'2022-06-12', N'QLĐB-367-13')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (643, 1443, N'2020-06-22', N'2023-06-07', N'VD-16515-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (644, 1444, N'2020-06-22', N'2023-06-07', N'VD-16516-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (645, 1445, N'2020-06-22', N'2025-05-27', N'VN-15376-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (646, 1446, N'2020-06-22', N'2022-06-12', N'VN-19126-15')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (647, 1447, N'2020-06-22', N'2022-06-12', N'VN-14124-11')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (648, 1448, N'2020-06-22', N'2025-05-27', N'VN-14630-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (649, 1449, N'2020-06-22', N'2022-06-12', N'VN-19977-16')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (650, 1450, N'2020-06-22', N'2022-06-12', N'VN-15378-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (651, 1451, N'2020-06-22', N'2022-06-12', N'VN-15379-12')
INSERT [dbo].[loThuoc$] ([F1], [maNhaCungCap], [ngaySanXuatTemp], [ngayHetHanTemp], [maThuoc]) VALUES (652, 1452, N'2020-06-22', N'2022-06-12', N'VN-10479-10')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1000', N'Midas-Care Pharmaceuticals Pvt. Ltd.', N'B-16, MIDC, Waluj, Aurangabad 431 136 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1001', N'Midas-Care Pharmaceuticals Pvt. Ltd.', N'B-16, MIDC, Waluj, Aurangabad 431 136 Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1002', N'Mustafa Nevzat Ilac Sanayii A.S.', N'Sanayi Caddesi No. 13, Cobancesme- Yenibosna Istanbul Turkey')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1003', N'Mylan Laboratories Limited', N'F4 & F12, MIDC, Malegaon, Tal. Sinnar, Nashik 422113, Maharashtra state Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1004', N'Naprod Life Sciences Pvt. Ltd.', N'G-17/1, MIDC, Tarapur, Industrial Area, Boisar, Dist.Thane-401506 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1005', N'Naprod Life Sciences Pvt. Ltd.', N'G-17/1, MIDC, Tarapur, Industrial Area, Boisar, Dist.Thane-401506 Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1006', N'Nhà máy sản xuất dược phẩm An Thiên', N'C16, đường số 9, KCN Hiệp Phước, huyện Nhà Bè, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1007', N'Nhà đóng gói cấp 2 và xuất xưởng: Công ty cổ phần dược phẩm Trung ương 1 - Pharbaco', N'Thôn Thạch Lỗi, xã Thanh Xuân, huyện Sóc Sơn, TP. Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1008', N'Novartis Pharma Stein AG', N'Schaffhauserstrasse 4332 Stein Switzerland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1009', N'Novartis Pharma Stein AG', N'Schaffhauserstrasse, 4332 Stein Switzerland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1010', N'PT. Sunthi Sepuri', N'Jl. Raya Serang Km.17, Cikupa, Tangerang 15710 Indonesia')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1011', N'Pfizer Manufacturing Deutschland GmbH', N'Betriebsstatte Freiburg, Mooswaldallee 1, 79090 Freiburg Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1012', N'PharmEvo Private Limited', N'Plot # A-29, North Western Industrial zone, Port Qasim, Karachi - 75020 Pakistan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1013', N'Polipharm Co., Ltd.', N'109 Mu 12 Bangna Trat Road, Km 13 Bangplee Samutprakarn 10540 Thailand')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1014', N'Probiotec Pharma Pty., Ltd.', N'83 Cherry Lane Laverton North VIC 3026 Australia')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1015', N'Probiotec Pharma Pty., Ltd.', N'83 Cherry Lane Laverton North, VIC 3026 Australia')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1016', N'R.P.Scherer GmbH & Co.KG', N'Gammelsbacher Str.2, 69412 Eberbach/Baden Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1017', N'R.X. Manufacturing Co., Ltd.', N'76 Moo 10, Naraphirom, Banglane, Nakornphathom 73130 Thailand')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1018', N'R.X. Manufacturing Co., Ltd.', N'76 Moo 10, Salaya-Bangpasi Road, Naraphirom, Banglane, Nakornphathom 73130 Thailand')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1019', N'R.X. Manufacturing Co., Ltd.', N'76 Moo 10, Salaya-Bangpasi Road, Narapirom, Banglane, Nakornpathom 73130 Thailand')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1020', N'R.X. Manufacturing Co., Ltd.', N'76 Moo 10, Salaya-Bangpasi Road, Narapirom, Banglane, Nakornpathom 73130 Thái Lan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1021', N'Rafarm S.A.', N'Thesi Pousi-Xatzi Agiou Louka, Paiania Attiki 19002, P.O. Box 37 Hy Lạp')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1022', N'Rhydburg Pharmaceuticals Limited', N'C-2&3, S.I.E.L., Selaqui, Dehradun, Uttarakhand India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1023', N'Rhydburg Pharmaceuticals Limited', N'C-2&3, S.I.E.L., Selaqui, Dehradun, Uttarakhand Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1024', N'S.C. Antibiotice S.A.', N'1th Valea Lupului Street Zip code 707410, Iasi Romani')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1025', N'Santen Pharmaceutical Co., Ltd.', N'9-19, Shimoshinjo 3-chome, Higashiyodogawa-ku, 533 8651, Osaka Japan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1026', N'Schering-Plough Labo N.V.', N'Industriepark 30, 2220, Heist-op-den-Berg Bỉ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1027', N'Schering-Plough Labo N.V.', N'Industriepark 30, B-2220, Heist-op-den-Berg Belgium')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1028', N'Shijiazhuang No. 4 Pharmaceutical Co., Ltd.', N'No. 35 Huitong Rd., Shijiazhuang Hebei China')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1029', N'Shree Krishnakeshav Laboratories Limited', N'Amraiwadi Road, Ahmedabad, 380 008 Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1030', N'Sinil Pharm Co., Ltd.', N'San 5-1, Bonpyeong Ri, Angsung myun Chungju Si Chungchongbuk-Do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1031', N'Sphere Healthcare Pty., Ltd.', N'10-12 Church road Moorebank, NSW 2170 Australia')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1032', N'Stadapharm GmbH', N'StadastraBe, 2-18 D-61118 Bad Vilbel Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1033', N'Standard Chem. & Pharm. Co., Ltd.', N'No. 154, Kaiyuan Road, Sinying District, Tainan City 73055 Đài Loan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1034', N'Standard Chem. & Pharm. Co., Ltd.', N'No. 6- 20, Tu- Ku Li, Hsin- Ying, Tainan Taiwan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1035', N'Swiss Pharma PVT.LTD.', N'3709, Phase IV, GIDC Vatva, Ahmedabad 382-445 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1036', N'Synmedic Laboratories', N'106-107 HSIDC Industrial Estate, SEC 31 - Faridabad 121003, Hangana India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1037', N'Synmedic Laboratories', N'106-107, HSIDC Industrial Estate, Sec-31, Faridabad- 121 003 Haryana India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1038', N'Synmedic Laboratories', N'Plot # 106-107, HSIDC Industrial Estate, Sector-31, Faridabad- 121 003 Haryana State India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1039', N'Tedec Meiji Farma, SA (The Spainish Subsidiary of Meiji Seika Pharma Co. Ltd', N'Ctra. M-300, Km 30,500, 28802 Alcala De Henares (Madrid) Spain')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1040', N'Teva Kutno S.A.', N'Sienkiewicza 25, 99-300 Kutno Poland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1041', N'Teva Pharmaceutical Works Private Limited Company', N'Tancsics Mihaly ut 82, H-2100 Godollo Hungary')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1042', N'The Madras Pharmaceuticals', N'137-B, Old mahabalipuram Road, Karapakkam, Chennai-600096 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1043', N'Viện Dược liệu', N'3B Quang Trung, Hoàn Kiếm, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1044', N'Viện khoa học và Kỹ thuật hạt nhân', N'179 Hoàng Quốc Việt, Nghĩa Đô, Cầu Giấy, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1045', N'West Pharma - Producoes de Especialidades Farmaceuticas, S.A', N'Rua Joao de Deus, No 11 Venda Nova 2700 Amadora Portugal')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1046', N'Withus Pharmaceutical Co., Ltd', N'103, Je2gongdan 2-gil, Miyang-myeon, Anseong-si, Gyeonggi-do Hàn Quốc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1047', N'XL Laboratories Pvt., Ltd.', N'E-1223, Phase I Extn (Ghatal) RIICO Industrial Area Bhiwadi (Raj) India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1048', N'XL Laboratories Pvt., Ltd.', N'E-1223, Phase I Extn (Ghatal) RIICO Industrial Area Bhiwadi-301019 Rajasthan India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1049', N'Xí nghiệp Dược phẩm 150- Công ty Dược & TTBYT Quân đội', N'112 Trần Hưng Đạo- Q.1- TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1050', N'Xí nghiệp dược phẩm 120- Công ty Dược và TTBYT Quân Đội.', N'118 Vũ Xuân Thiều-Phường Phúc Lợi- Quận Long Biên-Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'1051', N'Zim Labratories Ltd.', N'B-21/22, MIDC Area, Kalmeshwar-441 501, Dist. Nagpur, Maharashtra State india')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'800', N'(Cơ sở nhận gia công): Công ty TNHH Medochemie (Viễn Đông)', N'40 VSIP II đường số 6, KCN Việt Nam - Singapore II, Khu liên hợp Công nghiệp - dịch vụ - đô thị Bình Dương, P. Hòa Phú, TP.Thủ Dầu Một, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'801', N'ACI Pharma PVT., Ltd.', N'Sy No. 296/7/6, IDA Bollaram, Medak District, AP 502325 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'802', N'ACI Pharma PVT., Ltd.', N'Unit 2, Sy No. 172/A, Plot No. 135/A, IDA Bollaram, Medak District, AP 502325 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'803', N'ACI Pharma PVT., Ltd.', N'Unit 2, Sy No. 172/A, Plot No.135/A, IDA Bollaram, Medak District, AP 502325 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'804', N'Actavis HF', N'Reykjavikurvegur 76-78, PO Box 420, 220 Hafnarfjordur Iceland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'805', N'Actavis HF', N'Reykjavikurvegur 78, 220 Hafnarfjordur Iceland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'806', N'Actavis Ltd.', N'BLB016 Bulebel Industrial Estate, Zejtun ZTN 3000 Malta')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'807', N'Aegen Bioteck Pharma Private Limited', N'No. 108, Chandranagar, Palakkad - 678 007, Kerala India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'808', N'Aeropharm GmbH.', N'Francois Mitterrand Allee 1, D- 07407 Rudolstadt Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'809', N'Agio Pharmaceuticals Ltd.', N'T-82, M.I.D.C., Bhosari, Pune-411026 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'810', N'Agio Pharmaceuticals Ltd.', N'T-82, M.I.D.C., Bhosari, Pune-411026 Maharashtra State India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'811', N'Ahn Gook Pharmaceutical Co., Ltd.', N'903-2, Shangshin-ri, Hyangnam-myun, Hwasung-kun Kyunggi-do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'812', N'Allergan Pharmaceuticals Ireland', N'Castlebar Road, Westport, County Mayo Ireland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'813', N'Allergan Sales, LLC', N'Waco, Texas 76712 USA')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'814', N'Astellas Ireland Co.,Ltd.', N'Killorglin,Co. Kerry Ireland')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'815', N'B.Braun Melsungen AG', N'34209 Melsungen Đức')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'816', N'Baxter Healthcare Corporation of Puerto Rico', N'Guayama, PR 00784. USA')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'817', N'Baxter Healthcare of Puerto Rico', N'Guayama, Puerto Rico 00784 USA')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'818', N'Bayer Pharma AG', N'D-51368 Leverkusen Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'819', N'Bayer Pharma AG', N'D-51368 Leverkusen Đức')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'820', N'Bayer Schering Pharma AG', N'D-51368 Leverkusen Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'821', N'Beaufour Ipsen Industrie', N'Rue Ethe Virton 28100 Dreux France')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'822', N'Beaufour Ipsen Industrie', N'Rue Ethe Virton, 28100 Dreux France')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'823', N'Ben Venue Laboratories', N'Bedford, Ohio 44146 USA')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'824', N'Ben Venue Laboratories Inc.', N'Bedford, OH 44146 USA')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'825', N'Bioindustria L.I.M (Laboratorio Italiano Medicinali) S.p.A', N'Via De Ambrosiis, 2/6- 15067 Novi Ligure (AL) Ý')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'826', N'Boehringer Ingelheim Pharma GmbH & Co. KG', N'Birkendorfer StraBe 65 88397 Biberach an der Riss Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'827', N'Boram Pharm. Co., Ltd.', N'471 Moknae-Dong, Danwon-gu, Ansan-Si, Kyungki-Do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'828', N'Brawn Laboratories Ltd', N'13, NIT, Industrial Area, Faridabad-121001 Haryana India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'829', N'CSL Behring AG', N'Wankdorfstrasse 10, 3014 Bern - Thụy Sỹ Thụy Sĩ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'830', N'Cadila Pharmaceuticals Limited', N'1389, Trasad Road, Dholka- 382225, Distric: Ahmedabad, Gujarat State India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'831', N'Cadila Pharmaceuticals Ltd.', N'1389, Trasad Road, Dholka-387 810, District: Ahmedabad, Gujarat state Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'832', N'Cadila Pharmaceuticals Ltd.', N'1389, Trasad Road, Dholka-387 810, District: Ahmedabat, Gujarat state Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'833', N'Chi nhánh Công ty TNHH LD Stada-Việt Nam', N'Số 40 Đại lộ Tự Do, KCN Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'834', N'Chi nhánh Công ty cổ phần dược TW Mediplantex', N'Thôn Trung Hậu, xã Tiền Phong, Mê Linh, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'835', N'Chi nhánh công ty TNHH SX-TM dược phẩm Thành Nam', N'Số 60 - Đại lộ Độc lập - KCN Việt Nam-Singapore - Phương An Phú - Thị xã Thuận An - Tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'836', N'Chi nhánh công ty cổ phần Armephaco- Xí nghiệp dược phẩm 150', N'112 Trần Hưng Đạo, Quận 1, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'837', N'Chi nhánh công ty cổ phần Armephaco- Xí nghiệp dược phẩm 150', N'112 Trần Hưng Đạo, phường Phạm Ngũ Lão, Quận 1, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'838', N'Chi nhánh công ty cổ phần dược phẩm Agimexpharm- Nhà máy sản xuất dược phẩm Agimexpharm', N'Đường Vũ Trọng Phụng, Khóm Thạnh An, P. Mỹ Thới, TP. Long Xuyên, Tỉnh An Giang Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'839', N'Chi nhánh công ty cổ phần dược phẩm Trung ương Vidipha Bình Dương', N'Khu phố Tân Bình, phường Tân Hiệp, thị xã Tân Uyên, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'840', N'Chi nhánh công ty cổ phần dược phẩm trung ương Vidipha tại Bình Dương', N'ấp Tân Bình, xã Tân Hiệp, huyện Tân Uyên, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'841', N'Chugai Pharma Manufacturing Co., Ltd.', N'16-3, Kiyohara Kogyodanchi, Utsunomiya-city, Tochigi Nhật Bản')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'842', N'Crown pharm. Co., LTD', N'218-7, Anyang 7-Dong, Manan-Gu, Anyang-City, Kyunggi-Do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'843', N'Cure Medicines (I) Pvt Ltd', N'C-12/13, M.I.D.C., Bhosari, pune - 411026 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'844', N'Công ty CPDP Gia Nguyễn', N'Đường YP6, KCN Yên Phong, xã Đông Phong, huyện Yên Phong, tỉnh Bắc Ninh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'845', N'Công ty CPDP Khánh Hòa', N'Đường 2 tháng 4, p. Vĩnh Hòa, Nha Trang, Khánh Hòa (ĐK: 82 Thống Nhất, Nha Trang) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'846', N'Công ty Cổ phần BV Pharma', N'Xã Tân Thạnh Tây-Huyện Củ Chi-Thành phố Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'847', N'Công ty Cổ phần BV Pharma', N'Ấp 2, Xã Tân Thạnh Tây-Huyện Củ Chi-Thành phố Hồ Chí Minh Việt Nam')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'848', N'Công ty Cổ phần Dược phẩm An Thiên', N'C16, đường số 9, KCN Hiệp Phước, huyện Nhà Bè, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'849', N'Công ty Cổ phần Dược phẩm Bos Ton Việt Nam', N'Số 43, Đường số 8, KCN Việt Nam - Singapore, Thuận An, Bình Dương, Việt Nam Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'850', N'Công ty Cổ phần Dược phẩm Boston Việt Nam', N'Số 43, Đường số 8, KCN Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'851', N'Công ty Cổ phần Dược phẩm Glomed', N'29A Đại Lộ Tự Do, Khu công nghiệp Việt Nam-Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'852', N'Công ty Cổ phần Dược phẩm OPV', N'Số 27, Đường 3A, KCN Biên Hòa II, Phường An Bình, thành phố Biên Hòa, tỉnh Đồng Nai. Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'853', N'Công ty Cổ phần Dược phẩm Sanofi-Synthelabo Việt Nam', N'15/6C Đặng Văn Bi-Thủ Đức-Tp Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'854', N'Công ty Cổ phần Dược phẩm Trung ương I - Pharbaco', N'160 Tôn Đức Thắng, Hà Nội (SX: Thanh Xuân, Sóc Sơn, Hà Nội) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'855', N'Công ty Cổ phần Dược phẩm Đạt Vi Phú', N'Lô M7A, Đường D17, KCN Mỹ Phước 1, phường Thới Hòa, thị xã Bến Cát, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'856', N'Công ty LD TNHH Stada - Việt Nam', N'63/1 Nguyễn Thị Sóc, ấp Mỹ Hoà 2, xã Xuân Thới Đông, huyện Hóc Môn, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'857', N'Công ty Liên doanh Meyer - BPC.', N'6A3-quốc lộ 60, phường Phú Tân, TP. Bến Tre, tỉnh Bến Tre Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'858', N'Công ty TNHH Dược phẩm Shinpoong Daewoo', N'Số 13, đường 9A, KCN. Biên Hoà II, TP. Biên Hoà, Đồng Nai Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'859', N'Công ty TNHH Ha san - Dermapharm', N'Đường số 2, KCN Đồng An, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'860', N'Công ty TNHH Hasan-Dermapharm', N'Đường số 2 - Khu Công nghiệp Đồng An - Phường Bình Hòa - Thị xã Thuận An - Tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'861', N'Công ty TNHH LD Stada - Việt Nam', N'K63/1 Nguyễn Thị Sóc, ấp Mỹ Hoà 2, xã Xuân Thới Đông, huyện Hóc Môn, Tp. HCM Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'862', N'Công ty TNHH LD Stada-Việt Nam', N'Số 40 Đại lộ Tự Do, KCN Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'863', N'Công ty TNHH LD Stada-Việt Nam.', N'K63/1 Nguyễn Thị Sóc, ấp Mỹ Hòa 2, xã Xuân Thới Đông, huyện Hóc Môn, Tp. HCM Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'864', N'Công ty TNHH LD Stada-Việt Nam.', N'Số 40 Đại lộ Tự Do, KCN Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'865', N'Công ty TNHH MTV 120 Armephaco', N'118 Vũ Xuân Thiều, P. Phúc Lợi, Q. Long Biên, TP. Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'866', N'Công ty TNHH Otsuka OPV', N'Lô 27, đường 3A Khu Công nghiệp Biên Hoà II-Biên Hoà-Đồng Nai Việt Nam Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'867', N'Công ty TNHH Phil Inter Pharma', N'Số 25, Đường số 8, Khu CN Việt Nam-Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'868', N'Công ty TNHH Rohto - Mentholatum Việt Nam', N'Số 16, đường số 5, KCN. Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'869', N'Công ty TNHH SX-TM dược phẩm Thành Nam', N'60 Đại lộ Độc lập, KCN Việt Nam - Singapore, TX. Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'870', N'Công ty TNHH US Pharma USA', N'Lô B1-10, Đường D2, KCN Tây Bắc Củ Chi, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'871', N'Công ty TNHH dược phẩm Fito Pharma', N'26 Bis/1 Khu phố Trung, Vĩnh Phú, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'872', N'Công ty TNHH dược phẩm Vellpharm Việt Nam', N'Số 8 đường TS3 - KCN Tiên Sơn - Bắc Ninh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'873', N'Công ty TNHH dược phẩm Đạt Vi Phú', N'Lô M7A-CN, Đường D17, KCN Mỹ Phước, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'874', N'Công ty TNHH liên doanh Hasan-Dermapharm', N'Lô B, đường số 2, KCN Đồng An, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'875', N'Công ty TNHH một thành viên dược phẩm và sinh học y tế', N'Lô III - 18 đường số 13, Khu công nghiệp Tân Bình, Quận Tân Phú, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'876', N'Công ty TNHH một thành viên dược phẩm và sinh học y tế', N'Lô III - 18, đường số 13, Khu công nghiệp Tân Bình, Quận Tân Phú, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'877', N'Công ty TNHH sản xuất thương mại dược phẩm NIC', N'Lô 11D đường C, Khu công nghiệp Tân Tạo, quận Bình Tân, tp. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'878', N'Công ty TNHH sản xuất thương mại dược phẩm NIC (NIC Pharma)', N'Lô 11D đường C, Khu công nghiệp Tân Tạo, quận Bình Tân, tp. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'879', N'Công ty cổ phần Dược Hà Tĩnh', N'167 Hà Huy Tập, Tp. Hà Tĩnh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'880', N'Công ty cổ phần Dược Hậu Giang', N'288 Bis Nguyễn Văn Cừ - TP. Cần Thơ Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'881', N'Công ty cổ phần Dược Minh Hải', N'322 Lý Văn Lâm, Phường 1, Tp. Cà Mau, Tỉnh Cà Mau Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'882', N'Công ty cổ phần Dược Minh Hải', N'322 Lý Văn Lâm-P1-Tp. Cà Mau- Tỉnh Cà Mau Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'883', N'Công ty cổ phần Dược S. Pharm', N'Lô G, KCN An Nghiệp, An Hiệp, Châu Thành, Sóc Trăng Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'884', N'Công ty cổ phần Dược phẩm 3/2', N'Số 930 C2, Đường C, KCN Cát Lái, P. Thạnh Mỹ Lợi, Q2, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'885', N'Công ty cổ phần Dược phẩm 3/2..', N'Số 930 C2, Đường C, KCN Cát Lái, P. Thạnh Mỹ Lợi, Q2, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'886', N'Công ty cổ phần Dược phẩm CPC1 Hà Nội', N'Cụm công nghiệp Hà Bình Phương, Thường Tín, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'887', N'Công ty cổ phần Dược phẩm Euvipharm - Thành viên tập đoàn Valeant', N'ấp Bình Tiền 2, xã Đức Hoà hạ, Đức Hoà, Long An Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'888', N'Công ty cổ phần Dược phẩm OPV', N'Số 27, đường 3A, Khu công nghiệp Biên Hoà 2, Đồng Nai Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'889', N'Công ty cổ phần Dược phẩm Phương Đông', N'Lô số 7, đường số 2, KCN. Tân Tạo, P. Tân Tạo A, Q. Bình Tân, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'890', N'Công ty cổ phần Dược phẩm Yên Bái.', N'Số 725, Đường Yên Ninh, TP Yên Bái, Tỉnh Yên Bái. Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'891', N'Công ty cổ phần Dược-TTBYT Bình Định (Bidiphar)', N'498 Nguyễn Thái Học, P. Quang Trung, TP. Qui Nhơn, Bình Định Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'892', N'Công ty cổ phần Hoá dược Việt Nam', N'192 Đức Giang, Long Biên, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'893', N'Công ty cổ phần Korea United Pharm. Int'' L.', N'Số 2A, Đại lộ Tự Do, KCN Việt Nam-Singapore, huyện Thuận An, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'894', N'Công ty cổ phần LD dược phẩm Medipharco-Tenamyd BR s.r.l', N'Số 8, Nguyễn Trường Tộ, P. Phước Vĩnh, TP. Huế, Thừa Thiên Huế Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'895', N'Công ty cổ phần Pymepharco', N'166 - 170 Nguyễn Huệ, Tuy Hoà, Phú Yên Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'896', N'Công ty cổ phần SPM', N'Lô 51- Đường số 2- KCN Tân Tạo- P. Tân Tạo A, Q. Bình Tân- TP. HCM Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'897', N'Công ty cổ phần SPM', N'Lô 51- Đường số 2- KCN Tân Tạo- Q. Bình Tân- TP. HCM Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'898', N'Công ty cổ phần US Pharma USA', N'Lô B1-10, Đường D2, KCN Tây Bắc Củ Chi, Tp.Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'899', N'Công ty cổ phần công nghệ cao Traphaco', N'Xã Tân Quang, huyện Văn Lâm, tỉnh Hưng Yên Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'900', N'Công ty cổ phần công nghệ sinh học dược phẩm ICA', N'Lô 10, Đường số 5, KCN Việt Nam - Singapore, Thuận An, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'901', N'Công ty cổ phần dược Phúc Vinh', N'Lô CN 4-6.2 Khu Công nghiệp Thạch Thất, Quốc Oai, xã Phùng Xá, huyện Thạch Thất, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'902', N'Công ty cổ phần dược S.Pharm', N'Lô G, KCN An Nghiệp, xã An Hiệp, huyện Châu Thành, tỉnh Sóc Trăng Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'903', N'Công ty cổ phần dược TW Medipharco - Tenamyd', N'Số 8 Nguyễn Trường Tộ, P. Phước Vĩnh, TP. Huế, Thừa Thiên Huế Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'904', N'Công ty cổ phần dược TW Mediplantex', N'Nhà máy dược phẩm số 2: Trung Hậu, Tiền Phong, Mê Linh, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'905', N'Công ty cổ phần dược TW Mediplantex', N'Thôn Trung Hậu, xã Tiền Phong, huyện Mê Linh, Hà Nội Việt nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'906', N'Công ty cổ phần dược VTYT Hà Nam', N'Cụm công nghiệp Hoàng Đông, Duy Tiên, Hà Nam Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'907', N'Công ty cổ phần dược Vacopharm', N'Km 1954, quốc lộ 1A, P. Tân Khánh, TX. Tân An, Long An Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'908', N'Công ty cổ phần dược phẩm 2/9', N'930 C4, Đường C, Khu công nghiệp Cát Lái, Cụm 2, phường Thạnh Mỹ Lợi, Q.2, TP HCM. Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'909', N'Công ty cổ phần dược phẩm 2/9 - Nadyphar', N'930 C4, Đường C, Khu công nghiệp Cát Lái, Cụm 2, phường Thạnh Mỹ Lợi, Q.2, TP HCM. Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'910', N'Công ty cổ phần dược phẩm 2/9 TP HCM', N'930 C4, Đường C, Khu công nghiệp Cát Lái, Cụm 2, phường Thạnh Mỹ Lợi, Q.2, TP HCM. Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'911', N'Công ty cổ phần dược phẩm 2/9.', N'299/22 Lý Thường Kiệt, P.15, Q.11, TP. Hồ Chí Minh (SX tại: 930 C4, Đường C, KCN Cát Lái, Cụm 2, P. Thạnh Mỹ Lợi, Q.2, TP. Hồ Chí Minh) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'912', N'Công ty cổ phần dược phẩm 2/9.', N'930C4, Đường C, KCN Cát Lái, Cụm2, P. Thạnh Mỹ Lợi, Q2, Tp. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'913', N'Công ty cổ phần dược phẩm Agimexpharm', N'66 Vũ Trọng Phung, P. Mỹ Thới, TP. Long Xuyên, An Giang Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'914', N'Công ty cổ phần dược phẩm Agimexpharm', N'Khóm Thạnh An, P. Mỹ Thới, TP. Long Xuyên, An Giang Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'915', N'Công ty cổ phần dược phẩm An Thiên', N'Lô C16, đường số 9, KCN Hiệp Phước, huyện Nhà Bè, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'916', N'Công ty cổ phần dược phẩm Bidiphar 1', N'498 Nguyễn Thái Học, Tp. Qui Nhơn, Tỉnh Bình Định Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'917', N'Công ty cổ phần dược phẩm Cửu Long', N'150 đường 14 tháng 9, TP. Vĩnh Long, tỉnh Vĩnh Long Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'918', N'Công ty cổ phần dược phẩm Cửu Long', N'150 đường 14/9, TP. Vĩnh Long, tỉnh Vĩnh Long Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'919', N'Công ty cổ phần dược phẩm Cửu Long', N'Số 150 đường 14 tháng 9, TP. Vĩnh Long, tỉnh Vĩnh Long Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'920', N'Công ty cổ phần dược phẩm Cửu Long', N'Số 150 đường 14 tháng 9, phường 5, TP. Vĩnh Long, tỉnh Vĩnh Long Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'921', N'Công ty cổ phần dược phẩm Gia Nguyễn', N'Đường YP6, KCN Yên Phong, xã Đông Phong, huyện Yên Phong, tỉnh Bắc Ninh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'922', N'Công ty cổ phần dược phẩm Hoa Việt', N'Lô C9, KCN Châu Sơn, Tp. Phủ Lý, Hà Nam Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'923', N'Công ty cổ phần dược phẩm Hà Tây', N'La Khê - Văn Khê - Hà Đông - Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'924', N'Công ty cổ phần dược phẩm Hà Tây', N'Tổ dân phố số 4 - La Khê - Hà Đông - Tp. Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'925', N'Công ty cổ phần dược phẩm Hà Tây.', N'80 Quang Trung - Hà Đông - Hà Nội (SX tại La Khê - Văn Khê - Hà Đông - Hà Nội) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'926', N'Công ty cổ phần dược phẩm IMEXPHARM', N'04- đường 30/4, Phường 1, Tp. Cao Lãnh, Tỉnh Đồng Tháp Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'927', N'Công ty cổ phần dược phẩm Imexpharm', N'Số 04, đường 30/4, Phường 1, Tp. Cao Lãnh, Tỉnh Đồng Tháp Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'928', N'Công ty cổ phần dược phẩm Khánh Hoà', N'Đường 2 tháng 4, P. Vĩnh Hoà, TP. Nha Trang, Khánh Hoà Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'929', N'Công ty cổ phần dược phẩm Me Di Sun', N'521 khu phố An Lợi, phường Hoà Lợi, thị xã Bến Cát, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'930', N'Công ty cổ phần dược phẩm Me Di Sun', N'521 ấp An Lợi, xã Hoà Lợi, huyện Bến Cát, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'931', N'Công ty cổ phần dược phẩm Minh Dân', N'Lô N8, đường N5, KCN Hoà Xá, TP Nam Định Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'932', N'Công ty cổ phần dược phẩm Minh Dân', N'Lô N8, đường N5, KCN Hoà Xá, xã Mỹ Xá, TP Nam Định, tỉnh Nam Định Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'933', N'Công ty cổ phần dược phẩm Nam Hà', N'415- Hàn Thuyên - Nam Định Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'934', N'Công ty cổ phần dược phẩm OPV', N'Số 27 đường 3A, KCN Biên Hoà 2, Đồng Nai Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'935', N'Công ty cổ phần dược phẩm Quảng Bình', N'46 Đường Hữu Nghị - P Bắc Lý- TP. Đồng Hới - Quảng Bình Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'936', N'Công ty cổ phần dược phẩm Quảng Bình', N'46 Đường Hữu Nghị - P. Bắc Lý - TP. Đồng Hới - Quảng Bình Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'937', N'Công ty cổ phần dược phẩm Quảng Bình', N'46 Đường Hữu Nghị - TP. Đồng Hới - Quảng Bình Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'938', N'Công ty cổ phần dược phẩm Quảng Bình', N'Đường Hữu Nghị - Thị xã Đồng Hới - Quảng Bình Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'939', N'Công ty cổ phần dược phẩm TV.Pharm', N'27 Điện Biên Phủ, thị xã Trà Vinh, tỉnh Trà Vinh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'940', N'Công ty cổ phần dược phẩm Tipharco', N'15 Đốc Binh Kiều, phường 2, thành phố Mỹ Tho, tỉnh Tiền Giang Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'941', N'Công ty cổ phần dược phẩm Trung ương 1 - Pharbaco.', N'Thanh Xuân, Sóc Sơn, Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'942', N'Công ty cổ phần dược phẩm Trung ương 2', N'Lô 27 Khu công nghiệp Quang Minh, thị trấn Quang Minh, huyện Mê Linh, Tp. Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'943', N'Công ty cổ phần dược phẩm Trung ương 3.', N'Xã Nam Sơn, huyện An Dương, Tp. Hải Phòng Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'944', N'Công ty cổ phần dược phẩm Vĩnh Phúc', N'Thôn Mậu Thông-P.Khai Quang- TP. Vĩnh Yên- Tỉnh Vĩnh Phúc Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'945', N'Công ty cổ phần dược phẩm dược liệu Pharmedic', N'1/67 Nguyễn Văn Quá, Quận 12, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'946', N'Công ty cổ phần dược phẩm dược liệu Pharmedic', N'367 Nguyễn Trãi - Q.1 - TP. Hồ Chí Minh (SX tại: 1/67 Nguyễn Văn Quá, Quận 12) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'947', N'Công ty cổ phần dược phẩm trung ương 1 - Pharbaco.', N'Thanh Xuân, Sóc Sơn, Hà Nội Việt Nam')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'948', N'Công ty cổ phần dược phẩm trung ương VIDIPHA', N'ấp Tân Bình, xã Tân Hiệp, huyện Tân Uyên, tỉnh Bình Dương (Địa chỉ giao dịch: 184/2 Lê Văn Sỹ, Phường 10, Quận Phú Nhuận, TP. HCM) Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'949', N'Công ty cổ phần dược phẩm trung ương VIDIPHA', N'ấp Tân Bình, xã Tân Hiệp, huyện Tân Uyên, tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'950', N'Công ty cổ phần dược phẩm và sinh học y tế', N'Lô III-18 đường số 13 - Khu công nghiệp Tân Bình - Quận Tân Phú - TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'951', N'Công ty cổ phần dược trung ương Mediplantex', N'356 Đường Giải Phóng - Hà Nội Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'952', N'Công ty cổ phần dược trung ương Mediplantex.', N'Thôn Trung Hậu, xã Tiền Phong, huyện Mê Linh, Vĩnh Phúc Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'953', N'Công ty cổ phần dược vật tư y tế Hải Dương', N'102 Chi Lăng, thành phố Hải Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'954', N'Công ty cổ phần dược vật tư y tế Hải Dương', N'Số 102 Chi Lăng, phường Nguyễn Trãi, thành phố Hải Dương, tỉnh Hải Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'955', N'Công ty cổ phần dược-vật tư y tế Thanh Hoá', N'Số 4 Đường Quang Trung - TP. Thanh Hoá Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'956', N'Công ty cổ phần hoá dược phẩm Mekophar', N'297/5 - Lý Thường Kiệt - Quận 11- TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'957', N'Công ty cổ phần hoá-dược phẩm Mekophar.', N'297/5 Lý Thường Kiệt, quận 11, Tp. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'958', N'Công ty cổ phần sản xuất - thương mại Dược phẩm Đông Nam', N'Lô 2A, Đường số 1A, KCN. Tân Tạo, Q. Bình Tân, TP. Hồ Chí Minh Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'959', N'Công ty cổ phần xuất nhập khẩu y tế Domesco', N'66-Quốc lộ 30-P. Mỹ Phú-TP. Cao Lãnh-Tỉnh Đồng Tháp Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'960', N'Công ty liên doanh TNHH Stada Việt Nam', N'Số 40, Đại lộ Tự do, KCN Việt Nam - Singapore, Thuận An, Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'961', N'Công ty trách nhiệm hữu hạn Rohto - mentholatum Việt Nam', N'Số 16 đường số 5, Khu công nghiệp Việt Nam - Singapore - tỉnh Bình Dương Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'962', N'Cơ sở sản xuất đông nam dược Trung An', N'43/1A - Khu phố Trung Lương - Phường 10, TP. Mỹ Tho - Tiền Giang Việt Nam')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'963', N'Daiichi Sankyo Propharma Co., Ltd., Hiratsuka Plant', N'1-12-1, Shinomiya Road, Hiratsuka-shi, kanagawa Japan')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'964', N'Delpharm Tours', N'Rue Paul Langevin 37170 Chambray-Les-Tours France')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'965', N'Dihon pharmaceutical Co.,Ltd.', N'No.45 Keyi Road, Kunming New &n High-Tech Industrial Development zone, Yunnan China')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'966', N'Ebewe Pharma Ges.m.b.H.Nfg.KG', N'Mondseestraβe 11, AT-4866 Unterach am Attersee Áo')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'967', N'Euro-Med Laboratoires', N'Km 36, General Emilio Aguinalda Highway Cavite Philippines')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'968', N'Euro-Med Laboratoires Phil., Inc', N'Km 36, Gen. Emilio Aguinaldo Highway, Dasmarinas, Cavite Philippines')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'969', N'FDC Limited', N'B-8, MIDC Industrial area Waluj, Aurangabad 431136 Maharashtra State India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'970', N'Famar Italia S.p.A', N'Via Zambeletti, 25 I- 20021 Baranzate di Bollate, Milano Italy')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'971', N'Fourtts (India) Laboratories Pvt. Ltd.', N'Vandalur road, Kelambakkam - 603 103, Tamil Nadu. India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'972', N'Fresenius Kabi Oncology Ltd', N'19 HPSIDC, Industrial Area, Baddi, Dist. Solan (H.P.)-173205 Ấn Độ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'973', N'G.A Pharmaceuticals S.A. (GAP S.A.)', N'46, Agissilaou Str., Ag. Dimitrios Attiki 17341 Grecce')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'974', N'Godecke GmbH', N'Mooswaldallee 1, 79090 Freiburg Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'975', N'Gracure Pharmaceuticals Ltd.', N'E-1105, Industrial Area, Phase-III, Bhiwadi (Raj) India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'976', N'Gracure Pharmaceuticals Ltd.', N'E-1105, Industrial Area, Phase-III, Bhiwadi (Raj.) India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'977', N'Haupt Pharma WolfratshausenGmbH', N'Pfaffenriederer Strabe 5, D-82515 Wolfratshausen Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'978', N'Hermes Arzneimittel GmbH', N'Hans-Urmiller-Ring 52, 82515 Wolfratshausen Đức')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'979', N'Huons Co. Ltd', N'957 Wangam-dong, Jecheon-si, Chungcheongbuk-do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'980', N'Korea Arlico Pharm. Co., Ltd.', N'160-17, Whoijuk-ri, Gwanghyewon-myeon, Jincheon-gun, Chungcheongbuk-do Hàn Quốc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'981', N'Korea E-Pharm Inc.', N'648-2, Choji-dong, Ansan-si, Kyungki-do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'982', N'Korea United Pharm. Inc.', N'153, Budong-Ri, Seo-Myeon, Yeongi-Kun, Chungnam Hàn Quốc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'983', N'Korean Drug Co., Ltd.', N'486, Sugwang-Ri, Sindun-Myeon, Icheon-Si, Gyeonggi-Do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'984', N'Korean Drug Pharm Co., Ltd.', N'486, Sungwang-Ri, Sindun- Myeon, Icheon- Si, Kyeonggi- Do Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'985', N'Kuhnil Pharm. Co., Ltd.', N'297-5, Gunseo-ri, Jiksan-eup, Seobuk-ku, Cheonan-si, Chungnam Korea')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'986', N'Laboratoires Elerte', N'181- 183, rue André Karman 93303 Aubervilliers Cedex France')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'987', N'Laboratoires Grimberg S.A.', N'Z. A. des Boutries, 5 rue Vermont 78704 Conflans Ste Honorine France')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'988', N'Laboratorio Farmaceutico C.T.s.r.l.', N'Via Dante Alighieri 71, 18038 Sanremo (IM) Ý')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'989', N'Laboratorios Richet S.A', N'Terrero 1251 - Buenos Aires Argentina')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'990', N'Lek Pharmaceuticals d.d,', N'Verovskova 57, 1526 Ljubljana Slovenia')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'991', N'Lindopharm GmbH', N'Neustrasse 82 D- 40721 Hilden Germany')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'992', N'Lindopharm GmbH', N'Neustrasse 82, 40721 Hilden Đức')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'993', N'Marksans Pharma Ltd.', N'21, Lotus Business Park, Off new Link Road, Andheri (W), Mumbai, 400053 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'994', N'Medica Korea Co., Ltd.', N'96, Jeyakgongdan 4-gil, Hyangnam-eup, Hwaseong-si, Gyeonggi-Do Hàn Quốc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'995', N'Mediwin Pharmaceutical', N'128/A, Phase I & II, G.I.T.C Naroda, Ahmedabat, Gujarat state India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'996', N'Medley Pharmaceuticals Ltd.', N'Plot No 18&19 Survey No 378/7&8, 379/2 &3 Zari Causeway Road, Kachigam, Daman 396210 India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'997', N'Mega Lifesciences Ltd.', N'384 Moo 4, Soi 6, Bangpoo Industrial Estate, Pattana 3 Road, Phraeksa, Mueang, Samut Prakarn 10280 Thailand')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'998', N'Micro Labs Limited', N'92, Sipcot Hosur 635-126 Tamil Nadu India')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi]) VALUES (N'999', N'Micro Labs Limited', N'92, Sipcot, Hosur - 635 126, Tamil Nadu India')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTenDem], [TenNV], [NgaySinh], [DiaChi], [GioiTinh], [LuongTrenGio], [SoGioLam], [TenTaiKhoan], [SoDienThoai]) VALUES (N'18054321', N'Trương Đức', N'Hoàn', CAST(N'2000-01-25' AS Date), N'Gò Vấp - tp.HCM', 1, 30000.0000, 150, N'duchoan6814    ', N'0349380770')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenDem], [TenNV], [NgaySinh], [DiaChi], [GioiTinh], [LuongTrenGio], [SoGioLam], [TenTaiKhoan], [SoDienThoai]) VALUES (N'18054322', N'Dương Anh', N'Tú', CAST(N'2000-01-25' AS Date), N'Gò Vấp - tp.HCM', 1, 30000.0000, 135, N'duongtu6814    ', N'0123123343')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenDem], [TenNV], [NgaySinh], [DiaChi], [GioiTinh], [LuongTrenGio], [SoGioLam], [TenTaiKhoan], [SoDienThoai]) VALUES (N'18054323', N'Nguy?n Th? Qu?nh', N'Mai', NULL, NULL, 0, NULL, NULL, N'duchoan6815    ', N'09123456789')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenDem], [TenNV], [NgaySinh], [DiaChi], [GioiTinh], [LuongTrenGio], [SoGioLam], [TenTaiKhoan], [SoDienThoai]) VALUES (N'5df6ec22-2796-4889-bbfa-3825fbf82c9a', N'Pham Xuan', N'Vu', NULL, NULL, 1, NULL, NULL, N'xuanvu6817     ', N'0312533452')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenDem], [TenNV], [NgaySinh], [DiaChi], [GioiTinh], [LuongTrenGio], [SoGioLam], [TenTaiKhoan], [SoDienThoai]) VALUES (N'e40cd789-2297-45ab-8d55-7d47189bb880', N'Nguyễn Thị Quỳnh', N'Mai', NULL, NULL, 0, NULL, NULL, N'maiquynh123    ', N'0303265541')
GO
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV], [TongTienPhieuNhap]) VALUES (N'08a7d1d0-68bf-4b40-a814-b177c9fe3366', CAST(N'2020-07-11T23:34:42.367' AS DateTime), N'18054322', 487875.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV], [TongTienPhieuNhap]) VALUES (N'18054321', CAST(N'2020-07-10T16:08:04.420' AS DateTime), N'18054321', 2311794200.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV], [TongTienPhieuNhap]) VALUES (N'59618501-171a-4245-9d57-1fc61e7cc02b', CAST(N'2020-07-11T23:23:47.730' AS DateTime), N'18054322', 167875.0000)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [MaNV], [TongTienPhieuNhap]) VALUES (N'f50988e9-507b-493b-9bac-136cd807308d', CAST(N'2020-07-11T23:29:37.133' AS DateTime), N'18054322', 42500.0000)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (1, N'VD-23889-15', N'Casoran', N'48 tháng', N'590', N'Viên', N'Cao hoa hòe (3:1)
  -  
160mg
Cao dừa cạn (6:1)
  -  
20mg
Cao tâm sen (4:1)
  -  
15mg
Cao cúc hoa (3:1)
  -  
10mg
...', 6, 899)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (2, N'VN-5621-10', N'Cravit', N'36 tháng', N'88515', N'Lọ', N'Levofloxacin
  -  
5mg/ml', 6, 1025)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (3, N'VN-17674-14', N'Docetaxel 20mg', N'24 tháng', N'1260000', N'Lọ', N'Docetaxel
  -  
20mg/2ml', 4, 1041)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (4, N'VD-24071-16', N'Hà thủ ô', N'36 tháng', N'2700', N'Túi', N'Cao đặc rễ hà thủ ô đỏ
  -  
300mg', 6, 899)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (5, N'VN-16752-13', N'0.9% Sodium Chloride Solution for I.V. Infusion', N'60 tháng', N'17000', N'Chai', N'Irbesartan 300mg
  -  
  -  ', 2, 968)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (6, N'VN-17818-14', N'1-AL', N'24 tháng', N'52000', N'Lọ', N'Levocetirizine Dihydrochloride
  -  
15mg/30ml', 6, 969)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (7, N'VN-16753-13', N'10% Dextrose in Water Parenteral Solution for Intravenous Infusion', N'60 tháng', N'16000', N'Chai', N'Dextrose monohydrate 50g/500ml
  -  ', 4, 968)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (8, N'QLĐB1-H07-19', N'18F-FDG (FDG)', N'6 tháng', N'880000', N'mCi', N'18F-FDG 5,5-125mCi/ml
  -  
5,5-125mCi/ml', 8, 1044)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (9, N'VN-16754-13', N'20% Dextrose in Water for Intravenous Infusion', N'60 tháng', N'19000', N'Chai', N'Dextrose monohydrate 100g/500ml
  -  ', 1, 968)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (10, N'VN-16755-13', N'30% Dextrose in Water', N'60 tháng', N'17800', N'Chai', N'Dextrose monohydrate 150g/500ml
  -  ', 4, 968)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (11, N'VD-22915-15', N'3B-Medi', N'36 tháng', N'1250', N'Viên', N'Vitamin B1
  -  
125 mg
Vitamin B6
  -  
125 mg
Vitamin B12
  -  
250 mcg', 6, 930)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (12, N'VD-26870-17', N'3B-Medi tab', N'36 tháng', N'1100', N'Viên', N'Vitamin B1 (Thiamin mononitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 7, 930)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (13, N'VD-26140-17', N'3BTP', N'24 tháng', N'1250', N'Viên', N'Vitamin B1 (Thiamin nitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 7, 924)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (14, N'VD-16258-12', N'3Bpluzs F', N'36 tháng', N'1400', N'viên', N'Vitamin B1
  -  
12,5mg
Vitamin B6
  -  
12,5mg
Vitamin B12
  -  
50mcg
Sắt sulfat
  -  
16,2mg
...', 9, 889)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (15, N'VN2-52-13', N'4-Epeedo-50', N'24 tháng', N'573000', N'lọ', N'Epirubicin hydrochloride
  -  
50mg', 2, 1005)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (16, N'VN-18586-15', N'4.2% w/v Sodium Bicarbonate', N'24 tháng', N'95000', N'Chai', N'Natri bicarbonat
  -  
10,5 mg', 5, 815)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (17, N'VN-12442-11', N'5% Dextrose in lactated ringer s', N'60 tháng', N'18000', N'Chai', N'Dextrose monohydrate
  -  
--
Natri Chlorid
  -  
Natri lactat
  -  
Kali clorid
  -  
...', 5, 967)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (18, N'VN-14667-12', N'5% Dextrose in water solution for intravenous infusion', N'60 tháng', N'13500', N'Chai', N'Dextrose monohydrate
  -  
5g/100ml', 6, 968)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (19, N'VN-15332-12', N'5% Glucose Injection 500ml:25g', N'24 tháng', N'9500', N'Chai', N'Glucose (khan)
  -  
5%', 4, 1028)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (20, N'VN3-16-18', N'5-FU Onkovis 50mg/ml', N'24 tháng', N'135000', N'Lọ', N'Fluorouracil
  -  
250mg/5ml', 1, 977)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (21, N'VN-17422-13', N'5-Fluorouracil "Ebewe"', N'24 tháng', N'112350', N'Lọ', N'5-Fluorouracil
  -  
50mg/ml', 7, 966)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (22, N'VN-19820-16', N'A-Cnotren', N'36 tháng', N'12900', N'Viên', N'Isotretinoin 10mg
  -  ', 9, 973)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (23, N'VD-24125-16', N'A. T Ambroxol', N'24 tháng', N'26000', N'chai', N'Mỗi 5ml chứa Ambroxol (dưới dạng Ambroxol HCl) 30mg
  -  ', 2, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (24, N'VD-24126-16', N'A. T Lục vị', N'24 tháng', N'5000', N'Viên hoàn', N'Mỗi hoàn mềm 9g chứa: Thục địa 1,6g
  -  
Hoài sơn 0,8g
  -  
Sơn thù 0,8g
  -  
Mẫu đơn bì 0,6g
  -  
...', 4, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (25, N'VD-23567-15', N'A.C Mexcold', N'36 tháng', N'350', N'Viên', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 1, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (26, N'VD-24206-16', N'A.C Mexcold', N'36 tháng', N'530', N'530', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 4, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (27, N'VD-15693-11', N'A.D.O', N'24 tháng', N'420', N'Viên', N'Vitamin A palmitat 5000 IU, vitamin D3 400IU
  -  ', 1, 880)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (28, N'VD-31591-19', N'A.T Acyclovir 200 mg', N'24 tháng', N'3000', N'Viên', N'Acyclovir 200mg
  -  
200mg', 8, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (29, N'VD-24127-16', N'A.T Alugela', N'24 tháng', N'2800', N'Gói', N'Gói 20g chứa Nhôm phosphat gel 20% 12,380 g
  -  ', 7, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (30, N'VD-24722-16', N'A.T Amikacin 250', N'24 tháng', N'24000', N'Lọ', N'Amikacin (dưới dạng amikacin sulfat) 250mg
  -  ', 1, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (31, N'VD-31592-19', N'A.T Amikacin 500', N'24 tháng', N'39900', N'Lọ', N'Amikacin (dưới dạng amikacin sulfat) 500 mg
  -  
500 mg', 6, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (32, N'VD-25622-16', N'A.T Arginin', N'24 tháng', N'4000', N'Viên', N'Arginin hydroclorid 400mg
  -  ', 5, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (33, N'VD-24723-16', N'A.T Arginin 1000', N'24 tháng', N'5500', N'Gói', N'Arginin hydroclorid 1000mg/10ml
  -  ', 8, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (34, N'VD-25623-16', N'A.T Arginin 200', N'24 tháng', N'2200', N'Viên', N'Arginin hydroclorid 200mg
  -  ', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (35, N'VD-24724-16', N'A.T Arginin 400', N'24 tháng', N'3815', N'3815', N'Arginin hydroclorid 400mg/10ml
  -  ', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (36, N'VD-24128-16', N'A.T Arginin 800', N'24 tháng', N'4500', N'Ống', N'Ống 10ml chứa Arginin hydroclorid 800mg
  -  
  -  ', 7, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (37, N'VD-25624-16', N'A.T Ascorbic syrup', N'24 tháng', N'5200', N'Ống', N'Acid ascorbic 100mg/5ml
  -  
100mg/5ml', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (38, N'VD-27786-17', N'A.T Atorvastatin 10 mg', N'24 tháng', N'2400', N'Viên', N'Atorvastatin (dưới dạng Atorvastatin calci trihydrat)
  -  
10 mg', 3, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (39, N'VD-27787-17', N'A.T Atorvastatin 20 mg', N'24 tháng', N'4000', N'Viên', N'Atorvastatin (dưới dạng Atorvastatin calci trihydrat)
  -  
20 mg', 4, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (40, N'VD-25625-16', N'A.T Bisoprolol 2.5', N'24 tháng', N'1400', N'Viên', N'Bisoprolol fumarat 2,5mg
  -  ', 5, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (41, N'VD-24129-16', N'A.T Bisoprolol 5', N'24 tháng', N'1500', N'Viên', N'Bisoprolol fumarat 5mg
  -  ', 8, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (42, N'VD-26742-17', N'A.T Bát vị', N'24 tháng', N'200', N'Viên', N'Thục địa
  -  
787,5 mg
Hoài sơn
  -  
720 mg
Sơn thù
  -  
660 mg
Mẫu đơn bì
  -  
487,5 mg
...', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (43, N'VD-24130-16', N'A.T Calci plus', N'24 tháng', N'4600', N'4600', N'Mỗi ống 10ml chứa: Calci glucoheptonat 700mg
  -  
Calci gluconat 300mg
  -  ', 3, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (44, N'VD-24725-16', N'A.T Calci sac', N'24 tháng', N'3200', N'Gói', N'Mỗi gói chứa: Tricalci phosphat 1650mg
  -  ', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (45, N'VD-29682-18', N'A.T Calcium 300', N'24 tháng', N'1750', N'Viên', N'Calci lactat (dưới dạng Calci lactat pentahydrat) 300 mg
  -  
300 mg', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (46, N'VD-28849-18', N'A.T Calcium cort', N'24 tháng', N'4200', N'Ống', N'Mỗi ống 10ml dung dịch chứa: Calci glucoheptonat 1100 mg
  -  
1100 mg, 100 mg, 50 mg
Vitamin C 100 mg
  -  
Vitamin PP 50 mg
  -  ', 4, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (47, N'VD-26104-17', N'A.T Calmax', N'24 tháng', N'3990', N'Ống', N'Mỗi 10ml chứa: Calci glycerophosphat 456mg
  -  
456mg, 426mg
Magnesi gluconat 426mg
  -  ', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (48, N'VD-24726-16', N'A.T Calmax 500', N'24 tháng', N'29000', N'chai', N'Calci lactat pentahydrat 500mg/10ml
  -  ', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (49, N'QLĐB-531-16', N'A.T Carboplatin', N'24 tháng', N'390000', N'Lọ', N'Carboplatin 150mg/lọ
  -  ', 3, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (50, N'QLĐB-532-16', N'A.T Carboplatin inj', N'24 tháng', N'180000', N'Lọ', N'Carboplatin 50mg/5ml
  -  ', 7, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (51, N'VD-25626-16', N'A.T Cetam 400', N'24 tháng', N'4950', N'4950', N'Mỗi 10ml chứa: Piracetam 400mg
  -  
400mg', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (52, N'QLĐB-610-17', N'A.T Cyrantabin', N'24 tháng', N'18000', N'Viên', N'Anastrozol
  -  
1 mg', 5, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (53, N'VD-24131-16', N'A.T Desloratadin', N'24 tháng', N'5000', N'Gói', N'Mỗi 5ml chứa Desloratadin 2,5mg
  -  ', 4, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (54, N'VD-25627-16', N'A.T Diosmectit', N'24 tháng', N'2600', N'Gói', N'Mỗi gói 3,5g chứa Diosmectit 3000mg
  -  ', 3, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (55, N'VD-29683-18', N'A.T Diệp hạ châu', N'24 tháng', N'1000', N'Viên', N'Cao đặc Diệp hạ châu 150 mg tương đương: Diệp hạ châu 1050 mg
  -  
1050 mg', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (56, N'VD-26743-17', N'A.T Domperidon', N'24 tháng', N'2730', N'Gói', N'Mỗi 5ml chứa: Domperidon 5mg
  -  
5mg', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (57, N'QLĐB-569-16', N'A.T Entecavir 0.5', N'24 tháng', N'28000', N'Viên', N'Entecavir (dưới dạng Entecavir monohydrat) 0,5mg
  -  ', 3, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (58, N'QLĐB-570-16', N'A.T Entecavir 1', N'24 tháng', N'48000', N'Viên', N'Entecavir (dưới dạng Entecavir monohydrat) 1mg
  -  ', 1, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (59, N'VD-26744-17', N'A.T Esomeprazol 20 inj', N'24 tháng', N'27000', N'Lọ', N'Esomeprazol (dưới dạng Esomeprazol natri)
  -  
20 mg', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (60, N'VD-27788-17', N'A.T Esomeprazol 20 tab', N'24 tháng', N'5000', N'Viên', N'Esomeprazol (dưới dạng esomeprazol magnesi dihydrat 21,7 mg)
  -  
20 mg', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (61, N'VD-24727-16', N'A.T Esomeprazol 40 inj', N'24 tháng', N'52000', N'Lọ', N'Esomeprazol (dưới dạng Esomeprazol natri) 40mg
  -  ', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (62, N'VD-27789-17', N'A.T Esomeprazol 40 tab', N'24 tháng', N'10000', N'Viên', N'Esomeprazol (dưới dạng esomeprazol magnesi dihydrat)
  -  
40 mg', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (63, N'QLĐB-579-16', N'A.T Etoposide inj', N'24 tháng', N'145000', N'Lọ', N'Etoposid 100mg/5ml
  -  
100mg/5ml', 8, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (64, N'VD-24728-16', N'A.T Famotidin 40 inj', N'24 tháng', N'76000', N'Lọ', N'Famotidin 40mg/5ml
  -  ', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (65, N'VD-29684-18', N'A.T Fexofenadin', N'24 tháng', N'8000', N'Gói', N'Mỗi 5ml hỗn dịch chứa: Fexofenadin hydroclorid 30 mg
  -  
30 mg', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (66, N'VD-25628-16', N'A.T Flu', N'24 tháng', N'5000', N'Gói', N'Mỗi 5ml chứa: Guaifenesin 100mg
  -  
100mg, 2,5mg, 5mg
Phenylephrin hydroclorid 2,5mg
  -  
Dextromethorphan hydrobromid 5mg
  -  ', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (67, N'VD-25629-16', N'A.T Furosemid inj', N'24 tháng', N'3200', N'Ống', N'Furosemid 20mg/2ml
  -  ', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (68, N'VD-27790-17', N'A.T Gentamicine', N'24 tháng', N'1980', N'Ống', N'Gentamicin (dưới dạng Gentamicin sulfat)
  -  
80 mg', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (69, N'VD-24729-16', N'A.T Glutathion 300 inj', N'24 tháng', N'62000', N'Lọ', N'Glutathion 300mg
  -  ', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (70, N'VD-27791-17', N'A.T Glutathione 600 inj', N'24 tháng', N'94000', N'Lọ', N'Glutathion
  -  
600 mg', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (71, N'VD-25630-16', N'A.T Glutathione 900 inj.', N'24 tháng', N'110000', N'Lọ', N'Glutathion 900mg
  -  ', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (72, N'VD-24730-16', N'A.T Hydrocortisone', N'24 tháng', N'13860', N'Lọ', N'Hydrocortison (dưới dạng Hydrocortison natri succinat) 100mg
  -  ', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (73, N'VD-25631-16', N'A.T Ibuprofen Syrup', N'24 tháng', N'5500', N'Ống', N'Ibuprofen 100mg/5ml
  -  ', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (74, N'VD-26746-17', N'A.T Ichmau', N'24 tháng', N'1000', N'Viên', N'Cao ích mẫu (Tỉ lệ 10:1)
  -  
400 mg
Cao hương phụ (Tỉ lệ 10:1)
  -  
125 mg
Cao ngải cứu (Tỉ lệ 10:1)
  -  
100 mg', 1, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (75, N'VD-29686-18', N'A.T Imidapril 10 mg', N'24 tháng', N'4830', N'Viên', N'Imidapril hydroclorid 10 mg
  -  
10 mg', 4, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (76, N'VD-29687-18', N'A.T Imidapril 5mg', N'24 tháng', N'4200', N'Viên', N'Imidapril hydroclorid 5 mg
  -  
5 mg', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (77, N'VD-25632-16', N'A.T Lamivudin', N'24 tháng', N'9000', N'Viên', N'Lamivudin 100mg
  -  
100mg', 5, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (78, N'VD-26105-17', N'A.T Levofloxacin 250 inj', N'24 tháng', N'48000', N'Lọ', N'Levofloxacin (dưới dạng Levofloxacin hemihydrat) 250mg/50ml
  -  
250mg/50ml', 9, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (79, N'VD-26106-17', N'A.T Levofloxacin 500 inj', N'24 tháng', N'65000', N'Lọ', N'Levofloxacin (dưới dạng Levofloxacin hemihydrat) 500mg/100ml
  -  
500mg/100ml', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (80, N'VD-31065-18', N'A.T Loperamid 2 mg', N'24 tháng', N'1005', N'Viên', N'Loperamid HCl 2 mg
  -  
2 mg', 1, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (81, N'VD-24132-16', N'A.T Loratadin', N'24 tháng', N'400', N'Viên', N'Loratadin 10mg
  -  ', 5, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (82, N'VD-25633-16', N'A.T Lục vị', N'24 tháng', N'38000', N'Chai', N'Mỗi 8ml cao lỏng chứa dịch chiết của: Thục địa 1,6g
  -  
1,6g, 0,8g, 0,8g, 0,6g, 0,6g, 0,6g
Hoài sơn 0,8g
  -  
Sơn thù 0,8g
  -  
Mẫu đơn bì 0,6g
  -  
...', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (83, N'VD-24731-16', N'A.T Neltimicin inj', N'24 tháng', N'36800', N'Ống', N'Netilmicin (dưới dạng Netilmicin sulfat) 100mg/2ml
  -  ', 1, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (84, N'QLĐB-661-18', N'A.T Oxaliplatin 50', N'24 tháng', N'610000', N'Lọ', N'Oxaliplatin 50 mg
  -  
50 mg', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (85, N'VD-24732-16', N'A.T Pantoprazol', N'24 tháng', N'40000', N'Lọ', N'Pantoprazol (dưới dạng Pantoprazol natri sesquihydrat) 40mg
  -  ', 4, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (86, N'VD-26747-17', N'A.T Perindopril 5', N'24 tháng', N'3400', N'Viên', N'Perindopril arginin 5mg
  -  
5mg', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (87, N'VD-24133-16', N'A.T Ranitidine inj', N'24 tháng', N'10000', N'Ống', N'Ranitidin (dưới dạng Ranitidin hydroclorid) 50mg/2ml
  -  ', 7, 1006)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (88, N'VD-29688-18', N'A.T Ribavirin', N'24 tháng', N'125000', N'Chai', N'Mỗi 10 ml dung dịch chứa: Ribavirin 400 mg
  -  
400 mg', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (89, N'VD-25634-16', N'A.T Rosuvastatin 20', N'24 tháng', N'8000', N'Viên', N'Rosuvastatin (dưới dạng Rosuvastatin calci) 20mg
  -  ', 2, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (90, N'VD-25635-16', N'A.T Rosuvastatin 5', N'24 tháng', N'2600', N'Viên', N'Rosuvastatin (dưới dạng Rosuvastatin calci) 5mg
  -  ', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (91, N'VD-31593-19', N'A.T Salbutamol inj', N'24 tháng', N'5670', N'Ống', N'Mỗi 1ml chứa Salbutamol (dưới dạng Salbutamol sulfat) 0,5 mg
  -  
0,5 mg', 5, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (92, N'VD-32501-19', N'A.T Silymarin 117 mg', N'24 tháng', N'5500', N'Viên', N'Silymarin (Chiết xuất Cardus marianus) 117 mg
  -  
117 mg', 9, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (93, N'VD-26107-17', N'A.T Simvastatin 20', N'24 tháng', N'2400', N'Viên', N'Simvastatin 20mg
  -  
20mg', 8, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (94, N'VD-31594-19', N'A.T Sitagpiptin 100mg', N'36 tháng', N'18900', N'Viên', N'Sitagliptin (dưới dạng Sitagliptin phosphate monohydrate) 100 mg
  -  
100 mg', 4, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (95, N'VD-31595-19', N'A.T Sitagpiptin 50 mg', N'36 tháng', N'11000', N'Viên', N'Sitagliptin (dưới dạng Sitagliptin phosphate monohydrate) 50mg
  -  
50mg', 6, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (96, N'VD-25636-16', N'A.T Sucralfate', N'24 tháng', N'4500', N'Gói', N'Mỗi gói 5g bột chứa: Sucralfat 1000mg
  -  
1000mg', 5, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (97, N'VD-30295-18', N'A.T Teicoplanin 200 inj', N'24 tháng', N'210000', N'Lọ', N'Mỗi lọ chứa: Teicoplanin 200 mg
  -  
200 mg', 8, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (98, N'VD-25637-16', N'A.T Tobramycine inj', N'24 tháng', N'18000', N'Ống', N'Tobramycin 80mg/2ml
  -  
80mg/2ml', 3, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (99, N'VD-25638-16', N'A.T Tranexamic inj', N'24 tháng', N'7500', N'Ống', N'Tranexamic acid 250mg/5ml
  -  
250mg/5ml', 7, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (100, N'VD-29685-18', N'A.T hoạt huyết dưỡng', N'24 tháng', N'82000', N'Chai', N'Mỗi 8 ml chứa: Cao lá bạch quả (tương đương 9,6 mg Ginkoflavon Glycosid toàn phần) 40 mg
  -  
40 mg, 120 mg
Cao rễ đinh lăng (tỉ lệ 10:1) 120 mg
  -  ', 4, 848)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (101, N'VD-26745-17', N'A.T ích mẫu điều kinh', N'24 tháng', N'30000', N'Chai', N'Mỗi 8ml chứa: Cao ích mẫu (Tỉ lệ 10:1) 533,33mg
  -  
533,33mg, 166,66mg, 133,33mg
Cao hương phụ (Tỉ lệ 10:1) 166,66mg
  -  
Cao ngải cứu (Tỉ lệ 10:1) 133,33mg
  -  ', 8, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (102, N'VD-3467-07', N'A9 - Cerebrazel', N'36 tháng', N'1050', N'Viên', N'Meclofenoxat.HCl
  -  ', 4, 951)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (103, N'VN-15842-12', N'AB Ausbiobone', N'36 tháng', N'5000', N'Viên', N'Glucosamin sulfate potassium chlorid complex, Manganese gluconate, Chondroitin sulfate
  -  
295mg Glucosamin', 3, 1015)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (104, N'VN-15868-12', N'AB Extrabone-Care+', N'36 tháng', N'7000', N'Viên', N'Calcium aminoacid chelate, Calcium phosphate, Calcium citrate, Magnesium oxide nặng, Magnesium phosphate, Zinc aminoacid chelate, Manganese aminoacid chelate, Acid ascorbic, Vitamin D3, Acid folic
  -  
.', 2, 1031)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (105, N'VN-15010-12', N'AB Glucosamine', N'36 tháng', N'3200', N'Viên', N'Glucosamin Sulfate Potassium Chlorid Complex
  -  
500mg', 3, 1015)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (106, N'VD-21854-14', N'ABAB 500 mg', N'48 tháng', N'286', N'Viên', N'Acetaminophen 500 mg
  -  ', 8, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (107, N'VD-21855-14', N'ABAB 500 mg', N'48 tháng', N'286', N'Viên', N'Acetaminophen 500 mg
  -  ', 3, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (108, N'VD-22162-15', N'ABAB 500 mg', N'48 tháng', N'250', N'Viên', N'Paracetamol 500 mg
  -  ', 7, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (109, N'VD-20748-14', N'ABAB 500mg', N'48 tháng', N'286', N'Viên', N'Acetaminophen
  -  
500 mg', 5, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (110, N'VD-20749-14', N'ABAB 500mg', N'48 tháng', N'286', N'Viên', N'Acetaminophen
  -  
500 mg', 5, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (111, N'VD-16478-12', N'ABROCTO', N'24 tháng', N'7800', N'Ống', N'Ambroxol HCl 15mg/5ml
  -  
--', 8, 879)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (112, N'VD-13824-11', N'AC-Diclo', N'24 tháng', N'660', N'Viên', N'paracetamol 500mg, diclofenac natri 50mg
  -  ', 5, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (113, N'VN-19978-16', N'ACC 200 mg', N'24 tháng', N'2677', N'Gói', N'Acetylcystein
  -  
200 mg', 2, 992)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (114, N'VN-11089-10', N'ACC 200mg (Đóng gói & xuất xưởng: Slutas Pharma GmbH - Đức)', N'48 tháng', N'2677', N'Gói', N'Acetylcystein
  -  
200mg', 8, 992)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (115, N'VD-25107-16', N'ACM Control 1', N'24 tháng', N'2400', N'Viên', N'Acenocoumarol
  -  
1mg', 6, 884)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (116, N'VD-25594-16', N'ACM Control 4', N'24 tháng', N'3000', N'Viên', N'Acenocoumarol
  -  
4mg', 5, 884)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (117, N'VD-15499-11', N'AD - Liver', N'24 tháng', N'1750', N'Viên', N'Cao diệp hạ châu 100mg, cao nhân trần 50mg, cao cỏ nhọ nồi 50mg
  -  ', 8, 954)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (118, N'VD-23657-15', N'AD Tamy', N'30 tháng', N'650', N'Viên', N'Vitamin A (Retinol palmitat) 2000IU
  -  
Vitamin D3 250IU
  -  ', 7, 933)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (119, N'VD-13019-10', N'ADNaphazolin - New', N'24 tháng', N'25000', N'Lọ', N'Naphazolin 8 mg, Natri Clorid 144 mg
  -  ', 2, 903)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (120, N'VD-10977-10', N'AG-Ome', N'24 tháng', N'1100', N'Viên', N'Omeprazol magnesi tương đương với 20 mg Omeprazol
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (121, N'VD-20653-14', N'AG-Ome', N'36 tháng', N'1350', N'Viên', N'Omeprazol (Dạng vi hạt bao tan trong ruột)
  -  
20 mg', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (122, N'VD-26474-17', N'AM Itori 60', N'36 tháng', N'3600', N'Viên', N'Etoricoxib 60 mg
  -  
60 mg', 5, 857)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (123, N'VN-20887-18', N'AMK 457', N'24 tháng', N'168000', N'Chai', N'Amoxicillin (dưới dạng amoxicillin trihydrat)
  -  
400mg/5ml
Acid clavulanic (dưới dạng kali clavulanat)
  -  
57mg/5ml', 2, 1020)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (124, N'VN-10135-10', N'AMK 625', N'24 tháng', N'9450', N'Viên', N'Amoxicillin 500mg
  -  
--
Potassium clavulanate (tương đương 125mg acid clavulanic)
  -  ', 9, 1020)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (125, N'VD-26141-17', N'AN KHỚP VƯƠNG', N'24 tháng', N'5000', N'Viên', N'Độc hoạt, quế chi, phòng phong, đương quy, tế tân, xuyên khung, tần giao, bạch thược, tang ký sinh, can địa hoàng, đỗ trọng, đảng sâm, ngưu tất, bạch linh, cam thảo
  -  
0,9g', 4, 924)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (126, N'VD-32057-19', N'ANC', N'36 tháng', N'27500', N'Chai', N'Mỗi 5ml dung dịch chứa: N-Acetylcystein 200mg
  -  
200mg', 3, 905)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (127, N'VD-27800-17', N'ATIHEM', N'24 tháng', N'3800', N'Ống', N'Mỗi 10ml dung dịch chứa: Sắt (dưới dạng sắt gluconat) 50 mg
  -  
50 mg, 10,78 mg, 5 mg
Mangan gluconat 10,78 mg
  -  
Đồng gluconat 5 mg
  -  ', 6, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (128, N'VD-27208-17', N'ATP', N'36 tháng', N'950', N'Viên', N'Dinatri adenosin triphosphat
  -  
20mg', 5, 905)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (129, N'VD-32203-19', N'AXOFINEN 100', N'36 tháng', N'5500', N'Viên', N'Flurbiprofen 100mg
  -  
100mg', 8, 908)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (130, N'VN-18861-15', N'Aarmol 100ml', N'24 tháng', N'21000', N'Chai', N'Paracetamol
  -  
1 g/100 ml', 4, 1029)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (131, N'VN2-643-17', N'Abacavir Tablets USP 300mg', N'60 tháng', N'11000', N'Viên', N'Abacavir (dưới dạng Abacavir sulfat)
  -  
300 mg', 2, 1003)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (132, N'VD-17384-12', N'Abicin 250', N'36 tháng', N'26250', N'Lọ', N'Amikacin sulfat
  -  
Amikacin 250mg', 2, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (133, N'VD-30650-18', N'Abicin 250', N'36 tháng', N'24000', N'Lọ', N'Amikacin (dưới dạng Amikacin sulfat)
  -  
250mg', 1, 891)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (134, N'VN-15663-12', N'Abicof Syrup', N'36 tháng', N'48000', N'Lọ', N'Diphenhydramine HCl
  -  
16mg
Amonium Chloride
  -  
135mg
Sodium Citrate
  -  
57mg
Menthol
  -  
3,8mg
...', 9, 1048)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (135, N'VN-21764-19', N'Abifish', N'36 tháng', N'55000', N'Lọ', N'Ibuprofen 100mg/5ml
  -  
100mg
  -  ', 3, 1010)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (136, N'VN2-53-13', N'Abingem 200', N'24 tháng', N'547500', N'Lọ', N'Gemcitabine
  -  
200mg', 3, 1005)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (137, N'VD3-19-18', N'Abingem-1,4gm (Cơ sở sản xuất và đóng gói sơ cấp: Naprod life sciences pvt.ltd. Địa chỉ: 304, Town Centre, 3rd Floor, Andheri-Kurla Road, Near Mittal estate, Andheri (East), Mumbai-400059, India)', N'24 tháng', N'1400000', N'Lọ', N'Gemcitabin (dưới dạng Gemcitabin hydrochlorid) 1,4 g
  -  
1,4 g', 4, 1007)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (138, N'VN-16899-13', N'Abitrax', N'36 tháng', N'52000', N'Lọ', N'Ceftriaxone (dưới dạng Ceftriaxone natri)
  -  
1g', 5, 988)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (139, N'NC49-H12-15', N'Abivina', N'24 tháng', N'3085', N'Viên', N'Cao khô bồ bồ
  -  
170mg
Tinh dầu bồ bồ
  -  
0,002ml', 9, 1043)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (140, N'V53-H12-16', N'Abivina (Gia hạn lần 1)', N'24 tháng', N'3050', N'Viên', N'Cao khô Bồ bồ 170mg
  -  
Tinh dầu Bồ bồ 0,002ml
  -  ', 3, 1043)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (141, N'VD-25057-16', N'Abochlorphe', N'36 tháng', N'106', N'Viên', N'Chlorpheniramin maleat
  -  
4mg', 7, 835)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (142, N'VN-15416-12', N'Absolox (Đóng gói bởi: OLIC (Thailand) Limited - 166 Moo 16, Bangpa-In Industrial Estate, Udomsorayuth Road, Bangpa-In District, Ayutthaya Province, Thailand)', N'48 tháng', N'4620', N'Viên', N'Dinoprostone 10mg/01 hệ phân phối thuốc
  -  
60mg loxoprofen sodium
  -  ', 2, 963)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (143, N'VD-30009-18', N'Abvaceff 100', N'36 tháng', N'6900', N'Viên', N'Cefpodoxim (dưới dạng Cefpodoxim proxetil) 100 mg
  -  
100 mg', 3, 870)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (144, N'VD-32254-19', N'Abvaceff 100', N'36 tháng', N'8500', N'Gói', N'Mỗi gói 3g chứa Cefpodoxime (dưới dạng Cefpodoxime proxetil) 100mg
  -  
100mg', 9, 898)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (145, N'VD-28367-17', N'Abvaceff 200', N'36 tháng', N'16000', N'Gói', N'Cefpodoxim (dưới dạng Cefpodoxim proxetil)
  -  
200 mg', 2, 870)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (146, N'VN-12744-11', N'Abydium', N'48 tháng', N'180', N'Viên', N'Loperamide HCl BP
  -  
2mg', 7, 1048)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (147, N'VN-21345-18', N'Acabrose Tablets 50mg', N'24 tháng', N'2250', N'Viên', N'Acarbose
  -  
50mg', 4, 1034)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (148, N'VD-30296-18', N'Acantan 16', N'36 tháng', N'5000', N'Viên', N'Candesartan cilexetil 16 mg
  -  
16 mg', 6, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (149, N'VD-30297-18', N'Acantan 8', N'36 tháng', N'3300', N'Viên', N'Candesartan cilexetil 8 mg
  -  
8 mg', 9, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (150, N'VD-30298-18', N'Acantan HTZ 16-12.5', N'36 tháng', N'4800', N'Viên', N'Candesartan cilexetil 16 mg
  -  
16 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 2, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (151, N'VD-30299-18', N'Acantan HTZ 8-12.5', N'36 tháng', N'3880', N'Viên', N'Candesartan cilexetil 8 mg
  -  
8 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 1, 915)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (152, N'VD-14507-11', N'Acapella-S', N'36 tháng', N'2000', N'Viên', N'Simethicon 30mg, biodiastase 2000 I 10mg, Lipase II 10mg, cellulase AP3 II 25mg
  -  ', 1, 893)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (153, N'VN-21983-19', N'Acarbose Friulchem (Đóng gói &xuất xưởng: Lamp San Prospero SPA, địa chỉ: Via Della Pace, 25/A-41030 San Prospero (MO), Italy', N'24 tháng', N'2700', N'Viên', N'Acarbose 50mg
  -  
  -  ', 4, 970)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (154, N'VN-9858-10', N'Acarbose Tablets 50mg', N'36 tháng', N'2250', N'Viên', N'Acarbose
  -  
50mg/ viên', 9, 1034)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (155, N'VD-24153-16', N'Acarfar', N'36 tháng', N'2100', N'Viên', N'Acarbose
  -  
50mg', 8, 946)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (156, N'VN-20830-17', N'Acc Pluzz 200', N'24 tháng', N'6700', N'Viên', N'Acetylcystein
  -  
200mg', 6, 978)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (157, N'VN-19302-15', N'Accupril', N'24 tháng', N'3254', N'Viên', N'Quinapril (dưới dạng Quinapril HCl) 5mg
  -  ', 9, 1011)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (158, N'VN-5566-10', N'Accupril', N'36 tháng', N'3254', N'viên', N'Quinapril
  -  
5mg/viên', 7, 974)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (159, N'VD-22211-15', N'Acdinral', N'36 tháng', N'490', N'Viên', N'Clorpheniramin maleat 2mg
  -  
Phenylephrin HCl 10mg
  -  ', 8, 940)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (160, N'VD-17887-12', N'Ace kid 150', N'36 tháng', N'1260', N'Gói', N'Paracetamol
  -  
150 mg
vitamin C
  -  
75 mg', 1, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (161, N'VD-18248-13', N'Ace kid 325', N'36 tháng', N'2940', N'gói', N'Paracetamol
  -  
325 mg', 9, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (162, N'VD-17385-12', N'Ace kid 80', N'36 tháng', N'1575', N'Gói', N'Paracetamol
  -  
80mg', 1, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (163, N'VD-13330-10', N'Ace-Cold', N'36 tháng', N'1260', N'Gói', N'Acetylcystein 200mg
  -  ', 5, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (164, N'VD-15204-11', N'Aceblue 100', N'36 tháng', N'1960', N'Gói', N'Acetylcystein 100mg
  -  ', 8, 949)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (165, N'VN-20992-18', N'Aceclofen', N'36 tháng', N'15100', N'viên', N'Paracetamol
  -  
500mg
Diclofenac natri
  -  
50mg', 7, 1024)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (166, N'VD-27911-17', N'Aceclofenac', N'36 tháng', N'700', N'Viên', N'Aceclofenac 100mg
  -  
100mg', 8, 928)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (167, N'VD-14511-11', N'Aceclofenac PMP', N'24 tháng', N'1300', N'Viên', N'Aceclofenac 100 mg
  -  ', 7, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (168, N'VD-20124-13', N'Aceclofenac Stada 100 mg', N'36 tháng', N'701', N'701', N'Aceclofenac
  -  
100 mg', 8, 864)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (169, N'VN-20696-17', N'Aceclonac', N'36 tháng', N'5900', N'Viên', N'Aceclofenac
  -  
100 mg', 6, 1021)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (170, N'VD-25277-16', N'Acecontin', N'36 tháng', N'2850', N'Viên', N'Methocarbamol 750mg
  -  ', 2, 940)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (171, N'VD-13301-10', N'Acecyst', N'24 tháng', N'850', N'viên', N'Acetylcystein 200mg
  -  ', 9, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (172, N'VD-23483-15', N'Acecyst', N'24 tháng', N'2050', N'Gói', N'Mỗi gói 1,6g chứa Acetylcystein 200mg
  -  
  -  ', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (173, N'VD-25112-16', N'Acecyst', N'24 tháng', N'850', N'Viên', N'Acetylcystein
  -  
200 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (174, N'VD-14108-11', N'Acedanyl', N'24 tháng', N'720', N'Viên', N'Acetyl leucin 500mg
  -  ', 6, 1049)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (175, N'VD-30195-18', N'Acedanyl', N'36 tháng', N'1450', N'Viên', N'Acetyl leucin 500mg
  -  
500mg', 9, 837)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (176, N'VD-25673-16', N'Acefalgan 250', N'36 tháng', N'1800', N'Gói', N'Paracetamol
  -  
250mg', 7, 887)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (177, N'VD-23528-15', N'Acefalgan 500', N'24 tháng', N'2100', N'Viên', N'Paracetamol
  -  
500mg', 2, 887)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (178, N'VD-26134-17', N'Acefalgan 500', N'36 tháng', N'918', N'Viên', N'Acetaminophen
  -  
500 mg', 1, 887)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (179, N'VD-26135-17', N'Acefalgan Codein', N'18 tháng', N'2630', N'Viên', N'Paracetamol
  -  
500mg, 30mg
Codein phosphat hemihydrat
  -  ', 5, 887)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (180, N'VN-15700-12', N'Acefdrox-250', N'36 tháng', N'35000', N'Chai', N'Cefadroxil
  -  
250mg/5ml', 6, 803)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (181, N'VD-17472-12', N'Aceffex', N'30 tháng', N'1900', N'Viên', N'Các Vitamin A, B1, B2, PP, B6, B12, D3
  -  
Sắt sulfat
  -  
Lysine HCl
  -  
Calci glycerophosphat
  -  
...', 7, 933)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (182, N'VD-24204-16', N'Acegoi', N'24 tháng', N'1620', N'Gói', N'Mỗi gói chứa: Paracetamol 325mg
  -  
Natri benzoat 100mg
  -  
Clorpheniramin maleat 2mg
  -  ', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (183, N'VD-15582-11', N'Acehasan 100', N'24 tháng', N'1020', N'Gói', N'Acetylcystein
  -  
100 mg', 6, 859)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (184, N'VD-28535-17', N'Acehasan 100', N'24 tháng', N'1000', N'Gói', N'Mỗi gói 2g chứa: Acetylcystein 100mg
  -  
100mg', 1, 860)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (185, N'VD-15583-11', N'Acehasan 200', N'24 tháng', N'1140', N'Gói', N'Acetylcystein
  -  
200mg', 2, 859)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (186, N'VD-19179-13', N'Acehasan 200', N'36 tháng', N'465', N'Viên', N'Acetylcystein
  -  
200 mg', 9, 859)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (187, N'VD-30095-18', N'Acehasan 200', N'24 tháng', N'2200', N'Gói', N'Mỗi gói 3g chứa: Acetylcystein 200mg
  -  
200mg', 4, 860)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (188, N'VN-11171-10', N'Acemarksans 100', N'36 tháng', N'350', N'Viên', N'Aceclofenac
  -  
100mg', 3, 993)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (189, N'VN-16828-13', N'Acemed Tablets', N'36 tháng', N'900', N'Viên', N'Aceclofenac 100mg
  -  ', 8, 996)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (190, N'VD-10762-10', N'Acemetacin Stada 60mg', N'24 tháng', N'480', N'viên', N'Acemetacin 60mg
  -  ', 1, 960)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (191, N'VD-27875-17', N'Acemetin', N'24 tháng', N'1650', N'Gói', N'Acetylcystein
  -  
200 mg', 4, 924)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (192, N'VD-16812-12', N'Acemol', N'42 tháng', N'263', N'Viên', N'Paracetamol 325mg/ viên
  -  
--', 9, 912)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (193, N'VD-27730-17', N'Acemol Extra', N'36 tháng', N'700', N'Viên', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 9, 910)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (194, N'VD-20645-14', N'Acemol NDP 325', N'42 tháng', N'375', N'Viên', N'Paracetamol 325mg
  -  ', 9, 909)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (195, N'VD-20646-14', N'Acemol NDP 500', N'42 tháng', N'450', N'Viên', N'Paracetamol 500mg
  -  ', 5, 909)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (196, N'VD-16814-12', N'Acemol enfant', N'36 tháng', N'128', N'Viên', N'Paracetamol 100mg/ viên
  -  
--', 6, 912)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (197, N'VD-24693-16', N'Acemol fort', N'36 tháng', N'560', N'Viên', N'Acetaminophen
  -  
650 mg', 9, 910)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (198, N'VD-28809-18', N'Acemol plus', N'36 tháng', N'986', N'Viên', N'Paracetamol 500 mg
  -  
500 mg, 15 mg, 5 mg
Dextromethorphan HBr 15 mg
  -  
Phenylephrin hydroclorid 5 mg
  -  ', 9, 910)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (199, N'GC-274-17', N'Acemuc 200mg', N'36 tháng', N'2441', N'Gói', N'Acetylcystein
  -  
200 mg', 5, 800)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (200, N'VD-17405-12', N'Acenac 100', N'36 tháng', N'540', N'Viên', N'Aceclofenac
  -  
100 mg', 8, 920)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (201, N'VD-10858-10', N'Acenews', N'24 tháng', N'500', N'Viên', N'Acetylcystein 200mg
  -  ', 1, 1050)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (202, N'VD-10859-10', N'Acenews', N'24 tháng', N'1200', N'Gói', N'Acetyl cystein 100mg
  -  ', 6, 1050)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (203, N'VD-10860-10', N'Acenews', N'24 tháng', N'1000', N'Gói', N'Acetylcystein 200mg
  -  ', 9, 1050)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (204, N'VD-25997-16', N'Acenews', N'36 tháng', N'1200', N'Gói', N'Mỗi gói 3 g chứa Acetylcystein 100 mg
  -  
100 mg', 4, 865)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (205, N'VD-26588-17', N'Acenews', N'36 tháng', N'1200', N'Gói', N'Mỗi gói 2 g chứa Acetylcystein 200 mg
  -  
200 mg', 4, 865)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (206, N'VD-29515-18', N'Acenews', N'36 tháng', N'10000', N'Viên', N'Acetylcystein 200 mg
  -  
200 mg', 7, 865)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (207, N'VD-22293-15', N'Acenocoumarol-VNP 1', N'36 tháng', N'2700', N'Viên', N'Acenocoumarol 1mg
  -  ', 3, 897)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (208, N'VD-22294-15', N'Acenocoumarol-VNP 4', N'36 tháng', N'3300', N'Viên', N'Acenocoumarol 4mg
  -  ', 7, 897)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (209, N'VD-20679-14', N'Acepron 325 mg', N'36 tháng', N'850', N'Gói', N'Paracetamol
  -  
325 mg', 1, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (210, N'VD-20680-14', N'Acepron 500 mg', N'36 tháng', N'300', N'Viên', N'Paracetamol
  -  
500 mg', 8, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (211, N'VD-22822-15', N'Acepron 650', N'36 tháng', N'435', N'Viên', N'Paracetamol
  -  
650 mg', 9, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (212, N'VD-22122-15', N'Acepron 80', N'36 tháng', N'650', N'Gói', N'Paracetamol 80 mg/1,5g
  -  ', 8, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (213, N'VD-20681-14', N'Acepron Codein', N'36 tháng', N'1365', N'Viên', N'Paracetamol
  -  
500 mg
Codein phosphat hemihydrat
  -  
30 mg', 5, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (214, N'VD-13744-11', N'Acetab 325', N'36 tháng', N'270', N'Viên', N'Paracetamol 325mg
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (215, N'VD-22437-15', N'Acetab 325', N'24 tháng', N'270', N'Viên', N'Paracetamol
  -  
325 mg', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (216, N'VD-27742-17', N'Acetab 325', N'36 tháng', N'270', N'Viên', N'Paracetamol 325 mg
  -  
325 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (217, N'VD-12764-10', N'Acetab 650', N'24 tháng', N'700', N'Viên', N'Paracetamol 650 mg
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (218, N'VD-26090-17', N'Acetab 650', N'36 tháng', N'700', N'Viên', N'Paracetamol
  -  
650 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (219, N'VD-14663-11', N'Acetab Extra', N'36 tháng', N'600', N'Viên', N'Mỗi viên chứa Paracetamol 500mg
  -  
Cafein 65mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (220, N'VD-28816-18', N'Acetab extra', N'36 tháng', N'600', N'Viên', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (221, N'VD-17011-12', N'Acetalvic-codein 8', N'36 tháng', N'800', N'Viên', N'Paracetamol 500mg
  -  
--
Codein phosphat 8mg
  -  ', 1, 949)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (222, N'VD-10281-10', N'Acetaphen 500', N'48 tháng', N'500', N'Viên', N'Acetaminophen 500mg
  -  ', 2, 888)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (223, N'VD-11640-10', N'Acetaphen Extra', N'36 tháng', N'1500', N'Viên', N'Acetaminophen 500mg
  -  
cafein 65mg
  -  ', 8, 888)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (224, N'VD-15871-11', N'Acetate Ringer', N'36 tháng', N'17000', N'Chai', N'Sodium chloride, Potassium chloride, Calcium chloride dihydrate, sodium acetate trihydrat
  -  ', 3, 956)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (225, N'VD-24018-15', N'Acetate Ringer''s', N'60 tháng', N'17988', N'Chai', N'Mỗi 500ml chứa: Natri clorid 3g
  -  
Kali clorid 0,15g
  -  
Calci clorid.2H2O 0,1g
  -  
Natri acetat.3H2O 1,9g
  -  
...', 5, 866)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (226, N'VD-13361-10', N'Acetazolamid', N'36 tháng', N'735', N'Viên', N'Acetazolamid 250 mg
  -  ', 6, 946)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (227, N'VD-27844-17', N'Acetazolamid', N'36 tháng', N'735', N'Viên', N'Acetazolamid 250mg
  -  
250mg', 3, 946)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (228, N'VN-9905-10', N'Aceteming', N'36 tháng', N'761', N'Viên', N'Acetaminophen, Caffein
  -  
500mg/65mg', 3, 842)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (229, N'VD-20936-14', N'Acethepharm', N'24 tháng', N'1600', N'Gói', N'Acetylcystein
  -  
200mg', 9, 955)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (230, N'VN-20093-16', N'Acetra', N'36 tháng', N'1700', N'Viên', N'Tramadol hydrochlorid 37,5 mg
  -  
Acetaminophen 325mg
  -  ', 5, 1038)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (231, N'VD-32111-19', N'Acetuss', N'24 tháng', N'6700', N'Ống', N'Mỗi 10ml chứa: N-Acetylcystein 200mg
  -  
200mg', 5, 906)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (232, N'VD-20043-13', N'Acetydona 200 mg', N'36 tháng', N'550', N'Viên', N'Acetylcystein
  -  
200 mg', 2, 958)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (233, N'VD-3518-07', N'Acetydona 200 mg', N'36 tháng', N'550', N'Viên', N'Acetylcystein
  -  ', 8, 958)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (234, N'VD-17430-12', N'Acetyl Cystein', N'24 tháng', N'1500', N'Gói', N'Acetylcystein
  -  
200 mg', 8, 924)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (235, N'VD-23472-15', N'Acetylcistein 200 mg', N'36 tháng', N'1200', N'Gói', N'Mỗi gói 1,5g chứa: Acetylcystein 200 mg
  -  ', 4, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (236, N'VD-14163-11', N'Acetylcystein', N'24 tháng', N'1500', N'gói 1,5g', N'Acetylcystein 200mg/ gói
  -  ', 5, 883)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (237, N'VD-16381-12', N'Acetylcystein', N'36 tháng', N'470', N'viên', N'Acetylcystein 200mg
  -  
--', 7, 845)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (238, N'VD-16815-12', N'Acetylcystein', N'36 tháng', N'685', N'viên', N'Acetylcystein 200mg/ viên
  -  
--', 1, 912)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (239, N'VD-17864-12', N'Acetylcystein', N'30 tháng', N'2108', N'gói', N'Acetylcystein
  -  
200 mg', 5, 909)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (240, N'VD-21827-14', N'Acetylcystein', N'36 tháng', N'810', N'Gói', N'Acetylcystein 200 mg
  -  ', 8, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (241, N'VD-27595-17', N'Acetylcystein', N'36 tháng', N'570', N'Viên', N'Acetylcystein
  -  
200mg', 7, 835)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (242, N'VD-30156-18', N'Acetylcystein', N'36 tháng', N'562', N'Viên', N'Acetylcystein 200mg
  -  
200mg', 3, 835)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (243, N'VD-30628-18', N'Acetylcystein', N'24 tháng', N'1500', N'Gói', N'Mỗi gói 1,5g chứa: Acetylcystein 200mg
  -  
200mg', 7, 902)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (244, N'VD-18919-13', N'Acetylcystein', N'24 tháng', N'714', N'Viên', N'Acetylcystein
  -  
200mg', 4, 884)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (245, N'VD-26163-17', N'Acetylcystein 200', N'24 tháng', N'2000', N'Gói', N'Mỗi gói 2g chứa: Acetylcystein 200 mg
  -  
200 mg', 8, 927)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (246, N'VD-23568-15', N'Acetylcystein 200 mg', N'24 tháng', N'875', N'Viên', N'Acetylcystein 200 mg
  -  ', 7, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (247, N'VD-29875-18', N'Acetylcystein 200 mg', N'36 tháng', N'810', N'Gói', N'Acetylcystein
  -  
200mg', 2, 839)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (248, N'VD-13874-11', N'Acetylcystein 200mg', N'36 tháng', N'472', N'Viên', N'N - Acetylcystein 200 mg
  -  ', 5, 940)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (249, N'VD-14765-11', N'Acetylcystein 200mg', N'36 tháng', N'872', N'Gói', N'N-Acetyl cystein 200mg
  -  ', 4, 940)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (250, N'VD-16282-12', N'Acetylcystein 200mg', N'36 tháng', N'1000', N'Gói', N'Acetylcystein 200mg
  -  
--', 2, 949)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (251, N'VD-19483-13', N'Acetylcystein 200mg', N'36 tháng', N'1100', N'Gói', N'Acetylcystein 200mg
  -  ', 3, 840)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (252, N'VD-21910-14', N'Acetylcystein 200mg', N'36 tháng', N'407', N'Viên', N'Acetylcystein
  -  
200mg', 7, 840)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (253, N'VD-31912-19', N'Acetylcystein 200mg', N'36 tháng', N'690', N'Viên', N'Acetylcystein
  -  
200mg', 1, 940)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (254, N'VD-14257-11', N'Acetylcystein Boston 100', N'24 tháng', N'1100', N'Gói', N'Acetylcystein 100mg
  -  ', 2, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (255, N'VD-26762-17', N'Acetylcystein Boston 100', N'36 tháng', N'1100', N'Gói', N'Acetylcystein
  -  
100 mg', 3, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (256, N'VD-13770-11', N'Acetylcystein Boston 200', N'24 tháng', N'1700', N'Gói', N'Acetyl cystein 200mg
  -  ', 4, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (257, N'VD-26763-17', N'Acetylcystein Boston 200', N'36 tháng', N'1700', N'Gói', N'Acetylcystein
  -  
200 mg', 7, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (258, N'VD-22667-15', N'Acetylcystein Stada 200 mg', N'24 tháng', N'713', N'Viên', N'Acetylcystein 200 mg
  -  ', 2, 862)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (259, N'VD-17908-12', N'Acetylcysteine', N'24 tháng', N'600', N'Viên', N'Acetylcystein
  -  
200 mg', 5, 924)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (260, N'VN-5195-10', N'Acetylcysteine Solution, USP', N'36 tháng', N'295000', N'Lọ', N'Acetylcystein
  -  
--', 8, 823)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (261, N'VD-26619-17', N'Acetylcysterin', N'36 tháng', N'477', N'Viên', N'Acetylcystein 200mg
  -  
200mg', 2, 835)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (262, N'VD-14244-11', N'Acezym 600', N'36 tháng', N'75000', N'Lọ', N'Glutathion 600mg
  -  ', 5, 916)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (263, N'VN-12142-11', N'Acicef - 200', N'36 tháng', N'3000', N'Viên', N'Cefixime
  -  
200mg Cefixime', 6, 803)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (264, N'VD-14045-11', N'Aciclovir', N'36 tháng', N'1250', N'Viên', N'Aciclovir 200mg
  -  ', 8, 876)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (265, N'VD-19639-13', N'Aciclovir', N'36 tháng', N'700', N'Viên', N'Aciclovir 200 mg
  -  ', 9, 857)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (266, N'VD-20188-13', N'Aciclovir', N'36 tháng', N'2230', N'Viên', N'Aciclovir
  -  
400mg', 6, 946)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (267, N'VD-20321-13', N'Aciclovir', N'36 tháng', N'900', N'Viên', N'Aciclovir 200mg
  -  ', 3, 894)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (268, N'VD-28139-17', N'Aciclovir', N'36 tháng', N'1250', N'Viên', N'Aciclorvir 200mg
  -  
200mg', 4, 950)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (269, N'VD-11489-10', N'Aciclovir 200', N'36 tháng', N'2500', N'Viên', N'Aciclovir 200mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (270, N'VD-16803-12', N'Aciclovir 200 mg', N'36 tháng', N'450', N'Viên', N'Acyclovir
  -  
200mg', 4, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (271, N'VD-22934-15', N'Aciclovir 200mg', N'36 tháng', N'1200', N'Viên', N'Aciclovir 200mg
  -  ', 9, 932)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (272, N'VD-17856-12', N'Aciclovir 400 mg', N'36 tháng', N'680', N'Viên', N'Aciclovir
  -  
400 mg', 1, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (273, N'VD-24375-16', N'Aciclovir 400 mg', N'36 tháng', N'2530', N'Viên nang mềm', N'Aciclovir 400mg
  -  ', 5, 954)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (274, N'VD-18434-13', N'Aciclovir 5%', N'36 tháng', N'10000', N'Tuýp', N'Aciclovir
  -  
250mg', 5, 954)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (275, N'VD-11490-10', N'Aciclovir 800', N'36 tháng', N'5200', N'Viên', N'Aciclovir 800mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (276, N'VN-19565-16', N'Aciclovir Cream BP', N'24 tháng', N'6840', N'Tuýp', N'Aciclovir
  -  
5% w/w', 1, 828)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (277, N'VD-16333-12', N'Aciclovir MKP 200', N'36 tháng', N'1200', N'Viên', N'Aciclovir 200mg
  -  
--', 2, 956)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (278, N'VD-16647-12', N'Aciclovir MKP 5%', N'24 tháng', N'11250', N'tuýp', N'Aciclovir 250mg
  -  
--', 9, 956)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (279, N'VD-16082-11', N'Aciclovir MKP 800', N'36 tháng', N'2500', N'Viên', N'Aciclovir 800mg
  -  
--', 1, 956)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (280, N'VD-23266-15', N'Aciclovir Meyer', N'36 tháng', N'2050', N'Viên', N'Aciclovir 800 mg
  -  ', 3, 857)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (281, N'VN-16414-13', N'Acid Alendronic Farmoz', N'48 tháng', N'65000', N'Viên', N'Alendronic Acid (dưới dạng Alendronate sodium) 70mg
  -  ', 7, 1045)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (282, N'VD-16826-12', N'Acid Folic 5 mg', N'24 tháng', N'252', N'Viên', N'acid folic
  -  
5mg', 6, 885)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (283, N'VD-19107-13', N'Acid folic MKP', N'24 tháng', N'540', N'Viên', N'Acid folic
  -  
5 mg', 2, 957)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (284, N'VD-26894-17', N'Acid tranexamic 500mg', N'36 tháng', N'2500', N'Viên', N'Acid tranexamic 500 mg
  -  
500 mg', 9, 932)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (285, N'VN-20980-18', N'Acido Tranexamico Bioindustria L.I.M', N'36 tháng', N'21546', N'Ống', N'Acid tranexamic
  -  
500 mg', 7, 825)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (286, N'VN-16660-13', N'Acido Zoledronico Richet', N'24 tháng', N'2950000', N'Lọ', N'Zoledronic acid 4mg/5ml
  -  ', 1, 989)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (287, N'VD-21216-14', N'Acigmentin 1000', N'36 tháng', N'9000', N'Viên', N'Amoxicilin (dưới dạng Amoxicilin trihydrat)
  -  
875 mg
Acid Clavulanic (dưới dạng Clavulanat kali)
  -  
125 mg', 7, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (288, N'VD-21217-14', N'Acigmentin 312,5', N'36 tháng', N'5000', N'Gói', N'Amoxicilin (dưới dạng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (dưới dạng kali clavulanat)
  -  
62,5mg', 6, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (289, N'VD-21620-14', N'Acigmentin 375', N'36 tháng', N'7000', N'Gói', N'Amoxicilin (dưới dạng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (dưới dạng Kali clavulanat)
  -  
125 mg', 3, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (290, N'VD-21220-14', N'Acigmentin 625', N'36 tháng', N'5500', N'Viên', N'Amoxicilin (dưới dạng Amoxicilin trihydrat) 500 mg
  -  
125 mg
Acid Clavulanic (dưới dạng Clavulanat kali)
  -  ', 1, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (291, N'VN-13788-11', N'Aciherpin 5% cream', N'24 tháng', N'7000', N'Tuýp', N'Aciclovir
  -  
--', 6, 810)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (292, N'VN-17208-13', N'Acilesol 10mg', N'24 tháng', N'8000', N'Viên', N'Rabeprazole natri
  -  
10 mg', 3, 805)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (293, N'VN-17209-13', N'Acilesol 20mg', N'24 tháng', N'12400', N'Viên', N'Rabeprazole natri
  -  
20 mg', 5, 805)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (294, N'VD-11800-10', N'Acilis 20', N'24 tháng', N'18000', N'Viên', N'Tadalafil 20mg
  -  ', 1, 907)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (296, N'VN-17188-13', N'Aciloc 150', N'36 tháng', N'320', N'Viên', N'Ranitidin (dưới dạng Ranitidin hydrochlorid)
  -  
150mg', 5, 832)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (297, N'VN-17848-14', N'Aciloc 300', N'36 tháng', N'700', N'Viên', N'Ranitidin (dưới dạng Ranitidin hydrochlorid)
  -  
300 mg', 9, 832)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (298, N'VN-13669-11', N'Acinet 10', N'24 tháng', N'1540', N'Viên', N'Atorvastatin calcium
  -  
10mg Atorvastatin', 5, 1035)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (299, N'VN-13670-11', N'Acinet 20', N'24 tháng', N'2013', N'Viên', N'Atorvastatin calcium
  -  
20mg Atorvastatin', 2, 1035)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (300, N'VD-17254-12', N'Acinmuxi', N'24 tháng', N'1800', N'Gói', N'Acetylcystein
  -  
200mg', 7, 878)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (301, N'VD-27299-17', N'Acinstad 500mg', N'36 tháng', N'37800', N'Lọ', N'Amikacin (dưới dạng Amikacin sulfat)
  -  
500 mg/2 ml', 7, 895)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (302, N'VN-13443-11', N'Acipta', N'36 tháng', N'400', N'viên', N'Amlodipine
  -  
5mg', 8, 843)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (303, N'VN-11339-10', N'Acirax', N'36 tháng', N'1100', N'Viên', N'Aciclovir
  -  
200mg', 8, 1038)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (304, N'VN-10592-10', N'Acirax Cream', N'36 tháng', N'6400', N'Tuýp', N'Aciclovir
  -  
5% w/w', 5, 1038)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (305, N'VN-17793-14', N'Acirax-400', N'36 tháng', N'2200', N'Viên', N'Aciclovir 400mg
  -  ', 5, 1038)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (306, N'VN-18579-14', N'Acirax-800', N'36 tháng', N'3700', N'Viên', N'Aciclorvir 800mg
  -  ', 5, 1038)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (307, N'VN-15368-12', N'Acirun', N'36 tháng', N'2750', N'Viên', N'Magnesium trisilicate, Dried aluminium hydroxide, Simethicone
  -  
250mg, 250mg, 25mg', 9, 976)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (308, N'VN-11671-11', N'Acitaxime', N'24 tháng', N'16000', N'Lọ', N'Cefotaxime Sodium
  -  
1g Cefotaxime', 2, 803)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (309, N'VD-14512-11', N'Acitonal - 5', N'36 tháng', N'7250', N'Viên', N'Risedronat natri 5mg
  -  ', 8, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (310, N'VD-16656-12', N'Acitonal-35', N'36 tháng', N'31250', N'Viên', N'Risedronat natri 35mg
  -  
--', 3, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (311, N'VD-18820-13', N'Acitys', N'36 tháng', N'1300', N'1300', N'Acetylcystein
  -  
200 mg', 1, 897)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (312, N'VN-19294-15', N'Aclasta', N'36 tháng', N'6761490', N'Chai', N'Acid zoledronic (dưới dạng Acid zoledronic monohydrat) 5mg/100ml
  -  ', 5, 1009)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (313, N'VN-16010-12', N'Acle Tablet 625mg', N'24 tháng', N'5565', N'Viên', N'Amoxicillin trihydrate, Potassium clavulanate
  -  
500mg Amoxicillin, 125mg Acid clavulanic', 2, 985)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (314, N'VD-18521-13', N'Aclon', N'36 tháng', N'1600', N'viên', N'Aceclofenac
  -  
100mg', 5, 858)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (315, N'VN-19914-16', N'Aclop', N'24 tháng', N'7100', N'Viên', N'Clopidogrel (dưới dạng Clopidogrel bisulfat)a
  -  
75 mg', 9, 1042)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (316, N'VN-14025-11', N'Aclopsa', N'36 tháng', N'425', N'Viên', N'Aceclofenac
  -  
100mg', 4, 1051)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (317, N'VN-5104-10', N'Aclovia', N'36 tháng', N'13900', N'Tuýp', N'Acyclovir
  -  
250mg', 6, 827)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (318, N'VN-10980-10', N'Acmodim tablet', N'36 tháng', N'3337', N'Viên', N'Casein hydrolysate
  -  
500mg', 8, 827)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (319, N'VN-21117-18', N'Acmolrine - 20 Soft Capsule', N'36 tháng', N'15000', N'Viên', N'Isotretinoin
  -  
20mg', 9, 994)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (320, N'VN-16733-13', N'Acneal', N'36 tháng', N'25000', N'Tuýp', N'Clindamycin (dưới dạng Clindamycin hydrochloride) 200mg
  -  
Metronidazole 160mg
  -  ', 9, 965)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (321, N'VD-14378-11', N'Acneegel', N'36 tháng', N'19200', N'tub', N'Erythromycin 4%
  -  ', 9, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (322, N'VD-18475-13', N'Acnekyn 500', N'36 tháng', N'630', N'Viên', N'Acetaminophen
  -  
500 mg', 8, 958)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (323, N'VD-19571-13', N'Acnequidt', N'36 tháng', N'40000', N'Hộp', N'20 ml dung dịch chứa: Clindamycin (dưới dạng Clindamycin hydroclorid) 200mg
  -  
Metronidazol 160mg
  -  ', 9, 892)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (324, N'VD-21788-14', N'Acnes medical Cream', N'36 tháng', N'56700', N'56700', N'Sulfur
  -  
540mg
Resorcin
  -  
360mg
Tocopherol acetate
  -  
90mg
Glycyrrhetinic acid
  -  
54mg
...', 3, 868)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (325, N'VD-12081-10', N'Acnes offensive cream', N'36 tháng', N'39600', N'18g/Tuýp', N'resorcin 360mg, glycyrrhetinic acid 54mg, sulfur 540mg
  -  ', 4, 961)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (326, N'VD-28098-17', N'Acneskinz', N'36 tháng', N'7000', N'Viên', N'Isotretinoin
  -  
10 mg', 5, 942)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (327, N'VN-18371-14', N'Acnotin 20', N'24 tháng', N'15000', N'Viên', N'Isotretinoin 20mg
  -  ', 9, 997)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (328, N'VD-16313-12', N'Acocina', N'24 tháng', N'48000', N'Chai', N'Mỗi 40ml chứa: Ô đầu 0,32g
  -  
--
Mã tiền 0,64g
  -  
Quế nhục 0,32g
  -  
Đại hồi 0,32g
  -  
...', 2, 890)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (329, N'VD-21331-14', N'Acough', N'36 tháng', N'600', N'Viên', N'Dextromethorphan HBr
  -  
15mg', 3, 934)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (330, N'VN-17310-13', N'Acrason Cream', N'36 tháng', N'12000', N'Tuýp', N'Betamethasone dipropionate
  -  
6,4mg/10g
Clotrimazole
  -  
100mg/10g
Gentamicin sulfate
  -  
10mg/10g', 6, 980)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (331, N'VD-15052-11', N'Acritel', N'36 tháng', N'3200', N'Viên', N'Levocetirizin dihydroclorid 5mg
  -  ', 5, 873)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (332, N'VD-28899-18', N'Acritel-10', N'36 tháng', N'4950', N'Viên', N'Levocetirizin dihydroclorid 10mg
  -  
10mg', 5, 855)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (333, N'VD-21884-14', N'Actadol - Extra', N'36 tháng', N'710', N'viên', N'Paracetamol
  -  
500mg
Cafein
  -  
65mg', 3, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (334, N'VD-19584-13', N'Actadol 150', N'36 tháng', N'1800', N'Gói', N'Paracetamol 150mg
  -  ', 9, 894)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (335, N'VD-21960-14', N'Actadol 500', N'36 tháng', N'800', N'Viên', N'Paracetamol 500mg
  -  ', 4, 894)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (336, N'VD-19585-13', N'Actadol 80', N'36 tháng', N'1400', N'Gói', N'Paracetamol 80mg
  -  ', 7, 894)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (337, N'VN-19202-15', N'Actapulgite', N'36 tháng', N'3157', N'Gói', N'Activated Attapulgite of Mormoiron 3g
  -  ', 7, 822)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (338, N'VN-5437-10', N'Actapulgite', N'36 tháng', N'3157', N'gói', N'Attapulgite de Mormoiron hoạt hoá
  -  
3g', 6, 822)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (339, N'VN-16554-13', N'Actelsar 40mg', N'24 tháng', N'8100', N'Viên', N'Telmisartan 40mg
  -  ', 3, 805)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (340, N'VN-20899-18', N'Actelsar 40mg', N'36 tháng', N'8000', N'Viên', N'Telmisartan
  -  
40mg', 3, 806)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (341, N'VN-16555-13', N'Actelsar 80mg', N'24 tháng', N'11300', N'viên', N'Telmisartan 80mg
  -  ', 8, 805)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (342, N'VN-21654-19', N'Actelsar HCT 40mg/12,5 mg', N'24 tháng', N'9800', N'Viên', N'Telmisartan 40mg
  -  
40mg, 12,5mg
Hydrochlorothiazid 12,5mg
  -  ', 7, 806)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (343, N'VN-16257-13', N'Actemra', N'30 tháng', N'6748140', N'Lọ', N'Tocilizumab
  -  
200mg/10ml', 5, 841)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (344, N'VN-18587-15', N'Actibon', N'24 tháng', N'21940', N'Viên', N'Citicolin (dưới dạng Citicolin natri) 500 mg
  -  ', 7, 999)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (345, N'VN-11032-10', N'Acticarbine', N'60 tháng', N'950', N'Viên', N'Than hoạt tính
  -  
70mg', 6, 986)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (346, N'VD-21244-14', N'Actidine 100', N'36 tháng', N'3200', N'Viên', N'Acarbose 100mg
  -  ', 3, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (347, N'VD-21245-14', N'Actidine 50', N'36 tháng', N'3000', N'Viên', N'Acarbose
  -  
50 mg', 5, 849)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (348, N'VD-12966-10', N'Actifaflu', N'36 tháng', N'2000', N'Viên', N'Triprolidin.HCl 2,5mg
  -  
Pseudoephedrin.HCl 60mg
  -  ', 6, 939)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (349, N'VD-10638-10', N'Actiflex', N'24 tháng', N'970', N'Viên', N'Acid Ascorbic, Ergocalciferol, Nicotinamid, Riboflavin, Thiamin nitrat, Retinol palmitat
  -  ', 1, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (350, N'VN-11467-10', N'Actilyse', N'36 tháng', N'10323589', N'Lọ', N'Alteplase
  -  
50mg', 7, 826)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (351, N'VD-14628-11', N'Actiso', N'24 tháng', N'2500', N'Ống', N'Cao actiso 156,3mg tương đương lá actiso tươI 3,908g/ ống
  -  ', 9, 933)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (352, N'VD-24522-16', N'Actiso', N'36 tháng', N'1645', N'Viên', N'Mỗi viên chứa: Cao khô dược liệu 200mg tương đương Actiso (lá) 1975mg
  -  
Bột mịn dược liệu Actiso (lá) 25mg
  -  ', 1, 871)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (353, N'VD-27354-17', N'Actiso DHĐ', N'36 tháng', N'1800', N'Viên', N'Cao đặc lá Actiso 10/1 250mg
  -  
250mg', 3, 922)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (354, N'VD-21418-14', N'Actiso HĐ', N'36 tháng', N'2300', N'Viên', N'Cao đặc Actiso (18:1)
  -  
250mg', 4, 954)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (355, N'VD-12373-10', N'Actiso P TW3', N'24 tháng', N'4620', N'Viên', N'Cao khô viên nang Actiso P TW3 0,5g tương đương Actiso 2,5g, Nhân trần 2,5g
  -  ', 5, 943)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (356, N'VD-28159-17', N'Actiso PV', N'36 tháng', N'1800', N'Viên', N'Cao khô actiso (tương đương với 5g actiso)
  -  
300 mg', 1, 901)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (357, N'V70-H12-16', N'Actiso hoàn', N'24 tháng', N'250', N'Viên', N'25ml cao lỏng Actiso (tương đương 25g Actiso)
  -  
29g bột Actiso
  -  ', 5, 962)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (358, N'VN-18588-15', N'Actisoufre', N'36 tháng', N'11000', N'Ống', N'Monosulfua natri.9H2O
  -  
4 mg
Saccharomyces cerevisiae 1250 triệu tế bào
  -  
50 mg
  -  ', 2, 987)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (359, N'VD-20277-13', N'Activ - Gra', N'36 tháng', N'27000', N'Viên', N'Sildenafil (dưới dạng Sildenafil citrat) 50 mg
  -  ', 6, 834)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (360, N'VD-15352-11', N'Actixim', N'24 tháng', N'28500', N'Lọ', N'Cefuroxim
  -  
750mg', 9, 851)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (361, N'VD-20430-14', N'Actixim 1.5 g', N'24 tháng', N'35500', N'Lọ', N'Cefuroxim (dưới dạng Cefuroxim natri)
  -  
1,5 g', 4, 851)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (362, N'VN-10368-10', N'Actobim', N'24 tháng', N'2600', N'Viên', N'Lactobacillus acidophilus (sp. L. gasseri)
  -  
--
Bifidobacterium infantis
  -  
Enterococcus faecium
  -  ', 1, 990)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (363, N'VD-24819-16', N'Actorisedron 75', N'36 tháng', N'62000', N'Viên', N'Risedronat natri (dưới dạng Risedronat natri hemi-pentahydrat) 75mg
  -  ', 8, 852)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (364, N'VN-18806-15', N'Acular', N'24 tháng', N'67245', N'Lọ', N'Ketorolac tromethamine
  -  
0,5%', 1, 812)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (365, N'VN-18589-15', N'Acupan', N'36 tháng', N'34000', N'Ống', N'Nefopam hydroclorid
  -  
20 mg', 7, 964)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (366, N'VN-10076-10', N'Acutrine', N'36 tháng', N'3173', N'Viên', N'Isotretinoin
  -  
10mg', 4, 984)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (367, N'VN-19029-15', N'Acutrine 20 Soft capsule', N'36 tháng', N'15500', N'Viên', N'Isotretinoin 20mg
  -  ', 3, 983)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (368, N'VN-15194-12', N'Acuvail', N'24 tháng', N'7400', N'Ống', N'Ketorolac tromethamine
  -  
4,5mg/ml', 2, 813)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (369, N'VD-29711-18', N'Acyclorvir VPC 200', N'36 tháng', N'1000', N'Viên', N'Acyclovir 200 mg
  -  
200 mg', 5, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (370, N'VD-11768-10', N'Acyclovir', N'36 tháng', N'1200', N'Viên', N'Acyclovir 200mg
  -  ', 6, 952)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (371, N'VD-13018-10', N'Acyclovir', N'36 tháng', N'9500', N'Tuýp', N'Aciclovir 250mg
  -  ', 4, 903)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (372, N'VD-24489-16', N'Acyclovir', N'24 tháng', N'12000', N'Tuýp', N'Acyclovir 5% (kl/kl)
  -  ', 7, 844)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (373, N'VD-24956-16', N'Acyclovir', N'36 tháng', N'9500', N'Tuýp', N'Aciclovir
  -  
250mg', 3, 894)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (374, N'VN-13200-11', N'Acyclovir', N'36 tháng', N'14550', N'Tuýp', N'Acyclovir
  -  
250mg', 8, 1030)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (375, N'VD-21460-14', N'Acyclovir 200 mg', N'48 tháng', N'1250', N'Viên', N'Acyclovir
  -  
200mg', 4, 959)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (376, N'VD-16621-12', N'Acyclovir 200', N'36 tháng', N'1200', N'Viên', N'Acyclovir 200mg
  -  
--', 1, 952)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (377, N'VD-26787-17', N'Acyclovir 200', N'36 tháng', N'2000', N'Viên', N'Acyclovir 200 mg
  -  
200 mg', 9, 921)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (378, N'VD-17787-12', N'Acyclovir 200 mg', N'36 tháng', N'800', N'Viên', N'Acyclovir
  -  
200 mg', 8, 877)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (379, N'VD-16816-12', N'Acyclovir 200mg', N'36 tháng', N'1312', N'Viên', N'Acilovir 200mg/ viên
  -  
--', 8, 912)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (380, N'VD-30479-18', N'Acyclovir 200mg', N'36 tháng', N'1550', N'Viên', N'Acyclovir 200mg
  -  
200mg', 9, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (381, N'VD-27017-17', N'Acyclovir 3%', N'36 tháng', N'48000', N'Tuýp', N'Mối 3 g chứa: Aciclovir 0,09g
  -  
0,09g', 6, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (382, N'VD-31257-18', N'Acyclovir 400 mg', N'36 tháng', N'2500', N'Viên', N'Acyclovir
  -  
400 mg', 2, 901)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (383, N'VD-29085-18', N'Acyclovir 400mg', N'36 tháng', N'2700', N'Viên', N'Aciclovir 400mg
  -  
400mg', 4, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (384, N'VD-14632-11', N'Acyclovir 5%', N'24 tháng', N'19000', N'Tuýp', N'Acyclovir 500mg/ 10g
  -  ', 7, 883)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (385, N'VD-27018-17', N'Acyclovir 5%', N'36 tháng', N'10000', N'Tuýp', N'Mỗi 3 g chứa: Aciclovir
  -  
0,15g', 9, 938)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (386, N'VD-32039-19', N'Acyclovir 5%', N'36 tháng', N'20000', N'Tuýp', N'Acyclovir
  -  
5%', 8, 901)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (387, N'VD-26788-17', N'Acyclovir 800', N'36 tháng', N'4850', N'Viên', N'Acyclovir 800 mg
  -  
800 mg', 3, 921)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (388, N'VD-11476-10', N'Acyclovir 800mg', N'36 tháng', N'4400', N'Viên', N'Acyclovir 800mg
  -  ', 6, 912)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (389, N'VD-10107-10', N'Acyclovir Boston 200', N'36 tháng', N'2000', N'Viên', N'Acyclovir 200mg
  -  ', 8, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (390, N'VD-26113-17', N'Acyclovir Boston 200', N'36 tháng', N'2000', N'Viên', N'Aciclovir 200mg
  -  
200mg', 9, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (391, N'VD-19769-13', N'Acyclovir Boston 800', N'36 tháng', N'5500', N'Viên', N'Aciclovir 800mg
  -  ', 6, 850)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (392, N'VN-14811-12', N'Acyclovir Stada', N'36 tháng', N'24596', N'Tuýp', N'Acyclovir
  -  
50mg', 7, 1032)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (393, N'VD-24572-16', N'Acyclovir Stada 200 mg', N'36 tháng', N'1600', N'Viên', N'Acyclovir
  -  
200 mg', 7, 864)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (394, N'VD-26553-17', N'Acyclovir Stada 200 mg', N'36 tháng', N'1600', N'Viên', N'Acyclovir
  -  
200 mg', 1, 833)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (395, N'VD-27536-17', N'Acyclovir Stada 400 mg', N'36 tháng', N'3100', N'Viên', N'Acyclovir
  -  
400 mg', 6, 864)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (396, N'VD-10719-10', N'Acyclovir Stada 400mg', N'36 tháng', N'3500', N'Viên', N'Acyclovir 400 mg
  -  ', 6, 856)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (397, N'VD-21528-14', N'Acyclovir Stada 400mg', N'36 tháng', N'3100', N'viên', N'Acyclovir
  -  
400mg', 2, 861)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (398, N'VD-23346-15', N'Acyclovir Stada 800 mg', N'36 tháng', N'5000', N'Viên', N'Acyclovir
  -  
800 mg', 2, 864)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (399, N'VD-29496-18', N'Acyclovir Stada 800 mg', N'36 tháng', N'5000', N'Viên', N'Acyclovir 800mg
  -  
800mg', 6, 833)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (400, N'VD-10720-10', N'Acyclovir Stada 800mg', N'36 tháng', N'6000', N'Viên', N'Acyclovir 800 mg
  -  ', 1, 856)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (401, N'VD-11932-10', N'Acyclovir Stada cream', N'24 tháng', N'16000', N'Tuýp', N'Acyclovir 100mg
  -  ', 2, 856)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (402, N'VD-25031-16', N'Acyclovir Stada cream', N'24 tháng', N'18000', N'Tuýp', N'Acyclovir
  -  
250 mg', 7, 864)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (403, N'VD-16005-11', N'Acyclovir VPC 200', N'36 tháng', N'630', N'Viên', N'Acyclovir
  -  
200 mg', 9, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (404, N'VN-5197-10', N'Acyclovir for Injection USP', N'24 tháng', N'947600', N'Lọ', N'Acyclovir
  -  
500mg', 4, 824)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (405, N'VN-5220-10', N'Acymess', N'24 tháng', N'438000', N'Lọ', N'Aciclovir
  -  
250mg', 4, 1002)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (406, N'VD-20511-14', N'Acyvir', N'36 tháng', N'1400', N'viên', N'Aciclovir
  -  
200mg', 5, 897)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (407, N'VD-21122-14', N'Aczandia', N'36 tháng', N'5000', N'Viên', N'Diacerhein 50mg
  -  ', 4, 876)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (408, N'VD-17818-12', N'Adagrin', N'36 tháng', N'60000', N'viên', N'Sildenafil (dưới dạng Sildenafil citrat)
  -  
100 mg', 6, 900)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (409, N'VD-18667-13', N'Adagrin', N'36 tháng', N'45000', N'Viên', N'Sildenafil
  -  
50 mg', 3, 900)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (410, N'VN-14010-11', N'Adalat 10 (cơ sở xuất xưởng: Bayer Schering Pharma AG, địa chỉ: D-51368 Leverkusen, Germany)', N'36 tháng', N'2254', N'Viên', N'Nifedipine
  -  
10mg', 2, 1016)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (411, N'VN-15727-12', N'Adalat LA 20mg', N'36 tháng', N'6017', N'Viên', N'Nifedipine
  -  
20mg', 4, 820)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (412, N'VN-10754-10', N'Adalat LA 30mg', N'48 tháng', N'9454', N'Viên', N'Nifedipine
  -  
30mg', 3, 820)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (413, N'VN-20385-17', N'Adalat LA 30mg', N'48 tháng', N'9454', N'Viên', N'Nifedipin
  -  
30 mg', 3, 819)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (414, N'VN-10755-10', N'Adalat LA 60mg', N'48 tháng', N'12034', N'Viên', N'Nifedipine
  -  
60mg', 6, 820)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (415, N'VN-20386-17', N'Adalat LA 60mg', N'48 tháng', N'12034', N'Viên', N'Nifedipin
  -  
60mg', 9, 819)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (416, N'VN-10756-10', N'Adalat retard', N'36 tháng', N'4647', N'Viên', N'Nifedipine
  -  
20mg', 4, 820)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (417, N'VN-20387-17', N'Adalat retard', N'36 tháng', N'4647', N'Viên', N'Nifedipin
  -  
20mg', 4, 819)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (418, N'VD-28582-17', N'Adalcrem', N'36 tháng', N'62000', N'Tuýp', N'Mỗi 10 g chứa: Adapalene 10mg
  -  
10mg', 1, 867)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (419, N'VN-15543-12', N'Adant', N'36 tháng', N'800000', N'Hộp', N'Sodium hyaluronate
  -  
25mg', 1, 1039)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (420, N'VD-22783-15', N'Adazol', N'36 tháng', N'3000', N'Viên', N'Albendazol 400mg
  -  ', 5, 884)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (421, N'QLĐB-366-13', N'Adefovir 10 mg', N'36 tháng', N'10000', N'Viên', N'Adefovir dipivoxil
  -  
10 mg', 4, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (422, N'QLĐB-571-16', N'Adefovir A.T', N'24 tháng', N'3900', N'Viên', N'Adefovir dipivoxil 10mg
  -  ', 3, 848)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (423, N'VD-12596-10', N'Adefovir Stada 10 mg', N'24 tháng', N'15000', N'Viên', N'Adefovir dipivoxil 10 mg
  -  ', 4, 856)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (424, N'VD-25027-16', N'Adefovir Stada 10 mg', N'24 tháng', N'12000', N'Viên', N'Adefovir dipivoxil 10mg
  -  ', 9, 833)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (425, N'VD-24495-16', N'Adefovir meyer', N'36 tháng', N'3250', N'Viên', N'Adefovir dipivoxil 10 mg
  -  ', 6, 857)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (426, N'VD-27207-17', N'Aderonat', N'36 tháng', N'5500', N'Viên', N'Alendronic acid
  -  
10mg', 3, 905)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (427, N'VD-18767-13', N'Adkold-new', N'24 tháng', N'580', N'Viên', N'Dextromethorphan HBr
  -  
10mg
Phenylephrin HCl
  -  
5mg
Triprolidin HCl
  -  
1,25mg', 6, 947)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (428, N'VD-19015-13', N'Adkold-new for children', N'36 tháng', N'2600', N'Gói', N'Mỗi viên chứa: Phenylephrin HCl 2,5mg
  -  
Triprolidin HCl 0,625mg
  -  ', 5, 941)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (429, N'VD-23739-15', N'Admed', N'36 tháng', N'1500', N'Viên', N'Vitamin A (Retinol palmitat)
  -  
5000 IU
Vitamin D3 (Cholecalciferol )
  -  
400 IU', 9, 905)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (430, N'VD-11464-10', N'Admincort', N'36 tháng', N'420', N'Viên', N'Theophylin mononitrat 120 mg, Phenobacbital 8 mg, Ephedrin hydroclorid 25 mg
  -  ', 4, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (431, N'VN-19326-15', N'Adolox', N'24 tháng', N'8000', N'Viên', N'Levofloxacin (dưới dạng Levofloxacin hemihydrat)
  -  
500mg', 7, 1023)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (432, N'VD-11340-10', N'Adoor LA', N'24 tháng', N'6600', N'viên', N'Nifedipin 30mg
  -  ', 2, 872)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (433, N'VN-16807-13', N'Adorucin', N'18 tháng', N'108000', N'Lọ', N'Doxorubicin hydrochloride
  -  
10mg/5ml', 2, 982)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (434, N'VN-18590-15', N'Adostan 50', N'24 tháng', N'1000', N'Viên', N'Losartan kali 50 mg
  -  ', 1, 1023)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (435, N'VD-12988-10', N'Adrenalin', N'30 tháng', N'3850', N'ống', N'Adrenalin 1mg/1ml
  -  ', 7, 944)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (436, N'VD-25351-16', N'Adrenalin', N'24 tháng', N'5000', N'Ống', N'Adrenalin
  -  
1mg/1ml', 9, 955)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (437, N'VD-27151-17', N'Adrenalin', N'30 tháng', N'3850', N'Ống', N'Adrenalin
  -  
1mg/1ml', 5, 944)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (438, N'VD-32031-19', N'Adrenalin 1mg/10ml', N'30 tháng', N'5250', N'Ống', N'Adrenalin
  -  
1mg/10ml', 1, 944)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (439, N'VD-10359-10', N'Adrenoxyl 10mg', N'36 tháng', N'1300', N'Viên', N'Carbazochrom 8,68mg)
  -  ', 1, 853)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (440, N'VD-24262-16', N'Adrenoxyl 10mg', N'36 tháng', N'1300', N'Viên', N'Carbazochrom
  -  
10mg', 3, 853)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (441, N'VD-10428-10', N'Adretop', N'24 tháng', N'3150', N'Ống', N'Adrenalin 1mg/1ml
  -  ', 5, 854)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (442, N'VD-25284-16', N'Adretop', N'24 tháng', N'4000', N'Ống', N'Adrenalin (dưới dạng Epinephrin bitartrat) 1mg/1ml
  -  ', 1, 941)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (443, N'VN-17713-14', N'Adrim 10mg/5ml', N'24 tháng', N'51068', N'Lọ', N'Doxorubicin hydrochloride 10mg/5ml
  -  
2 mg/ ml', 2, 972)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (444, N'VN-11839-11', N'Adus Soft Capsule', N'36 tháng', N'5950', N'Viên', N'Acid ursodesoxycholic
  -  
50mg
Thiamine nitrate
  -  
10mg
Riboflavin
  -  
5mg', 5, 981)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (445, N'VN-16290-13', N'Advagraf', N'36 tháng', N'36616', N'Viên', N'Tacrolimus (dưới dạng Tacrolimus monohydrate)
  -  
0,5mg', 4, 814)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (446, N'VN-16498-13', N'Advagraf', N'36 tháng', N'54920', N'Viên', N'Tacrolimus (dưới dạng Tacrolimus monohydrate)
  -  
1 mg', 3, 814)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (447, N'VD-11599-10', N'Advan', N'24 tháng', N'504', N'Viên', N'Paracetamol 500 mg, Codein 10 mg
  -  ', 2, 926)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (448, N'VD-12282-10', N'Adwel', N'36 tháng', N'570', N'Viên', N'Vitamin A (retinyl palmitat 2000IU, Vitamin D2 200 IU
  -  ', 6, 925)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (449, N'VN-12717-11', N'Aegencefpo 200', N'24 tháng', N'9561', N'Viên', N'Cefpodoxim proxetil
  -  
200mg Cefpodoxime', 6, 807)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (450, N'VN-13904-11', N'Aegendinir 125', N'24 tháng', N'6500', N'Gói', N'Cefdinir
  -  
125mg', 6, 807)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (451, N'VN-13905-11', N'Aegendinir 300', N'24 tháng', N'9500', N'Viên', N'Cefdinir
  -  
300mg', 8, 807)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (452, N'VN-14268-11', N'Aerius', N'24 tháng', N'78901', N'Chai', N'Desloratadine
  -  
0,5mg/ml', 8, 1027)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (453, N'VN-18026-14', N'Aerius', N'24 tháng', N'9521', N'Viên', N'Desloratadine
  -  
5mg', 8, 1027)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (454, N'VN-14903-12', N'Aeroflu 125 HFA Inhalation', N'24 tháng', N'90000', N'Lọ', N'Salmeterol xinafoate, fluticasone propionate
  -  
(Salmeterol 25mcg', 9, 1001)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (455, N'VN-17240-13', N'Aerofor 100 Hfa', N'24 tháng', N'170000', N'Ống', N'Budesonide
  -  
100µg/liều
Formoterol fumarate (dưới dạng Formoterol fumarate dihydrate)
  -  
6µg/liều', 5, 1001)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (456, N'VN-17241-13', N'Aerofor 200 Hfa', N'24 tháng', N'230000', N'Ống', N'Budesonide (Micronised)
  -  
200µg/liều
Formoterol fumarate (dưới dạng Formoterol fumarate dihydrate)
  -  
6µg/liều', 5, 1001)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (457, N'VN-10747-10', N'Aerrane', N'60 tháng', N'910800', N'Chai', N'Isoflurane
  -  
--', 2, 816)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (458, N'VN-19793-16', N'Aerrane', N'60 tháng', N'910800', N'Chai', N'Isoflurane 100%
  -  
100% ( tt/tt)', 6, 817)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (459, N'VN-14033-11', N'Aescin', N'36 tháng', N'3400', N'Viên', N'Aescin
  -  
20mg', 1, 1040)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (460, N'VD-23473-15', N'Aescin 20 mg', N'36 tháng', N'3000', N'Viên', N'Escin 20 mg
  -  ', 4, 882)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (461, N'VN-15421-12', N'Aeyerop inj.', N'36 tháng', N'6000', N'Ống', N'Piracetam
  -  
1g/5ml', 2, 979)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (462, N'VD-29479-18', N'Afenemi', N'24 tháng', N'36000', N'Ống', N'Mỗi 1 ml dung dịch chứa: Natri hyaluronat 1,8 mg
  -  
1,8 mg', 9, 886)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (463, N'VN-11200-10', N'Afigrel', N'36 tháng', N'7000', N'Viên', N'Clopidogrel bisulphate
  -  
75mg clopidogrel', 9, 999)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (464, N'VN2-206-13', N'Afinitor 10mg', N'36 tháng', N'1220115', N'Viên', N'Everolimus 10mg
  -  ', 3, 1009)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (465, N'VN-20043-16', N'Afinitor 5mg', N'36 tháng', N'610058', N'Viên', N'Everolimus
  -  
5mg', 3, 1009)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (466, N'VN2-207-13', N'Afinitor 5mg', N'36 tháng', N'610057', N'Viên', N'Everolimus 5mg
  -  ', 3, 1009)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (467, N'VN-21122-18', N'Afocical Tab.', N'36 tháng', N'8000', N'Viên', N'Atorvastatin (dưới dạng atorvastatin calcium)
  -  
10mg', 7, 1046)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (468, N'VN-12449-11', N'Aforsatin 10', N'24 tháng', N'600', N'Viên', N'Atorvastatin calci
  -  
10mg Atorvastatin', 5, 971)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (469, N'VN-12450-11', N'Aforsatin 20', N'24 tháng', N'690', N'Viên', N'Atorvastatin calci
  -  
20mg Atorvastatin', 1, 971)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (470, N'VD-29344-18', N'Afovix tab', N'36 tháng', N'15300', N'Viên', N'Adefovir dipivoxil 10mg
  -  
10mg', 5, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (471, N'VD-15034-11', N'Afovixtab', N'36 tháng', N'28980', N'Viên', N'Adefovir dipivoxil 10mg
  -  ', 2, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (472, N'VD-20502-14', N'Afulocin', N'36 tháng', N'17000', N'Ống', N'Pefloxacin (dưới dạng Pefloxacin mesylat dihydrat)
  -  
400mg/5ml', 1, 895)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (473, N'VD-26093-17', N'Ag-Ome', N'24 tháng', N'1100', N'Viên', N'Omeprazol (dưới dạng Omeprazol magnesi)
  -  
20 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (474, N'VN-5228-10', N'Agcel', N'36 tháng', N'1091', N'Viên', N'Celecoxib
  -  
200mg/viên', 8, 976)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (475, N'VD-13302-10', N'Agdicerin', N'36 tháng', N'6000', N'Viên', N'Diacerein 50mg
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (476, N'V54-H12-16', N'Agerhinin', N'24 tháng', N'28000', N'Lọ', N'Mỗi 15 ml chứa: Bột Sp3 (tương đương 15 g cây ngũ sắc) 750mg
  -  ', 3, 1043)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (477, N'NC46-H06-15', N'Agerhinin (gia hạn lần 1)', N'24 tháng', N'28000', N'Lọ', N'Bột Sp3 (tương đương 15g cây ngũ sắc) 750mg/15ml
  -  ', 4, 1043)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (478, N'VD-11491-10', N'Agi - Beta', N'36 tháng', N'264', N'Viên', N'Betamethason 0,5mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (479, N'VD-12194-10', N'Agi - CotrimF', N'36 tháng', N'700', N'Viên', N'Sulphamethoxazol 800mg, Trimethoprim 160mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (480, N'VD-10051-10', N'Agi - VitaC', N'24 tháng', N'900', N'Viên', N'Acid ascorbic 500mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (481, N'VD-18220-13', N'Agi- Ery 500', N'36 tháng', N'2280', N'Viên', N'Erythromycin (dưới dạng Erythromycin stearat)
  -  
500 mg', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (482, N'VD-23484-15', N'Agi- calci', N'24 tháng', N'870', N'Viên', N'Mỗi viên chứa: Calci carbonat 1250mg
  -  
Cholecalciferol 200IU
  -  ', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (483, N'VD-23485-15', N'Agi- neurin', N'24 tháng', N'1200', N'Viên', N'Mỗi viên chứa: Thiamin mononitrat 125mg
  -  
Pyridoxin hydroclorid 125mg
  -  
Cyanocobalamin 125mcg
  -  ', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (484, N'VD-26720-17', N'Agi-Beta', N'36 tháng', N'264', N'Viên', N'Betamethason 0,5 mg
  -  
0,5 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (485, N'VD-14216-11', N'Agi-Bromhexine', N'36 tháng', N'195', N'Viên', N'Bromhexin HCl 8mg/viên
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (486, N'VD-29646-18', N'Agi-Bromhexine', N'36 tháng', N'195', N'Viên', N'Bromhexin hydroclorid 8 mg
  -  
8 mg', 2, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (487, N'VD-30270-18', N'Agi-Bromhexine 16', N'36 tháng', N'890', N'Viên', N'Bromhexin hydroclorid 16 mg
  -  
16 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (488, N'VD-29647-18', N'Agi-Bromhexine 4', N'36 tháng', N'350', N'Viên', N'Bromhexin hydroclorid 4 mg
  -  
4 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (489, N'VD-10057-10', N'Agi-Lanso', N'36 tháng', N'2900', N'Viên', N'Lansoprazol vi hạt bao tan trong ruột (hàm lượng 8,5%) tương đương 30mg Lansoprazol
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (490, N'VD-14229-11', N'Agi-Tyfedol 500', N'36 tháng', N'450', N'Viên', N'Paracetamol 500mg/ viên
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (491, N'VD-27749-17', N'Agi-Tyfedol 500', N'36 tháng', N'450', N'Viên', N'Paracetamol 500 mg
  -  
500 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (492, N'VD-19310-13', N'Agi-bromhexine', N'24 tháng', N'18000', N'Chai', N'Mỗi 30ml chứa Bromhexin HCl 0,024g
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (493, N'VD-22789-15', N'Agi-calci', N'36 tháng', N'2600', N'Gói', N'Mỗi gói chứa Calci (dưới dạng tricalci phosphat) 600mg
  -  ', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (494, N'VD-25116-16', N'Agi-cotrim F', N'36 tháng', N'700', N'Viên', N'Sulfamethoxazol
  -  
800 mg
Trimethoprim
  -  
160 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (495, N'VD-14225-11', N'Agi-linco', N'36 tháng', N'1850', N'Viên', N'Lincomycin hydroclorid tương đương Lincomycin 500mg/ viên
  -  ', 9, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (496, N'VD-24705-16', N'Agi-vitac', N'24 tháng', N'900', N'Viên', N'Acid ascorbic
  -  
500 mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (497, N'VD-14220-11', N'AgiDopa', N'36 tháng', N'2000', N'Viên', N'Methyldopa 250mg/ viên
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (498, N'VD-10052-10', N'Agibetadex', N'36 tháng', N'400', N'Viên', N'Betamethason 0,25 mg, Dexchlorpheniramin maleat 2 mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (499, N'VD-25601-16', N'Agibetadex', N'36 tháng', N'400', N'Viên', N'Betamethason 0,25 mg
  -  
0,25 mg, 2 mg
Dexclorpheniramin maleat 2 mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (500, N'VD-30269-18', N'Agibeza 200', N'36 tháng', N'3200', N'Viên', N'Bezafibrat 200 mg
  -  
200 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (501, N'VD-10053-10', N'Agicardi', N'36 tháng', N'2125', N'Viên', N'Bisoprolol fumarat 5mg
  -  ', 7, 914)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (502, N'VD-25113-16', N'Agicardi', N'24 tháng', N'1450', N'Viên', N'Bisoprolol fumarat
  -  
5 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (503, N'VD-25114-16', N'Agicarvir', N'24 tháng', N'28000', N'Viên', N'Entecavir (dưới dạng Entecavir monohydrat) 0,5 mg
  -  ', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (504, N'VD-14217-11', N'Agicedol', N'36 tháng', N'500', N'viên', N'Paracetamol 500mg/ viên
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (505, N'VD-28817-18', N'Agicedol', N'36 tháng', N'500', N'Viên', N'Paracetamol
  -  
500 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (506, N'VD-11492-10', N'Agicetam', N'36 tháng', N'1400', N'Viên', N'Piracetam 800mg
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (507, N'VD-13303-10', N'Agicetam', N'36 tháng', N'700', N'Viên', N'Piracetam 400mg
  -  ', 3, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (508, N'VD-26091-17', N'Agicetam 400', N'36 tháng', N'700', N'Viên', N'Piracetam 400 mg
  -  
400 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (509, N'VD-25115-16', N'Agicetam 800', N'36 tháng', N'1400', N'Viên', N'Piracetam 800 mg
  -  ', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (510, N'VD-10054-10', N'Agichymo', N'24 tháng', N'1700', N'Viên', N'Chymotrypsin 4,2mg tương đương 21 microkatal
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (511, N'VD-24701-16', N'Agichymo', N'24 tháng', N'1700', N'Viên', N'Chymotrypsin (tương đương 4200 đơn vị Chymotrypsin USP) 4,2 mg
  -  ', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (512, N'VD-25602-16', N'Agicipro', N'36 tháng', N'1700', N'Viên', N'Ciprofloxacin (dưới dạng Ciprofloxacin HCl) 500 mg
  -  
500 mg', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (513, N'VD-11493-10', N'Agiclari 125', N'36 tháng', N'3000', N'Gói', N'Clarithromycin 125mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (514, N'VD-25603-16', N'Agiclovir 200', N'36 tháng', N'2000', N'Viên', N'Aciclovir 200 mg
  -  
200 mg
  -  ', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (515, N'VD-18693-13', N'Agiclovir 5%', N'36 tháng', N'10000', N'Tuýp', N'Aciclovir
  -  
0,25g/ 5g', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (516, N'VD-27743-17', N'Agiclovir 800', N'36 tháng', N'5200', N'Viên', N'Aciclovir
  -  
800mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (517, N'VN-21238-18', N'Agicold hotmix orange', N'36 tháng', N'15690', N'Túi', N'Paracetamol
  -  
750mg
Phenylephrin hydrocloird
  -  
10mg
Acid ascorbic (vitamin C)
  -  
60mg', 1, 810)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (518, N'VD-14664-11', N'Agidecotyl', N'24 tháng', N'500', N'viên', N'Mephenesin 250mg/ viên
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (519, N'VD-28818-18', N'Agidecotyl', N'24 tháng', N'800', N'Viên', N'Mephenesin
  -  
250 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (520, N'VD-25604-16', N'Agidecotyl 500', N'24 tháng', N'1400', N'Viên', N'Mephenesin 500 mg
  -  
500 mg', 2, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (521, N'VD-12765-10', N'Agidexclo', N'36 tháng', N'700', N'Viên', N'Dexchlorpheniramine maleate 2mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (522, N'VD-26092-17', N'Agidexclo', N'36 tháng', N'200', N'Viên', N'Dexclorpheniramin maleat 2 mg
  -  
2 mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (523, N'VD-15362-11', N'Agidolgen', N'36 tháng', N'700', N'Viên', N'Mỗi viên chứa: Paracetamol 500mg
  -  
Cafein 25mg
  -  
Phenylephrin HCl 5mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (524, N'VD-31060-18', N'Agidolgen', N'36 tháng', N'800', N'Viên', N'Paracetamol 500mg
  -  
500mg, 5mg, 25mg
Phenylephrin hydroclorid 5mg
  -  
Cafein 25mg
  -  ', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (525, N'VD-30201-18', N'Agidopa', N'36 tháng', N'1900', N'Viên', N'Methyldopa 250mg
  -  
250mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (526, N'VD-14221-11', N'Agidorin', N'36 tháng', N'700', N'Viên', N'Mỗi viên chứa: Paracetamol 500mg
  -  
Phenylephrin HCl 5mg
  -  
Clorpheniramin maleat 2mg
  -  ', 9, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (527, N'VD-14222-11', N'Agidoxin', N'24 tháng', N'600', N'Viên', N'Pyridoxin HCl 250mg/ viên
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (529, N'VD-29648-18', N'Agietoxib 120', N'36 tháng', N'7000', N'Viên', N'Etoricoxib 120 mg
  -  
120 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (530, N'VD-13304-10', N'Agietoxib 60', N'36 tháng', N'6800', N'viên', N'Etoricoxib 60mg
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (531, N'VD-13305-10', N'Agietoxib 90', N'36 tháng', N'10500', N'viên', N'Etoricoxib 90mg
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (532, N'VD-29649-18', N'Agietoxib 90', N'36 tháng', N'6000', N'Viên', N'Etoricoxib 90 mg
  -  
90 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (533, N'VD-14223-11', N'Agifamcin 300', N'36 tháng', N'1970', N'Viên', N'Rifampicin 300mg/ viên
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (534, N'VD-22438-15', N'Agifivit', N'36 tháng', N'610', N'Viên', N'Sắt (II) fumarat
  -  
200 mg
Acid folic
  -  
1 mg', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (535, N'VD-18925-13', N'Agifovir', N'24 tháng', N'25000', N'Viên', N'Tenofovir disoproxil fumarat 300mg
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (536, N'QLĐB-744-19', N'Agifovir-F', N'24 tháng', N'32000', N'Viên', N'Efavirenz 600mg
  -  
600mg, 300mg, 300mg
Lamivudin 300mg
  -  
Tenofovir disoproxil fumarat 300mg
  -  ', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (537, N'VD-14224-11', N'Agifuros', N'36 tháng', N'405', N'Viên', N'Furosemid 40mg/ viên
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (538, N'VD-27744-17', N'Agifuros', N'36 tháng', N'405', N'Viên', N'Furosemid
  -  
40 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (539, N'VD-13745-11', N'Agihistine 16', N'36 tháng', N'1860', N'Viên', N'Betahistin dihydroclorid 16mg
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (540, N'VD-29650-18', N'Agihistine 16', N'36 tháng', N'1860', N'Viên', N'Betahistin dihydroclorid 16 mg
  -  
16 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (541, N'VD-13746-11', N'Agihistine 8', N'36 tháng', N'1320', N'Viên', N'Betahistin dihydroclorid 8mg
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (542, N'VD-28819-18', N'Agihistine 8', N'36 tháng', N'1320', N'Viên', N'Betahistin dihydroclorid 8 mg
  -  
8 mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (543, N'VD-10056-10', N'Agiketo', N'24 tháng', N'2125', N'Viên', N'Ketoconazol 200mg
  -  ', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (544, N'VD-29651-18', N'Agilecox 100', N'36 tháng', N'2000', N'Viên', N'Celecoxib 100mg
  -  
100mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (545, N'VD-11494-10', N'Agilecox 200', N'36 tháng', N'4500', N'Viên', N'Celecoxib 200mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (546, N'VD-25523-16', N'Agilecox 200', N'36 tháng', N'4500', N'Viên', N'Celecoxib 200 mg
  -  ', 7, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (547, N'VD-12766-10', N'Agilizid', N'36 tháng', N'1500', N'Viên', N'Gliclazid 80mg
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (548, N'VD-28820-18', N'Agilosart 100', N'36 tháng', N'7000', N'Viên', N'Losartan kali
  -  
100 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (549, N'VD-27745-17', N'Agilosart 12,5', N'36 tháng', N'1450', N'Viên', N'Losartan potassium 12,5 mg
  -  
12,5 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (550, N'VD-19311-13', N'Agilosart 25', N'24 tháng', N'1450', N'Viên', N'Losartan kali
  -  
25 mg', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (551, N'VD-17377-12', N'Agilosart 50', N'24 tháng', N'3000', N'Viên', N'Losartan Kali
  -  
50mg/ viên', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (552, N'VD-29652-18', N'Agilosart-H 100/25', N'36 tháng', N'4200', N'Viên', N'Losartan kali 100 mg
  -  
100 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (553, N'VD-29653-18', N'Agilosart-H 50/12,5', N'36 tháng', N'3900', N'Viên', N'Losartan kali 50 mg
  -  
50 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 7, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (554, N'VD-10058-10', N'Agimdogyl', N'36 tháng', N'1900', N'Viên', N'Spiramycin 750.000IU, Metronidazole 125mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (555, N'VD-24702-16', N'Agimdogyl', N'36 tháng', N'1900', N'Viên', N'Spiramycin 0,75 M IU
  -  
Metronidazol 125 mg
  -  ', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (556, N'VD-10059-10', N'Agimepzol', N'36 tháng', N'1500', N'Viên', N'Omeprazol dạng vi hạt 8,5% bao tan trong ruột tương ứng Omeprazol 20mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (557, N'VD-29654-18', N'Agimepzol 20', N'36 tháng', N'1150', N'Viên', N'Omeprazol (dưới dạng Omeprazol pellet bao tan trong ruột 8,5 %) 20 mg
  -  
20 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (558, N'VD-31061-18', N'Agimepzol 40', N'36 tháng', N'2400', N'Viên', N'Omeprazol (dưới dạng vi hạt 8,5 % Omeprazol magnesi dihydrat 8,5%) 40mg
  -  
40mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (559, N'VD-30271-18', N'Agimesi 15', N'36 tháng', N'1900', N'Viên', N'Meloxicam 15mg
  -  
15mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (560, N'VD-25117-16', N'Agimesi 7,5', N'36 tháng', N'1200', N'Viên', N'Meloxicam
  -  
7,5 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (561, N'VD-28821-18', N'Agimetpred 16', N'36 tháng', N'3500', N'Viên', N'Methylprednisolon 16 mg
  -  
16 mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (562, N'VD-11495-10', N'Agimetpred 4', N'36 tháng', N'1800', N'Viên', N'Methylprednisolon 4mg
  -  ', 3, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (563, N'VD-24111-16', N'Agimetpred 4', N'36 tháng', N'1100', N'Viên', N'Methylprednisolon 4mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (564, N'VD-10060-10', N'Agimfast', N'36 tháng', N'2100', N'Viên', N'Fexofenadin hydroclorid 60mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (565, N'VD-13307-10', N'Agimfast 120', N'36 tháng', N'3800', N'Viên', N'Fexofenadin hydroclorid 120mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (566, N'VD-29655-18', N'Agimfast 120', N'36 tháng', N'3800', N'Viên', N'Fexofenadin hydroclorid 120 mg
  -  
120 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (567, N'VD-13308-10', N'Agimfast 180', N'36 tháng', N'5100', N'Viên', N'Fexofenadin hydroclorid 180mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (568, N'VD-28822-18', N'Agimfast 180', N'36 tháng', N'5100', N'Viên', N'Fexofenadin hydrochlorid 180 mg
  -  
180 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (569, N'VD-25605-16', N'Agimfast 60', N'36 tháng', N'2100', N'Viên', N'Fexofenadin hydroclorid 60 mg
  -  
60 mg', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (570, N'VD-11497-10', N'Agimfor 850', N'36 tháng', N'2200', N'Viên', N'Metformin HCl 850mg
  -  ', 3, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (571, N'VD-14665-11', N'Agimidin', N'36 tháng', N'8500', N'Viên', N'Lamivudin 100mg/ viên
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (572, N'VD-30272-18', N'Agimidin', N'36 tháng', N'8500', N'Viên', N'Lamivudin 100 mg
  -  
100 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (574, N'VD-26721-17', N'Agimlisin 10', N'36 tháng', N'2450', N'Viên', N'Lisinopril (dưới dạng Lisinopril dihydrat) 10 mg
  -  
10 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (575, N'VD-29656-18', N'Agimlisin 20', N'36 tháng', N'3380', N'Viên', N'Lisinopril (dưới dạng Lisinopril dihydrat) 20 mg
  -  
20 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (576, N'VD-25118-16', N'Agimlisin 5', N'36 tháng', N'1385', N'Viên', N'Lisinopril
  -  
5 mg', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (577, N'VD-22790-15', N'Agimol 150', N'36 tháng', N'1500', N'Gói', N'Mỗi gói chứa Paracetamol 150mg
  -  ', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (578, N'VD-22791-15', N'Agimol 325', N'36 tháng', N'1800', N'Gói', N'Mỗi gói chứa Paracetamol 325mg
  -  ', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (579, N'VD-26722-17', N'Agimol 80', N'36 tháng', N'1750', N'Gói', N'Mỗi gói 1g chứa: Paracetamol 80 mg
  -  
80 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (580, N'VD-22792-15', N'Agimosarid', N'24 tháng', N'3000', N'Viên', N'Mosaprid citrat 5mg
  -  ', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (581, N'VD-10061-10', N'Agimoti', N'24 tháng', N'800', N'Viên', N'Domperidon maleat tương đương với Domperidon 10mg
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (582, N'VD-17880-12', N'Agimoti', N'24 tháng', N'18800', N'Chai', N'Domperidone
  -  
30 mg/30 ml', 7, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (583, N'VD-24703-16', N'Agimoti', N'24 tháng', N'800', N'Viên', N'Domperidon (dưới dạng Domperidon maleat)
  -  
10 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (584, N'VD-15984-11', N'Agimoti-S', N'24 tháng', N'1800', N'Gói', N'Mỗi gói chứa: Domperidon maleat tương đương Dmperidon 2,5mg
  -  
--
Simethicon 50mg
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (585, N'VD-13748-11', N'Agimsamin F', N'36 tháng', N'3900', N'Viên', N'Glucosamin 417mg
  -  
Natri chondroitin sulfat 400mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (586, N'VD-13311-10', N'Agimsamine', N'24 tháng', N'1530', N'Viên', N'Glucosamin sulfat dikaliclorid 331,6mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (587, N'VD-27746-17', N'Agimstan', N'24 tháng', N'4150', N'Viên', N'Telmisartan
  -  
40 mg', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (588, N'VD-30273-18', N'Agimstan 80', N'36 tháng', N'5900', N'Viên', N'Telmisartan 80 mg
  -  
80 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (589, N'VD-30274-18', N'Agimstan-H 80/25', N'36 tháng', N'7500', N'Viên', N'Telmisartan 80 mg
  -  
80 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (590, N'VD-13749-11', N'Agimycob', N'36 tháng', N'3300', N'Viên', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 3, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (591, N'VD-29657-18', N'Agimycob', N'36 tháng', N'3300', N'Viên', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 7, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (592, N'VD-23486-15', N'Aginalxic', N'36 tháng', N'1400', N'Viên', N'Acid nalidixic 500mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (593, N'VD-13750-11', N'Aginaril', N'36 tháng', N'1200', N'Viên', N'Enalapril maleat tương đương Enalapril 5mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (594, N'VD-10062-10', N'Agindopin', N'36 tháng', N'1500', N'Viên', N'Amlodipin besilat tương đương 5mg Amlodipin
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (595, N'VD-25119-16', N'Aginfolix 5', N'36 tháng', N'540', N'Viên', N'Acid folic
  -  
5 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (596, N'VD-17378-12', N'Aginmezin', N'24 tháng', N'350', N'Viên', N'Alimemazin tartrat
  -  
5mg/ viên', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (597, N'VD-27747-17', N'Aginmezin 10', N'36 tháng', N'970', N'Viên', N'Alimemazin tartrat
  -  
10 mg', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (598, N'VD-11499-10', N'Aginolol 50', N'36 tháng', N'1200', N'Viên', N'Atenolol 50 mg
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (599, N'VD-24704-16', N'Aginolol 50', N'36 tháng', N'800', N'Viên', N'Atenolol 50 mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (600, N'VD-13315-10', N'Agintidin', N'36 tháng', N'460', N'Viên', N'Cimetidin 300mg
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (601, N'VD-25120-16', N'Agintidin 300', N'36 tháng', N'460', N'Viên', N'Cimetidin
  -  
300 mg', 2, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (602, N'VD-13316-10', N'Agintidin 400', N'36 tháng', N'700', N'Viên', N'Cimetidin 400mg
  -  ', 9, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (603, N'VD-25121-16', N'Agintidin 400', N'36 tháng', N'700', N'Viên', N'Cimetidin
  -  
400 mg', 3, 838)
GO
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (604, N'VD-13751-11', N'Agiosmin', N'24 tháng', N'2500', N'Viên', N'Diosmin 450mg, hesperidin 50mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (605, N'VD-15363-11', N'Agiparofen', N'36 tháng', N'700', N'Viên', N'Mỗi viên chứa: Paracetamol 325mg
  -  
Ibuprofen 200mg
  -  ', 4, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (606, N'VD-29658-18', N'Agiparofen', N'36 tháng', N'790', N'Viên', N'Paracetamol 325 mg
  -  
325 mg, 200 mg
Ibuprofen 200 mg
  -  ', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (607, N'VD-14226-11', N'Agipiro', N'36 tháng', N'3500', N'Viên', N'Piroxicam beta cyclodextrin tương đương Piroxicam 20mg/ viên
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (608, N'VD-27748-17', N'Agiremid 100', N'36 tháng', N'3750', N'Viên', N'Rebamipid
  -  
100 mg', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (609, N'VD-14666-11', N'Agirenyl', N'36 tháng', N'430', N'Viên', N'Retinyl acetat 5000IU/ viên
  -  ', 3, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (610, N'VD-11501-10', N'Agirofen', N'24 tháng', N'850', N'Viên', N'Ibuprofen 600mg
  -  ', 8, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (611, N'VD-25606-16', N'Agirofen', N'24 tháng', N'850', N'Viên', N'Ibuprofen 600 mg
  -  
600 mg', 5, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (612, N'VD-12768-10', N'Agirovastin 10', N'36 tháng', N'8000', N'Viên', N'Rosuvastatin 10mg (dưới dạng Rosuvastatin calci)
  -  ', 9, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (613, N'VD-28823-18', N'Agirovastin 10', N'36 tháng', N'6250', N'Viên', N'Rosuvastatin (dưới dạng Rosuvastatin calci)
  -  
10 mg', 6, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (614, N'VD-13317-10', N'Agirovastin 20', N'36 tháng', N'15000', N'Viên', N'Rosuvastatin calcium tương đương 20 mg Rosuvastatin
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (615, N'VD-25122-16', N'Agirovastin 20', N'36 tháng', N'8505', N'Viên', N'Rosuvastatin (dưới dạng Rosuvastatin calci)
  -  
20 mg', 7, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (616, N'VD-25123-16', N'Agiroxi 150', N'36 tháng', N'1820', N'Viên', N'Roxithromycin 150 mg
  -  ', 9, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (617, N'VD-23487-15', N'Agiroxi 50', N'24 tháng', N'2100', N'Gói', N'Mỗi gói 1,5g chứa Roxithromycin 50mg
  -  
  -  ', 2, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (618, N'VN-5534-10', N'Agisept Antiseptic Tablet-Classical', N'36 tháng', N'716', N'Viên', N'2,4 Dichlorobenzyl Alcohol
  -  
--
Amylmetacresol
  -  ', 5, 810)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (619, N'VD-10065-10', N'Agisimva 10', N'36 tháng', N'3000', N'Viên', N'Simvastatin 10mg
  -  ', 2, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (620, N'VD-25607-16', N'Agisimva 10', N'36 tháng', N'2150', N'Viên', N'Simvastatin 10 mg
  -  
10 mg', 7, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (621, N'VD-10066-10', N'Agisimva 20', N'36 tháng', N'6800', N'Viên', N'Simvastatin 20mg
  -  ', 5, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (622, N'VD-24112-16', N'Agisimva 20', N'36 tháng', N'2500', N'Viên', N'Simvastatin 20mg
  -  ', 3, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (623, N'VD-28824-18', N'Agitafil 20', N'24 tháng', N'30000', N'Viên', N'Tadalafil
  -  
20 mg', 1, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (624, N'VD-19753-13', N'Agitec-F', N'24 tháng', N'100', N'Viên', N'Clorpheniramin maleat 4 mg
  -  ', 4, 837)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (625, N'VD-19754-13', N'Agitec-F', N'24 tháng', N'100', N'Viên', N'Clorpheniramin maleat
  -  
4 mg', 2, 837)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (626, N'VD-13752-11', N'Agitritine 100', N'36 tháng', N'800', N'Viên', N'Trimebutine maleat 100mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (627, N'VD-31062-18', N'Agitritine 100', N'36 tháng', N'950', N'Viên', N'Trimebutine maleat 100 mg
  -  
100 mg', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (628, N'VD-13753-11', N'Agitritine 200', N'36 tháng', N'1500', N'Viên', N'Trimebutine maleat 200mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (629, N'VD-22793-15', N'Agituss', N'24 tháng', N'14500', N'Chai', N'Mỗi 60ml chứa: Dextromethorphan HBr 72mg
  -  
Clorpheniramin maleat 18mg
  -  
Guaiphenesin 600mg
  -  ', 4, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (630, N'VD-25608-16', N'Agivastar 40', N'36 tháng', N'8700', N'Viên', N'Pravastatin natri 40 mg
  -  
40 mg', 2, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (631, N'VD-12769-10', N'Agivitamin B1', N'24 tháng', N'550', N'Viên', N'Thiamin mononitrat 250mg
  -  ', 1, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (632, N'VD-25609-16', N'Agivitamin B1', N'24 tháng', N'800', N'Viên', N'Vitamin B1 (Thiamin mononitrat) 250 mg
  -  
250 mg', 8, 838)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (633, N'VD-10067-10', N'Agoflox', N'36 tháng', N'1800', N'Viên', N'Ofloxacin 200mg
  -  ', 6, 914)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (634, N'VD-21047-14', N'Agostini', N'36 tháng', N'22000', N'Viên', N'Alendronic acid (dưới dạng alendronat natri) 70mg
  -  ', 4, 873)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (635, N'VD-30412-18', N'Aguzar 200', N'36 tháng', N'3100', N'Viên', N'Etodolac
  -  
200 mg', 2, 930)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (636, N'VD-27924-17', N'Aguzar 400', N'36 tháng', N'6000', N'Viên', N'Etodolac
  -  
400mg', 5, 930)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (637, N'VD-14139-11', N'Ahevip', N'36 tháng', N'8000', N'Viên', N'Etoricoxib 90mg
  -  ', 7, 847)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (638, N'VD-28758-18', N'Ahevip 90', N'48 tháng', N'6000', N'Viên', N'Etoricoxib
  -  
90 mg', 4, 847)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (639, N'VD-19729-13', N'Ahmcmil''s', N'36 tháng', N'246', N'Viên', N'Nhôm hydroxyd gel khô
  -  
200 mg
Magnesi hydroxyd
  -  
200 mg
Dimethylpolysiloxane
  -  
10 mg
Dicyclomine HCl
  -  
2,5 mg
...', 3, 869)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (640, N'VN-5440-10', N'Ahngook Cefotaxim 1g', N'24 tháng', N'19147', N'Lọ', N'Cefotaxime natri
  -  
1g', 7, 811)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (641, N'VN-15577-12', N'Ahngookpapaze Tablet', N'36 tháng', N'4950', N'Viên', N'Magnesium aluminometasilicate
  -  
.
Natri bicarbonate
  -  
Scopolia Extract
  -  
Eslase
  -  
...', 4, 811)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (642, N'QLĐB-367-13', N'Aibezym', N'24 tháng', N'4600', N'gói', N'Lactobacillus acidophilus
  -  
10^8 CFU
Bacillus subtilis
  -  
10^8 CFU.
Kẽm gluconat
  -  
35mg', 3, 874)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (643, N'VD-16515-12', N'Ailaxon', N'36 tháng', N'600', N'Viên', N'Paracetamol , Ibuprofen
  -  
325mg', 6, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (644, N'VD-16516-12', N'Ailaxon', N'36 tháng', N'595', N'viên', N'Paracetamol 325mg, Ibuprofen 200mg
  -  
--', 4, 920)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (645, N'VN-15376-12', N'Air-X', N'60 tháng', N'903', N'Viên', N'Simethicone
  -  
80mg', 9, 1020)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (646, N'VN-19126-15', N'Air-X 120', N'24 tháng', N'1365', N'Viên', N'Simethicone
  -  
120mg', 6, 1020)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (647, N'VN-14124-11', N'Air-X drops', N'24 tháng', N'21000', N'Chai', N'Simethicon
  -  
40mg/0,6ml', 7, 1013)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (648, N'VN-14630-12', N'Air-X tab. hương vị cam', N'60 tháng', N'903', N'Viên', N'Simethicone
  -  
80mg', 9, 1020)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (649, N'VN-19977-16', N'AirFluSal Forspiro', N'24 tháng', N'319132', N'Bình', N'Mỗi liều xịt chứa: Salmeterol (dưới dạng salmeterol xinafoat) 50mcg
  -  
Fluticason propionat 500mcg
  -  ', 5, 808)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (650, N'VN-15378-12', N'Airbuter 10', N'24 tháng', N'3600', N'Viên', N'Bambuterol HCL
  -  
10mg', 5, 995)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (651, N'VN-15379-12', N'Airbuter 20', N'24 tháng', N'5900', N'Viên', N'Bambuterol HCL
  -  
20mg', 3, 995)
INSERT [dbo].[Sheet1$] ([F1], [maThuoc], [tenThuoc], [hanSuDung], [donGia], [donViTinh], [moTa], [maLoai], [maNCC]) VALUES (652, N'VN-10479-10', N'Aireez 10mg Tablet', N'24 tháng', N'3936', N'Viên', N'Montelukast sodium
  -  
10mg', 1, 1012)
GO
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'duchoan6814    ', N'sapassword          ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'duchoan6815    ', N'toilatoi            ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'duongtu6814    ', N'sapassword          ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'maiquynh123    ', N'ChiDai123           ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'xuanvu6814     ', N'Sapassword123       ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'xuanvu6817     ', N'Sapassword123       ')
GO
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'1', N'Thuốc gây mê')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'10', N'Thuốc tẩy uế')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'2', N'Thuốc giải độc')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'3', N'Thuốc chống co giật')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'4', N'Thuốc chống bệnh truyền nhiễm')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'5', N'Thuốc chống bênh đau nửa đầu')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'6', N'Thuốc chống khối u')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'7', N'Thuốc ảnh hưởng đến máu')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'8', N'Thuốc tim mạch')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'9', N'Thuốc da liễu')
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'DH-18054321', N'Ðây là thu?c làm cho b?n ch? lên d?p trai gi?ng nhu Hoàn v?y haha', 1000000.0000, N'Thuốc đẹp trai', NULL, N'viên', N'1028', N'2', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'DH-18054322', N'Ðây là thu?c th?n ch?a du?c bách b?nh và d?c bi?t có th? giúp b?n tru?ng sinh b?t t?.', 99999999999.0000, N'Thuốc trường sinh bất tử', N'9999tháng', N'Chum', N'1011', N'2', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'DH-18054323', N'Ðây là thu?c test thôi.', 999999.0000, N'Thuốc gì chưa biết', N'99 tháng', N'Chai', N'1018', N'2', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'DH-18054324', N'Ðây là mô t? c?a test', 999999.0000, N'Thuốc gì chưa biết', N'12 tháng', N'Cái', N'1004', N'2', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'GC-274-17', N'Acetylcystein
  -  
200 mg', 2441.0000, N'Acemuc 200mg', N'36 tháng', N'Gói', N'800', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'NC46-H06-15', N'B?t Sp3 (tuong duong 15g cây ngu s?c) 750mg/15ml
  -  ', 28000.0000, N'Agerhinin (gia hạn lần 1)', N'24 tháng', N'Lọ', N'1043', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'NC49-H12-15', N'Cao khô b? b?
  -  
170mg
Tinh d?u b? b?
  -  
0,002ml', 3085.0000, N'Abivina', N'24 tháng', N'Viên', N'1043', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB1-H07-19', N'18F-FDG 5,5-125mCi/ml
  -  
5,5-125mCi/ml', 880000.0000, N'18F-FDG (FDG)', N'6 tháng', N'mCi', N'1044', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-366-13', N'Adefovir dipivoxil
  -  
10 mg', 10000.0000, N'Adefovir 10 mg', N'36 tháng', N'Viên', N'920', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-367-13', N'Lactobacillus acidophilus
  -  
10^8 CFU
Bacillus subtilis
  -  
10^8 CFU.
K?m gluconat
  -  
35mg', 4600.0000, N'Aibezym', N'24 tháng', N'gói', N'874', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-531-16', N'Carboplatin 150mg/l?
  -  ', 390000.0000, N'A.T Carboplatin', N'24 tháng', N'Lọ', N'1006', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-532-16', N'Carboplatin 50mg/5ml
  -  ', 180000.0000, N'A.T Carboplatin inj', N'24 tháng', N'Lọ', N'1006', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-569-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 0,5mg
  -  ', 28000.0000, N'A.T Entecavir 0.5', N'24 tháng', N'Viên', N'848', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-570-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 1mg
  -  ', 48000.0000, N'A.T Entecavir 1', N'24 tháng', N'Viên', N'848', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-571-16', N'Adefovir dipivoxil 10mg
  -  ', 3900.0000, N'Adefovir A.T', N'24 tháng', N'Viên', N'848', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-579-16', N'Etoposid 100mg/5ml
  -  
100mg/5ml', 145000.0000, N'A.T Etoposide inj', N'24 tháng', N'Lọ', N'848', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-610-17', N'Anastrozol
  -  
1 mg', 18000.0000, N'A.T Cyrantabin', N'24 tháng', N'Viên', N'848', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-661-18', N'Oxaliplatin 50 mg
  -  
50 mg', 610000.0000, N'A.T Oxaliplatin 50', N'24 tháng', N'Lọ', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-744-19', N'Efavirenz 600mg
  -  
600mg, 300mg, 300mg
Lamivudin 300mg
  -  
Tenofovir disoproxil fumarat 300mg
  -  ', 32000.0000, N'Agifovir-F', N'24 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V53-H12-16', N'Cao khô B? b? 170mg
  -  
Tinh d?u B? b? 0,002ml
  -  ', 3050.0000, N'Abivina (Gia hạn lần 1)', N'24 tháng', N'Viên', N'1043', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V54-H12-16', N'M?i 15 ml ch?a: B?t Sp3 (tuong duong 15 g cây ngu s?c) 750mg
  -  ', 28000.0000, N'Agerhinin', N'24 tháng', N'Lọ', N'1043', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V70-H12-16', N'25ml cao l?ng Actiso (tuong duong 25g Actiso)
  -  
29g b?t Actiso
  -  ', 250.0000, N'Actiso hoàn', N'24 tháng', N'Viên', N'962', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10051-10', N'Acid ascorbic 500mg
  -  ', 900.0000, N'Agi - VitaC', N'24 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10052-10', N'Betamethason 0,25 mg, Dexchlorpheniramin maleat 2 mg
  -  ', 400.0000, N'Agibetadex', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10053-10', N'Bisoprolol fumarat 5mg
  -  ', 2125.0000, N'Agicardi', N'36 tháng', N'Viên', N'914', N'7', 30)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10054-10', N'Chymotrypsin 4,2mg tuong duong 21 microkatal
  -  ', 1700.0000, N'Agichymo', N'24 tháng', N'Viên', N'914', N'5', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10056-10', N'Ketoconazol 200mg
  -  ', 2125.0000, N'Agiketo', N'24 tháng', N'Viên', N'914', N'7', 44)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10057-10', N'Lansoprazol vi h?t bao tan trong ru?t (hàm lu?ng 8,5%) tuong duong 30mg Lansoprazol
  -  ', 2900.0000, N'Agi-Lanso', N'36 tháng', N'Viên', N'914', N'5', 39)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10058-10', N'Spiramycin 750.000IU, Metronidazole 125mg
  -  ', 1900.0000, N'Agimdogyl', N'36 tháng', N'Viên', N'914', N'1', 33)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10059-10', N'Omeprazol d?ng vi h?t 8,5% bao tan trong ru?t tuong ?ng Omeprazol 20mg
  -  ', 1500.0000, N'Agimepzol', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10060-10', N'Fexofenadin hydroclorid 60mg
  -  ', 2100.0000, N'Agimfast', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10061-10', N'Domperidon maleat tuong duong v?i Domperidon 10mg
  -  ', 800.0000, N'Agimoti', N'24 tháng', N'Viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10062-10', N'Amlodipin besilat tuong duong 5mg Amlodipin
  -  ', 1500.0000, N'Agindopin', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10065-10', N'Simvastatin 10mg
  -  ', 3000.0000, N'Agisimva 10', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10066-10', N'Simvastatin 20mg
  -  ', 6800.0000, N'Agisimva 20', N'36 tháng', N'Viên', N'914', N'5', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10067-10', N'Ofloxacin 200mg
  -  ', 1800.0000, N'Agoflox', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10107-10', N'Acyclovir 200mg
  -  ', 2000.0000, N'Acyclovir Boston 200', N'36 tháng', N'Viên', N'850', N'8', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10281-10', N'Acetaminophen 500mg
  -  ', 500.0000, N'Acetaphen 500', N'48 tháng', N'Viên', N'888', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10359-10', N'Carbazochrom 8,68mg)
  -  ', 1300.0000, N'Adrenoxyl 10mg', N'36 tháng', N'Viên', N'853', N'1', 28)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10428-10', N'Adrenalin 1mg/1ml
  -  ', 3150.0000, N'Adretop', N'24 tháng', N'Ống', N'854', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10638-10', N'Acid Ascorbic, Ergocalciferol, Nicotinamid, Riboflavin, Thiamin nitrat, Retinol palmitat
  -  ', 970.0000, N'Actiflex', N'24 tháng', N'Viên', N'895', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10719-10', N'Acyclovir 400 mg
  -  ', 3500.0000, N'Acyclovir Stada 400mg', N'36 tháng', N'Viên', N'856', N'6', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10720-10', N'Acyclovir 800 mg
  -  ', 6000.0000, N'Acyclovir Stada 800mg', N'36 tháng', N'Viên', N'856', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10762-10', N'Acemetacin 60mg
  -  ', 480.0000, N'Acemetacin Stada 60mg', N'24 tháng', N'viên', N'960', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10858-10', N'Acetylcystein 200mg
  -  ', 500.0000, N'Acenews', N'24 tháng', N'Viên', N'1050', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10859-10', N'Acetyl cystein 100mg
  -  ', 1200.0000, N'Acenews', N'24 tháng', N'Gói', N'1050', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10860-10', N'Acetylcystein 200mg
  -  ', 1000.0000, N'Acenews', N'24 tháng', N'Gói', N'1050', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10977-10', N'Omeprazol magnesi tuong duong v?i 20 mg Omeprazol
  -  ', 1100.0000, N'AG-Ome', N'24 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11340-10', N'Nifedipin 30mg
  -  ', 6600.0000, N'Adoor LA', N'24 tháng', N'viên', N'872', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11464-10', N'Theophylin mononitrat 120 mg, Phenobacbital 8 mg, Ephedrin hydroclorid 25 mg
  -  ', 420.0000, N'Admincort', N'36 tháng', N'Viên', N'882', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11476-10', N'Acyclovir 800mg
  -  ', 4400.0000, N'Acyclovir 800mg', N'36 tháng', N'Viên', N'912', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11489-10', N'Aciclovir 200mg
  -  ', 2500.0000, N'Aciclovir 200', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11490-10', N'Aciclovir 800mg
  -  ', 5200.0000, N'Aciclovir 800', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11491-10', N'Betamethason 0,5mg
  -  ', 264.0000, N'Agi - Beta', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11492-10', N'Piracetam 800mg
  -  ', 1400.0000, N'Agicetam', N'36 tháng', N'Viên', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11493-10', N'Clarithromycin 125mg
  -  ', 3000.0000, N'Agiclari 125', N'36 tháng', N'Gói', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11494-10', N'Celecoxib 200mg
  -  ', 4500.0000, N'Agilecox 200', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11495-10', N'Methylprednisolon 4mg
  -  ', 1800.0000, N'Agimetpred 4', N'36 tháng', N'Viên', N'914', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11497-10', N'Metformin HCl 850mg
  -  ', 2200.0000, N'Agimfor 850', N'36 tháng', N'Viên', N'914', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11499-10', N'Atenolol 50 mg
  -  ', 1200.0000, N'Aginolol 50', N'36 tháng', N'Viên', N'914', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11501-10', N'Ibuprofen 600mg
  -  ', 850.0000, N'Agirofen', N'24 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11599-10', N'Paracetamol 500 mg, Codein 10 mg
  -  ', 504.0000, N'Advan', N'24 tháng', N'Viên', N'926', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11640-10', N'Acetaminophen 500mg
  -  
cafein 65mg
  -  ', 1500.0000, N'Acetaphen Extra', N'36 tháng', N'Viên', N'888', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11768-10', N'Acyclovir 200mg
  -  ', 1200.0000, N'Acyclovir', N'36 tháng', N'Viên', N'952', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11800-10', N'Tadalafil 20mg
  -  ', 18000.0000, N'Acilis 20', N'24 tháng', N'Viên', N'907', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11932-10', N'Acyclovir 100mg
  -  ', 16000.0000, N'Acyclovir Stada cream', N'24 tháng', N'Tuýp', N'856', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12081-10', N'resorcin 360mg, glycyrrhetinic acid 54mg, sulfur 540mg
  -  ', 39600.0000, N'Acnes offensive cream', N'36 tháng', N'18g/Tuýp', N'961', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12194-10', N'Sulphamethoxazol 800mg, Trimethoprim 160mg
  -  ', 700.0000, N'Agi - CotrimF', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12282-10', N'Vitamin A (retinyl palmitat 2000IU, Vitamin D2 200 IU
  -  ', 570.0000, N'Adwel', N'36 tháng', N'Viên', N'925', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12373-10', N'Cao khô viên nang Actiso P TW3 0,5g tuong duong Actiso 2,5g, Nhân tr?n 2,5g
  -  ', 4620.0000, N'Actiso P TW3', N'24 tháng', N'Viên', N'943', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12596-10', N'Adefovir dipivoxil 10 mg
  -  ', 15000.0000, N'Adefovir Stada 10 mg', N'24 tháng', N'Viên', N'856', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12764-10', N'Paracetamol 650 mg
  -  ', 700.0000, N'Acetab 650', N'24 tháng', N'Viên', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12765-10', N'Dexchlorpheniramine maleate 2mg
  -  ', 700.0000, N'Agidexclo', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12766-10', N'Gliclazid 80mg
  -  ', 1500.0000, N'Agilizid', N'36 tháng', N'Viên', N'914', N'4', 37)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12768-10', N'Rosuvastatin 10mg (du?i d?ng Rosuvastatin calci)
  -  ', 8000.0000, N'Agirovastin 10', N'36 tháng', N'Viên', N'914', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12769-10', N'Thiamin mononitrat 250mg
  -  ', 550.0000, N'Agivitamin B1', N'24 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12966-10', N'Triprolidin.HCl 2,5mg
  -  
Pseudoephedrin.HCl 60mg
  -  ', 2000.0000, N'Actifaflu', N'36 tháng', N'Viên', N'939', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12988-10', N'Adrenalin 1mg/1ml
  -  ', 3850.0000, N'Adrenalin', N'30 tháng', N'ống', N'944', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13018-10', N'Aciclovir 250mg
  -  ', 9500.0000, N'Acyclovir', N'36 tháng', N'Tuýp', N'903', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13019-10', N'Naphazolin 8 mg, Natri Clorid 144 mg
  -  ', 25000.0000, N'ADNaphazolin - New', N'24 tháng', N'Lọ', N'903', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13301-10', N'Acetylcystein 200mg
  -  ', 850.0000, N'Acecyst', N'24 tháng', N'viên', N'914', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13302-10', N'Diacerein 50mg
  -  ', 6000.0000, N'Agdicerin', N'36 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13303-10', N'Piracetam 400mg
  -  ', 700.0000, N'Agicetam', N'36 tháng', N'Viên', N'914', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13304-10', N'Etoricoxib 60mg
  -  ', 6800.0000, N'Agietoxib 60', N'36 tháng', N'viên', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13305-10', N'Etoricoxib 90mg
  -  ', 10500.0000, N'Agietoxib 90', N'36 tháng', N'viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13307-10', N'Fexofenadin hydroclorid 120mg
  -  ', 3800.0000, N'Agimfast 120', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13308-10', N'Fexofenadin hydroclorid 180mg
  -  ', 5100.0000, N'Agimfast 180', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13311-10', N'Glucosamin sulfat dikaliclorid 331,6mg
  -  ', 1530.0000, N'Agimsamine', N'24 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13315-10', N'Cimetidin 300mg
  -  ', 460.0000, N'Agintidin', N'36 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13316-10', N'Cimetidin 400mg
  -  ', 700.0000, N'Agintidin 400', N'36 tháng', N'Viên', N'914', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13317-10', N'Rosuvastatin calcium tuong duong 20 mg Rosuvastatin
  -  ', 15000.0000, N'Agirovastin 20', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13330-10', N'Acetylcystein 200mg
  -  ', 1260.0000, N'Ace-Cold', N'36 tháng', N'Gói', N'916', N'5', 46)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13361-10', N'Acetazolamid 250 mg
  -  ', 735.0000, N'Acetazolamid', N'36 tháng', N'Viên', N'946', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13744-11', N'Paracetamol 325mg
  -  ', 270.0000, N'Acetab 325', N'36 tháng', N'Viên', N'914', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13745-11', N'Betahistin dihydroclorid 16mg
  -  ', 1860.0000, N'Agihistine 16', N'36 tháng', N'Viên', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13746-11', N'Betahistin dihydroclorid 8mg
  -  ', 1320.0000, N'Agihistine 8', N'36 tháng', N'Viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13748-11', N'Glucosamin 417mg
  -  
Natri chondroitin sulfat 400mg
  -  ', 3900.0000, N'Agimsamin F', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13749-11', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 3300.0000, N'Agimycob', N'36 tháng', N'Viên', N'914', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13750-11', N'Enalapril maleat tuong duong Enalapril 5mg
  -  ', 1200.0000, N'Aginaril', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13751-11', N'Diosmin 450mg, hesperidin 50mg
  -  ', 2500.0000, N'Agiosmin', N'24 tháng', N'Viên', N'914', N'2', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13752-11', N'Trimebutine maleat 100mg
  -  ', 800.0000, N'Agitritine 100', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13753-11', N'Trimebutine maleat 200mg
  -  ', 1500.0000, N'Agitritine 200', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13770-11', N'Acetyl cystein 200mg
  -  ', 1700.0000, N'Acetylcystein Boston 200', N'24 tháng', N'Gói', N'850', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13824-11', N'paracetamol 500mg, diclofenac natri 50mg
  -  ', 660.0000, N'AC-Diclo', N'24 tháng', N'Viên', N'926', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13874-11', N'N - Acetylcystein 200 mg
  -  ', 472.0000, N'Acetylcystein 200mg', N'36 tháng', N'Viên', N'940', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14045-11', N'Aciclovir 200mg
  -  ', 1250.0000, N'Aciclovir', N'36 tháng', N'Viên', N'876', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14108-11', N'Acetyl leucin 500mg
  -  ', 720.0000, N'Acedanyl', N'24 tháng', N'Viên', N'1049', N'6', 30)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14139-11', N'Etoricoxib 90mg
  -  ', 8000.0000, N'Ahevip', N'36 tháng', N'Viên', N'847', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14163-11', N'Acetylcystein 200mg/ gói
  -  ', 1500.0000, N'Acetylcystein', N'24 tháng', N'gói 1,5g', N'883', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14216-11', N'Bromhexin HCl 8mg/viên
  -  ', 195.0000, N'Agi-Bromhexine', N'36 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14217-11', N'Paracetamol 500mg/ viên
  -  ', 500.0000, N'Agicedol', N'36 tháng', N'viên', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14220-11', N'Methyldopa 250mg/ viên
  -  ', 2000.0000, N'AgiDopa', N'36 tháng', N'Viên', N'914', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14221-11', N'M?i viên ch?a: Paracetamol 500mg
  -  
Phenylephrin HCl 5mg
  -  
Clorpheniramin maleat 2mg
  -  ', 700.0000, N'Agidorin', N'36 tháng', N'Viên', N'914', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14222-11', N'Pyridoxin HCl 250mg/ viên
  -  ', 600.0000, N'Agidoxin', N'24 tháng', N'Viên', N'914', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14223-11', N'Rifampicin 300mg/ viên
  -  ', 1970.0000, N'Agifamcin 300', N'36 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14224-11', N'Furosemid 40mg/ viên
  -  ', 405.0000, N'Agifuros', N'36 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14225-11', N'Lincomycin hydroclorid tuong duong Lincomycin 500mg/ viên
  -  ', 1850.0000, N'Agi-linco', N'36 tháng', N'Viên', N'914', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14226-11', N'Piroxicam beta cyclodextrin tuong duong Piroxicam 20mg/ viên
  -  ', 3500.0000, N'Agipiro', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14229-11', N'Paracetamol 500mg/ viên
  -  ', 450.0000, N'Agi-Tyfedol 500', N'36 tháng', N'Viên', N'914', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14244-11', N'Glutathion 600mg
  -  ', 75000.0000, N'Acezym 600', N'36 tháng', N'Lọ', N'916', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14257-11', N'Acetylcystein 100mg
  -  ', 1100.0000, N'Acetylcystein Boston 100', N'24 tháng', N'Gói', N'850', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14378-11', N'Erythromycin 4%
  -  ', 19200.0000, N'Acneegel', N'36 tháng', N'tub', N'938', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14507-11', N'Simethicon 30mg, biodiastase 2000 I 10mg, Lipase II 10mg, cellulase AP3 II 25mg
  -  ', 2000.0000, N'Acapella-S', N'36 tháng', N'Viên', N'893', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14511-11', N'Aceclofenac 100 mg
  -  ', 1300.0000, N'Aceclofenac PMP', N'24 tháng', N'Viên', N'895', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14512-11', N'Risedronat natri 5mg
  -  ', 7250.0000, N'Acitonal - 5', N'36 tháng', N'Viên', N'895', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14628-11', N'Cao actiso 156,3mg tuong duong lá actiso tuoI 3,908g/ ?ng
  -  ', 2500.0000, N'Actiso', N'24 tháng', N'Ống', N'933', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14632-11', N'Acyclovir 500mg/ 10g
  -  ', 19000.0000, N'Acyclovir 5%', N'24 tháng', N'Tuýp', N'883', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14663-11', N'M?i viên ch?a Paracetamol 500mg
  -  
Cafein 65mg
  -  ', 600.0000, N'Acetab Extra', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14664-11', N'Mephenesin 250mg/ viên
  -  ', 500.0000, N'Agidecotyl', N'24 tháng', N'viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14665-11', N'Lamivudin 100mg/ viên
  -  ', 8500.0000, N'Agimidin', N'36 tháng', N'Viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14666-11', N'Retinyl acetat 5000IU/ viên
  -  ', 430.0000, N'Agirenyl', N'36 tháng', N'Viên', N'914', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14765-11', N'N-Acetyl cystein 200mg
  -  ', 872.0000, N'Acetylcystein 200mg', N'36 tháng', N'Gói', N'940', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15034-11', N'Adefovir dipivoxil 10mg
  -  ', 28980.0000, N'Afovixtab', N'36 tháng', N'Viên', N'895', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15052-11', N'Levocetirizin dihydroclorid 5mg
  -  ', 3200.0000, N'Acritel', N'36 tháng', N'Viên', N'873', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15204-11', N'Acetylcystein 100mg
  -  ', 1960.0000, N'Aceblue 100', N'36 tháng', N'Gói', N'949', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15352-11', N'Cefuroxim
  -  
750mg', 28500.0000, N'Actixim', N'24 tháng', N'Lọ', N'851', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15362-11', N'M?i viên ch?a: Paracetamol 500mg
  -  
Cafein 25mg
  -  
Phenylephrin HCl 5mg
  -  ', 700.0000, N'Agidolgen', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15363-11', N'M?i viên ch?a: Paracetamol 325mg
  -  
Ibuprofen 200mg
  -  ', 700.0000, N'Agiparofen', N'36 tháng', N'Viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15499-11', N'Cao di?p h? châu 100mg, cao nhân tr?n 50mg, cao c? nh? n?i 50mg
  -  ', 1750.0000, N'AD - Liver', N'24 tháng', N'Viên', N'954', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15582-11', N'Acetylcystein
  -  
100 mg', 1020.0000, N'Acehasan 100', N'24 tháng', N'Gói', N'859', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15583-11', N'Acetylcystein
  -  
200mg', 1140.0000, N'Acehasan 200', N'24 tháng', N'Gói', N'859', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15693-11', N'Vitamin A palmitat 5000 IU, vitamin D3 400IU
  -  ', 420.0000, N'A.D.O', N'24 tháng', N'Viên', N'880', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15871-11', N'Sodium chloride, Potassium chloride, Calcium chloride dihydrate, sodium acetate trihydrat
  -  ', 17000.0000, N'Acetate Ringer', N'36 tháng', N'Chai', N'956', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15984-11', N'M?i gói ch?a: Domperidon maleat tuong duong Dmperidon 2,5mg
  -  
--
Simethicon 50mg
  -  ', 1800.0000, N'Agimoti-S', N'24 tháng', N'Gói', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16005-11', N'Acyclovir
  -  
200 mg', 630.0000, N'Acyclovir VPC 200', N'36 tháng', N'Viên', N'920', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16082-11', N'Aciclovir 800mg
  -  
--', 2500.0000, N'Aciclovir MKP 800', N'36 tháng', N'Viên', N'956', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16258-12', N'Vitamin B1
  -  
12,5mg
Vitamin B6
  -  
12,5mg
Vitamin B12
  -  
50mcg
S?t sulfat
  -  
16,2mg
...', 1400.0000, N'3Bpluzs F', N'36 tháng', N'viên', N'889', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16282-12', N'Acetylcystein 200mg
  -  
--', 1000.0000, N'Acetylcystein 200mg', N'36 tháng', N'Gói', N'949', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16313-12', N'M?i 40ml ch?a: Ô d?u 0,32g
  -  
--
Mã ti?n 0,64g
  -  
Qu? nh?c 0,32g
  -  
Ð?i h?i 0,32g
  -  
...', 48000.0000, N'Acocina', N'24 tháng', N'Chai', N'890', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16333-12', N'Aciclovir 200mg
  -  
--', 1200.0000, N'Aciclovir MKP 200', N'36 tháng', N'Viên', N'956', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16381-12', N'Acetylcystein 200mg
  -  
--', 470.0000, N'Acetylcystein', N'36 tháng', N'viên', N'845', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16478-12', N'Ambroxol HCl 15mg/5ml
  -  
--', 7800.0000, N'ABROCTO', N'24 tháng', N'Ống', N'879', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16515-12', N'Paracetamol , Ibuprofen
  -  
325mg', 600.0000, N'Ailaxon', N'36 tháng', N'Viên', N'920', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16516-12', N'Paracetamol 325mg, Ibuprofen 200mg
  -  
--', 595.0000, N'Ailaxon', N'36 tháng', N'viên', N'920', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16621-12', N'Acyclovir 200mg
  -  
--', 1200.0000, N'Acyclovir 200', N'36 tháng', N'Viên', N'952', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16647-12', N'Aciclovir 250mg
  -  
--', 11250.0000, N'Aciclovir MKP 5%', N'24 tháng', N'tuýp', N'956', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16656-12', N'Risedronat natri 35mg
  -  
--', 31250.0000, N'Acitonal-35', N'36 tháng', N'Viên', N'895', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16803-12', N'Acyclovir
  -  
200mg', 450.0000, N'Aciclovir 200 mg', N'36 tháng', N'Viên', N'882', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16812-12', N'Paracetamol 325mg/ viên
  -  
--', 263.0000, N'Acemol', N'42 tháng', N'Viên', N'912', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16814-12', N'Paracetamol 100mg/ viên
  -  
--', 128.0000, N'Acemol enfant', N'36 tháng', N'Viên', N'912', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16815-12', N'Acetylcystein 200mg/ viên
  -  
--', 685.0000, N'Acetylcystein', N'36 tháng', N'viên', N'912', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16816-12', N'Acilovir 200mg/ viên
  -  
--', 1312.0000, N'Acyclovir 200mg', N'36 tháng', N'Viên', N'912', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16826-12', N'acid folic
  -  
5mg', 252.0000, N'Acid Folic 5 mg', N'24 tháng', N'Viên', N'885', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17011-12', N'Paracetamol 500mg
  -  
--
Codein phosphat 8mg
  -  ', 800.0000, N'Acetalvic-codein 8', N'36 tháng', N'Viên', N'949', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17254-12', N'Acetylcystein
  -  
200mg', 1800.0000, N'Acinmuxi', N'24 tháng', N'Gói', N'878', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17377-12', N'Losartan Kali
  -  
50mg/ viên', 3000.0000, N'Agilosart 50', N'24 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17378-12', N'Alimemazin tartrat
  -  
5mg/ viên', 350.0000, N'Aginmezin', N'24 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17384-12', N'Amikacin sulfat
  -  
Amikacin 250mg', 26250.0000, N'Abicin 250', N'36 tháng', N'Lọ', N'916', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17385-12', N'Paracetamol
  -  
80mg', 1575.0000, N'Ace kid 80', N'36 tháng', N'Gói', N'916', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17405-12', N'Aceclofenac
  -  
100 mg', 540.0000, N'Acenac 100', N'36 tháng', N'Viên', N'920', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17430-12', N'Acetylcystein
  -  
200 mg', 1500.0000, N'Acetyl Cystein', N'24 tháng', N'Gói', N'924', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17472-12', N'Các Vitamin A, B1, B2, PP, B6, B12, D3
  -  
S?t sulfat
  -  
Lysine HCl
  -  
Calci glycerophosphat
  -  
...', 1900.0000, N'Aceffex', N'30 tháng', N'Viên', N'933', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17787-12', N'Acyclovir
  -  
200 mg', 800.0000, N'Acyclovir 200 mg', N'36 tháng', N'Viên', N'877', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17818-12', N'Sildenafil (du?i d?ng Sildenafil citrat)
  -  
100 mg', 60000.0000, N'Adagrin', N'36 tháng', N'viên', N'900', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17856-12', N'Aciclovir
  -  
400 mg', 680.0000, N'Aciclovir 400 mg', N'36 tháng', N'Viên', N'882', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17864-12', N'Acetylcystein
  -  
200 mg', 2108.0000, N'Acetylcystein', N'30 tháng', N'gói', N'909', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17880-12', N'Domperidone
  -  
30 mg/30 ml', 18800.0000, N'Agimoti', N'24 tháng', N'Chai', N'914', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17887-12', N'Paracetamol
  -  
150 mg
vitamin C
  -  
75 mg', 1260.0000, N'Ace kid 150', N'36 tháng', N'Gói', N'916', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17908-12', N'Acetylcystein
  -  
200 mg', 600.0000, N'Acetylcysteine', N'24 tháng', N'Viên', N'924', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18220-13', N'Erythromycin (du?i d?ng Erythromycin stearat)
  -  
500 mg', 2280.0000, N'Agi- Ery 500', N'36 tháng', N'Viên', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18248-13', N'Paracetamol
  -  
325 mg', 2940.0000, N'Ace kid 325', N'36 tháng', N'gói', N'916', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18434-13', N'Aciclovir
  -  
250mg', 10000.0000, N'Aciclovir 5%', N'36 tháng', N'Tuýp', N'954', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18475-13', N'Acetaminophen
  -  
500 mg', 630.0000, N'Acnekyn 500', N'36 tháng', N'Viên', N'958', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18521-13', N'Aceclofenac
  -  
100mg', 1600.0000, N'Aclon', N'36 tháng', N'viên', N'858', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18667-13', N'Sildenafil
  -  
50 mg', 45000.0000, N'Adagrin', N'36 tháng', N'Viên', N'900', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18693-13', N'Aciclovir
  -  
0,25g/ 5g', 10000.0000, N'Agiclovir 5%', N'36 tháng', N'Tuýp', N'914', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18767-13', N'Dextromethorphan HBr
  -  
10mg
Phenylephrin HCl
  -  
5mg
Triprolidin HCl
  -  
1,25mg', 580.0000, N'Adkold-new', N'24 tháng', N'Viên', N'947', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18820-13', N'Acetylcystein
  -  
200 mg', 1300.0000, N'Acitys', N'36 tháng', N'1300', N'897', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18919-13', N'Acetylcystein
  -  
200mg', 714.0000, N'Acetylcystein', N'24 tháng', N'Viên', N'884', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18925-13', N'Tenofovir disoproxil fumarat 300mg
  -  ', 25000.0000, N'Agifovir', N'24 tháng', N'Viên', N'914', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19015-13', N'M?i viên ch?a: Phenylephrin HCl 2,5mg
  -  
Triprolidin HCl 0,625mg
  -  ', 2600.0000, N'Adkold-new for children', N'36 tháng', N'Gói', N'941', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19107-13', N'Acid folic
  -  
5 mg', 540.0000, N'Acid folic MKP', N'24 tháng', N'Viên', N'957', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19179-13', N'Acetylcystein
  -  
200 mg', 465.0000, N'Acehasan 200', N'36 tháng', N'Viên', N'859', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19310-13', N'M?i 30ml ch?a Bromhexin HCl 0,024g
  -  ', 18000.0000, N'Agi-bromhexine', N'24 tháng', N'Chai', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19311-13', N'Losartan kali
  -  
25 mg', 1450.0000, N'Agilosart 25', N'24 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19483-13', N'Acetylcystein 200mg
  -  ', 1100.0000, N'Acetylcystein 200mg', N'36 tháng', N'Gói', N'840', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19571-13', N'20 ml dung d?ch ch?a: Clindamycin (du?i d?ng Clindamycin hydroclorid) 200mg
  -  
Metronidazol 160mg
  -  ', 40000.0000, N'Acnequidt', N'36 tháng', N'Hộp', N'892', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19584-13', N'Paracetamol 150mg
  -  ', 1800.0000, N'Actadol 150', N'36 tháng', N'Gói', N'894', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19585-13', N'Paracetamol 80mg
  -  ', 1400.0000, N'Actadol 80', N'36 tháng', N'Gói', N'894', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19639-13', N'Aciclovir 200 mg
  -  ', 700.0000, N'Aciclovir', N'36 tháng', N'Viên', N'857', N'9', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19729-13', N'Nhôm hydroxyd gel khô
  -  
200 mg
Magnesi hydroxyd
  -  
200 mg
Dimethylpolysiloxane
  -  
10 mg
Dicyclomine HCl
  -  
2,5 mg
...', 246.0000, N'Ahmcmil''s', N'36 tháng', N'Viên', N'869', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19753-13', N'Clorpheniramin maleat 4 mg
  -  ', 100.0000, N'Agitec-F', N'24 tháng', N'Viên', N'837', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19754-13', N'Clorpheniramin maleat
  -  
4 mg', 100.0000, N'Agitec-F', N'24 tháng', N'Viên', N'837', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19769-13', N'Aciclovir 800mg
  -  ', 5500.0000, N'Acyclovir Boston 800', N'36 tháng', N'Viên', N'850', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20043-13', N'Acetylcystein
  -  
200 mg', 550.0000, N'Acetydona 200 mg', N'36 tháng', N'Viên', N'958', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20124-13', N'Aceclofenac
  -  
100 mg', 701.0000, N'Aceclofenac Stada 100 mg', N'36 tháng', N'701', N'864', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20188-13', N'Aciclovir
  -  
400mg', 2230.0000, N'Aciclovir', N'36 tháng', N'Viên', N'946', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20277-13', N'Sildenafil (du?i d?ng Sildenafil citrat) 50 mg
  -  ', 27000.0000, N'Activ - Gra', N'36 tháng', N'Viên', N'834', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20321-13', N'Aciclovir 200mg
  -  ', 900.0000, N'Aciclovir', N'36 tháng', N'Viên', N'894', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20430-14', N'Cefuroxim (du?i d?ng Cefuroxim natri)
  -  
1,5 g', 35500.0000, N'Actixim 1.5 g', N'24 tháng', N'Lọ', N'851', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20502-14', N'Pefloxacin (du?i d?ng Pefloxacin mesylat dihydrat)
  -  
400mg/5ml', 17000.0000, N'Afulocin', N'36 tháng', N'Ống', N'895', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20511-14', N'Aciclovir
  -  
200mg', 1400.0000, N'Acyvir', N'36 tháng', N'viên', N'897', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20645-14', N'Paracetamol 325mg
  -  ', 375.0000, N'Acemol NDP 325', N'42 tháng', N'Viên', N'909', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20646-14', N'Paracetamol 500mg
  -  ', 450.0000, N'Acemol NDP 500', N'42 tháng', N'Viên', N'909', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20653-14', N'Omeprazol (D?ng vi h?t bao tan trong ru?t)
  -  
20 mg', 1350.0000, N'AG-Ome', N'36 tháng', N'Viên', N'914', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20679-14', N'Paracetamol
  -  
325 mg', 850.0000, N'Acepron 325 mg', N'36 tháng', N'Gói', N'920', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20680-14', N'Paracetamol
  -  
500 mg', 300.0000, N'Acepron 500 mg', N'36 tháng', N'Viên', N'920', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20681-14', N'Paracetamol
  -  
500 mg
Codein phosphat hemihydrat
  -  
30 mg', 1365.0000, N'Acepron Codein', N'36 tháng', N'Viên', N'920', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20748-14', N'Acetaminophen
  -  
500 mg', 286.0000, N'ABAB 500mg', N'48 tháng', N'Viên', N'926', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20749-14', N'Acetaminophen
  -  
500 mg', 286.0000, N'ABAB 500mg', N'48 tháng', N'Viên', N'926', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20936-14', N'Acetylcystein
  -  
200mg', 1600.0000, N'Acethepharm', N'24 tháng', N'Gói', N'955', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21047-14', N'Alendronic acid (du?i d?ng alendronat natri) 70mg
  -  ', 22000.0000, N'Agostini', N'36 tháng', N'Viên', N'873', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21122-14', N'Diacerhein 50mg
  -  ', 5000.0000, N'Aczandia', N'36 tháng', N'Viên', N'876', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21216-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
875 mg
Acid Clavulanic (du?i d?ng Clavulanat kali)
  -  
125 mg', 9000.0000, N'Acigmentin 1000', N'36 tháng', N'Viên', N'882', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21217-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (du?i d?ng kali clavulanat)
  -  
62,5mg', 5000.0000, N'Acigmentin 312,5', N'36 tháng', N'Gói', N'882', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21220-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat) 500 mg
  -  
125 mg
Acid Clavulanic (du?i d?ng Clavulanat kali)
  -  ', 5500.0000, N'Acigmentin 625', N'36 tháng', N'Viên', N'882', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21244-14', N'Acarbose 100mg
  -  ', 3200.0000, N'Actidine 100', N'36 tháng', N'Viên', N'850', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21245-14', N'Acarbose
  -  
50 mg', 3000.0000, N'Actidine 50', N'36 tháng', N'Viên', N'849', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21331-14', N'Dextromethorphan HBr
  -  
15mg', 600.0000, N'Acough', N'36 tháng', N'Viên', N'934', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21418-14', N'Cao d?c Actiso (18:1)
  -  
250mg', 2300.0000, N'Actiso HĐ', N'36 tháng', N'Viên', N'954', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21460-14', N'Acyclovir
  -  
200mg', 1250.0000, N'Acyclovir 200 mg', N'48 tháng', N'Viên', N'959', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21528-14', N'Acyclovir
  -  
400mg', 3100.0000, N'Acyclovir Stada 400mg', N'36 tháng', N'viên', N'861', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21620-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (du?i d?ng Kali clavulanat)
  -  
125 mg', 7000.0000, N'Acigmentin 375', N'36 tháng', N'Gói', N'882', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21788-14', N'Sulfur
  -  
540mg
Resorcin
  -  
360mg
Tocopherol acetate
  -  
90mg
Glycyrrhetinic acid
  -  
54mg
...', 56700.0000, N'Acnes medical Cream', N'36 tháng', N'56700', N'868', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21827-14', N'Acetylcystein 200 mg
  -  ', 810.0000, N'Acetylcystein', N'36 tháng', N'Gói', N'920', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21854-14', N'Acetaminophen 500 mg
  -  ', 286.0000, N'ABAB 500 mg', N'48 tháng', N'Viên', N'926', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21855-14', N'Acetaminophen 500 mg
  -  ', 286.0000, N'ABAB 500 mg', N'48 tháng', N'Viên', N'926', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21884-14', N'Paracetamol
  -  
500mg
Cafein
  -  
65mg', 710.0000, N'Actadol - Extra', N'36 tháng', N'viên', N'938', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21910-14', N'Acetylcystein
  -  
200mg', 407.0000, N'Acetylcystein 200mg', N'36 tháng', N'Viên', N'840', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21960-14', N'Paracetamol 500mg
  -  ', 800.0000, N'Actadol 500', N'36 tháng', N'Viên', N'894', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22122-15', N'Paracetamol 80 mg/1,5g
  -  ', 650.0000, N'Acepron 80', N'36 tháng', N'Gói', N'920', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22162-15', N'Paracetamol 500 mg
  -  ', 250.0000, N'ABAB 500 mg', N'48 tháng', N'Viên', N'926', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22211-15', N'Clorpheniramin maleat 2mg
  -  
Phenylephrin HCl 10mg
  -  ', 490.0000, N'Acdinral', N'36 tháng', N'Viên', N'940', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22293-15', N'Acenocoumarol 1mg
  -  ', 2700.0000, N'Acenocoumarol-VNP 1', N'36 tháng', N'Viên', N'897', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22294-15', N'Acenocoumarol 4mg
  -  ', 3300.0000, N'Acenocoumarol-VNP 4', N'36 tháng', N'Viên', N'897', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22437-15', N'Paracetamol
  -  
325 mg', 270.0000, N'Acetab 325', N'24 tháng', N'Viên', N'914', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22438-15', N'S?t (II) fumarat
  -  
200 mg
Acid folic
  -  
1 mg', 610.0000, N'Agifivit', N'36 tháng', N'Viên', N'914', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22667-15', N'Acetylcystein 200 mg
  -  ', 713.0000, N'Acetylcystein Stada 200 mg', N'24 tháng', N'Viên', N'862', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22783-15', N'Albendazol 400mg
  -  ', 3000.0000, N'Adazol', N'36 tháng', N'Viên', N'884', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22789-15', N'M?i gói ch?a Calci (du?i d?ng tricalci phosphat) 600mg
  -  ', 2600.0000, N'Agi-calci', N'36 tháng', N'Gói', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22790-15', N'M?i gói ch?a Paracetamol 150mg
  -  ', 1500.0000, N'Agimol 150', N'36 tháng', N'Gói', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22791-15', N'M?i gói ch?a Paracetamol 325mg
  -  ', 1800.0000, N'Agimol 325', N'36 tháng', N'Gói', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22792-15', N'Mosaprid citrat 5mg
  -  ', 3000.0000, N'Agimosarid', N'24 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22793-15', N'M?i 60ml ch?a: Dextromethorphan HBr 72mg
  -  
Clorpheniramin maleat 18mg
  -  
Guaiphenesin 600mg
  -  ', 14500.0000, N'Agituss', N'24 tháng', N'Chai', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22822-15', N'Paracetamol
  -  
650 mg', 435.0000, N'Acepron 650', N'36 tháng', N'Viên', N'920', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22915-15', N'Vitamin B1
  -  
125 mg
Vitamin B6
  -  
125 mg
Vitamin B12
  -  
250 mcg', 1250.0000, N'3B-Medi', N'36 tháng', N'Viên', N'930', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22934-15', N'Aciclovir 200mg
  -  ', 1200.0000, N'Aciclovir 200mg', N'36 tháng', N'Viên', N'932', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23266-15', N'Aciclovir 800 mg
  -  ', 2050.0000, N'Aciclovir Meyer', N'36 tháng', N'Viên', N'857', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23346-15', N'Acyclovir
  -  
800 mg', 5000.0000, N'Acyclovir Stada 800 mg', N'36 tháng', N'Viên', N'864', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23472-15', N'M?i gói 1,5g ch?a: Acetylcystein 200 mg
  -  ', 1200.0000, N'Acetylcistein 200 mg', N'36 tháng', N'Gói', N'882', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23473-15', N'Escin 20 mg
  -  ', 3000.0000, N'Aescin 20 mg', N'36 tháng', N'Viên', N'882', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23483-15', N'M?i gói 1,6g ch?a Acetylcystein 200mg
  -  
  -  ', 2050.0000, N'Acecyst', N'24 tháng', N'Gói', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23484-15', N'M?i viên ch?a: Calci carbonat 1250mg
  -  
Cholecalciferol 200IU
  -  ', 870.0000, N'Agi- calci', N'24 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23485-15', N'M?i viên ch?a: Thiamin mononitrat 125mg
  -  
Pyridoxin hydroclorid 125mg
  -  
Cyanocobalamin 125mcg
  -  ', 1200.0000, N'Agi- neurin', N'24 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23486-15', N'Acid nalidixic 500mg
  -  ', 1400.0000, N'Aginalxic', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23487-15', N'M?i gói 1,5g ch?a Roxithromycin 50mg
  -  
  -  ', 2100.0000, N'Agiroxi 50', N'24 tháng', N'Gói', N'838', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23528-15', N'Paracetamol
  -  
500mg', 2100.0000, N'Acefalgan 500', N'24 tháng', N'Viên', N'887', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23567-15', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 350.0000, N'A.C Mexcold', N'36 tháng', N'Viên', N'926', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23568-15', N'Acetylcystein 200 mg
  -  ', 875.0000, N'Acetylcystein 200 mg', N'24 tháng', N'Viên', N'926', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23657-15', N'Vitamin A (Retinol palmitat) 2000IU
  -  
Vitamin D3 250IU
  -  ', 650.0000, N'AD Tamy', N'30 tháng', N'Viên', N'933', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23739-15', N'Vitamin A (Retinol palmitat)
  -  
5000 IU
Vitamin D3 (Cholecalciferol )
  -  
400 IU', 1500.0000, N'Admed', N'36 tháng', N'Viên', N'905', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23889-15', N'Cao hoa hòe (3:1)
  -  
160mg
Cao d?a c?n (6:1)
  -  
20mg
Cao tâm sen (4:1)
  -  
15mg
Cao cúc hoa (3:1)
  -  
10mg
...', 590.0000, N'Casoran', N'48 tháng', N'Viên', N'899', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24018-15', N'M?i 500ml ch?a: Natri clorid 3g
  -  
Kali clorid 0,15g
  -  
Calci clorid.2H2O 0,1g
  -  
Natri acetat.3H2O 1,9g
  -  
...', 17988.0000, N'Acetate Ringer''s', N'60 tháng', N'Chai', N'866', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24071-16', N'Cao d?c r? hà th? ô d?
  -  
300mg', 2700.0000, N'Hà thủ ô', N'36 tháng', N'Túi', N'899', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24111-16', N'Methylprednisolon 4mg
  -  ', 1100.0000, N'Agimetpred 4', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24112-16', N'Simvastatin 20mg
  -  ', 2500.0000, N'Agisimva 20', N'36 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24125-16', N'M?i 5ml ch?a Ambroxol (du?i d?ng Ambroxol HCl) 30mg
  -  ', 26000.0000, N'A. T Ambroxol', N'24 tháng', N'chai', N'1006', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24126-16', N'M?i hoàn m?m 9g ch?a: Th?c d?a 1,6g
  -  
Hoài son 0,8g
  -  
Son thù 0,8g
  -  
M?u don bì 0,6g
  -  
...', 5000.0000, N'A. T Lục vị', N'24 tháng', N'Viên hoàn', N'1006', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24127-16', N'Gói 20g ch?a Nhôm phosphat gel 20% 12,380 g
  -  ', 2800.0000, N'A.T Alugela', N'24 tháng', N'Gói', N'1006', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24128-16', N'?ng 10ml ch?a Arginin hydroclorid 800mg
  -  
  -  ', 4500.0000, N'A.T Arginin 800', N'24 tháng', N'Ống', N'1006', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24129-16', N'Bisoprolol fumarat 5mg
  -  ', 1500.0000, N'A.T Bisoprolol 5', N'24 tháng', N'Viên', N'1006', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24130-16', N'M?i ?ng 10ml ch?a: Calci glucoheptonat 700mg
  -  
Calci gluconat 300mg
  -  ', 4600.0000, N'A.T Calci plus', N'24 tháng', N'4600', N'1006', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24131-16', N'M?i 5ml ch?a Desloratadin 2,5mg
  -  ', 5000.0000, N'A.T Desloratadin', N'24 tháng', N'Gói', N'1006', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24132-16', N'Loratadin 10mg
  -  ', 400.0000, N'A.T Loratadin', N'24 tháng', N'Viên', N'1006', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24133-16', N'Ranitidin (du?i d?ng Ranitidin hydroclorid) 50mg/2ml
  -  ', 10000.0000, N'A.T Ranitidine inj', N'24 tháng', N'Ống', N'1006', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24153-16', N'Acarbose
  -  
50mg', 2100.0000, N'Acarfar', N'36 tháng', N'Viên', N'946', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24204-16', N'M?i gói ch?a: Paracetamol 325mg
  -  
Natri benzoat 100mg
  -  
Clorpheniramin maleat 2mg
  -  ', 1620.0000, N'Acegoi', N'24 tháng', N'Gói', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24206-16', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 530.0000, N'A.C Mexcold', N'36 tháng', N'530', N'926', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24262-16', N'Carbazochrom
  -  
10mg', 1300.0000, N'Adrenoxyl 10mg', N'36 tháng', N'Viên', N'853', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24375-16', N'Aciclovir 400mg
  -  ', 2530.0000, N'Aciclovir 400 mg', N'36 tháng', N'Viên nang mềm', N'954', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24489-16', N'Acyclovir 5% (kl/kl)
  -  ', 12000.0000, N'Acyclovir', N'24 tháng', N'Tuýp', N'844', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24495-16', N'Adefovir dipivoxil 10 mg
  -  ', 3250.0000, N'Adefovir meyer', N'36 tháng', N'Viên', N'857', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24522-16', N'M?i viên ch?a: Cao khô du?c li?u 200mg tuong duong Actiso (lá) 1975mg
  -  
B?t m?n du?c li?u Actiso (lá) 25mg
  -  ', 1645.0000, N'Actiso', N'36 tháng', N'Viên', N'871', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24572-16', N'Acyclovir
  -  
200 mg', 1600.0000, N'Acyclovir Stada 200 mg', N'36 tháng', N'Viên', N'864', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24693-16', N'Acetaminophen
  -  
650 mg', 560.0000, N'Acemol fort', N'36 tháng', N'Viên', N'910', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24701-16', N'Chymotrypsin (tuong duong 4200 don v? Chymotrypsin USP) 4,2 mg
  -  ', 1700.0000, N'Agichymo', N'24 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24702-16', N'Spiramycin 0,75 M IU
  -  
Metronidazol 125 mg
  -  ', 1900.0000, N'Agimdogyl', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24703-16', N'Domperidon (du?i d?ng Domperidon maleat)
  -  
10 mg', 800.0000, N'Agimoti', N'24 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24704-16', N'Atenolol 50 mg
  -  ', 800.0000, N'Aginolol 50', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24705-16', N'Acid ascorbic
  -  
500 mg', 900.0000, N'Agi-vitac', N'24 tháng', N'Viên', N'838', N'1', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24722-16', N'Amikacin (du?i d?ng amikacin sulfat) 250mg
  -  ', 24000.0000, N'A.T Amikacin 250', N'24 tháng', N'Lọ', N'848', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24723-16', N'Arginin hydroclorid 1000mg/10ml
  -  ', 5500.0000, N'A.T Arginin 1000', N'24 tháng', N'Gói', N'848', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24724-16', N'Arginin hydroclorid 400mg/10ml
  -  ', 3815.0000, N'A.T Arginin 400', N'24 tháng', N'3815', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24725-16', N'M?i gói ch?a: Tricalci phosphat 1650mg
  -  ', 3200.0000, N'A.T Calci sac', N'24 tháng', N'Gói', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24726-16', N'Calci lactat pentahydrat 500mg/10ml
  -  ', 29000.0000, N'A.T Calmax 500', N'24 tháng', N'chai', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24727-16', N'Esomeprazol (du?i d?ng Esomeprazol natri) 40mg
  -  ', 52000.0000, N'A.T Esomeprazol 40 inj', N'24 tháng', N'Lọ', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24728-16', N'Famotidin 40mg/5ml
  -  ', 76000.0000, N'A.T Famotidin 40 inj', N'24 tháng', N'Lọ', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24729-16', N'Glutathion 300mg
  -  ', 62000.0000, N'A.T Glutathion 300 inj', N'24 tháng', N'Lọ', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24730-16', N'Hydrocortison (du?i d?ng Hydrocortison natri succinat) 100mg
  -  ', 13860.0000, N'A.T Hydrocortisone', N'24 tháng', N'Lọ', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24731-16', N'Netilmicin (du?i d?ng Netilmicin sulfat) 100mg/2ml
  -  ', 36800.0000, N'A.T Neltimicin inj', N'24 tháng', N'Ống', N'848', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24732-16', N'Pantoprazol (du?i d?ng Pantoprazol natri sesquihydrat) 40mg
  -  ', 40000.0000, N'A.T Pantoprazol', N'24 tháng', N'Lọ', N'848', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24819-16', N'Risedronat natri (du?i d?ng Risedronat natri hemi-pentahydrat) 75mg
  -  ', 62000.0000, N'Actorisedron 75', N'36 tháng', N'Viên', N'852', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24956-16', N'Aciclovir
  -  
250mg', 9500.0000, N'Acyclovir', N'36 tháng', N'Tuýp', N'894', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25027-16', N'Adefovir dipivoxil 10mg
  -  ', 12000.0000, N'Adefovir Stada 10 mg', N'24 tháng', N'Viên', N'833', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25031-16', N'Acyclovir
  -  
250 mg', 18000.0000, N'Acyclovir Stada cream', N'24 tháng', N'Tuýp', N'864', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25057-16', N'Chlorpheniramin maleat
  -  
4mg', 106.0000, N'Abochlorphe', N'36 tháng', N'Viên', N'835', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25107-16', N'Acenocoumarol
  -  
1mg', 2400.0000, N'ACM Control 1', N'24 tháng', N'Viên', N'884', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25112-16', N'Acetylcystein
  -  
200 mg', 850.0000, N'Acecyst', N'24 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25113-16', N'Bisoprolol fumarat
  -  
5 mg', 1450.0000, N'Agicardi', N'24 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25114-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 0,5 mg
  -  ', 28000.0000, N'Agicarvir', N'24 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25115-16', N'Piracetam 800 mg
  -  ', 1400.0000, N'Agicetam 800', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25116-16', N'Sulfamethoxazol
  -  
800 mg
Trimethoprim
  -  
160 mg', 700.0000, N'Agi-cotrim F', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25117-16', N'Meloxicam
  -  
7,5 mg', 1200.0000, N'Agimesi 7,5', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25118-16', N'Lisinopril
  -  
5 mg', 1385.0000, N'Agimlisin 5', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25119-16', N'Acid folic
  -  
5 mg', 540.0000, N'Aginfolix 5', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25120-16', N'Cimetidin
  -  
300 mg', 460.0000, N'Agintidin 300', N'36 tháng', N'Viên', N'838', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25121-16', N'Cimetidin
  -  
400 mg', 700.0000, N'Agintidin 400', N'36 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25122-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci)
  -  
20 mg', 8505.0000, N'Agirovastin 20', N'36 tháng', N'Viên', N'838', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25123-16', N'Roxithromycin 150 mg
  -  ', 1820.0000, N'Agiroxi 150', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25277-16', N'Methocarbamol 750mg
  -  ', 2850.0000, N'Acecontin', N'36 tháng', N'Viên', N'940', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25284-16', N'Adrenalin (du?i d?ng Epinephrin bitartrat) 1mg/1ml
  -  ', 4000.0000, N'Adretop', N'24 tháng', N'Ống', N'941', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25351-16', N'Adrenalin
  -  
1mg/1ml', 5000.0000, N'Adrenalin', N'24 tháng', N'Ống', N'955', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25523-16', N'Celecoxib 200 mg
  -  ', 4500.0000, N'Agilecox 200', N'36 tháng', N'Viên', N'838', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25594-16', N'Acenocoumarol
  -  
4mg', 3000.0000, N'ACM Control 4', N'24 tháng', N'Viên', N'884', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25601-16', N'Betamethason 0,25 mg
  -  
0,25 mg, 2 mg
Dexclorpheniramin maleat 2 mg
  -  ', 400.0000, N'Agibetadex', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25602-16', N'Ciprofloxacin (du?i d?ng Ciprofloxacin HCl) 500 mg
  -  
500 mg', 1700.0000, N'Agicipro', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25603-16', N'Aciclovir 200 mg
  -  
200 mg
  -  ', 2000.0000, N'Agiclovir 200', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25604-16', N'Mephenesin 500 mg
  -  
500 mg', 1400.0000, N'Agidecotyl 500', N'24 tháng', N'Viên', N'838', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25605-16', N'Fexofenadin hydroclorid 60 mg
  -  
60 mg', 2100.0000, N'Agimfast 60', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25606-16', N'Ibuprofen 600 mg
  -  
600 mg', 850.0000, N'Agirofen', N'24 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25607-16', N'Simvastatin 10 mg
  -  
10 mg', 2150.0000, N'Agisimva 10', N'36 tháng', N'Viên', N'838', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25608-16', N'Pravastatin natri 40 mg
  -  
40 mg', 8700.0000, N'Agivastar 40', N'36 tháng', N'Viên', N'838', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25609-16', N'Vitamin B1 (Thiamin mononitrat) 250 mg
  -  
250 mg', 800.0000, N'Agivitamin B1', N'24 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25622-16', N'Arginin hydroclorid 400mg
  -  ', 4000.0000, N'A.T Arginin', N'24 tháng', N'Viên', N'848', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25623-16', N'Arginin hydroclorid 200mg
  -  ', 2200.0000, N'A.T Arginin 200', N'24 tháng', N'Viên', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25624-16', N'Acid ascorbic 100mg/5ml
  -  
100mg/5ml', 5200.0000, N'A.T Ascorbic syrup', N'24 tháng', N'Ống', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25625-16', N'Bisoprolol fumarat 2,5mg
  -  ', 1400.0000, N'A.T Bisoprolol 2.5', N'24 tháng', N'Viên', N'848', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25626-16', N'M?i 10ml ch?a: Piracetam 400mg
  -  
400mg', 4950.0000, N'A.T Cetam 400', N'24 tháng', N'4950', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25627-16', N'M?i gói 3,5g ch?a Diosmectit 3000mg
  -  ', 2600.0000, N'A.T Diosmectit', N'24 tháng', N'Gói', N'848', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25628-16', N'M?i 5ml ch?a: Guaifenesin 100mg
  -  
100mg, 2,5mg, 5mg
Phenylephrin hydroclorid 2,5mg
  -  
Dextromethorphan hydrobromid 5mg
  -  ', 5000.0000, N'A.T Flu', N'24 tháng', N'Gói', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25629-16', N'Furosemid 20mg/2ml
  -  ', 3200.0000, N'A.T Furosemid inj', N'24 tháng', N'Ống', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25630-16', N'Glutathion 900mg
  -  ', 110000.0000, N'A.T Glutathione 900 inj.', N'24 tháng', N'Lọ', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25631-16', N'Ibuprofen 100mg/5ml
  -  ', 5500.0000, N'A.T Ibuprofen Syrup', N'24 tháng', N'Ống', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25632-16', N'Lamivudin 100mg
  -  
100mg', 9000.0000, N'A.T Lamivudin', N'24 tháng', N'Viên', N'848', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25633-16', N'M?i 8ml cao l?ng ch?a d?ch chi?t c?a: Th?c d?a 1,6g
  -  
1,6g, 0,8g, 0,8g, 0,6g, 0,6g, 0,6g
Hoài son 0,8g
  -  
Son thù 0,8g
  -  
M?u don bì 0,6g
  -  
...', 38000.0000, N'A.T Lục vị', N'24 tháng', N'Chai', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25634-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci) 20mg
  -  ', 8000.0000, N'A.T Rosuvastatin 20', N'24 tháng', N'Viên', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25635-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci) 5mg
  -  ', 2600.0000, N'A.T Rosuvastatin 5', N'24 tháng', N'Viên', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25636-16', N'M?i gói 5g b?t ch?a: Sucralfat 1000mg
  -  
1000mg', 4500.0000, N'A.T Sucralfate', N'24 tháng', N'Gói', N'848', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25637-16', N'Tobramycin 80mg/2ml
  -  
80mg/2ml', 18000.0000, N'A.T Tobramycine inj', N'24 tháng', N'Ống', N'848', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25638-16', N'Tranexamic acid 250mg/5ml
  -  
250mg/5ml', 7500.0000, N'A.T Tranexamic inj', N'24 tháng', N'Ống', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25673-16', N'Paracetamol
  -  
250mg', 1800.0000, N'Acefalgan 250', N'36 tháng', N'Gói', N'887', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25997-16', N'M?i gói 3 g ch?a Acetylcystein 100 mg
  -  
100 mg', 1200.0000, N'Acenews', N'36 tháng', N'Gói', N'865', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26090-17', N'Paracetamol
  -  
650 mg', 700.0000, N'Acetab 650', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26091-17', N'Piracetam 400 mg
  -  
400 mg', 700.0000, N'Agicetam 400', N'36 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26092-17', N'Dexclorpheniramin maleat 2 mg
  -  
2 mg', 200.0000, N'Agidexclo', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26093-17', N'Omeprazol (du?i d?ng Omeprazol magnesi)
  -  
20 mg', 1100.0000, N'Ag-Ome', N'24 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26104-17', N'M?i 10ml ch?a: Calci glycerophosphat 456mg
  -  
456mg, 426mg
Magnesi gluconat 426mg
  -  ', 3990.0000, N'A.T Calmax', N'24 tháng', N'Ống', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26105-17', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat) 250mg/50ml
  -  
250mg/50ml', 48000.0000, N'A.T Levofloxacin 250 inj', N'24 tháng', N'Lọ', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26106-17', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat) 500mg/100ml
  -  
500mg/100ml', 65000.0000, N'A.T Levofloxacin 500 inj', N'24 tháng', N'Lọ', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26107-17', N'Simvastatin 20mg
  -  
20mg', 2400.0000, N'A.T Simvastatin 20', N'24 tháng', N'Viên', N'848', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26113-17', N'Aciclovir 200mg
  -  
200mg', 2000.0000, N'Acyclovir Boston 200', N'36 tháng', N'Viên', N'850', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26134-17', N'Acetaminophen
  -  
500 mg', 918.0000, N'Acefalgan 500', N'36 tháng', N'Viên', N'887', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26135-17', N'Paracetamol
  -  
500mg, 30mg
Codein phosphat hemihydrat
  -  ', 2630.0000, N'Acefalgan Codein', N'18 tháng', N'Viên', N'887', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26140-17', N'Vitamin B1 (Thiamin nitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 1250.0000, N'3BTP', N'24 tháng', N'Viên', N'924', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26141-17', N'Ð?c ho?t, qu? chi, phòng phong, duong quy, t? tân, xuyên khung, t?n giao, b?ch thu?c, tang ký sinh, can d?a hoàng, d? tr?ng, d?ng sâm, nguu t?t, b?ch linh, cam th?o
  -  
0,9g', 5000.0000, N'AN KHỚP VƯƠNG', N'24 tháng', N'Viên', N'924', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26163-17', N'M?i gói 2g ch?a: Acetylcystein 200 mg
  -  
200 mg', 2000.0000, N'Acetylcystein 200', N'24 tháng', N'Gói', N'927', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26474-17', N'Etoricoxib 60 mg
  -  
60 mg', 3600.0000, N'AM Itori 60', N'36 tháng', N'Viên', N'857', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26553-17', N'Acyclovir
  -  
200 mg', 1600.0000, N'Acyclovir Stada 200 mg', N'36 tháng', N'Viên', N'833', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26588-17', N'M?i gói 2 g ch?a Acetylcystein 200 mg
  -  
200 mg', 1200.0000, N'Acenews', N'36 tháng', N'Gói', N'865', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26619-17', N'Acetylcystein 200mg
  -  
200mg', 477.0000, N'Acetylcysterin', N'36 tháng', N'Viên', N'835', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26720-17', N'Betamethason 0,5 mg
  -  
0,5 mg', 264.0000, N'Agi-Beta', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26721-17', N'Lisinopril (du?i d?ng Lisinopril dihydrat) 10 mg
  -  
10 mg', 2450.0000, N'Agimlisin 10', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26722-17', N'M?i gói 1g ch?a: Paracetamol 80 mg
  -  
80 mg', 1750.0000, N'Agimol 80', N'36 tháng', N'Gói', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26742-17', N'Th?c d?a
  -  
787,5 mg
Hoài son
  -  
720 mg
Son thù
  -  
660 mg
M?u don bì
  -  
487,5 mg
...', 200.0000, N'A.T Bát vị', N'24 tháng', N'Viên', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26743-17', N'M?i 5ml ch?a: Domperidon 5mg
  -  
5mg', 2730.0000, N'A.T Domperidon', N'24 tháng', N'Gói', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26744-17', N'Esomeprazol (du?i d?ng Esomeprazol natri)
  -  
20 mg', 27000.0000, N'A.T Esomeprazol 20 inj', N'24 tháng', N'Lọ', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26745-17', N'M?i 8ml ch?a: Cao ích m?u (T? l? 10:1) 533,33mg
  -  
533,33mg, 166,66mg, 133,33mg
Cao huong ph? (T? l? 10:1) 166,66mg
  -  
Cao ng?i c?u (T? l? 10:1) 133,33mg
  -  ', 30000.0000, N'A.T ích mẫu điều kinh', N'24 tháng', N'Chai', N'848', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26746-17', N'Cao ích m?u (T? l? 10:1)
  -  
400 mg
Cao huong ph? (T? l? 10:1)
  -  
125 mg
Cao ng?i c?u (T? l? 10:1)
  -  
100 mg', 1000.0000, N'A.T Ichmau', N'24 tháng', N'Viên', N'848', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26747-17', N'Perindopril arginin 5mg
  -  
5mg', 3400.0000, N'A.T Perindopril 5', N'24 tháng', N'Viên', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26762-17', N'Acetylcystein
  -  
100 mg', 1100.0000, N'Acetylcystein Boston 100', N'36 tháng', N'Gói', N'850', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26763-17', N'Acetylcystein
  -  
200 mg', 1700.0000, N'Acetylcystein Boston 200', N'36 tháng', N'Gói', N'850', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26787-17', N'Acyclovir 200 mg
  -  
200 mg', 2000.0000, N'Acyclovir 200', N'36 tháng', N'Viên', N'921', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26788-17', N'Acyclovir 800 mg
  -  
800 mg', 4850.0000, N'Acyclovir 800', N'36 tháng', N'Viên', N'921', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26870-17', N'Vitamin B1 (Thiamin mononitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 1100.0000, N'3B-Medi tab', N'36 tháng', N'Viên', N'930', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26894-17', N'Acid tranexamic 500 mg
  -  
500 mg', 2500.0000, N'Acid tranexamic 500mg', N'36 tháng', N'Viên', N'932', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27017-17', N'M?i 3 g ch?a: Aciclovir 0,09g
  -  
0,09g', 48000.0000, N'Acyclovir 3%', N'36 tháng', N'Tuýp', N'938', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27018-17', N'M?i 3 g ch?a: Aciclovir
  -  
0,15g', 10000.0000, N'Acyclovir 5%', N'36 tháng', N'Tuýp', N'938', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27151-17', N'Adrenalin
  -  
1mg/1ml', 3850.0000, N'Adrenalin', N'30 tháng', N'Ống', N'944', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27207-17', N'Alendronic acid
  -  
10mg', 5500.0000, N'Aderonat', N'36 tháng', N'Viên', N'905', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27208-17', N'Dinatri adenosin triphosphat
  -  
20mg', 950.0000, N'ATP', N'36 tháng', N'Viên', N'905', N'5', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27299-17', N'Amikacin (du?i d?ng Amikacin sulfat)
  -  
500 mg/2 ml', 37800.0000, N'Acinstad 500mg', N'36 tháng', N'Lọ', N'895', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27354-17', N'Cao d?c lá Actiso 10/1 250mg
  -  
250mg', 1800.0000, N'Actiso DHĐ', N'36 tháng', N'Viên', N'922', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27536-17', N'Acyclovir
  -  
400 mg', 3100.0000, N'Acyclovir Stada 400 mg', N'36 tháng', N'Viên', N'864', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27595-17', N'Acetylcystein
  -  
200mg', 570.0000, N'Acetylcystein', N'36 tháng', N'Viên', N'835', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27730-17', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 700.0000, N'Acemol Extra', N'36 tháng', N'Viên', N'910', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27742-17', N'Paracetamol 325 mg
  -  
325 mg', 270.0000, N'Acetab 325', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27743-17', N'Aciclovir
  -  
800mg', 5200.0000, N'Agiclovir 800', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27744-17', N'Furosemid
  -  
40 mg', 405.0000, N'Agifuros', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27745-17', N'Losartan potassium 12,5 mg
  -  
12,5 mg', 1450.0000, N'Agilosart 12,5', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27746-17', N'Telmisartan
  -  
40 mg', 4150.0000, N'Agimstan', N'24 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27747-17', N'Alimemazin tartrat
  -  
10 mg', 970.0000, N'Aginmezin 10', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27748-17', N'Rebamipid
  -  
100 mg', 3750.0000, N'Agiremid 100', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27749-17', N'Paracetamol 500 mg
  -  
500 mg', 450.0000, N'Agi-Tyfedol 500', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27786-17', N'Atorvastatin (du?i d?ng Atorvastatin calci trihydrat)
  -  
10 mg', 2400.0000, N'A.T Atorvastatin 10 mg', N'24 tháng', N'Viên', N'848', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27787-17', N'Atorvastatin (du?i d?ng Atorvastatin calci trihydrat)
  -  
20 mg', 4000.0000, N'A.T Atorvastatin 20 mg', N'24 tháng', N'Viên', N'848', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27788-17', N'Esomeprazol (du?i d?ng esomeprazol magnesi dihydrat 21,7 mg)
  -  
20 mg', 5000.0000, N'A.T Esomeprazol 20 tab', N'24 tháng', N'Viên', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27789-17', N'Esomeprazol (du?i d?ng esomeprazol magnesi dihydrat)
  -  
40 mg', 10000.0000, N'A.T Esomeprazol 40 tab', N'24 tháng', N'Viên', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27790-17', N'Gentamicin (du?i d?ng Gentamicin sulfat)
  -  
80 mg', 1980.0000, N'A.T Gentamicine', N'24 tháng', N'Ống', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27791-17', N'Glutathion
  -  
600 mg', 94000.0000, N'A.T Glutathione 600 inj', N'24 tháng', N'Lọ', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27800-17', N'M?i 10ml dung d?ch ch?a: S?t (du?i d?ng s?t gluconat) 50 mg
  -  
50 mg, 10,78 mg, 5 mg
Mangan gluconat 10,78 mg
  -  
Ð?ng gluconat 5 mg
  -  ', 3800.0000, N'ATIHEM', N'24 tháng', N'Ống', N'848', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27844-17', N'Acetazolamid 250mg
  -  
250mg', 735.0000, N'Acetazolamid', N'36 tháng', N'Viên', N'946', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27875-17', N'Acetylcystein
  -  
200 mg', 1650.0000, N'Acemetin', N'24 tháng', N'Gói', N'924', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27911-17', N'Aceclofenac 100mg
  -  
100mg', 700.0000, N'Aceclofenac', N'36 tháng', N'Viên', N'928', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27924-17', N'Etodolac
  -  
400mg', 6000.0000, N'Aguzar 400', N'36 tháng', N'Viên', N'930', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28098-17', N'Isotretinoin
  -  
10 mg', 7000.0000, N'Acneskinz', N'36 tháng', N'Viên', N'942', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28139-17', N'Aciclorvir 200mg
  -  
200mg', 1250.0000, N'Aciclovir', N'36 tháng', N'Viên', N'950', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28159-17', N'Cao khô actiso (tuong duong v?i 5g actiso)
  -  
300 mg', 1800.0000, N'Actiso PV', N'36 tháng', N'Viên', N'901', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28367-17', N'Cefpodoxim (du?i d?ng Cefpodoxim proxetil)
  -  
200 mg', 16000.0000, N'Abvaceff 200', N'36 tháng', N'Gói', N'870', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28535-17', N'M?i gói 2g ch?a: Acetylcystein 100mg
  -  
100mg', 1000.0000, N'Acehasan 100', N'24 tháng', N'Gói', N'860', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28582-17', N'M?i 10 g ch?a: Adapalene 10mg
  -  
10mg', 62000.0000, N'Adalcrem', N'36 tháng', N'Tuýp', N'867', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28758-18', N'Etoricoxib
  -  
90 mg', 6000.0000, N'Ahevip 90', N'48 tháng', N'Viên', N'847', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28809-18', N'Paracetamol 500 mg
  -  
500 mg, 15 mg, 5 mg
Dextromethorphan HBr 15 mg
  -  
Phenylephrin hydroclorid 5 mg
  -  ', 986.0000, N'Acemol plus', N'36 tháng', N'Viên', N'910', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28816-18', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 600.0000, N'Acetab extra', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28817-18', N'Paracetamol
  -  
500 mg', 500.0000, N'Agicedol', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28818-18', N'Mephenesin
  -  
250 mg', 800.0000, N'Agidecotyl', N'24 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28819-18', N'Betahistin dihydroclorid 8 mg
  -  
8 mg', 1320.0000, N'Agihistine 8', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28820-18', N'Losartan kali
  -  
100 mg', 7000.0000, N'Agilosart 100', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28821-18', N'Methylprednisolon 16 mg
  -  
16 mg', 3500.0000, N'Agimetpred 16', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28822-18', N'Fexofenadin hydrochlorid 180 mg
  -  
180 mg', 5100.0000, N'Agimfast 180', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28823-18', N'Rosuvastatin (du?i d?ng Rosuvastatin calci)
  -  
10 mg', 6250.0000, N'Agirovastin 10', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28824-18', N'Tadalafil
  -  
20 mg', 30000.0000, N'Agitafil 20', N'24 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28849-18', N'M?i ?ng 10ml dung d?ch ch?a: Calci glucoheptonat 1100 mg
  -  
1100 mg, 100 mg, 50 mg
Vitamin C 100 mg
  -  
Vitamin PP 50 mg
  -  ', 4200.0000, N'A.T Calcium cort', N'24 tháng', N'Ống', N'848', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28899-18', N'Levocetirizin dihydroclorid 10mg
  -  
10mg', 4950.0000, N'Acritel-10', N'36 tháng', N'Viên', N'855', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29085-18', N'Aciclovir 400mg
  -  
400mg', 2700.0000, N'Acyclovir 400mg', N'36 tháng', N'Viên', N'938', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29344-18', N'Adefovir dipivoxil 10mg
  -  
10mg', 15300.0000, N'Afovix tab', N'36 tháng', N'Viên', N'895', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29479-18', N'M?i 1 ml dung d?ch ch?a: Natri hyaluronat 1,8 mg
  -  
1,8 mg', 36000.0000, N'Afenemi', N'24 tháng', N'Ống', N'886', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29496-18', N'Acyclovir 800mg
  -  
800mg', 5000.0000, N'Acyclovir Stada 800 mg', N'36 tháng', N'Viên', N'833', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29515-18', N'Acetylcystein 200 mg
  -  
200 mg', 10000.0000, N'Acenews', N'36 tháng', N'Viên', N'865', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29646-18', N'Bromhexin hydroclorid 8 mg
  -  
8 mg', 195.0000, N'Agi-Bromhexine', N'36 tháng', N'Viên', N'838', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29647-18', N'Bromhexin hydroclorid 4 mg
  -  
4 mg', 350.0000, N'Agi-Bromhexine 4', N'36 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29648-18', N'Etoricoxib 120 mg
  -  
120 mg', 7000.0000, N'Agietoxib 120', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29649-18', N'Etoricoxib 90 mg
  -  
90 mg', 6000.0000, N'Agietoxib 90', N'36 tháng', N'Viên', N'838', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29650-18', N'Betahistin dihydroclorid 16 mg
  -  
16 mg', 1860.0000, N'Agihistine 16', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29651-18', N'Celecoxib 100mg
  -  
100mg', 2000.0000, N'Agilecox 100', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29652-18', N'Losartan kali 100 mg
  -  
100 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 4200.0000, N'Agilosart-H 100/25', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29653-18', N'Losartan kali 50 mg
  -  
50 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 3900.0000, N'Agilosart-H 50/12,5', N'36 tháng', N'Viên', N'838', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29654-18', N'Omeprazol (du?i d?ng Omeprazol pellet bao tan trong ru?t 8,5 %) 20 mg
  -  
20 mg', 1150.0000, N'Agimepzol 20', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29655-18', N'Fexofenadin hydroclorid 120 mg
  -  
120 mg', 3800.0000, N'Agimfast 120', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29656-18', N'Lisinopril (du?i d?ng Lisinopril dihydrat) 20 mg
  -  
20 mg', 3380.0000, N'Agimlisin 20', N'36 tháng', N'Viên', N'838', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29657-18', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 3300.0000, N'Agimycob', N'36 tháng', N'Viên', N'838', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29658-18', N'Paracetamol 325 mg
  -  
325 mg, 200 mg
Ibuprofen 200 mg
  -  ', 790.0000, N'Agiparofen', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29682-18', N'Calci lactat (du?i d?ng Calci lactat pentahydrat) 300 mg
  -  
300 mg', 1750.0000, N'A.T Calcium 300', N'24 tháng', N'Viên', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29683-18', N'Cao d?c Di?p h? châu 150 mg tuong duong: Di?p h? châu 1050 mg
  -  
1050 mg', 1000.0000, N'A.T Diệp hạ châu', N'24 tháng', N'Viên', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29684-18', N'M?i 5ml h?n d?ch ch?a: Fexofenadin hydroclorid 30 mg
  -  
30 mg', 8000.0000, N'A.T Fexofenadin', N'24 tháng', N'Gói', N'848', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29685-18', N'M?i 8 ml ch?a: Cao lá b?ch qu? (tuong duong 9,6 mg Ginkoflavon Glycosid toàn ph?n) 40 mg
  -  
40 mg, 120 mg
Cao r? dinh lang (t? l? 10:1) 120 mg
  -  ', 82000.0000, N'A.T hoạt huyết dưỡng', N'24 tháng', N'Chai', N'848', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29686-18', N'Imidapril hydroclorid 10 mg
  -  
10 mg', 4830.0000, N'A.T Imidapril 10 mg', N'24 tháng', N'Viên', N'848', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29687-18', N'Imidapril hydroclorid 5 mg
  -  
5 mg', 4200.0000, N'A.T Imidapril 5mg', N'24 tháng', N'Viên', N'848', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29688-18', N'M?i 10 ml dung d?ch ch?a: Ribavirin 400 mg
  -  
400 mg', 125000.0000, N'A.T Ribavirin', N'24 tháng', N'Chai', N'848', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29711-18', N'Acyclovir 200 mg
  -  
200 mg', 1000.0000, N'Acyclorvir VPC 200', N'36 tháng', N'Viên', N'920', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29875-18', N'Acetylcystein
  -  
200mg', 810.0000, N'Acetylcystein 200 mg', N'36 tháng', N'Gói', N'839', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30009-18', N'Cefpodoxim (du?i d?ng Cefpodoxim proxetil) 100 mg
  -  
100 mg', 6900.0000, N'Abvaceff 100', N'36 tháng', N'Viên', N'870', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30095-18', N'M?i gói 3g ch?a: Acetylcystein 200mg
  -  
200mg', 2200.0000, N'Acehasan 200', N'24 tháng', N'Gói', N'860', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30156-18', N'Acetylcystein 200mg
  -  
200mg', 562.0000, N'Acetylcystein', N'36 tháng', N'Viên', N'835', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30195-18', N'Acetyl leucin 500mg
  -  
500mg', 1450.0000, N'Acedanyl', N'36 tháng', N'Viên', N'837', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30201-18', N'Methyldopa 250mg
  -  
250mg', 1900.0000, N'Agidopa', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30269-18', N'Bezafibrat 200 mg
  -  
200 mg', 3200.0000, N'Agibeza 200', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30270-18', N'Bromhexin hydroclorid 16 mg
  -  
16 mg', 890.0000, N'Agi-Bromhexine 16', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30271-18', N'Meloxicam 15mg
  -  
15mg', 1900.0000, N'Agimesi 15', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30272-18', N'Lamivudin 100 mg
  -  
100 mg', 8500.0000, N'Agimidin', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30273-18', N'Telmisartan 80 mg
  -  
80 mg', 5900.0000, N'Agimstan 80', N'36 tháng', N'Viên', N'838', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30274-18', N'Telmisartan 80 mg
  -  
80 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 7500.0000, N'Agimstan-H 80/25', N'36 tháng', N'Viên', N'838', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30295-18', N'M?i l? ch?a: Teicoplanin 200 mg
  -  
200 mg', 210000.0000, N'A.T Teicoplanin 200 inj', N'24 tháng', N'Lọ', N'915', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30296-18', N'Candesartan cilexetil 16 mg
  -  
16 mg', 5000.0000, N'Acantan 16', N'36 tháng', N'Viên', N'915', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30297-18', N'Candesartan cilexetil 8 mg
  -  
8 mg', 3300.0000, N'Acantan 8', N'36 tháng', N'Viên', N'915', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30298-18', N'Candesartan cilexetil 16 mg
  -  
16 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 4800.0000, N'Acantan HTZ 16-12.5', N'36 tháng', N'Viên', N'915', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30299-18', N'Candesartan cilexetil 8 mg
  -  
8 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 3880.0000, N'Acantan HTZ 8-12.5', N'36 tháng', N'Viên', N'915', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30412-18', N'Etodolac
  -  
200 mg', 3100.0000, N'Aguzar 200', N'36 tháng', N'Viên', N'930', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30479-18', N'Acyclovir 200mg
  -  
200mg', 1550.0000, N'Acyclovir 200mg', N'36 tháng', N'Viên', N'938', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30628-18', N'M?i gói 1,5g ch?a: Acetylcystein 200mg
  -  
200mg', 1500.0000, N'Acetylcystein', N'24 tháng', N'Gói', N'902', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30650-18', N'Amikacin (du?i d?ng Amikacin sulfat)
  -  
250mg', 24000.0000, N'Abicin 250', N'36 tháng', N'Lọ', N'891', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31060-18', N'Paracetamol 500mg
  -  
500mg, 5mg, 25mg
Phenylephrin hydroclorid 5mg
  -  
Cafein 25mg
  -  ', 800.0000, N'Agidolgen', N'36 tháng', N'Viên', N'838', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31061-18', N'Omeprazol (du?i d?ng vi h?t 8,5 % Omeprazol magnesi dihydrat 8,5%) 40mg
  -  
40mg', 2400.0000, N'Agimepzol 40', N'36 tháng', N'Viên', N'838', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31062-18', N'Trimebutine maleat 100 mg
  -  
100 mg', 950.0000, N'Agitritine 100', N'36 tháng', N'Viên', N'838', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31065-18', N'Loperamid HCl 2 mg
  -  
2 mg', 1005.0000, N'A.T Loperamid 2 mg', N'24 tháng', N'Viên', N'915', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31257-18', N'Acyclovir
  -  
400 mg', 2500.0000, N'Acyclovir 400 mg', N'36 tháng', N'Viên', N'901', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31591-19', N'Acyclovir 200mg
  -  
200mg', 3000.0000, N'A.T Acyclovir 200 mg', N'24 tháng', N'Viên', N'915', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31592-19', N'Amikacin (du?i d?ng amikacin sulfat) 500 mg
  -  
500 mg', 39900.0000, N'A.T Amikacin 500', N'24 tháng', N'Lọ', N'915', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31593-19', N'M?i 1ml ch?a Salbutamol (du?i d?ng Salbutamol sulfat) 0,5 mg
  -  
0,5 mg', 5670.0000, N'A.T Salbutamol inj', N'24 tháng', N'Ống', N'915', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31594-19', N'Sitagliptin (du?i d?ng Sitagliptin phosphate monohydrate) 100 mg
  -  
100 mg', 18900.0000, N'A.T Sitagpiptin 100mg', N'36 tháng', N'Viên', N'915', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31595-19', N'Sitagliptin (du?i d?ng Sitagliptin phosphate monohydrate) 50mg
  -  
50mg', 11000.0000, N'A.T Sitagpiptin 50 mg', N'36 tháng', N'Viên', N'915', N'6', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31912-19', N'Acetylcystein
  -  
200mg', 690.0000, N'Acetylcystein 200mg', N'36 tháng', N'Viên', N'940', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD3-19-18', N'Gemcitabin (du?i d?ng Gemcitabin hydrochlorid) 1,4 g
  -  
1,4 g', 1400000.0000, N'Abingem-1,4gm (Cơ sở sản xuất và đóng gói sơ cấp: Naprod life sciences pvt.ltd. Địa chỉ: 304, Town Centre, 3rd Floor, Andheri-Kurla Road, Near Mittal estate, Andheri (East), Mumbai-400059, India)', N'24 tháng', N'Lọ', N'1007', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32031-19', N'Adrenalin
  -  
1mg/10ml', 5250.0000, N'Adrenalin 1mg/10ml', N'30 tháng', N'Ống', N'944', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32039-19', N'Acyclovir
  -  
5%', 20000.0000, N'Acyclovir 5%', N'36 tháng', N'Tuýp', N'901', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32057-19', N'M?i 5ml dung d?ch ch?a: N-Acetylcystein 200mg
  -  
200mg', 27500.0000, N'ANC', N'36 tháng', N'Chai', N'905', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32111-19', N'M?i 10ml ch?a: N-Acetylcystein 200mg
  -  
200mg', 6700.0000, N'Acetuss', N'24 tháng', N'Ống', N'906', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32203-19', N'Flurbiprofen 100mg
  -  
100mg', 5500.0000, N'AXOFINEN 100', N'36 tháng', N'Viên', N'908', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32254-19', N'M?i gói 3g ch?a Cefpodoxime (du?i d?ng Cefpodoxime proxetil) 100mg
  -  
100mg', 8500.0000, N'Abvaceff 100', N'36 tháng', N'Gói', N'898', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32501-19', N'Silymarin (Chi?t xu?t Cardus marianus) 117 mg
  -  
117 mg', 5500.0000, N'A.T Silymarin 117 mg', N'24 tháng', N'Viên', N'915', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-3467-07', N'Meclofenoxat.HCl
  -  ', 1050.0000, N'A9 - Cerebrazel', N'36 tháng', N'Viên', N'951', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-3518-07', N'Acetylcystein
  -  ', 550.0000, N'Acetydona 200 mg', N'36 tháng', N'Viên', N'958', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10076-10', N'Isotretinoin
  -  
10mg', 3173.0000, N'Acutrine', N'36 tháng', N'Viên', N'984', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10135-10', N'Amoxicillin 500mg
  -  
--
Potassium clavulanate (tuong duong 125mg acid clavulanic)
  -  ', 9450.0000, N'AMK 625', N'24 tháng', N'Viên', N'1020', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10368-10', N'Lactobacillus acidophilus (sp. L. gasseri)
  -  
--
Bifidobacterium infantis
  -  
Enterococcus faecium
  -  ', 2600.0000, N'Actobim', N'24 tháng', N'Viên', N'990', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10479-10', N'Montelukast sodium
  -  
10mg', 3936.0000, N'Aireez 10mg Tablet', N'24 tháng', N'Viên', N'1012', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10592-10', N'Aciclovir
  -  
5% w/w', 6400.0000, N'Acirax Cream', N'36 tháng', N'Tuýp', N'1038', N'5', 0)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10747-10', N'Isoflurane
  -  
--', 910800.0000, N'Aerrane', N'60 tháng', N'Chai', N'816', N'2', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10754-10', N'Nifedipine
  -  
30mg', 9454.0000, N'Adalat LA 30mg', N'48 tháng', N'Viên', N'820', N'3', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10755-10', N'Nifedipine
  -  
60mg', 12034.0000, N'Adalat LA 60mg', N'48 tháng', N'Viên', N'820', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10756-10', N'Nifedipine
  -  
20mg', 4647.0000, N'Adalat retard', N'36 tháng', N'Viên', N'820', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10980-10', N'Casein hydrolysate
  -  
500mg', 3337.0000, N'Acmodim tablet', N'36 tháng', N'Viên', N'827', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11032-10', N'Than ho?t tính
  -  
70mg', 950.0000, N'Acticarbine', N'60 tháng', N'Viên', N'986', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11089-10', N'Acetylcystein
  -  
200mg', 2677.0000, N'ACC 200mg (Đóng gói & xuất xưởng: Slutas Pharma GmbH - Đức)', N'48 tháng', N'Gói', N'992', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11171-10', N'Aceclofenac
  -  
100mg', 350.0000, N'Acemarksans 100', N'36 tháng', N'Viên', N'993', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11200-10', N'Clopidogrel bisulphate
  -  
75mg clopidogrel', 7000.0000, N'Afigrel', N'36 tháng', N'Viên', N'999', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11339-10', N'Aciclovir
  -  
200mg', 1100.0000, N'Acirax', N'36 tháng', N'Viên', N'1038', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11467-10', N'Alteplase
  -  
50mg', 10323589.0000, N'Actilyse', N'36 tháng', N'Lọ', N'826', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11671-11', N'Cefotaxime Sodium
  -  
1g Cefotaxime', 16000.0000, N'Acitaxime', N'24 tháng', N'Lọ', N'803', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11839-11', N'Acid ursodesoxycholic
  -  
50mg
Thiamine nitrate
  -  
10mg
Riboflavin
  -  
5mg', 5950.0000, N'Adus Soft Capsule', N'36 tháng', N'Viên', N'981', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12142-11', N'Cefixime
  -  
200mg Cefixime', 3000.0000, N'Acicef - 200', N'36 tháng', N'Viên', N'803', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12442-11', N'Dextrose monohydrate
  -  
--
Natri Chlorid
  -  
Natri lactat
  -  
Kali clorid
  -  
...', 18000.0000, N'5% Dextrose in lactated ringer s', N'60 tháng', N'Chai', N'967', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12449-11', N'Atorvastatin calci
  -  
10mg Atorvastatin', 600.0000, N'Aforsatin 10', N'24 tháng', N'Viên', N'971', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12450-11', N'Atorvastatin calci
  -  
20mg Atorvastatin', 690.0000, N'Aforsatin 20', N'24 tháng', N'Viên', N'971', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12717-11', N'Cefpodoxim proxetil
  -  
200mg Cefpodoxime', 9561.0000, N'Aegencefpo 200', N'24 tháng', N'Viên', N'807', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12744-11', N'Loperamide HCl BP
  -  
2mg', 180.0000, N'Abydium', N'48 tháng', N'Viên', N'1048', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13200-11', N'Acyclovir
  -  
250mg', 14550.0000, N'Acyclovir', N'36 tháng', N'Tuýp', N'1030', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13443-11', N'Amlodipine
  -  
5mg', 400.0000, N'Acipta', N'36 tháng', N'viên', N'843', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13669-11', N'Atorvastatin calcium
  -  
10mg Atorvastatin', 1540.0000, N'Acinet 10', N'24 tháng', N'Viên', N'1035', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13670-11', N'Atorvastatin calcium
  -  
20mg Atorvastatin', 2013.0000, N'Acinet 20', N'24 tháng', N'Viên', N'1035', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13788-11', N'Aciclovir
  -  
--', 7000.0000, N'Aciherpin 5% cream', N'24 tháng', N'Tuýp', N'810', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13904-11', N'Cefdinir
  -  
125mg', 6500.0000, N'Aegendinir 125', N'24 tháng', N'Gói', N'807', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13905-11', N'Cefdinir
  -  
300mg', 9500.0000, N'Aegendinir 300', N'24 tháng', N'Viên', N'807', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14010-11', N'Nifedipine
  -  
10mg', 2254.0000, N'Adalat 10 (cơ sở xuất xưởng: Bayer Schering Pharma AG, địa chỉ: D-51368 Leverkusen, Germany)', N'36 tháng', N'Viên', N'1016', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14025-11', N'Aceclofenac
  -  
100mg', 425.0000, N'Aclopsa', N'36 tháng', N'Viên', N'1051', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14033-11', N'Aescin
  -  
20mg', 3400.0000, N'Aescin', N'36 tháng', N'Viên', N'1040', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14124-11', N'Simethicon
  -  
40mg/0,6ml', 21000.0000, N'Air-X drops', N'24 tháng', N'Chai', N'1013', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14268-11', N'Desloratadine
  -  
0,5mg/ml', 78901.0000, N'Aerius', N'24 tháng', N'Chai', N'1027', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14630-12', N'Simethicone
  -  
80mg', 903.0000, N'Air-X tab. hương vị cam', N'60 tháng', N'Viên', N'1020', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14667-12', N'Dextrose monohydrate
  -  
5g/100ml', 13500.0000, N'5% Dextrose in water solution for intravenous infusion', N'60 tháng', N'Chai', N'968', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14811-12', N'Acyclovir
  -  
50mg', 24596.0000, N'Acyclovir Stada', N'36 tháng', N'Tuýp', N'1032', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14903-12', N'Salmeterol xinafoate, fluticasone propionate
  -  
(Salmeterol 25mcg', 90000.0000, N'Aeroflu 125 HFA Inhalation', N'24 tháng', N'Lọ', N'1001', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15010-12', N'Glucosamin Sulfate Potassium Chlorid Complex
  -  
500mg', 3200.0000, N'AB Glucosamine', N'36 tháng', N'Viên', N'1015', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15194-12', N'Ketorolac tromethamine
  -  
4,5mg/ml', 7400.0000, N'Acuvail', N'24 tháng', N'Ống', N'813', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15332-12', N'Glucose (khan)
  -  
5%', 9500.0000, N'5% Glucose Injection 500ml:25g', N'24 tháng', N'Chai', N'1028', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15368-12', N'Magnesium trisilicate, Dried aluminium hydroxide, Simethicone
  -  
250mg, 250mg, 25mg', 2750.0000, N'Acirun', N'36 tháng', N'Viên', N'976', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15376-12', N'Simethicone
  -  
80mg', 903.0000, N'Air-X', N'60 tháng', N'Viên', N'1020', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15378-12', N'Bambuterol HCL
  -  
10mg', 3600.0000, N'Airbuter 10', N'24 tháng', N'Viên', N'995', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15379-12', N'Bambuterol HCL
  -  
20mg', 5900.0000, N'Airbuter 20', N'24 tháng', N'Viên', N'995', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15416-12', N'Dinoprostone 10mg/01 h? phân ph?i thu?c
  -  
60mg loxoprofen sodium
  -  ', 4620.0000, N'Absolox (Đóng gói bởi: OLIC (Thailand) Limited - 166 Moo 16, Bangpa-In Industrial Estate, Udomsorayuth Road, Bangpa-In District, Ayutthaya Province, Thailand)', N'48 tháng', N'Viên', N'963', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15421-12', N'Piracetam
  -  
1g/5ml', 6000.0000, N'Aeyerop inj.', N'36 tháng', N'Ống', N'979', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15543-12', N'Sodium hyaluronate
  -  
25mg', 800000.0000, N'Adant', N'36 tháng', N'Hộp', N'1039', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15577-12', N'Magnesium aluminometasilicate
  -  
.
Natri bicarbonate
  -  
Scopolia Extract
  -  
Eslase
  -  
...', 4950.0000, N'Ahngookpapaze Tablet', N'36 tháng', N'Viên', N'811', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15663-12', N'Diphenhydramine HCl
  -  
16mg
Amonium Chloride
  -  
135mg
Sodium Citrate
  -  
57mg
Menthol
  -  
3,8mg
...', 48000.0000, N'Abicof Syrup', N'36 tháng', N'Lọ', N'1048', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15700-12', N'Cefadroxil
  -  
250mg/5ml', 35000.0000, N'Acefdrox-250', N'36 tháng', N'Chai', N'803', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15727-12', N'Nifedipine
  -  
20mg', 6017.0000, N'Adalat LA 20mg', N'36 tháng', N'Viên', N'820', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15842-12', N'Glucosamin sulfate potassium chlorid complex, Manganese gluconate, Chondroitin sulfate
  -  
295mg Glucosamin', 5000.0000, N'AB Ausbiobone', N'36 tháng', N'Viên', N'1015', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15868-12', N'Calcium aminoacid chelate, Calcium phosphate, Calcium citrate, Magnesium oxide n?ng, Magnesium phosphate, Zinc aminoacid chelate, Manganese aminoacid chelate, Acid ascorbic, Vitamin D3, Acid folic
  -  
.', 7000.0000, N'AB Extrabone-Care+', N'36 tháng', N'Viên', N'1031', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16010-12', N'Amoxicillin trihydrate, Potassium clavulanate
  -  
500mg Amoxicillin, 125mg Acid clavulanic', 5565.0000, N'Acle Tablet 625mg', N'24 tháng', N'Viên', N'985', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16257-13', N'Tocilizumab
  -  
200mg/10ml', 6748140.0000, N'Actemra', N'30 tháng', N'Lọ', N'841', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16290-13', N'Tacrolimus (du?i d?ng Tacrolimus monohydrate)
  -  
0,5mg', 36616.0000, N'Advagraf', N'36 tháng', N'Viên', N'814', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16414-13', N'Alendronic Acid (du?i d?ng Alendronate sodium) 70mg
  -  ', 65000.0000, N'Acid Alendronic Farmoz', N'48 tháng', N'Viên', N'1045', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16498-13', N'Tacrolimus (du?i d?ng Tacrolimus monohydrate)
  -  
1 mg', 54920.0000, N'Advagraf', N'36 tháng', N'Viên', N'814', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16554-13', N'Telmisartan 40mg
  -  ', 8100.0000, N'Actelsar 40mg', N'24 tháng', N'Viên', N'805', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16555-13', N'Telmisartan 80mg
  -  ', 11300.0000, N'Actelsar 80mg', N'24 tháng', N'viên', N'805', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16660-13', N'Zoledronic acid 4mg/5ml
  -  ', 2950000.0000, N'Acido Zoledronico Richet', N'24 tháng', N'Lọ', N'989', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16733-13', N'Clindamycin (du?i d?ng Clindamycin hydrochloride) 200mg
  -  
Metronidazole 160mg
  -  ', 25000.0000, N'Acneal', N'36 tháng', N'Tuýp', N'965', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16752-13', N'Irbesartan 300mg
  -  
  -  ', 17000.0000, N'0.9% Sodium Chloride Solution for I.V. Infusion', N'60 tháng', N'Chai', N'968', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16753-13', N'Dextrose monohydrate 50g/500ml
  -  ', 16000.0000, N'10% Dextrose in Water Parenteral Solution for Intravenous Infusion', N'60 tháng', N'Chai', N'968', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16754-13', N'Dextrose monohydrate 100g/500ml
  -  ', 19000.0000, N'20% Dextrose in Water for Intravenous Infusion', N'60 tháng', N'Chai', N'968', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16755-13', N'Dextrose monohydrate 150g/500ml
  -  ', 17800.0000, N'30% Dextrose in Water', N'60 tháng', N'Chai', N'968', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16807-13', N'Doxorubicin hydrochloride
  -  
10mg/5ml', 108000.0000, N'Adorucin', N'18 tháng', N'Lọ', N'982', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16828-13', N'Aceclofenac 100mg
  -  ', 900.0000, N'Acemed Tablets', N'36 tháng', N'Viên', N'996', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16899-13', N'Ceftriaxone (du?i d?ng Ceftriaxone natri)
  -  
1g', 52000.0000, N'Abitrax', N'36 tháng', N'Lọ', N'988', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17188-13', N'Ranitidin (du?i d?ng Ranitidin hydrochlorid)
  -  
150mg', 320.0000, N'Aciloc 150', N'36 tháng', N'Viên', N'832', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17208-13', N'Rabeprazole natri
  -  
10 mg', 8000.0000, N'Acilesol 10mg', N'24 tháng', N'Viên', N'805', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17209-13', N'Rabeprazole natri
  -  
20 mg', 12400.0000, N'Acilesol 20mg', N'24 tháng', N'Viên', N'805', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17240-13', N'Budesonide
  -  
100µg/li?u
Formoterol fumarate (du?i d?ng Formoterol fumarate dihydrate)
  -  
6µg/li?u', 170000.0000, N'Aerofor 100 Hfa', N'24 tháng', N'Ống', N'1001', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17241-13', N'Budesonide (Micronised)
  -  
200µg/li?u
Formoterol fumarate (du?i d?ng Formoterol fumarate dihydrate)
  -  
6µg/li?u', 230000.0000, N'Aerofor 200 Hfa', N'24 tháng', N'Ống', N'1001', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17310-13', N'Betamethasone dipropionate
  -  
6,4mg/10g
Clotrimazole
  -  
100mg/10g
Gentamicin sulfate
  -  
10mg/10g', 12000.0000, N'Acrason Cream', N'36 tháng', N'Tuýp', N'980', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17422-13', N'5-Fluorouracil
  -  
50mg/ml', 112350.0000, N'5-Fluorouracil "Ebewe"', N'24 tháng', N'Lọ', N'966', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17674-14', N'Docetaxel
  -  
20mg/2ml', 1260000.0000, N'Docetaxel 20mg', N'24 tháng', N'Lọ', N'1041', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17713-14', N'Doxorubicin hydrochloride 10mg/5ml
  -  
2 mg/ ml', 51068.0000, N'Adrim 10mg/5ml', N'24 tháng', N'Lọ', N'972', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17793-14', N'Aciclovir 400mg
  -  ', 2200.0000, N'Acirax-400', N'36 tháng', N'Viên', N'1038', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17818-14', N'Levocetirizine Dihydrochloride
  -  
15mg/30ml', 52000.0000, N'1-AL', N'24 tháng', N'Lọ', N'969', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17848-14', N'Ranitidin (du?i d?ng Ranitidin hydrochlorid)
  -  
300 mg', 700.0000, N'Aciloc 300', N'36 tháng', N'Viên', N'832', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18026-14', N'Desloratadine
  -  
5mg', 9521.0000, N'Aerius', N'24 tháng', N'Viên', N'1027', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18371-14', N'Isotretinoin 20mg
  -  ', 15000.0000, N'Acnotin 20', N'24 tháng', N'Viên', N'997', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18579-14', N'Aciclorvir 800mg
  -  ', 3700.0000, N'Acirax-800', N'36 tháng', N'Viên', N'1038', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18586-15', N'Natri bicarbonat
  -  
10,5 mg', 95000.0000, N'4.2% w/v Sodium Bicarbonate', N'24 tháng', N'Chai', N'815', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18587-15', N'Citicolin (du?i d?ng Citicolin natri) 500 mg
  -  ', 21940.0000, N'Actibon', N'24 tháng', N'Viên', N'999', N'7', 50)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18588-15', N'Monosulfua natri.9H2O
  -  
4 mg
Saccharomyces cerevisiae 1250 tri?u t? bào
  -  
50 mg
  -  ', 11000.0000, N'Actisoufre', N'36 tháng', N'Ống', N'987', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18589-15', N'Nefopam hydroclorid
  -  
20 mg', 34000.0000, N'Acupan', N'36 tháng', N'Ống', N'964', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18590-15', N'Losartan kali 50 mg
  -  ', 1000.0000, N'Adostan 50', N'24 tháng', N'Viên', N'1023', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18806-15', N'Ketorolac tromethamine
  -  
0,5%', 67245.0000, N'Acular', N'24 tháng', N'Lọ', N'812', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18861-15', N'Paracetamol
  -  
1 g/100 ml', 21000.0000, N'Aarmol 100ml', N'24 tháng', N'Chai', N'1029', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19029-15', N'Isotretinoin 20mg
  -  ', 15500.0000, N'Acutrine 20 Soft capsule', N'36 tháng', N'Viên', N'983', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19126-15', N'Simethicone
  -  
120mg', 1365.0000, N'Air-X 120', N'24 tháng', N'Viên', N'1020', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19202-15', N'Activated Attapulgite of Mormoiron 3g
  -  ', 3157.0000, N'Actapulgite', N'36 tháng', N'Gói', N'822', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19294-15', N'Acid zoledronic (du?i d?ng Acid zoledronic monohydrat) 5mg/100ml
  -  ', 6761490.0000, N'Aclasta', N'36 tháng', N'Chai', N'1009', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19302-15', N'Quinapril (du?i d?ng Quinapril HCl) 5mg
  -  ', 3254.0000, N'Accupril', N'24 tháng', N'Viên', N'1011', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19326-15', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat)
  -  
500mg', 8000.0000, N'Adolox', N'24 tháng', N'Viên', N'1023', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19565-16', N'Aciclovir
  -  
5% w/w', 6840.0000, N'Aciclovir Cream BP', N'24 tháng', N'Tuýp', N'828', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19793-16', N'Isoflurane 100%
  -  
100% ( tt/tt)', 910800.0000, N'Aerrane', N'60 tháng', N'Chai', N'817', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19820-16', N'Isotretinoin 10mg
  -  ', 12900.0000, N'A-Cnotren', N'36 tháng', N'Viên', N'973', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19914-16', N'Clopidogrel (du?i d?ng Clopidogrel bisulfat)a
  -  
75 mg', 7100.0000, N'Aclop', N'24 tháng', N'Viên', N'1042', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19977-16', N'M?i li?u x?t ch?a: Salmeterol (du?i d?ng salmeterol xinafoat) 50mcg
  -  
Fluticason propionat 500mcg
  -  ', 319132.0000, N'AirFluSal Forspiro', N'24 tháng', N'Bình', N'808', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19978-16', N'Acetylcystein
  -  
200 mg', 2677.0000, N'ACC 200 mg', N'24 tháng', N'Gói', N'992', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20043-16', N'Everolimus
  -  
5mg', 610058.0000, N'Afinitor 5mg', N'36 tháng', N'Viên', N'1009', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20093-16', N'Tramadol hydrochlorid 37,5 mg
  -  
Acetaminophen 325mg
  -  ', 1700.0000, N'Acetra', N'36 tháng', N'Viên', N'1038', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20385-17', N'Nifedipin
  -  
30 mg', 9454.0000, N'Adalat LA 30mg', N'48 tháng', N'Viên', N'819', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20386-17', N'Nifedipin
  -  
60mg', 12034.0000, N'Adalat LA 60mg', N'48 tháng', N'Viên', N'819', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20387-17', N'Nifedipin
  -  
20mg', 4647.0000, N'Adalat retard', N'36 tháng', N'Viên', N'819', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20696-17', N'Aceclofenac
  -  
100 mg', 5900.0000, N'Aceclonac', N'36 tháng', N'Viên', N'1021', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20830-17', N'Acetylcystein
  -  
200mg', 6700.0000, N'Acc Pluzz 200', N'24 tháng', N'Viên', N'978', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20887-18', N'Amoxicillin (du?i d?ng amoxicillin trihydrat)
  -  
400mg/5ml
Acid clavulanic (du?i d?ng kali clavulanat)
  -  
57mg/5ml', 168000.0000, N'AMK 457', N'24 tháng', N'Chai', N'1020', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20899-18', N'Telmisartan
  -  
40mg', 8000.0000, N'Actelsar 40mg', N'36 tháng', N'Viên', N'806', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20980-18', N'Acid tranexamic
  -  
500 mg', 21546.0000, N'Acido Tranexamico Bioindustria L.I.M', N'36 tháng', N'Ống', N'825', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20992-18', N'Paracetamol
  -  
500mg
Diclofenac natri
  -  
50mg', 15100.0000, N'Aceclofen', N'36 tháng', N'viên', N'1024', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21117-18', N'Isotretinoin
  -  
20mg', 15000.0000, N'Acmolrine - 20 Soft Capsule', N'36 tháng', N'Viên', N'994', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21122-18', N'Atorvastatin (du?i d?ng atorvastatin calcium)
  -  
10mg', 8000.0000, N'Afocical Tab.', N'36 tháng', N'Viên', N'1046', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21238-18', N'Paracetamol
  -  
750mg
Phenylephrin hydrocloird
  -  
10mg
Acid ascorbic (vitamin C)
  -  
60mg', 15690.0000, N'Agicold hotmix orange', N'36 tháng', N'Túi', N'810', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21345-18', N'Acarbose
  -  
50mg', 2250.0000, N'Acabrose Tablets 50mg', N'24 tháng', N'Viên', N'1034', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21654-19', N'Telmisartan 40mg
  -  
40mg, 12,5mg
Hydrochlorothiazid 12,5mg
  -  ', 9800.0000, N'Actelsar HCT 40mg/12,5 mg', N'24 tháng', N'Viên', N'806', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21764-19', N'Ibuprofen 100mg/5ml
  -  
100mg
  -  ', 55000.0000, N'Abifish', N'36 tháng', N'Lọ', N'1010', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21983-19', N'Acarbose 50mg
  -  
  -  ', 2700.0000, N'Acarbose Friulchem (Đóng gói &xuất xưởng: Lamp San Prospero SPA, địa chỉ: Via Della Pace, 25/A-41030 San Prospero (MO), Italy', N'24 tháng', N'Viên', N'970', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-206-13', N'Everolimus 10mg
  -  ', 1220115.0000, N'Afinitor 10mg', N'36 tháng', N'Viên', N'1009', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-207-13', N'Everolimus 5mg
  -  ', 610057.0000, N'Afinitor 5mg', N'36 tháng', N'Viên', N'1009', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-52-13', N'Epirubicin hydrochloride
  -  
50mg', 573000.0000, N'4-Epeedo-50', N'24 tháng', N'lọ', N'1005', N'2', 49)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-53-13', N'Gemcitabine
  -  
200mg', 547500.0000, N'Abingem 200', N'24 tháng', N'Lọ', N'1005', N'3', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-643-17', N'Abacavir (du?i d?ng Abacavir sulfat)
  -  
300 mg', 11000.0000, N'Abacavir Tablets USP 300mg', N'60 tháng', N'Viên', N'1003', N'2', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN3-16-18', N'Fluorouracil
  -  
250mg/5ml', 135000.0000, N'5-FU Onkovis 50mg/ml', N'24 tháng', N'Lọ', N'977', N'1', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5104-10', N'Acyclovir
  -  
250mg', 13900.0000, N'Aclovia', N'36 tháng', N'Tuýp', N'827', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5195-10', N'Acetylcystein
  -  
--', 295000.0000, N'Acetylcysteine Solution, USP', N'36 tháng', N'Lọ', N'823', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5197-10', N'Acyclovir
  -  
500mg', 947600.0000, N'Acyclovir for Injection USP', N'24 tháng', N'Lọ', N'824', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5220-10', N'Aciclovir
  -  
250mg', 438000.0000, N'Acymess', N'24 tháng', N'Lọ', N'1002', N'4', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5228-10', N'Celecoxib
  -  
200mg/viên', 1091.0000, N'Agcel', N'36 tháng', N'Viên', N'976', N'8', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5437-10', N'Attapulgite de Mormoiron ho?t hoá
  -  
3g', 3157.0000, N'Actapulgite', N'36 tháng', N'gói', N'822', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5440-10', N'Cefotaxime natri
  -  
1g', 19147.0000, N'Ahngook Cefotaxim 1g', N'24 tháng', N'Lọ', N'811', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5534-10', N'2,4 Dichlorobenzyl Alcohol
  -  
--
Amylmetacresol
  -  ', 716.0000, N'Agisept Antiseptic Tablet-Classical', N'36 tháng', N'Viên', N'810', N'5', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5566-10', N'Quinapril
  -  
5mg/viên', 3254.0000, N'Accupril', N'36 tháng', N'viên', N'974', N'7', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5621-10', N'Levofloxacin
  -  
5mg/ml', 88515.0000, N'Cravit', N'36 tháng', N'Lọ', N'1025', N'6', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-9858-10', N'Acarbose
  -  
50mg/ viên', 2250.0000, N'Acarbose Tablets 50mg', N'36 tháng', N'Viên', N'1034', N'9', 50)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-9905-10', N'Acetaminophen, Caffein
  -  
500mg/65mg', 761.0000, N'Aceteming', N'36 tháng', N'Viên', N'842', N'3', 50)
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHoa__MaHD__3E1D39E1] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK__ChiTietHoa__MaHD__3E1D39E1]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Thuoc]
GO
ALTER TABLE [dbo].[ChiTietPhieuHuy]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietPh__MaPhi__3F115E1A] FOREIGN KEY([MaPhieuHuy])
REFERENCES [dbo].[PhieuHuy] ([MaPhieuHuy])
GO
ALTER TABLE [dbo].[ChiTietPhieuHuy] CHECK CONSTRAINT [FK__ChiTietPh__MaPhi__3F115E1A]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietPh__MaPhi__40F9A68C] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK__ChiTietPh__MaPhi__40F9A68C]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__42E1EEFE] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__42E1EEFE]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__43D61337] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__43D61337]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTK])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[PhieuHuy]  WITH CHECK ADD  CONSTRAINT [FK__PhieuHuy__MaNV__44CA3770] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuHuy] CHECK CONSTRAINT [FK__PhieuHuy__MaNV__44CA3770]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhap__MaNV__45BE5BA9] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK__PhieuNhap__MaNV__45BE5BA9]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK__Thuoc__MaLoai__46B27FE2] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK__Thuoc__MaLoai__46B27FE2]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK__Thuoc__MaNCC__47A6A41B] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK__Thuoc__MaNCC__47A6A41B]
GO
USE [master]
GO
ALTER DATABASE [QuanLiThuoc] SET  READ_WRITE 
GO
