USE [CaseStudy]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDiemDanhTheoNhanVienId]    Script Date: 10/11/2019 4:40:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LayNhanVienTheoId]    Script Date: 10/11/2019 4:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayNhanVienTheoId]
	@Id INT
AS 
BEGIN
SELECT nv.[Id]
	  ,CONCAT(nv.Ho,' ',nv.Ten) AS HoTen
      ,
		CASE WHEN GioiTinh = 0 THEN N'Nữ'
			ELSE N'Nam'
		END AS GioiTinh
      ,nv.[NgaySinh]
      ,nv.[SoChungMinh]
      ,nv.[SoDienThoai]
      ,nv.[Email]
      ,nv.[DiaChi]
      ,nv.[MaSoThue]
      ,nv.[HinhAnh]
      ,nv.[NgayTao]
      ,nv.[NgaySua]
      ,nv.[DangLamViec]
      ,nv.[DaXoa]
	  ,bp.Ten AS BoPhan
	  ,cv.Ten AS ChucVu
  FROM [dbo].[NhanVien] nv
		JOIN dbo.ChucVuNhanVien cvnv ON cvnv.NhanVienId = nv.Id
		JOIN dbo.ChucVu cv ON cv.Id = cvnv.ChucVuId
		JOIN dbo.BoPhan bp ON bp.Id = cvnv.BoPhanId
  WHERE nv.Id = @Id AND nv.DaXoa = 0 AND DangLamViec = 1
END

GO
/****** Object:  StoredProcedure [dbo].[TaoDonXinPhep]    Script Date: 10/11/2019 4:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Báo
-- Create date: 2019/10/09
-- Description:	Viết Đơn Xin Phép
-- =============================================
CREATE PROCEDURE [dbo].[TaoDonXinPhep]
(
	@NhanVienId INT,
	@QuanLyId INT,
	@TinhTrang INT,
	@NgayBatDau DATE,
	@NgayKetThuc DATE,
	@SoPhepConLai TINYINT,
	@SoNgayDaNghi TINYINT,
	@NgayGui DATE,
	@NgayPhanHoi DATE,
	@GhiChu NVARCHAR(MAX),
	@TraLoi NVARCHAR(MAX)
)
AS
BEGIN
INSERT INTO [dbo].[DonXinPhep]
           ([NhanVienId]
           ,[QuanLyId]
           ,[TinhTrang]
           ,[NgayBatDau]
           ,[NgayKetThuc]
           ,[SoPhepConLai]
           ,[SoNgayDaNghi]
           ,[NgayGui]
           ,[NgayPhanHoi]
           ,[GhiChu]
           ,[TraLoi])
     VALUES
           (@NhanVienId
           ,@QuanLyId
           ,@TinhTrang
           ,@NgayBatDau
           ,@NgayKetThuc
           ,@SoPhepConLai
           ,@SoNgayDaNghi
           ,@NgayGui
           ,@NgayPhanHoi
           ,@GhiChu
           ,@TraLoi)
END

GO
/****** Object:  StoredProcedure [dbo].[TaoDonXinPhepView]    Script Date: 10/11/2019 4:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Báo
-- Create date: 2019/10/09
-- Description:	Xem Đơn Xin Phép
-- =============================================
CREATE PROCEDURE  [dbo].[TaoDonXinPhepView]
(
	@Id INT
)
AS
BEGIN
DECLARE @NgayHienTai DATE = GETDATE()
SELECT tk.[NhanVienId]
      ,CONCAT(nv.Ho,' ',nv.Ten) AS HoTen
	  ,bp.Ten AS BoPhan
      ,tk.[Tre]
      ,tk.[KhongPhep]
      ,tk.[SoPhepConLai]
FROM [dbo].[ThongKe] tk JOIN dbo.NhanVien nv ON nv.Id = tk.NhanVienId
	JOIN dbo.ChucVuNhanVien cvnv ON cvnv.NhanVienId = nv.Id
	JOIN dbo.BoPhan bp ON bp.Id = cvnv.BoPhanId
	WHERE tk.NhanVienId = @Id AND tk.Thang = MONTH(@NgayHienTai) AND tk.Nam = YEAR(@NgayHienTai) 
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKeNhanVienTheoId]    Script Date: 10/11/2019 4:40:26 PM ******/
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
/****** Object:  StoredProcedure [dbo].[XemDonXinPhepNhanVienTheoId]    Script Date: 10/11/2019 4:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Báo
-- Create date: 2019/10/09
-- Description:	Xem Đơn Xin Phép
-- =============================================
CREATE PROCEDURE [dbo].[XemDonXinPhepNhanVienTheoId]
(
	@Id INT
)
AS
BEGIN
SELECT dxp.[Id]
      ,dxp.[NhanVienId]
	  ,CONCAT(nv.Ho,' ',nv.Ten) AS HoTen
      ,dxp.[QuanLyId]
      ,dxp.[TinhTrang]
      ,dxp.[NgayBatDau]
      ,dxp.[NgayKetThuc]
      ,dxp.[SoPhepConLai]
      ,dxp.[SoNgayDaNghi]
      ,dxp.[NgayGui]
      ,dxp.[NgayPhanHoi]
      ,dxp.[GhiChu]
      ,dxp.[TraLoi]
  FROM [dbo].[DonXinPhep] dxp JOIN dbo.NhanVien nv ON nv.Id = dxp.NhanVienId
	WHERE nv.DaXoa = 0 AND nv.DangLamViec = 1 AND dxp.NhanVienId = @Id
  
END

GO
