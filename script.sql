USE [master]
GO
/****** Object:  Database [QuanLiThuoc]    Script Date: 6/22/2020 11:43:30 AM ******/
CREATE DATABASE [QuanLiThuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiThuoc', FILENAME = N'C:\New folder\BTLJava\QuanLiThuoc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLiThuoc_log', FILENAME = N'C:\New folder\BTLJava\QuanLiThuoc_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
ALTER DATABASE [QuanLiThuoc] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLiThuoc', N'ON'
GO
ALTER DATABASE [QuanLiThuoc] SET QUERY_STORE = OFF
GO
USE [QuanLiThuoc]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nvarchar](20) NOT NULL,
	[MaThuoc] [nvarchar](20) NOT NULL,
	[SoLuong] [smallint] NULL,
	[DonGia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuHuy]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuHuy](
	[MaThuoc] [nvarchar](20) NOT NULL,
	[MaPhieuHuy] [nvarchar](20) NOT NULL,
	[SoLuong] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC,
	[MaPhieuHuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaThuoc] [nvarchar](20) NOT NULL,
	[MaPhieuNhap] [nvarchar](20) NOT NULL,
	[SoLuong] [float] NULL,
	[DonGia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC,
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](20) NOT NULL,
	[NgayLapHD] [datetime] NULL,
	[VAT] [float] NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[HoTenDem] [nvarchar](50) NULL,
	[TenKH] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](60) NULL,
	[GioiTinh] [bit] NULL,
	[DiemTichLuy] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/22/2020 11:43:30 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](20) NOT NULL,
	[HoTenDem] [nvarchar](50) NULL,
	[TenNV] [nvarchar](20) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](60) NULL,
	[GioiTinh] [bit] NULL,
	[LuongTrenGio] [money] NULL,
	[SoGioLam] [float] NULL,
	[TenTaiKhoan] [nchar](15) NULL,
	[SoDienThoai] [varchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuHuy]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuHuy](
	[MaPhieuHuy] [nvarchar](20) NOT NULL,
	[NgayHuy] [datetime] NULL,
	[MaNV] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuHuy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [nvarchar](20) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNV] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTK] [nchar](15) NULL,
	[MatKhau] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 6/22/2020 11:43:30 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 6/22/2020 11:43:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [nvarchar](20) NOT NULL,
	[MoTa] [text] NULL,
	[GiaThuoc] [money] NULL,
	[TenThuoc] [nvarchar](200) NULL,
	[NgaySX] [datetime] NULL,
	[HSD] [nvarchar](20) NULL,
	[DonViTinh] [nchar](10) NULL,
	[MaNCC] [nvarchar](20) NULL,
	[MaLoai] [nvarchar](20) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
GO
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'duchoan6814    ', N'sapassword          ')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau]) VALUES (N'duongtu6814    ', N'sapassword          ')
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
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'GC-274-17', N'Acetylcystein
  -  
200 mg', 2441.0000, N'Acemuc 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'800', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'NC46-H06-15', N'B?t Sp3 (tuong duong 15g cây ngu s?c) 750mg/15ml
  -  ', 28000.0000, N'Agerhinin (gia hạn lần 1)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1043', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'NC49-H12-15', N'Cao khô b? b?
  -  
170mg
Tinh d?u b? b?
  -  
0,002ml', 3085.0000, N'Abivina', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1043', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB1-H07-19', N'18F-FDG 5,5-125mCi/ml
  -  
5,5-125mCi/ml', 880000.0000, N'18F-FDG (FDG)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'6 tháng', N'mCi       ', N'1044', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-366-13', N'Adefovir dipivoxil
  -  
10 mg', 10000.0000, N'Adefovir 10 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-367-13', N'Lactobacillus acidophilus
  -  
10^8 CFU
Bacillus subtilis
  -  
10^8 CFU.
K?m gluconat
  -  
35mg', 4600.0000, N'Aibezym', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'gói       ', N'874', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-531-16', N'Carboplatin 150mg/l?
  -  ', 390000.0000, N'A.T Carboplatin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1006', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-532-16', N'Carboplatin 50mg/5ml
  -  ', 180000.0000, N'A.T Carboplatin inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1006', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-569-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 0,5mg
  -  ', 28000.0000, N'A.T Entecavir 0.5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-570-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 1mg
  -  ', 48000.0000, N'A.T Entecavir 1', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-571-16', N'Adefovir dipivoxil 10mg
  -  ', 3900.0000, N'Adefovir A.T', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-579-16', N'Etoposid 100mg/5ml
  -  
100mg/5ml', 145000.0000, N'A.T Etoposide inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-610-17', N'Anastrozol
  -  
1 mg', 18000.0000, N'A.T Cyrantabin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-661-18', N'Oxaliplatin 50 mg
  -  
50 mg', 610000.0000, N'A.T Oxaliplatin 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'QLĐB-744-19', N'Efavirenz 600mg
  -  
600mg, 300mg, 300mg
Lamivudin 300mg
  -  
Tenofovir disoproxil fumarat 300mg
  -  ', 32000.0000, N'Agifovir-F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V53-H12-16', N'Cao khô B? b? 170mg
  -  
Tinh d?u B? b? 0,002ml
  -  ', 3050.0000, N'Abivina (Gia hạn lần 1)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1043', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V54-H12-16', N'M?i 15 ml ch?a: B?t Sp3 (tuong duong 15 g cây ngu s?c) 750mg
  -  ', 28000.0000, N'Agerhinin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1043', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'V70-H12-16', N'25ml cao l?ng Actiso (tuong duong 25g Actiso)
  -  
29g b?t Actiso
  -  ', 250.0000, N'Actiso hoàn', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'962', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10051-10', N'Acid ascorbic 500mg
  -  ', 900.0000, N'Agi - VitaC', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10052-10', N'Betamethason 0,25 mg, Dexchlorpheniramin maleat 2 mg
  -  ', 400.0000, N'Agibetadex', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10053-10', N'Bisoprolol fumarat 5mg
  -  ', 2125.0000, N'Agicardi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10054-10', N'Chymotrypsin 4,2mg tuong duong 21 microkatal
  -  ', 1700.0000, N'Agichymo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10056-10', N'Ketoconazol 200mg
  -  ', 2125.0000, N'Agiketo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10057-10', N'Lansoprazol vi h?t bao tan trong ru?t (hàm lu?ng 8,5%) tuong duong 30mg Lansoprazol
  -  ', 2900.0000, N'Agi-Lanso', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10058-10', N'Spiramycin 750.000IU, Metronidazole 125mg
  -  ', 1900.0000, N'Agimdogyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10059-10', N'Omeprazol d?ng vi h?t 8,5% bao tan trong ru?t tuong ?ng Omeprazol 20mg
  -  ', 1500.0000, N'Agimepzol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10060-10', N'Fexofenadin hydroclorid 60mg
  -  ', 2100.0000, N'Agimfast', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10061-10', N'Domperidon maleat tuong duong v?i Domperidon 10mg
  -  ', 800.0000, N'Agimoti', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10062-10', N'Amlodipin besilat tuong duong 5mg Amlodipin
  -  ', 1500.0000, N'Agindopin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10065-10', N'Simvastatin 10mg
  -  ', 3000.0000, N'Agisimva 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10066-10', N'Simvastatin 20mg
  -  ', 6800.0000, N'Agisimva 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10067-10', N'Ofloxacin 200mg
  -  ', 1800.0000, N'Agoflox', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10107-10', N'Acyclovir 200mg
  -  ', 2000.0000, N'Acyclovir Boston 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'850', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10281-10', N'Acetaminophen 500mg
  -  ', 500.0000, N'Acetaphen 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'888', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10359-10', N'Carbazochrom 8,68mg)
  -  ', 1300.0000, N'Adrenoxyl 10mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'853', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10428-10', N'Adrenalin 1mg/1ml
  -  ', 3150.0000, N'Adretop', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'854', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10638-10', N'Acid Ascorbic, Ergocalciferol, Nicotinamid, Riboflavin, Thiamin nitrat, Retinol palmitat
  -  ', 970.0000, N'Actiflex', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'895', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10719-10', N'Acyclovir 400 mg
  -  ', 3500.0000, N'Acyclovir Stada 400mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'856', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10720-10', N'Acyclovir 800 mg
  -  ', 6000.0000, N'Acyclovir Stada 800mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'856', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10762-10', N'Acemetacin 60mg
  -  ', 480.0000, N'Acemetacin Stada 60mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'viên      ', N'960', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10858-10', N'Acetylcystein 200mg
  -  ', 500.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1050', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10859-10', N'Acetyl cystein 100mg
  -  ', 1200.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'1050', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10860-10', N'Acetylcystein 200mg
  -  ', 1000.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'1050', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-10977-10', N'Omeprazol magnesi tuong duong v?i 20 mg Omeprazol
  -  ', 1100.0000, N'AG-Ome', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11340-10', N'Nifedipin 30mg
  -  ', 6600.0000, N'Adoor LA', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'viên      ', N'872', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11464-10', N'Theophylin mononitrat 120 mg, Phenobacbital 8 mg, Ephedrin hydroclorid 25 mg
  -  ', 420.0000, N'Admincort', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11476-10', N'Acyclovir 800mg
  -  ', 4400.0000, N'Acyclovir 800mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'912', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11489-10', N'Aciclovir 200mg
  -  ', 2500.0000, N'Aciclovir 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11490-10', N'Aciclovir 800mg
  -  ', 5200.0000, N'Aciclovir 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11491-10', N'Betamethason 0,5mg
  -  ', 264.0000, N'Agi - Beta', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11492-10', N'Piracetam 800mg
  -  ', 1400.0000, N'Agicetam', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11493-10', N'Clarithromycin 125mg
  -  ', 3000.0000, N'Agiclari 125', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11494-10', N'Celecoxib 200mg
  -  ', 4500.0000, N'Agilecox 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11495-10', N'Methylprednisolon 4mg
  -  ', 1800.0000, N'Agimetpred 4', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11497-10', N'Metformin HCl 850mg
  -  ', 2200.0000, N'Agimfor 850', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11499-10', N'Atenolol 50 mg
  -  ', 1200.0000, N'Aginolol 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11501-10', N'Ibuprofen 600mg
  -  ', 850.0000, N'Agirofen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11599-10', N'Paracetamol 500 mg, Codein 10 mg
  -  ', 504.0000, N'Advan', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'926', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11640-10', N'Acetaminophen 500mg
  -  
cafein 65mg
  -  ', 1500.0000, N'Acetaphen Extra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'888', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11768-10', N'Acyclovir 200mg
  -  ', 1200.0000, N'Acyclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'952', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11800-10', N'Tadalafil 20mg
  -  ', 18000.0000, N'Acilis 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'907', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-11932-10', N'Acyclovir 100mg
  -  ', 16000.0000, N'Acyclovir Stada cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'856', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12081-10', N'resorcin 360mg, glycyrrhetinic acid 54mg, sulfur 540mg
  -  ', 39600.0000, N'Acnes offensive cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'18g/Tuýp  ', N'961', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12194-10', N'Sulphamethoxazol 800mg, Trimethoprim 160mg
  -  ', 700.0000, N'Agi - CotrimF', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12282-10', N'Vitamin A (retinyl palmitat 2000IU, Vitamin D2 200 IU
  -  ', 570.0000, N'Adwel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'925', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12373-10', N'Cao khô viên nang Actiso P TW3 0,5g tuong duong Actiso 2,5g, Nhân tr?n 2,5g
  -  ', 4620.0000, N'Actiso P TW3', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'943', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12596-10', N'Adefovir dipivoxil 10 mg
  -  ', 15000.0000, N'Adefovir Stada 10 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'856', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12764-10', N'Paracetamol 650 mg
  -  ', 700.0000, N'Acetab 650', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12765-10', N'Dexchlorpheniramine maleate 2mg
  -  ', 700.0000, N'Agidexclo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12766-10', N'Gliclazid 80mg
  -  ', 1500.0000, N'Agilizid', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12768-10', N'Rosuvastatin 10mg (du?i d?ng Rosuvastatin calci)
  -  ', 8000.0000, N'Agirovastin 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12769-10', N'Thiamin mononitrat 250mg
  -  ', 550.0000, N'Agivitamin B1', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12966-10', N'Triprolidin.HCl 2,5mg
  -  
Pseudoephedrin.HCl 60mg
  -  ', 2000.0000, N'Actifaflu', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'939', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-12988-10', N'Adrenalin 1mg/1ml
  -  ', 3850.0000, N'Adrenalin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'ống       ', N'944', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13018-10', N'Aciclovir 250mg
  -  ', 9500.0000, N'Acyclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'903', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13019-10', N'Naphazolin 8 mg, Natri Clorid 144 mg
  -  ', 25000.0000, N'ADNaphazolin - New', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'903', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13301-10', N'Acetylcystein 200mg
  -  ', 850.0000, N'Acecyst', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13302-10', N'Diacerein 50mg
  -  ', 6000.0000, N'Agdicerin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13303-10', N'Piracetam 400mg
  -  ', 700.0000, N'Agicetam', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13304-10', N'Etoricoxib 60mg
  -  ', 6800.0000, N'Agietoxib 60', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13305-10', N'Etoricoxib 90mg
  -  ', 10500.0000, N'Agietoxib 90', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13307-10', N'Fexofenadin hydroclorid 120mg
  -  ', 3800.0000, N'Agimfast 120', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13308-10', N'Fexofenadin hydroclorid 180mg
  -  ', 5100.0000, N'Agimfast 180', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13311-10', N'Glucosamin sulfat dikaliclorid 331,6mg
  -  ', 1530.0000, N'Agimsamine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13315-10', N'Cimetidin 300mg
  -  ', 460.0000, N'Agintidin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13316-10', N'Cimetidin 400mg
  -  ', 700.0000, N'Agintidin 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13317-10', N'Rosuvastatin calcium tuong duong 20 mg Rosuvastatin
  -  ', 15000.0000, N'Agirovastin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13330-10', N'Acetylcystein 200mg
  -  ', 1260.0000, N'Ace-Cold', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'916', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13361-10', N'Acetazolamid 250 mg
  -  ', 735.0000, N'Acetazolamid', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'946', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13744-11', N'Paracetamol 325mg
  -  ', 270.0000, N'Acetab 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13745-11', N'Betahistin dihydroclorid 16mg
  -  ', 1860.0000, N'Agihistine 16', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13746-11', N'Betahistin dihydroclorid 8mg
  -  ', 1320.0000, N'Agihistine 8', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13748-11', N'Glucosamin 417mg
  -  
Natri chondroitin sulfat 400mg
  -  ', 3900.0000, N'Agimsamin F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13749-11', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 3300.0000, N'Agimycob', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13750-11', N'Enalapril maleat tuong duong Enalapril 5mg
  -  ', 1200.0000, N'Aginaril', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13751-11', N'Diosmin 450mg, hesperidin 50mg
  -  ', 2500.0000, N'Agiosmin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13752-11', N'Trimebutine maleat 100mg
  -  ', 800.0000, N'Agitritine 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13753-11', N'Trimebutine maleat 200mg
  -  ', 1500.0000, N'Agitritine 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13770-11', N'Acetyl cystein 200mg
  -  ', 1700.0000, N'Acetylcystein Boston 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'850', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13824-11', N'paracetamol 500mg, diclofenac natri 50mg
  -  ', 660.0000, N'AC-Diclo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'926', N'4', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-13874-11', N'N - Acetylcystein 200 mg
  -  ', 472.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'940', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14045-11', N'Aciclovir 200mg
  -  ', 1250.0000, N'Aciclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'876', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14108-11', N'Acetyl leucin 500mg
  -  ', 720.0000, N'Acedanyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1049', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14139-11', N'Etoricoxib 90mg
  -  ', 8000.0000, N'Ahevip', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'847', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14163-11', N'Acetylcystein 200mg/ gói
  -  ', 1500.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'gói 1,5g  ', N'883', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14216-11', N'Bromhexin HCl 8mg/viên
  -  ', 195.0000, N'Agi-Bromhexine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14217-11', N'Paracetamol 500mg/ viên
  -  ', 500.0000, N'Agicedol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14220-11', N'Methyldopa 250mg/ viên
  -  ', 2000.0000, N'AgiDopa', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14221-11', N'M?i viên ch?a: Paracetamol 500mg
  -  
Phenylephrin HCl 5mg
  -  
Clorpheniramin maleat 2mg
  -  ', 700.0000, N'Agidorin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14222-11', N'Pyridoxin HCl 250mg/ viên
  -  ', 600.0000, N'Agidoxin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14223-11', N'Rifampicin 300mg/ viên
  -  ', 1970.0000, N'Agifamcin 300', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14224-11', N'Furosemid 40mg/ viên
  -  ', 405.0000, N'Agifuros', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14225-11', N'Lincomycin hydroclorid tuong duong Lincomycin 500mg/ viên
  -  ', 1850.0000, N'Agi-linco', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14226-11', N'Piroxicam beta cyclodextrin tuong duong Piroxicam 20mg/ viên
  -  ', 3500.0000, N'Agipiro', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14229-11', N'Paracetamol 500mg/ viên
  -  ', 450.0000, N'Agi-Tyfedol 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14244-11', N'Glutathion 600mg
  -  ', 75000.0000, N'Acezym 600', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'916', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14257-11', N'Acetylcystein 100mg
  -  ', 1100.0000, N'Acetylcystein Boston 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'850', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14378-11', N'Erythromycin 4%
  -  ', 19200.0000, N'Acneegel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'tub       ', N'938', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14507-11', N'Simethicon 30mg, biodiastase 2000 I 10mg, Lipase II 10mg, cellulase AP3 II 25mg
  -  ', 2000.0000, N'Acapella-S', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'893', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14511-11', N'Aceclofenac 100 mg
  -  ', 1300.0000, N'Aceclofenac PMP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'895', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14512-11', N'Risedronat natri 5mg
  -  ', 7250.0000, N'Acitonal - 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'895', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14628-11', N'Cao actiso 156,3mg tuong duong lá actiso tuoI 3,908g/ ?ng
  -  ', 2500.0000, N'Actiso', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'933', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14632-11', N'Acyclovir 500mg/ 10g
  -  ', 19000.0000, N'Acyclovir 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'883', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14663-11', N'M?i viên ch?a Paracetamol 500mg
  -  
Cafein 65mg
  -  ', 600.0000, N'Acetab Extra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14664-11', N'Mephenesin 250mg/ viên
  -  ', 500.0000, N'Agidecotyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14665-11', N'Lamivudin 100mg/ viên
  -  ', 8500.0000, N'Agimidin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14666-11', N'Retinyl acetat 5000IU/ viên
  -  ', 430.0000, N'Agirenyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-14765-11', N'N-Acetyl cystein 200mg
  -  ', 872.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'940', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15034-11', N'Adefovir dipivoxil 10mg
  -  ', 28980.0000, N'Afovixtab', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'895', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15052-11', N'Levocetirizin dihydroclorid 5mg
  -  ', 3200.0000, N'Acritel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'873', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15204-11', N'Acetylcystein 100mg
  -  ', 1960.0000, N'Aceblue 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'949', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15352-11', N'Cefuroxim
  -  
750mg', 28500.0000, N'Actixim', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'851', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15362-11', N'M?i viên ch?a: Paracetamol 500mg
  -  
Cafein 25mg
  -  
Phenylephrin HCl 5mg
  -  ', 700.0000, N'Agidolgen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15363-11', N'M?i viên ch?a: Paracetamol 325mg
  -  
Ibuprofen 200mg
  -  ', 700.0000, N'Agiparofen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15499-11', N'Cao di?p h? châu 100mg, cao nhân tr?n 50mg, cao c? nh? n?i 50mg
  -  ', 1750.0000, N'AD - Liver', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'954', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15582-11', N'Acetylcystein
  -  
100 mg', 1020.0000, N'Acehasan 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'859', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15583-11', N'Acetylcystein
  -  
200mg', 1140.0000, N'Acehasan 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'859', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15693-11', N'Vitamin A palmitat 5000 IU, vitamin D3 400IU
  -  ', 420.0000, N'A.D.O', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'880', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15871-11', N'Sodium chloride, Potassium chloride, Calcium chloride dihydrate, sodium acetate trihydrat
  -  ', 17000.0000, N'Acetate Ringer', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Chai      ', N'956', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-15984-11', N'M?i gói ch?a: Domperidon maleat tuong duong Dmperidon 2,5mg
  -  
--
Simethicon 50mg
  -  ', 1800.0000, N'Agimoti-S', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16005-11', N'Acyclovir
  -  
200 mg', 630.0000, N'Acyclovir VPC 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16082-11', N'Aciclovir 800mg
  -  
--', 2500.0000, N'Aciclovir MKP 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'956', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16258-12', N'Vitamin B1
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
...', 1400.0000, N'3Bpluzs F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'889', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16282-12', N'Acetylcystein 200mg
  -  
--', 1000.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'949', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16313-12', N'M?i 40ml ch?a: Ô d?u 0,32g
  -  
--
Mã ti?n 0,64g
  -  
Qu? nh?c 0,32g
  -  
Ð?i h?i 0,32g
  -  
...', 48000.0000, N'Acocina', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'890', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16333-12', N'Aciclovir 200mg
  -  
--', 1200.0000, N'Aciclovir MKP 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'956', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16381-12', N'Acetylcystein 200mg
  -  
--', 470.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'845', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16478-12', N'Ambroxol HCl 15mg/5ml
  -  
--', 7800.0000, N'ABROCTO', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'879', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16515-12', N'Paracetamol , Ibuprofen
  -  
325mg', 600.0000, N'Ailaxon', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16516-12', N'Paracetamol 325mg, Ibuprofen 200mg
  -  
--', 595.0000, N'Ailaxon', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'920', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16621-12', N'Acyclovir 200mg
  -  
--', 1200.0000, N'Acyclovir 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'952', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16647-12', N'Aciclovir 250mg
  -  
--', 11250.0000, N'Aciclovir MKP 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'tuýp      ', N'956', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16656-12', N'Risedronat natri 35mg
  -  
--', 31250.0000, N'Acitonal-35', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'895', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16803-12', N'Acyclovir
  -  
200mg', 450.0000, N'Aciclovir 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16812-12', N'Paracetamol 325mg/ viên
  -  
--', 263.0000, N'Acemol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'42 tháng', N'Viên      ', N'912', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16814-12', N'Paracetamol 100mg/ viên
  -  
--', 128.0000, N'Acemol enfant', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'912', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16815-12', N'Acetylcystein 200mg/ viên
  -  
--', 685.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'912', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16816-12', N'Acilovir 200mg/ viên
  -  
--', 1312.0000, N'Acyclovir 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'912', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-16826-12', N'acid folic
  -  
5mg', 252.0000, N'Acid Folic 5 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'885', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17011-12', N'Paracetamol 500mg
  -  
--
Codein phosphat 8mg
  -  ', 800.0000, N'Acetalvic-codein 8', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'949', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17254-12', N'Acetylcystein
  -  
200mg', 1800.0000, N'Acinmuxi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'878', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17377-12', N'Losartan Kali
  -  
50mg/ viên', 3000.0000, N'Agilosart 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17378-12', N'Alimemazin tartrat
  -  
5mg/ viên', 350.0000, N'Aginmezin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17384-12', N'Amikacin sulfat
  -  
Amikacin 250mg', 26250.0000, N'Abicin 250', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'916', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17385-12', N'Paracetamol
  -  
80mg', 1575.0000, N'Ace kid 80', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'916', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17405-12', N'Aceclofenac
  -  
100 mg', 540.0000, N'Acenac 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17430-12', N'Acetylcystein
  -  
200 mg', 1500.0000, N'Acetyl Cystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'924', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17472-12', N'Các Vitamin A, B1, B2, PP, B6, B12, D3
  -  
S?t sulfat
  -  
Lysine HCl
  -  
Calci glycerophosphat
  -  
...', 1900.0000, N'Aceffex', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'Viên      ', N'933', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17787-12', N'Acyclovir
  -  
200 mg', 800.0000, N'Acyclovir 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'877', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17818-12', N'Sildenafil (du?i d?ng Sildenafil citrat)
  -  
100 mg', 60000.0000, N'Adagrin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'900', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17856-12', N'Aciclovir
  -  
400 mg', 680.0000, N'Aciclovir 400 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17864-12', N'Acetylcystein
  -  
200 mg', 2108.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'gói       ', N'909', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17880-12', N'Domperidone
  -  
30 mg/30 ml', 18800.0000, N'Agimoti', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'914', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17887-12', N'Paracetamol
  -  
150 mg
vitamin C
  -  
75 mg', 1260.0000, N'Ace kid 150', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'916', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-17908-12', N'Acetylcystein
  -  
200 mg', 600.0000, N'Acetylcysteine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'924', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18220-13', N'Erythromycin (du?i d?ng Erythromycin stearat)
  -  
500 mg', 2280.0000, N'Agi- Ery 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18248-13', N'Paracetamol
  -  
325 mg', 2940.0000, N'Ace kid 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'gói       ', N'916', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18434-13', N'Aciclovir
  -  
250mg', 10000.0000, N'Aciclovir 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'954', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18475-13', N'Acetaminophen
  -  
500 mg', 630.0000, N'Acnekyn 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'958', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18521-13', N'Aceclofenac
  -  
100mg', 1600.0000, N'Aclon', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'858', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18667-13', N'Sildenafil
  -  
50 mg', 45000.0000, N'Adagrin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'900', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18693-13', N'Aciclovir
  -  
0,25g/ 5g', 10000.0000, N'Agiclovir 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18767-13', N'Dextromethorphan HBr
  -  
10mg
Phenylephrin HCl
  -  
5mg
Triprolidin HCl
  -  
1,25mg', 580.0000, N'Adkold-new', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'947', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18820-13', N'Acetylcystein
  -  
200 mg', 1300.0000, N'Acitys', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'1300      ', N'897', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18919-13', N'Acetylcystein
  -  
200mg', 714.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'884', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-18925-13', N'Tenofovir disoproxil fumarat 300mg
  -  ', 25000.0000, N'Agifovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19015-13', N'M?i viên ch?a: Phenylephrin HCl 2,5mg
  -  
Triprolidin HCl 0,625mg
  -  ', 2600.0000, N'Adkold-new for children', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'941', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19107-13', N'Acid folic
  -  
5 mg', 540.0000, N'Acid folic MKP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'957', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19179-13', N'Acetylcystein
  -  
200 mg', 465.0000, N'Acehasan 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'859', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19310-13', N'M?i 30ml ch?a Bromhexin HCl 0,024g
  -  ', 18000.0000, N'Agi-bromhexine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'914', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19311-13', N'Losartan kali
  -  
25 mg', 1450.0000, N'Agilosart 25', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19483-13', N'Acetylcystein 200mg
  -  ', 1100.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'840', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19571-13', N'20 ml dung d?ch ch?a: Clindamycin (du?i d?ng Clindamycin hydroclorid) 200mg
  -  
Metronidazol 160mg
  -  ', 40000.0000, N'Acnequidt', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Hộp       ', N'892', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19584-13', N'Paracetamol 150mg
  -  ', 1800.0000, N'Actadol 150', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'894', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19585-13', N'Paracetamol 80mg
  -  ', 1400.0000, N'Actadol 80', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'894', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19639-13', N'Aciclovir 200 mg
  -  ', 700.0000, N'Aciclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'857', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19729-13', N'Nhôm hydroxyd gel khô
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
...', 246.0000, N'Ahmcmil''s', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'869', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19753-13', N'Clorpheniramin maleat 4 mg
  -  ', 100.0000, N'Agitec-F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'837', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19754-13', N'Clorpheniramin maleat
  -  
4 mg', 100.0000, N'Agitec-F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'837', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-19769-13', N'Aciclovir 800mg
  -  ', 5500.0000, N'Acyclovir Boston 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'850', N'7', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20043-13', N'Acetylcystein
  -  
200 mg', 550.0000, N'Acetydona 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'958', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20124-13', N'Aceclofenac
  -  
100 mg', 701.0000, N'Aceclofenac Stada 100 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'701       ', N'864', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20188-13', N'Aciclovir
  -  
400mg', 2230.0000, N'Aciclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'946', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20277-13', N'Sildenafil (du?i d?ng Sildenafil citrat) 50 mg
  -  ', 27000.0000, N'Activ - Gra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'834', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20321-13', N'Aciclovir 200mg
  -  ', 900.0000, N'Aciclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'894', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20430-14', N'Cefuroxim (du?i d?ng Cefuroxim natri)
  -  
1,5 g', 35500.0000, N'Actixim 1.5 g', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'851', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20502-14', N'Pefloxacin (du?i d?ng Pefloxacin mesylat dihydrat)
  -  
400mg/5ml', 17000.0000, N'Afulocin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Ống       ', N'895', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20511-14', N'Aciclovir
  -  
200mg', 1400.0000, N'Acyvir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'897', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20645-14', N'Paracetamol 325mg
  -  ', 375.0000, N'Acemol NDP 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'42 tháng', N'Viên      ', N'909', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20646-14', N'Paracetamol 500mg
  -  ', 450.0000, N'Acemol NDP 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'42 tháng', N'Viên      ', N'909', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20653-14', N'Omeprazol (D?ng vi h?t bao tan trong ru?t)
  -  
20 mg', 1350.0000, N'AG-Ome', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20679-14', N'Paracetamol
  -  
325 mg', 850.0000, N'Acepron 325 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'920', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20680-14', N'Paracetamol
  -  
500 mg', 300.0000, N'Acepron 500 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20681-14', N'Paracetamol
  -  
500 mg
Codein phosphat hemihydrat
  -  
30 mg', 1365.0000, N'Acepron Codein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20748-14', N'Acetaminophen
  -  
500 mg', 286.0000, N'ABAB 500mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'926', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20749-14', N'Acetaminophen
  -  
500 mg', 286.0000, N'ABAB 500mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'926', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-20936-14', N'Acetylcystein
  -  
200mg', 1600.0000, N'Acethepharm', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'955', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21047-14', N'Alendronic acid (du?i d?ng alendronat natri) 70mg
  -  ', 22000.0000, N'Agostini', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'873', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21122-14', N'Diacerhein 50mg
  -  ', 5000.0000, N'Aczandia', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'876', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21216-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
875 mg
Acid Clavulanic (du?i d?ng Clavulanat kali)
  -  
125 mg', 9000.0000, N'Acigmentin 1000', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21217-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (du?i d?ng kali clavulanat)
  -  
62,5mg', 5000.0000, N'Acigmentin 312,5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'882', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21220-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat) 500 mg
  -  
125 mg
Acid Clavulanic (du?i d?ng Clavulanat kali)
  -  ', 5500.0000, N'Acigmentin 625', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21244-14', N'Acarbose 100mg
  -  ', 3200.0000, N'Actidine 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'850', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21245-14', N'Acarbose
  -  
50 mg', 3000.0000, N'Actidine 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'849', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21331-14', N'Dextromethorphan HBr
  -  
15mg', 600.0000, N'Acough', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'934', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21418-14', N'Cao d?c Actiso (18:1)
  -  
250mg', 2300.0000, N'Actiso HĐ', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'954', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21460-14', N'Acyclovir
  -  
200mg', 1250.0000, N'Acyclovir 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'959', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21528-14', N'Acyclovir
  -  
400mg', 3100.0000, N'Acyclovir Stada 400mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'861', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21620-14', N'Amoxicilin (du?i d?ng Amoxicilin trihydrat)
  -  
250 mg
Acid clavulanic (du?i d?ng Kali clavulanat)
  -  
125 mg', 7000.0000, N'Acigmentin 375', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'882', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21788-14', N'Sulfur
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
...', 56700.0000, N'Acnes medical Cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'56700     ', N'868', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21827-14', N'Acetylcystein 200 mg
  -  ', 810.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'920', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21854-14', N'Acetaminophen 500 mg
  -  ', 286.0000, N'ABAB 500 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'926', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21855-14', N'Acetaminophen 500 mg
  -  ', 286.0000, N'ABAB 500 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'926', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21884-14', N'Paracetamol
  -  
500mg
Cafein
  -  
65mg', 710.0000, N'Actadol - Extra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'938', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21910-14', N'Acetylcystein
  -  
200mg', 407.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'840', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-21960-14', N'Paracetamol 500mg
  -  ', 800.0000, N'Actadol 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'894', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22122-15', N'Paracetamol 80 mg/1,5g
  -  ', 650.0000, N'Acepron 80', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'920', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22162-15', N'Paracetamol 500 mg
  -  ', 250.0000, N'ABAB 500 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'926', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22211-15', N'Clorpheniramin maleat 2mg
  -  
Phenylephrin HCl 10mg
  -  ', 490.0000, N'Acdinral', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'940', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22293-15', N'Acenocoumarol 1mg
  -  ', 2700.0000, N'Acenocoumarol-VNP 1', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'897', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22294-15', N'Acenocoumarol 4mg
  -  ', 3300.0000, N'Acenocoumarol-VNP 4', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'897', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22437-15', N'Paracetamol
  -  
325 mg', 270.0000, N'Acetab 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'914', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22438-15', N'S?t (II) fumarat
  -  
200 mg
Acid folic
  -  
1 mg', 610.0000, N'Agifivit', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'914', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22667-15', N'Acetylcystein 200 mg
  -  ', 713.0000, N'Acetylcystein Stada 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'862', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22783-15', N'Albendazol 400mg
  -  ', 3000.0000, N'Adazol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'884', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22789-15', N'M?i gói ch?a Calci (du?i d?ng tricalci phosphat) 600mg
  -  ', 2600.0000, N'Agi-calci', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22790-15', N'M?i gói ch?a Paracetamol 150mg
  -  ', 1500.0000, N'Agimol 150', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22791-15', N'M?i gói ch?a Paracetamol 325mg
  -  ', 1800.0000, N'Agimol 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22792-15', N'Mosaprid citrat 5mg
  -  ', 3000.0000, N'Agimosarid', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22793-15', N'M?i 60ml ch?a: Dextromethorphan HBr 72mg
  -  
Clorpheniramin maleat 18mg
  -  
Guaiphenesin 600mg
  -  ', 14500.0000, N'Agituss', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22822-15', N'Paracetamol
  -  
650 mg', 435.0000, N'Acepron 650', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22915-15', N'Vitamin B1
  -  
125 mg
Vitamin B6
  -  
125 mg
Vitamin B12
  -  
250 mcg', 1250.0000, N'3B-Medi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'930', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-22934-15', N'Aciclovir 200mg
  -  ', 1200.0000, N'Aciclovir 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'932', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23266-15', N'Aciclovir 800 mg
  -  ', 2050.0000, N'Aciclovir Meyer', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'857', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23346-15', N'Acyclovir
  -  
800 mg', 5000.0000, N'Acyclovir Stada 800 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'864', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23472-15', N'M?i gói 1,5g ch?a: Acetylcystein 200 mg
  -  ', 1200.0000, N'Acetylcistein 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'882', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23473-15', N'Escin 20 mg
  -  ', 3000.0000, N'Aescin 20 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'882', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23483-15', N'M?i gói 1,6g ch?a Acetylcystein 200mg
  -  
  -  ', 2050.0000, N'Acecyst', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23484-15', N'M?i viên ch?a: Calci carbonat 1250mg
  -  
Cholecalciferol 200IU
  -  ', 870.0000, N'Agi- calci', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23485-15', N'M?i viên ch?a: Thiamin mononitrat 125mg
  -  
Pyridoxin hydroclorid 125mg
  -  
Cyanocobalamin 125mcg
  -  ', 1200.0000, N'Agi- neurin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23486-15', N'Acid nalidixic 500mg
  -  ', 1400.0000, N'Aginalxic', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23487-15', N'M?i gói 1,5g ch?a Roxithromycin 50mg
  -  
  -  ', 2100.0000, N'Agiroxi 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23528-15', N'Paracetamol
  -  
500mg', 2100.0000, N'Acefalgan 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'887', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23567-15', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 350.0000, N'A.C Mexcold', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'926', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23568-15', N'Acetylcystein 200 mg
  -  ', 875.0000, N'Acetylcystein 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'926', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23657-15', N'Vitamin A (Retinol palmitat) 2000IU
  -  
Vitamin D3 250IU
  -  ', 650.0000, N'AD Tamy', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'Viên      ', N'933', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23739-15', N'Vitamin A (Retinol palmitat)
  -  
5000 IU
Vitamin D3 (Cholecalciferol )
  -  
400 IU', 1500.0000, N'Admed', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'905', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-23889-15', N'Cao hoa hòe (3:1)
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
...', 590.0000, N'Casoran', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'899', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24018-15', N'M?i 500ml ch?a: Natri clorid 3g
  -  
Kali clorid 0,15g
  -  
Calci clorid.2H2O 0,1g
  -  
Natri acetat.3H2O 1,9g
  -  
...', 17988.0000, N'Acetate Ringer''s', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'866', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24071-16', N'Cao d?c r? hà th? ô d?
  -  
300mg', 2700.0000, N'Hà thủ ô', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Túi       ', N'899', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24111-16', N'Methylprednisolon 4mg
  -  ', 1100.0000, N'Agimetpred 4', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24112-16', N'Simvastatin 20mg
  -  ', 2500.0000, N'Agisimva 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24125-16', N'M?i 5ml ch?a Ambroxol (du?i d?ng Ambroxol HCl) 30mg
  -  ', 26000.0000, N'A. T Ambroxol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'chai      ', N'1006', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24126-16', N'M?i hoàn m?m 9g ch?a: Th?c d?a 1,6g
  -  
Hoài son 0,8g
  -  
Son thù 0,8g
  -  
M?u don bì 0,6g
  -  
...', 5000.0000, N'A. T Lục vị', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên hoàn ', N'1006', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24127-16', N'Gói 20g ch?a Nhôm phosphat gel 20% 12,380 g
  -  ', 2800.0000, N'A.T Alugela', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'1006', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24128-16', N'?ng 10ml ch?a Arginin hydroclorid 800mg
  -  
  -  ', 4500.0000, N'A.T Arginin 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'1006', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24129-16', N'Bisoprolol fumarat 5mg
  -  ', 1500.0000, N'A.T Bisoprolol 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1006', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24130-16', N'M?i ?ng 10ml ch?a: Calci glucoheptonat 700mg
  -  
Calci gluconat 300mg
  -  ', 4600.0000, N'A.T Calci plus', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'4600      ', N'1006', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24131-16', N'M?i 5ml ch?a Desloratadin 2,5mg
  -  ', 5000.0000, N'A.T Desloratadin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'1006', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24132-16', N'Loratadin 10mg
  -  ', 400.0000, N'A.T Loratadin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1006', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24133-16', N'Ranitidin (du?i d?ng Ranitidin hydroclorid) 50mg/2ml
  -  ', 10000.0000, N'A.T Ranitidine inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'1006', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24153-16', N'Acarbose
  -  
50mg', 2100.0000, N'Acarfar', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'946', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24204-16', N'M?i gói ch?a: Paracetamol 325mg
  -  
Natri benzoat 100mg
  -  
Clorpheniramin maleat 2mg
  -  ', 1620.0000, N'Acegoi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24206-16', N'Paracetamol 325 mg
  -  
Chlorpheniramin maleat 2 mg
  -  ', 530.0000, N'A.C Mexcold', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'530       ', N'926', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24262-16', N'Carbazochrom
  -  
10mg', 1300.0000, N'Adrenoxyl 10mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'853', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24375-16', N'Aciclovir 400mg
  -  ', 2530.0000, N'Aciclovir 400 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên nang ', N'954', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24489-16', N'Acyclovir 5% (kl/kl)
  -  ', 12000.0000, N'Acyclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'844', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24495-16', N'Adefovir dipivoxil 10 mg
  -  ', 3250.0000, N'Adefovir meyer', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'857', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24522-16', N'M?i viên ch?a: Cao khô du?c li?u 200mg tuong duong Actiso (lá) 1975mg
  -  
B?t m?n du?c li?u Actiso (lá) 25mg
  -  ', 1645.0000, N'Actiso', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'871', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24572-16', N'Acyclovir
  -  
200 mg', 1600.0000, N'Acyclovir Stada 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'864', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24693-16', N'Acetaminophen
  -  
650 mg', 560.0000, N'Acemol fort', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'910', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24701-16', N'Chymotrypsin (tuong duong 4200 don v? Chymotrypsin USP) 4,2 mg
  -  ', 1700.0000, N'Agichymo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24702-16', N'Spiramycin 0,75 M IU
  -  
Metronidazol 125 mg
  -  ', 1900.0000, N'Agimdogyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24703-16', N'Domperidon (du?i d?ng Domperidon maleat)
  -  
10 mg', 800.0000, N'Agimoti', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24704-16', N'Atenolol 50 mg
  -  ', 800.0000, N'Aginolol 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24705-16', N'Acid ascorbic
  -  
500 mg', 900.0000, N'Agi-vitac', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24722-16', N'Amikacin (du?i d?ng amikacin sulfat) 250mg
  -  ', 24000.0000, N'A.T Amikacin 250', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24723-16', N'Arginin hydroclorid 1000mg/10ml
  -  ', 5500.0000, N'A.T Arginin 1000', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24724-16', N'Arginin hydroclorid 400mg/10ml
  -  ', 3815.0000, N'A.T Arginin 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'3815      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24725-16', N'M?i gói ch?a: Tricalci phosphat 1650mg
  -  ', 3200.0000, N'A.T Calci sac', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'6', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24726-16', N'Calci lactat pentahydrat 500mg/10ml
  -  ', 29000.0000, N'A.T Calmax 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'chai      ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24727-16', N'Esomeprazol (du?i d?ng Esomeprazol natri) 40mg
  -  ', 52000.0000, N'A.T Esomeprazol 40 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24728-16', N'Famotidin 40mg/5ml
  -  ', 76000.0000, N'A.T Famotidin 40 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24729-16', N'Glutathion 300mg
  -  ', 62000.0000, N'A.T Glutathion 300 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24730-16', N'Hydrocortison (du?i d?ng Hydrocortison natri succinat) 100mg
  -  ', 13860.0000, N'A.T Hydrocortisone', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24731-16', N'Netilmicin (du?i d?ng Netilmicin sulfat) 100mg/2ml
  -  ', 36800.0000, N'A.T Neltimicin inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24732-16', N'Pantoprazol (du?i d?ng Pantoprazol natri sesquihydrat) 40mg
  -  ', 40000.0000, N'A.T Pantoprazol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24819-16', N'Risedronat natri (du?i d?ng Risedronat natri hemi-pentahydrat) 75mg
  -  ', 62000.0000, N'Actorisedron 75', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'852', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-24956-16', N'Aciclovir
  -  
250mg', 9500.0000, N'Acyclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'894', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25027-16', N'Adefovir dipivoxil 10mg
  -  ', 12000.0000, N'Adefovir Stada 10 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'833', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25031-16', N'Acyclovir
  -  
250 mg', 18000.0000, N'Acyclovir Stada cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'864', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25057-16', N'Chlorpheniramin maleat
  -  
4mg', 106.0000, N'Abochlorphe', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'835', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25107-16', N'Acenocoumarol
  -  
1mg', 2400.0000, N'ACM Control 1', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'884', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25112-16', N'Acetylcystein
  -  
200 mg', 850.0000, N'Acecyst', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25113-16', N'Bisoprolol fumarat
  -  
5 mg', 1450.0000, N'Agicardi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25114-16', N'Entecavir (du?i d?ng Entecavir monohydrat) 0,5 mg
  -  ', 28000.0000, N'Agicarvir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25115-16', N'Piracetam 800 mg
  -  ', 1400.0000, N'Agicetam 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25116-16', N'Sulfamethoxazol
  -  
800 mg
Trimethoprim
  -  
160 mg', 700.0000, N'Agi-cotrim F', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25117-16', N'Meloxicam
  -  
7,5 mg', 1200.0000, N'Agimesi 7,5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25118-16', N'Lisinopril
  -  
5 mg', 1385.0000, N'Agimlisin 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25119-16', N'Acid folic
  -  
5 mg', 540.0000, N'Aginfolix 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25120-16', N'Cimetidin
  -  
300 mg', 460.0000, N'Agintidin 300', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25121-16', N'Cimetidin
  -  
400 mg', 700.0000, N'Agintidin 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25122-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci)
  -  
20 mg', 8505.0000, N'Agirovastin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25123-16', N'Roxithromycin 150 mg
  -  ', 1820.0000, N'Agiroxi 150', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25277-16', N'Methocarbamol 750mg
  -  ', 2850.0000, N'Acecontin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'940', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25284-16', N'Adrenalin (du?i d?ng Epinephrin bitartrat) 1mg/1ml
  -  ', 4000.0000, N'Adretop', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'941', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25351-16', N'Adrenalin
  -  
1mg/1ml', 5000.0000, N'Adrenalin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'955', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25523-16', N'Celecoxib 200 mg
  -  ', 4500.0000, N'Agilecox 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25594-16', N'Acenocoumarol
  -  
4mg', 3000.0000, N'ACM Control 4', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'884', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25601-16', N'Betamethason 0,25 mg
  -  
0,25 mg, 2 mg
Dexclorpheniramin maleat 2 mg
  -  ', 400.0000, N'Agibetadex', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25602-16', N'Ciprofloxacin (du?i d?ng Ciprofloxacin HCl) 500 mg
  -  
500 mg', 1700.0000, N'Agicipro', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25603-16', N'Aciclovir 200 mg
  -  
200 mg
  -  ', 2000.0000, N'Agiclovir 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25604-16', N'Mephenesin 500 mg
  -  
500 mg', 1400.0000, N'Agidecotyl 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25605-16', N'Fexofenadin hydroclorid 60 mg
  -  
60 mg', 2100.0000, N'Agimfast 60', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25606-16', N'Ibuprofen 600 mg
  -  
600 mg', 850.0000, N'Agirofen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25607-16', N'Simvastatin 10 mg
  -  
10 mg', 2150.0000, N'Agisimva 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25608-16', N'Pravastatin natri 40 mg
  -  
40 mg', 8700.0000, N'Agivastar 40', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25609-16', N'Vitamin B1 (Thiamin mononitrat) 250 mg
  -  
250 mg', 800.0000, N'Agivitamin B1', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25622-16', N'Arginin hydroclorid 400mg
  -  ', 4000.0000, N'A.T Arginin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25623-16', N'Arginin hydroclorid 200mg
  -  ', 2200.0000, N'A.T Arginin 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25624-16', N'Acid ascorbic 100mg/5ml
  -  
100mg/5ml', 5200.0000, N'A.T Ascorbic syrup', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25625-16', N'Bisoprolol fumarat 2,5mg
  -  ', 1400.0000, N'A.T Bisoprolol 2.5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25626-16', N'M?i 10ml ch?a: Piracetam 400mg
  -  
400mg', 4950.0000, N'A.T Cetam 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'4950      ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25627-16', N'M?i gói 3,5g ch?a Diosmectit 3000mg
  -  ', 2600.0000, N'A.T Diosmectit', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25628-16', N'M?i 5ml ch?a: Guaifenesin 100mg
  -  
100mg, 2,5mg, 5mg
Phenylephrin hydroclorid 2,5mg
  -  
Dextromethorphan hydrobromid 5mg
  -  ', 5000.0000, N'A.T Flu', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25629-16', N'Furosemid 20mg/2ml
  -  ', 3200.0000, N'A.T Furosemid inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25630-16', N'Glutathion 900mg
  -  ', 110000.0000, N'A.T Glutathione 900 inj.', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25631-16', N'Ibuprofen 100mg/5ml
  -  ', 5500.0000, N'A.T Ibuprofen Syrup', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25632-16', N'Lamivudin 100mg
  -  
100mg', 9000.0000, N'A.T Lamivudin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25633-16', N'M?i 8ml cao l?ng ch?a d?ch chi?t c?a: Th?c d?a 1,6g
  -  
1,6g, 0,8g, 0,8g, 0,6g, 0,6g, 0,6g
Hoài son 0,8g
  -  
Son thù 0,8g
  -  
M?u don bì 0,6g
  -  
...', 38000.0000, N'A.T Lục vị', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25634-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci) 20mg
  -  ', 8000.0000, N'A.T Rosuvastatin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25635-16', N'Rosuvastatin (du?i d?ng Rosuvastatin calci) 5mg
  -  ', 2600.0000, N'A.T Rosuvastatin 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25636-16', N'M?i gói 5g b?t ch?a: Sucralfat 1000mg
  -  
1000mg', 4500.0000, N'A.T Sucralfate', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25637-16', N'Tobramycin 80mg/2ml
  -  
80mg/2ml', 18000.0000, N'A.T Tobramycine inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25638-16', N'Tranexamic acid 250mg/5ml
  -  
250mg/5ml', 7500.0000, N'A.T Tranexamic inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25673-16', N'Paracetamol
  -  
250mg', 1800.0000, N'Acefalgan 250', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'887', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-25997-16', N'M?i gói 3 g ch?a Acetylcystein 100 mg
  -  
100 mg', 1200.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'865', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26090-17', N'Paracetamol
  -  
650 mg', 700.0000, N'Acetab 650', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26091-17', N'Piracetam 400 mg
  -  
400 mg', 700.0000, N'Agicetam 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26092-17', N'Dexclorpheniramin maleat 2 mg
  -  
2 mg', 200.0000, N'Agidexclo', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26093-17', N'Omeprazol (du?i d?ng Omeprazol magnesi)
  -  
20 mg', 1100.0000, N'Ag-Ome', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26104-17', N'M?i 10ml ch?a: Calci glycerophosphat 456mg
  -  
456mg, 426mg
Magnesi gluconat 426mg
  -  ', 3990.0000, N'A.T Calmax', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26105-17', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat) 250mg/50ml
  -  
250mg/50ml', 48000.0000, N'A.T Levofloxacin 250 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26106-17', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat) 500mg/100ml
  -  
500mg/100ml', 65000.0000, N'A.T Levofloxacin 500 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26107-17', N'Simvastatin 20mg
  -  
20mg', 2400.0000, N'A.T Simvastatin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26113-17', N'Aciclovir 200mg
  -  
200mg', 2000.0000, N'Acyclovir Boston 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'850', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26134-17', N'Acetaminophen
  -  
500 mg', 918.0000, N'Acefalgan 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'887', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26135-17', N'Paracetamol
  -  
500mg, 30mg
Codein phosphat hemihydrat
  -  ', 2630.0000, N'Acefalgan Codein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'18 tháng', N'Viên      ', N'887', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26140-17', N'Vitamin B1 (Thiamin nitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 1250.0000, N'3BTP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'924', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26141-17', N'Ð?c ho?t, qu? chi, phòng phong, duong quy, t? tân, xuyên khung, t?n giao, b?ch thu?c, tang ký sinh, can d?a hoàng, d? tr?ng, d?ng sâm, nguu t?t, b?ch linh, cam th?o
  -  
0,9g', 5000.0000, N'AN KHỚP VƯƠNG', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'924', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26163-17', N'M?i gói 2g ch?a: Acetylcystein 200 mg
  -  
200 mg', 2000.0000, N'Acetylcystein 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'927', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26474-17', N'Etoricoxib 60 mg
  -  
60 mg', 3600.0000, N'AM Itori 60', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'857', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26553-17', N'Acyclovir
  -  
200 mg', 1600.0000, N'Acyclovir Stada 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'833', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26588-17', N'M?i gói 2 g ch?a Acetylcystein 200 mg
  -  
200 mg', 1200.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'865', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26619-17', N'Acetylcystein 200mg
  -  
200mg', 477.0000, N'Acetylcysterin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'835', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26720-17', N'Betamethason 0,5 mg
  -  
0,5 mg', 264.0000, N'Agi-Beta', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26721-17', N'Lisinopril (du?i d?ng Lisinopril dihydrat) 10 mg
  -  
10 mg', 2450.0000, N'Agimlisin 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26722-17', N'M?i gói 1g ch?a: Paracetamol 80 mg
  -  
80 mg', 1750.0000, N'Agimol 80', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26742-17', N'Th?c d?a
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
...', 200.0000, N'A.T Bát vị', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26743-17', N'M?i 5ml ch?a: Domperidon 5mg
  -  
5mg', 2730.0000, N'A.T Domperidon', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26744-17', N'Esomeprazol (du?i d?ng Esomeprazol natri)
  -  
20 mg', 27000.0000, N'A.T Esomeprazol 20 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26745-17', N'M?i 8ml ch?a: Cao ích m?u (T? l? 10:1) 533,33mg
  -  
533,33mg, 166,66mg, 133,33mg
Cao huong ph? (T? l? 10:1) 166,66mg
  -  
Cao ng?i c?u (T? l? 10:1) 133,33mg
  -  ', 30000.0000, N'A.T ích mẫu điều kinh', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26746-17', N'Cao ích m?u (T? l? 10:1)
  -  
400 mg
Cao huong ph? (T? l? 10:1)
  -  
125 mg
Cao ng?i c?u (T? l? 10:1)
  -  
100 mg', 1000.0000, N'A.T Ichmau', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26747-17', N'Perindopril arginin 5mg
  -  
5mg', 3400.0000, N'A.T Perindopril 5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26762-17', N'Acetylcystein
  -  
100 mg', 1100.0000, N'Acetylcystein Boston 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'850', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26763-17', N'Acetylcystein
  -  
200 mg', 1700.0000, N'Acetylcystein Boston 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'850', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26787-17', N'Acyclovir 200 mg
  -  
200 mg', 2000.0000, N'Acyclovir 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'921', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26788-17', N'Acyclovir 800 mg
  -  
800 mg', 4850.0000, N'Acyclovir 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'921', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26870-17', N'Vitamin B1 (Thiamin mononitrat)
  -  
100 mg
Vitamin B6 (Pyridoxin hydroclorid)
  -  
200 mg
Vitamin B12 (Cyanocobalamin)
  -  
200 mcg', 1100.0000, N'3B-Medi tab', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'930', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-26894-17', N'Acid tranexamic 500 mg
  -  
500 mg', 2500.0000, N'Acid tranexamic 500mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'932', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27017-17', N'M?i 3 g ch?a: Aciclovir 0,09g
  -  
0,09g', 48000.0000, N'Acyclovir 3%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'938', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27018-17', N'M?i 3 g ch?a: Aciclovir
  -  
0,15g', 10000.0000, N'Acyclovir 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'938', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27151-17', N'Adrenalin
  -  
1mg/1ml', 3850.0000, N'Adrenalin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'Ống       ', N'944', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27207-17', N'Alendronic acid
  -  
10mg', 5500.0000, N'Aderonat', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'905', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27208-17', N'Dinatri adenosin triphosphat
  -  
20mg', 950.0000, N'ATP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'905', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27299-17', N'Amikacin (du?i d?ng Amikacin sulfat)
  -  
500 mg/2 ml', 37800.0000, N'Acinstad 500mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'895', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27354-17', N'Cao d?c lá Actiso 10/1 250mg
  -  
250mg', 1800.0000, N'Actiso DHĐ', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'922', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27536-17', N'Acyclovir
  -  
400 mg', 3100.0000, N'Acyclovir Stada 400 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'864', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27595-17', N'Acetylcystein
  -  
200mg', 570.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'835', N'3', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27730-17', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 700.0000, N'Acemol Extra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'910', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27742-17', N'Paracetamol 325 mg
  -  
325 mg', 270.0000, N'Acetab 325', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27743-17', N'Aciclovir
  -  
800mg', 5200.0000, N'Agiclovir 800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27744-17', N'Furosemid
  -  
40 mg', 405.0000, N'Agifuros', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27745-17', N'Losartan potassium 12,5 mg
  -  
12,5 mg', 1450.0000, N'Agilosart 12,5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27746-17', N'Telmisartan
  -  
40 mg', 4150.0000, N'Agimstan', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27747-17', N'Alimemazin tartrat
  -  
10 mg', 970.0000, N'Aginmezin 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27748-17', N'Rebamipid
  -  
100 mg', 3750.0000, N'Agiremid 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27749-17', N'Paracetamol 500 mg
  -  
500 mg', 450.0000, N'Agi-Tyfedol 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27786-17', N'Atorvastatin (du?i d?ng Atorvastatin calci trihydrat)
  -  
10 mg', 2400.0000, N'A.T Atorvastatin 10 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27787-17', N'Atorvastatin (du?i d?ng Atorvastatin calci trihydrat)
  -  
20 mg', 4000.0000, N'A.T Atorvastatin 20 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27788-17', N'Esomeprazol (du?i d?ng esomeprazol magnesi dihydrat 21,7 mg)
  -  
20 mg', 5000.0000, N'A.T Esomeprazol 20 tab', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27789-17', N'Esomeprazol (du?i d?ng esomeprazol magnesi dihydrat)
  -  
40 mg', 10000.0000, N'A.T Esomeprazol 40 tab', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27790-17', N'Gentamicin (du?i d?ng Gentamicin sulfat)
  -  
80 mg', 1980.0000, N'A.T Gentamicine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27791-17', N'Glutathion
  -  
600 mg', 94000.0000, N'A.T Glutathione 600 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'848', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27800-17', N'M?i 10ml dung d?ch ch?a: S?t (du?i d?ng s?t gluconat) 50 mg
  -  
50 mg, 10,78 mg, 5 mg
Mangan gluconat 10,78 mg
  -  
Ð?ng gluconat 5 mg
  -  ', 3800.0000, N'ATIHEM', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27844-17', N'Acetazolamid 250mg
  -  
250mg', 735.0000, N'Acetazolamid', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'946', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27875-17', N'Acetylcystein
  -  
200 mg', 1650.0000, N'Acemetin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'924', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27911-17', N'Aceclofenac 100mg
  -  
100mg', 700.0000, N'Aceclofenac', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'928', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-27924-17', N'Etodolac
  -  
400mg', 6000.0000, N'Aguzar 400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'930', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28098-17', N'Isotretinoin
  -  
10 mg', 7000.0000, N'Acneskinz', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'942', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28139-17', N'Aciclorvir 200mg
  -  
200mg', 1250.0000, N'Aciclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'950', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28159-17', N'Cao khô actiso (tuong duong v?i 5g actiso)
  -  
300 mg', 1800.0000, N'Actiso PV', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'901', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28367-17', N'Cefpodoxim (du?i d?ng Cefpodoxim proxetil)
  -  
200 mg', 16000.0000, N'Abvaceff 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'870', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28535-17', N'M?i gói 2g ch?a: Acetylcystein 100mg
  -  
100mg', 1000.0000, N'Acehasan 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'860', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28582-17', N'M?i 10 g ch?a: Adapalene 10mg
  -  
10mg', 62000.0000, N'Adalcrem', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'867', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28758-18', N'Etoricoxib
  -  
90 mg', 6000.0000, N'Ahevip 90', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'847', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28809-18', N'Paracetamol 500 mg
  -  
500 mg, 15 mg, 5 mg
Dextromethorphan HBr 15 mg
  -  
Phenylephrin hydroclorid 5 mg
  -  ', 986.0000, N'Acemol plus', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'910', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28816-18', N'Paracetamol 500 mg
  -  
500 mg, 65 mg
Cafein 65 mg
  -  ', 600.0000, N'Acetab extra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28817-18', N'Paracetamol
  -  
500 mg', 500.0000, N'Agicedol', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28818-18', N'Mephenesin
  -  
250 mg', 800.0000, N'Agidecotyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28819-18', N'Betahistin dihydroclorid 8 mg
  -  
8 mg', 1320.0000, N'Agihistine 8', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28820-18', N'Losartan kali
  -  
100 mg', 7000.0000, N'Agilosart 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28821-18', N'Methylprednisolon 16 mg
  -  
16 mg', 3500.0000, N'Agimetpred 16', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28822-18', N'Fexofenadin hydrochlorid 180 mg
  -  
180 mg', 5100.0000, N'Agimfast 180', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28823-18', N'Rosuvastatin (du?i d?ng Rosuvastatin calci)
  -  
10 mg', 6250.0000, N'Agirovastin 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28824-18', N'Tadalafil
  -  
20 mg', 30000.0000, N'Agitafil 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28849-18', N'M?i ?ng 10ml dung d?ch ch?a: Calci glucoheptonat 1100 mg
  -  
1100 mg, 100 mg, 50 mg
Vitamin C 100 mg
  -  
Vitamin PP 50 mg
  -  ', 4200.0000, N'A.T Calcium cort', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-28899-18', N'Levocetirizin dihydroclorid 10mg
  -  
10mg', 4950.0000, N'Acritel-10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'855', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29085-18', N'Aciclovir 400mg
  -  
400mg', 2700.0000, N'Acyclovir 400mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'938', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29344-18', N'Adefovir dipivoxil 10mg
  -  
10mg', 15300.0000, N'Afovix tab', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'895', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29479-18', N'M?i 1 ml dung d?ch ch?a: Natri hyaluronat 1,8 mg
  -  
1,8 mg', 36000.0000, N'Afenemi', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'886', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29496-18', N'Acyclovir 800mg
  -  
800mg', 5000.0000, N'Acyclovir Stada 800 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'833', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29515-18', N'Acetylcystein 200 mg
  -  
200 mg', 10000.0000, N'Acenews', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'865', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29646-18', N'Bromhexin hydroclorid 8 mg
  -  
8 mg', 195.0000, N'Agi-Bromhexine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29647-18', N'Bromhexin hydroclorid 4 mg
  -  
4 mg', 350.0000, N'Agi-Bromhexine 4', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29648-18', N'Etoricoxib 120 mg
  -  
120 mg', 7000.0000, N'Agietoxib 120', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29649-18', N'Etoricoxib 90 mg
  -  
90 mg', 6000.0000, N'Agietoxib 90', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29650-18', N'Betahistin dihydroclorid 16 mg
  -  
16 mg', 1860.0000, N'Agihistine 16', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29651-18', N'Celecoxib 100mg
  -  
100mg', 2000.0000, N'Agilecox 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29652-18', N'Losartan kali 100 mg
  -  
100 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 4200.0000, N'Agilosart-H 100/25', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29653-18', N'Losartan kali 50 mg
  -  
50 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 3900.0000, N'Agilosart-H 50/12,5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29654-18', N'Omeprazol (du?i d?ng Omeprazol pellet bao tan trong ru?t 8,5 %) 20 mg
  -  
20 mg', 1150.0000, N'Agimepzol 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29655-18', N'Fexofenadin hydroclorid 120 mg
  -  
120 mg', 3800.0000, N'Agimfast 120', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29656-18', N'Lisinopril (du?i d?ng Lisinopril dihydrat) 20 mg
  -  
20 mg', 3380.0000, N'Agimlisin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29657-18', N'Metronidazol 500mg, nystatin 100.000UI, neomycin 65.000 IU
  -  ', 3300.0000, N'Agimycob', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29658-18', N'Paracetamol 325 mg
  -  
325 mg, 200 mg
Ibuprofen 200 mg
  -  ', 790.0000, N'Agiparofen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29682-18', N'Calci lactat (du?i d?ng Calci lactat pentahydrat) 300 mg
  -  
300 mg', 1750.0000, N'A.T Calcium 300', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29683-18', N'Cao d?c Di?p h? châu 150 mg tuong duong: Di?p h? châu 1050 mg
  -  
1050 mg', 1000.0000, N'A.T Diệp hạ châu', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29684-18', N'M?i 5ml h?n d?ch ch?a: Fexofenadin hydroclorid 30 mg
  -  
30 mg', 8000.0000, N'A.T Fexofenadin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'848', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29685-18', N'M?i 8 ml ch?a: Cao lá b?ch qu? (tuong duong 9,6 mg Ginkoflavon Glycosid toàn ph?n) 40 mg
  -  
40 mg, 120 mg
Cao r? dinh lang (t? l? 10:1) 120 mg
  -  ', 82000.0000, N'A.T hoạt huyết dưỡng', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'848', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29686-18', N'Imidapril hydroclorid 10 mg
  -  
10 mg', 4830.0000, N'A.T Imidapril 10 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29687-18', N'Imidapril hydroclorid 5 mg
  -  
5 mg', 4200.0000, N'A.T Imidapril 5mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'848', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29688-18', N'M?i 10 ml dung d?ch ch?a: Ribavirin 400 mg
  -  
400 mg', 125000.0000, N'A.T Ribavirin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'848', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29711-18', N'Acyclovir 200 mg
  -  
200 mg', 1000.0000, N'Acyclorvir VPC 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'920', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-29875-18', N'Acetylcystein
  -  
200mg', 810.0000, N'Acetylcystein 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'839', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30009-18', N'Cefpodoxim (du?i d?ng Cefpodoxim proxetil) 100 mg
  -  
100 mg', 6900.0000, N'Abvaceff 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'870', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30095-18', N'M?i gói 3g ch?a: Acetylcystein 200mg
  -  
200mg', 2200.0000, N'Acehasan 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'860', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30156-18', N'Acetylcystein 200mg
  -  
200mg', 562.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'835', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30195-18', N'Acetyl leucin 500mg
  -  
500mg', 1450.0000, N'Acedanyl', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'837', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30201-18', N'Methyldopa 250mg
  -  
250mg', 1900.0000, N'Agidopa', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30269-18', N'Bezafibrat 200 mg
  -  
200 mg', 3200.0000, N'Agibeza 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30270-18', N'Bromhexin hydroclorid 16 mg
  -  
16 mg', 890.0000, N'Agi-Bromhexine 16', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30271-18', N'Meloxicam 15mg
  -  
15mg', 1900.0000, N'Agimesi 15', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30272-18', N'Lamivudin 100 mg
  -  
100 mg', 8500.0000, N'Agimidin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30273-18', N'Telmisartan 80 mg
  -  
80 mg', 5900.0000, N'Agimstan 80', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30274-18', N'Telmisartan 80 mg
  -  
80 mg, 25 mg
Hydroclorothiazid 25 mg
  -  ', 7500.0000, N'Agimstan-H 80/25', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30295-18', N'M?i l? ch?a: Teicoplanin 200 mg
  -  
200 mg', 210000.0000, N'A.T Teicoplanin 200 inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'915', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30296-18', N'Candesartan cilexetil 16 mg
  -  
16 mg', 5000.0000, N'Acantan 16', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30297-18', N'Candesartan cilexetil 8 mg
  -  
8 mg', 3300.0000, N'Acantan 8', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30298-18', N'Candesartan cilexetil 16 mg
  -  
16 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 4800.0000, N'Acantan HTZ 16-12.5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30299-18', N'Candesartan cilexetil 8 mg
  -  
8 mg, 12,5 mg
Hydroclorothiazid 12,5 mg
  -  ', 3880.0000, N'Acantan HTZ 8-12.5', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30412-18', N'Etodolac
  -  
200 mg', 3100.0000, N'Aguzar 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'930', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30479-18', N'Acyclovir 200mg
  -  
200mg', 1550.0000, N'Acyclovir 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'938', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30628-18', N'M?i gói 1,5g ch?a: Acetylcystein 200mg
  -  
200mg', 1500.0000, N'Acetylcystein', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'902', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-30650-18', N'Amikacin (du?i d?ng Amikacin sulfat)
  -  
250mg', 24000.0000, N'Abicin 250', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'891', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31060-18', N'Paracetamol 500mg
  -  
500mg, 5mg, 25mg
Phenylephrin hydroclorid 5mg
  -  
Cafein 25mg
  -  ', 800.0000, N'Agidolgen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31061-18', N'Omeprazol (du?i d?ng vi h?t 8,5 % Omeprazol magnesi dihydrat 8,5%) 40mg
  -  
40mg', 2400.0000, N'Agimepzol 40', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31062-18', N'Trimebutine maleat 100 mg
  -  
100 mg', 950.0000, N'Agitritine 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'838', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31065-18', N'Loperamid HCl 2 mg
  -  
2 mg', 1005.0000, N'A.T Loperamid 2 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'915', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31257-18', N'Acyclovir
  -  
400 mg', 2500.0000, N'Acyclovir 400 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'901', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31591-19', N'Acyclovir 200mg
  -  
200mg', 3000.0000, N'A.T Acyclovir 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'915', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31592-19', N'Amikacin (du?i d?ng amikacin sulfat) 500 mg
  -  
500 mg', 39900.0000, N'A.T Amikacin 500', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'915', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31593-19', N'M?i 1ml ch?a Salbutamol (du?i d?ng Salbutamol sulfat) 0,5 mg
  -  
0,5 mg', 5670.0000, N'A.T Salbutamol inj', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'915', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31594-19', N'Sitagliptin (du?i d?ng Sitagliptin phosphate monohydrate) 100 mg
  -  
100 mg', 18900.0000, N'A.T Sitagpiptin 100mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31595-19', N'Sitagliptin (du?i d?ng Sitagliptin phosphate monohydrate) 50mg
  -  
50mg', 11000.0000, N'A.T Sitagpiptin 50 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'915', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-31912-19', N'Acetylcystein
  -  
200mg', 690.0000, N'Acetylcystein 200mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'940', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD3-19-18', N'Gemcitabin (du?i d?ng Gemcitabin hydrochlorid) 1,4 g
  -  
1,4 g', 1400000.0000, N'Abingem-1,4gm (Cơ sở sản xuất và đóng gói sơ cấp: Naprod life sciences pvt.ltd. Địa chỉ: 304, Town Centre, 3rd Floor, Andheri-Kurla Road, Near Mittal estate, Andheri (East), Mumbai-400059, India)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1007', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32031-19', N'Adrenalin
  -  
1mg/10ml', 5250.0000, N'Adrenalin 1mg/10ml', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'Ống       ', N'944', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32039-19', N'Acyclovir
  -  
5%', 20000.0000, N'Acyclovir 5%', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'901', N'2', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32057-19', N'M?i 5ml dung d?ch ch?a: N-Acetylcystein 200mg
  -  
200mg', 27500.0000, N'ANC', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Chai      ', N'905', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32111-19', N'M?i 10ml ch?a: N-Acetylcystein 200mg
  -  
200mg', 6700.0000, N'Acetuss', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'906', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32203-19', N'Flurbiprofen 100mg
  -  
100mg', 5500.0000, N'AXOFINEN 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'908', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32254-19', N'M?i gói 3g ch?a Cefpodoxime (du?i d?ng Cefpodoxime proxetil) 100mg
  -  
100mg', 8500.0000, N'Abvaceff 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'898', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-32501-19', N'Silymarin (Chi?t xu?t Cardus marianus) 117 mg
  -  
117 mg', 5500.0000, N'A.T Silymarin 117 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'915', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-3467-07', N'Meclofenoxat.HCl
  -  ', 1050.0000, N'A9 - Cerebrazel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'951', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VD-3518-07', N'Acetylcystein
  -  ', 550.0000, N'Acetydona 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'958', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10076-10', N'Isotretinoin
  -  
10mg', 3173.0000, N'Acutrine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'984', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10135-10', N'Amoxicillin 500mg
  -  
--
Potassium clavulanate (tuong duong 125mg acid clavulanic)
  -  ', 9450.0000, N'AMK 625', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1020', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10368-10', N'Lactobacillus acidophilus (sp. L. gasseri)
  -  
--
Bifidobacterium infantis
  -  
Enterococcus faecium
  -  ', 2600.0000, N'Actobim', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'990', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10479-10', N'Montelukast sodium
  -  
10mg', 3936.0000, N'Aireez 10mg Tablet', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1012', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10592-10', N'Aciclovir
  -  
5% w/w', 6400.0000, N'Acirax Cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'1038', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10747-10', N'Isoflurane
  -  
--', 910800.0000, N'Aerrane', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'816', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10754-10', N'Nifedipine
  -  
30mg', 9454.0000, N'Adalat LA 30mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'820', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10755-10', N'Nifedipine
  -  
60mg', 12034.0000, N'Adalat LA 60mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'820', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10756-10', N'Nifedipine
  -  
20mg', 4647.0000, N'Adalat retard', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'820', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-10980-10', N'Casein hydrolysate
  -  
500mg', 3337.0000, N'Acmodim tablet', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'827', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11032-10', N'Than ho?t tính
  -  
70mg', 950.0000, N'Acticarbine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Viên      ', N'986', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11089-10', N'Acetylcystein
  -  
200mg', 2677.0000, N'ACC 200mg (Đóng gói & xuất xưởng: Slutas Pharma GmbH - Đức)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Gói       ', N'992', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11171-10', N'Aceclofenac
  -  
100mg', 350.0000, N'Acemarksans 100', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'993', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11200-10', N'Clopidogrel bisulphate
  -  
75mg clopidogrel', 7000.0000, N'Afigrel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'999', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11339-10', N'Aciclovir
  -  
200mg', 1100.0000, N'Acirax', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1038', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11467-10', N'Alteplase
  -  
50mg', 10323589.0000, N'Actilyse', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'826', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11671-11', N'Cefotaxime Sodium
  -  
1g Cefotaxime', 16000.0000, N'Acitaxime', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'803', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-11839-11', N'Acid ursodesoxycholic
  -  
50mg
Thiamine nitrate
  -  
10mg
Riboflavin
  -  
5mg', 5950.0000, N'Adus Soft Capsule', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'981', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12142-11', N'Cefixime
  -  
200mg Cefixime', 3000.0000, N'Acicef - 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'803', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12442-11', N'Dextrose monohydrate
  -  
--
Natri Chlorid
  -  
Natri lactat
  -  
Kali clorid
  -  
...', 18000.0000, N'5% Dextrose in lactated ringer s', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'967', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12449-11', N'Atorvastatin calci
  -  
10mg Atorvastatin', 600.0000, N'Aforsatin 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'971', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12450-11', N'Atorvastatin calci
  -  
20mg Atorvastatin', 690.0000, N'Aforsatin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'971', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12717-11', N'Cefpodoxim proxetil
  -  
200mg Cefpodoxime', 9561.0000, N'Aegencefpo 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'807', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-12744-11', N'Loperamide HCl BP
  -  
2mg', 180.0000, N'Abydium', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'1048', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13200-11', N'Acyclovir
  -  
250mg', 14550.0000, N'Acyclovir', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'1030', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13443-11', N'Amlodipine
  -  
5mg', 400.0000, N'Acipta', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'843', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13669-11', N'Atorvastatin calcium
  -  
10mg Atorvastatin', 1540.0000, N'Acinet 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1035', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13670-11', N'Atorvastatin calcium
  -  
20mg Atorvastatin', 2013.0000, N'Acinet 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1035', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13788-11', N'Aciclovir
  -  
--', 7000.0000, N'Aciherpin 5% cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'810', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13904-11', N'Cefdinir
  -  
125mg', 6500.0000, N'Aegendinir 125', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'807', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-13905-11', N'Cefdinir
  -  
300mg', 9500.0000, N'Aegendinir 300', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'807', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14010-11', N'Nifedipine
  -  
10mg', 2254.0000, N'Adalat 10 (cơ sở xuất xưởng: Bayer Schering Pharma AG, địa chỉ: D-51368 Leverkusen, Germany)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1016', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14025-11', N'Aceclofenac
  -  
100mg', 425.0000, N'Aclopsa', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1051', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14033-11', N'Aescin
  -  
20mg', 3400.0000, N'Aescin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1040', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14124-11', N'Simethicon
  -  
40mg/0,6ml', 21000.0000, N'Air-X drops', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'1013', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14268-11', N'Desloratadine
  -  
0,5mg/ml', 78901.0000, N'Aerius', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'1027', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14630-12', N'Simethicone
  -  
80mg', 903.0000, N'Air-X tab. hương vị cam', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Viên      ', N'1020', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14667-12', N'Dextrose monohydrate
  -  
5g/100ml', 13500.0000, N'5% Dextrose in water solution for intravenous infusion', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'968', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14811-12', N'Acyclovir
  -  
50mg', 24596.0000, N'Acyclovir Stada', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'1032', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-14903-12', N'Salmeterol xinafoate, fluticasone propionate
  -  
(Salmeterol 25mcg', 90000.0000, N'Aeroflu 125 HFA Inhalation', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1001', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15010-12', N'Glucosamin Sulfate Potassium Chlorid Complex
  -  
500mg', 3200.0000, N'AB Glucosamine', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1015', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15194-12', N'Ketorolac tromethamine
  -  
4,5mg/ml', 7400.0000, N'Acuvail', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'813', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15332-12', N'Glucose (khan)
  -  
5%', 9500.0000, N'5% Glucose Injection 500ml:25g', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'1028', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15368-12', N'Magnesium trisilicate, Dried aluminium hydroxide, Simethicone
  -  
250mg, 250mg, 25mg', 2750.0000, N'Acirun', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'976', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15376-12', N'Simethicone
  -  
80mg', 903.0000, N'Air-X', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Viên      ', N'1020', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15378-12', N'Bambuterol HCL
  -  
10mg', 3600.0000, N'Airbuter 10', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'995', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15379-12', N'Bambuterol HCL
  -  
20mg', 5900.0000, N'Airbuter 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'995', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15416-12', N'Dinoprostone 10mg/01 h? phân ph?i thu?c
  -  
60mg loxoprofen sodium
  -  ', 4620.0000, N'Absolox (Đóng gói bởi: OLIC (Thailand) Limited - 166 Moo 16, Bangpa-In Industrial Estate, Udomsorayuth Road, Bangpa-In District, Ayutthaya Province, Thailand)', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'963', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15421-12', N'Piracetam
  -  
1g/5ml', 6000.0000, N'Aeyerop inj.', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Ống       ', N'979', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15543-12', N'Sodium hyaluronate
  -  
25mg', 800000.0000, N'Adant', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Hộp       ', N'1039', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15577-12', N'Magnesium aluminometasilicate
  -  
.
Natri bicarbonate
  -  
Scopolia Extract
  -  
Eslase
  -  
...', 4950.0000, N'Ahngookpapaze Tablet', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'811', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15663-12', N'Diphenhydramine HCl
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
...', 48000.0000, N'Abicof Syrup', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'1048', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15700-12', N'Cefadroxil
  -  
250mg/5ml', 35000.0000, N'Acefdrox-250', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Chai      ', N'803', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15727-12', N'Nifedipine
  -  
20mg', 6017.0000, N'Adalat LA 20mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'820', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15842-12', N'Glucosamin sulfate potassium chlorid complex, Manganese gluconate, Chondroitin sulfate
  -  
295mg Glucosamin', 5000.0000, N'AB Ausbiobone', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1015', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-15868-12', N'Calcium aminoacid chelate, Calcium phosphate, Calcium citrate, Magnesium oxide n?ng, Magnesium phosphate, Zinc aminoacid chelate, Manganese aminoacid chelate, Acid ascorbic, Vitamin D3, Acid folic
  -  
.', 7000.0000, N'AB Extrabone-Care+', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1031', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16010-12', N'Amoxicillin trihydrate, Potassium clavulanate
  -  
500mg Amoxicillin, 125mg Acid clavulanic', 5565.0000, N'Acle Tablet 625mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'985', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16257-13', N'Tocilizumab
  -  
200mg/10ml', 6748140.0000, N'Actemra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'30 tháng', N'Lọ        ', N'841', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16290-13', N'Tacrolimus (du?i d?ng Tacrolimus monohydrate)
  -  
0,5mg', 36616.0000, N'Advagraf', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'814', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16414-13', N'Alendronic Acid (du?i d?ng Alendronate sodium) 70mg
  -  ', 65000.0000, N'Acid Alendronic Farmoz', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'1045', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16498-13', N'Tacrolimus (du?i d?ng Tacrolimus monohydrate)
  -  
1 mg', 54920.0000, N'Advagraf', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'814', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16554-13', N'Telmisartan 40mg
  -  ', 8100.0000, N'Actelsar 40mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'805', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16555-13', N'Telmisartan 80mg
  -  ', 11300.0000, N'Actelsar 80mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'viên      ', N'805', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16660-13', N'Zoledronic acid 4mg/5ml
  -  ', 2950000.0000, N'Acido Zoledronico Richet', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'989', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16733-13', N'Clindamycin (du?i d?ng Clindamycin hydrochloride) 200mg
  -  
Metronidazole 160mg
  -  ', 25000.0000, N'Acneal', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'965', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16752-13', N'Irbesartan 300mg
  -  
  -  ', 17000.0000, N'0.9% Sodium Chloride Solution for I.V. Infusion', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'968', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16753-13', N'Dextrose monohydrate 50g/500ml
  -  ', 16000.0000, N'10% Dextrose in Water Parenteral Solution for Intravenous Infusion', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'968', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16754-13', N'Dextrose monohydrate 100g/500ml
  -  ', 19000.0000, N'20% Dextrose in Water for Intravenous Infusion', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'968', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16755-13', N'Dextrose monohydrate 150g/500ml
  -  ', 17800.0000, N'30% Dextrose in Water', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'968', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16807-13', N'Doxorubicin hydrochloride
  -  
10mg/5ml', 108000.0000, N'Adorucin', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'18 tháng', N'Lọ        ', N'982', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16828-13', N'Aceclofenac 100mg
  -  ', 900.0000, N'Acemed Tablets', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'996', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-16899-13', N'Ceftriaxone (du?i d?ng Ceftriaxone natri)
  -  
1g', 52000.0000, N'Abitrax', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'988', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17188-13', N'Ranitidin (du?i d?ng Ranitidin hydrochlorid)
  -  
150mg', 320.0000, N'Aciloc 150', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'832', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17208-13', N'Rabeprazole natri
  -  
10 mg', 8000.0000, N'Acilesol 10mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'805', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17209-13', N'Rabeprazole natri
  -  
20 mg', 12400.0000, N'Acilesol 20mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'805', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17240-13', N'Budesonide
  -  
100µg/li?u
Formoterol fumarate (du?i d?ng Formoterol fumarate dihydrate)
  -  
6µg/li?u', 170000.0000, N'Aerofor 100 Hfa', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'1001', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17241-13', N'Budesonide (Micronised)
  -  
200µg/li?u
Formoterol fumarate (du?i d?ng Formoterol fumarate dihydrate)
  -  
6µg/li?u', 230000.0000, N'Aerofor 200 Hfa', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Ống       ', N'1001', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17310-13', N'Betamethasone dipropionate
  -  
6,4mg/10g
Clotrimazole
  -  
100mg/10g
Gentamicin sulfate
  -  
10mg/10g', 12000.0000, N'Acrason Cream', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'980', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17422-13', N'5-Fluorouracil
  -  
50mg/ml', 112350.0000, N'5-Fluorouracil "Ebewe"', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'966', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17674-14', N'Docetaxel
  -  
20mg/2ml', 1260000.0000, N'Docetaxel 20mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1041', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17713-14', N'Doxorubicin hydrochloride 10mg/5ml
  -  
2 mg/ ml', 51068.0000, N'Adrim 10mg/5ml', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'972', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17793-14', N'Aciclovir 400mg
  -  ', 2200.0000, N'Acirax-400', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1038', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17818-14', N'Levocetirizine Dihydrochloride
  -  
15mg/30ml', 52000.0000, N'1-AL', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'969', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-17848-14', N'Ranitidin (du?i d?ng Ranitidin hydrochlorid)
  -  
300 mg', 700.0000, N'Aciloc 300', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'832', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18026-14', N'Desloratadine
  -  
5mg', 9521.0000, N'Aerius', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1027', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18371-14', N'Isotretinoin 20mg
  -  ', 15000.0000, N'Acnotin 20', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'997', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18579-14', N'Aciclorvir 800mg
  -  ', 3700.0000, N'Acirax-800', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1038', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18586-15', N'Natri bicarbonat
  -  
10,5 mg', 95000.0000, N'4.2% w/v Sodium Bicarbonate', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'815', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18587-15', N'Citicolin (du?i d?ng Citicolin natri) 500 mg
  -  ', 21940.0000, N'Actibon', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'999', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18588-15', N'Monosulfua natri.9H2O
  -  
4 mg
Saccharomyces cerevisiae 1250 tri?u t? bào
  -  
50 mg
  -  ', 11000.0000, N'Actisoufre', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Ống       ', N'987', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18589-15', N'Nefopam hydroclorid
  -  
20 mg', 34000.0000, N'Acupan', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Ống       ', N'964', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18590-15', N'Losartan kali 50 mg
  -  ', 1000.0000, N'Adostan 50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1023', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18806-15', N'Ketorolac tromethamine
  -  
0,5%', 67245.0000, N'Acular', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'812', N'7', 500)
GO
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-18861-15', N'Paracetamol
  -  
1 g/100 ml', 21000.0000, N'Aarmol 100ml', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'1029', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19029-15', N'Isotretinoin 20mg
  -  ', 15500.0000, N'Acutrine 20 Soft capsule', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'983', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19126-15', N'Simethicone
  -  
120mg', 1365.0000, N'Air-X 120', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1020', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19202-15', N'Activated Attapulgite of Mormoiron 3g
  -  ', 3157.0000, N'Actapulgite', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Gói       ', N'822', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19294-15', N'Acid zoledronic (du?i d?ng Acid zoledronic monohydrat) 5mg/100ml
  -  ', 6761490.0000, N'Aclasta', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Chai      ', N'1009', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19302-15', N'Quinapril (du?i d?ng Quinapril HCl) 5mg
  -  ', 3254.0000, N'Accupril', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1011', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19326-15', N'Levofloxacin (du?i d?ng Levofloxacin hemihydrat)
  -  
500mg', 8000.0000, N'Adolox', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1023', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19565-16', N'Aciclovir
  -  
5% w/w', 6840.0000, N'Aciclovir Cream BP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Tuýp      ', N'828', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19793-16', N'Isoflurane 100%
  -  
100% ( tt/tt)', 910800.0000, N'Aerrane', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Chai      ', N'817', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19820-16', N'Isotretinoin 10mg
  -  ', 12900.0000, N'A-Cnotren', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'973', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19914-16', N'Clopidogrel (du?i d?ng Clopidogrel bisulfat)a
  -  
75 mg', 7100.0000, N'Aclop', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1042', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19977-16', N'M?i li?u x?t ch?a: Salmeterol (du?i d?ng salmeterol xinafoat) 50mcg
  -  
Fluticason propionat 500mcg
  -  ', 319132.0000, N'AirFluSal Forspiro', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Bình      ', N'808', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-19978-16', N'Acetylcystein
  -  
200 mg', 2677.0000, N'ACC 200 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Gói       ', N'992', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20043-16', N'Everolimus
  -  
5mg', 610058.0000, N'Afinitor 5mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1009', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20093-16', N'Tramadol hydrochlorid 37,5 mg
  -  
Acetaminophen 325mg
  -  ', 1700.0000, N'Acetra', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1038', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20385-17', N'Nifedipin
  -  
30 mg', 9454.0000, N'Adalat LA 30mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'819', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20386-17', N'Nifedipin
  -  
60mg', 12034.0000, N'Adalat LA 60mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'48 tháng', N'Viên      ', N'819', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20387-17', N'Nifedipin
  -  
20mg', 4647.0000, N'Adalat retard', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'819', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20696-17', N'Aceclofenac
  -  
100 mg', 5900.0000, N'Aceclonac', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1021', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20830-17', N'Acetylcystein
  -  
200mg', 6700.0000, N'Acc Pluzz 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'978', N'1', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20887-18', N'Amoxicillin (du?i d?ng amoxicillin trihydrat)
  -  
400mg/5ml
Acid clavulanic (du?i d?ng kali clavulanat)
  -  
57mg/5ml', 168000.0000, N'AMK 457', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Chai      ', N'1020', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20899-18', N'Telmisartan
  -  
40mg', 8000.0000, N'Actelsar 40mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'806', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20980-18', N'Acid tranexamic
  -  
500 mg', 21546.0000, N'Acido Tranexamico Bioindustria L.I.M', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Ống       ', N'825', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-20992-18', N'Paracetamol
  -  
500mg
Diclofenac natri
  -  
50mg', 15100.0000, N'Aceclofen', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'1024', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21117-18', N'Isotretinoin
  -  
20mg', 15000.0000, N'Acmolrine - 20 Soft Capsule', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'994', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21122-18', N'Atorvastatin (du?i d?ng atorvastatin calcium)
  -  
10mg', 8000.0000, N'Afocical Tab.', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1046', N'2', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21238-18', N'Paracetamol
  -  
750mg
Phenylephrin hydrocloird
  -  
10mg
Acid ascorbic (vitamin C)
  -  
60mg', 15690.0000, N'Agicold hotmix orange', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Túi       ', N'810', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21345-18', N'Acarbose
  -  
50mg', 2250.0000, N'Acabrose Tablets 50mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'1034', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21654-19', N'Telmisartan 40mg
  -  
40mg, 12,5mg
Hydrochlorothiazid 12,5mg
  -  ', 9800.0000, N'Actelsar HCT 40mg/12,5 mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'806', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21764-19', N'Ibuprofen 100mg/5ml
  -  
100mg
  -  ', 55000.0000, N'Abifish', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'1010', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-21983-19', N'Acarbose 50mg
  -  
  -  ', 2700.0000, N'Acarbose Friulchem (Đóng gói &xuất xưởng: Lamp San Prospero SPA, địa chỉ: Via Della Pace, 25/A-41030 San Prospero (MO), Italy', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Viên      ', N'970', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-206-13', N'Everolimus 10mg
  -  ', 1220115.0000, N'Afinitor 10mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1009', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-207-13', N'Everolimus 5mg
  -  ', 610057.0000, N'Afinitor 5mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1009', N'6', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-52-13', N'Epirubicin hydrochloride
  -  
50mg', 573000.0000, N'4-Epeedo-50', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'lọ        ', N'1005', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-53-13', N'Gemcitabine
  -  
200mg', 547500.0000, N'Abingem 200', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1005', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN2-643-17', N'Abacavir (du?i d?ng Abacavir sulfat)
  -  
300 mg', 11000.0000, N'Abacavir Tablets USP 300mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'60 tháng', N'Viên      ', N'1003', N'3', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN3-16-18', N'Fluorouracil
  -  
250mg/5ml', 135000.0000, N'5-FU Onkovis 50mg/ml', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'977', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5104-10', N'Acyclovir
  -  
250mg', 13900.0000, N'Aclovia', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Tuýp      ', N'827', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5195-10', N'Acetylcystein
  -  
--', 295000.0000, N'Acetylcysteine Solution, USP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'823', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5197-10', N'Acyclovir
  -  
500mg', 947600.0000, N'Acyclovir for Injection USP', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'824', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5220-10', N'Aciclovir
  -  
250mg', 438000.0000, N'Acymess', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'1002', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5228-10', N'Celecoxib
  -  
200mg/viên', 1091.0000, N'Agcel', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'976', N'8', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5437-10', N'Attapulgite de Mormoiron ho?t hoá
  -  
3g', 3157.0000, N'Actapulgite', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'gói       ', N'822', N'9', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5440-10', N'Cefotaxime natri
  -  
1g', 19147.0000, N'Ahngook Cefotaxim 1g', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'24 tháng', N'Lọ        ', N'811', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5534-10', N'2,4 Dichlorobenzyl Alcohol
  -  
--
Amylmetacresol
  -  ', 716.0000, N'Agisept Antiseptic Tablet-Classical', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'810', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5566-10', N'Quinapril
  -  
5mg/viên', 3254.0000, N'Accupril', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'viên      ', N'974', N'4', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-5621-10', N'Levofloxacin
  -  
5mg/ml', 88515.0000, N'Cravit', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Lọ        ', N'1025', N'7', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-9858-10', N'Acarbose
  -  
50mg/ viên', 2250.0000, N'Acarbose Tablets 50mg', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'1034', N'5', 500)
INSERT [dbo].[Thuoc] ([MaThuoc], [MoTa], [GiaThuoc], [TenThuoc], [NgaySX], [HSD], [DonViTinh], [MaNCC], [MaLoai], [SoLuong]) VALUES (N'VN-9905-10', N'Acetaminophen, Caffein
  -  
500mg/65mg', 761.0000, N'Aceteming', CAST(N'2020-06-17T04:57:19.483' AS DateTime), N'36 tháng', N'Viên      ', N'842', N'7', 500)
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietPhieuHuy]  WITH CHECK ADD FOREIGN KEY([MaPhieuHuy])
REFERENCES [dbo].[PhieuHuy] ([MaPhieuHuy])
GO
ALTER TABLE [dbo].[ChiTietPhieuHuy]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuHuy]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
USE [master]
GO
ALTER DATABASE [QuanLiThuoc] SET  READ_WRITE 
GO
