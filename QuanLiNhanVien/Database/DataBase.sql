USE [TTN_QLNV]
GO
/****** Object:  Table [dbo].[DUAN]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DUAN](
	[MaDA] [int] IDENTITY(1,1) NOT NULL,
	[TenDA] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[MaPB] [int] NULL,
 CONSTRAINT [PK_DUAN] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[Luong] [decimal](18, 0) NULL,
	[MaPB] [int] NULL,
	[MaNGS] [int] NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MaDA] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[SoGio] [int] NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[MaPB] [int] IDENTITY(1,1) NOT NULL,
	[TenPB] [nvarchar](50) NULL,
	[MaTP] [int] NULL,
	[NgayNhanChuc] [date] NULL,
 CONSTRAINT [PK_PHONGBAN] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MaNV] [int] NOT NULL,
	[TenTN] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[QuanHe] [nvarchar](50) NULL,
 CONSTRAINT [PK_THANNHAN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[TenTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DUAN] ON 

INSERT [dbo].[DUAN] ([MaDA], [TenDA], [DiaDiem], [MaPB]) VALUES (1, N'Làm giàu không khó', N'Hai Bà Trưng, Hà Nội', 2)
SET IDENTITY_INSERT [dbo].[DUAN] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [NgaySinh], [DiaChi], [GioiTinh], [Luong], [MaPB], [MaNGS]) VALUES (1, N'Dương Thị Minh Nguyệt', CAST(N'1998-08-23' AS Date), N'Thanh Xuân, Hà Nội', N'N?', CAST(18000000 AS Decimal(18, 0)), 1, NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [NgaySinh], [DiaChi], [GioiTinh], [Luong], [MaPB], [MaNGS]) VALUES (3, N'Nguyễn Thị Huyền Trang', CAST(N'2019-06-09' AS Date), N'Vĩnh Yên, Vĩnh Phúc', N'Nữ', CAST(10000000 AS Decimal(18, 0)), 1, 1)
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
INSERT [dbo].[PHANCONG] ([MaDA], [MaNV], [SoGio]) VALUES (1, 1, 200)
SET IDENTITY_INSERT [dbo].[PHONGBAN] ON 

INSERT [dbo].[PHONGBAN] ([MaPB], [TenPB], [MaTP], [NgayNhanChuc]) VALUES (1, N'Hành Chính', 1, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[PHONGBAN] ([MaPB], [TenPB], [MaTP], [NgayNhanChuc]) VALUES (2, N'Nhân Sự', NULL, CAST(N'2013-08-23' AS Date))
SET IDENTITY_INSERT [dbo].[PHONGBAN] OFF
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [GioiTinh], [NgaySinh], [QuanHe]) VALUES (1, N'Dương Văn Minh', N'Nam', CAST(N'2011-09-20' AS Date), N'Con')
ALTER TABLE [dbo].[DUAN]  WITH CHECK ADD  CONSTRAINT [FK_DUAN_PHONGBAN] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PHONGBAN] ([MaPB])
GO
ALTER TABLE [dbo].[DUAN] CHECK CONSTRAINT [FK_DUAN_PHONGBAN]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_NHANVIEN] FOREIGN KEY([MaNGS])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_NHANVIEN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_DUAN] FOREIGN KEY([MaDA])
REFERENCES [dbo].[DUAN] ([MaDA])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_DUAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_NHANVIEN]
GO
ALTER TABLE [dbo].[PHONGBAN]  WITH CHECK ADD  CONSTRAINT [FK_PHONGBAN_NHANVIEN] FOREIGN KEY([MaTP])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PHONGBAN] CHECK CONSTRAINT [FK_PHONGBAN_NHANVIEN]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_THANNHAN_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_THANNHAN_NHANVIEN]
GO
/****** Object:  StoredProcedure [dbo].[LoadAllNhanVien]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadAllNhanVien]
AS 
	SELECT nv.MaNV, nv.Hoten, nv.NgaySinh, nv.DiaChi, nv.GioiTinh, nv.Luong, pb.MaPB, pb.TenPB, gs.MaNV AS MaNGS, gs.Hoten AS TenNGS
	FROM dbo.NHANVIEN nv LEFT JOIN dbo.PHONGBAN pb ON nv.MaPB = pb.MaPB
	LEFT JOIN dbo.NHANVIEN gs ON nv.MaNGS = gs.MaNV

GO
exec LoadAllNhanVien
/****** Object:  StoredProcedure [dbo].[LoadComboBoxNGS]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadComboBoxNGS]
AS
	SELECT nv.MaNV, nv.Hoten
	FROM dbo.NHANVIEN nv
GO
/****** Object:  StoredProcedure [dbo].[LoadComboBoxPhongBan]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadComboBoxPhongBan]
AS
	SELECT pb.MaPB, pb.TenPB
	FROM dbo.PHONGBAN pb

GO
/****** Object:  StoredProcedure [dbo].[XoaNhanVienTheoMa]    Script Date: 30/01/2019 4:21:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaNhanVienTheoMa]
	@maNV INT
AS 
	DELETE FROM dbo.NHANVIEN WHERE MaNV = @maNV

GO

/*****Object: LoadAllDuAn*****/
alter proc [dbo].[LoadAllDuAn]
AS
/*
select d.MaDA,d.TenDA,d.DiaDiem,d.MaPB
from dbo.DUAN as d, dbo.PHONGBAN as p,dbo.PHANCONG as pc
where d.MaDA=pc.MaDA and d.MaPB=p.MaPB
*/
select * from DUAN
go
create proc [dbo].[XoaDuAnTheoMa]
@maDA INT
AS 
	DELETE FROM dbo.DUAN WHERE MaDA=@maDA



