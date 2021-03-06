USE [CaseStudy]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietDiemDanhTheoNhanVienId]    Script Date: 10/11/2019 4:36:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LayNhanVienTheoId]    Script Date: 10/11/2019 4:36:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HienThiThongTinNhanVien]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HienThiThongTinNhanVien](
	@Id INT
 )
AS
BEGIN
	SELECT nv.Id,
		nv.Ho,
		nv.Ten,
		nv.GioiTinh,
		nv.NgaySinh,
		nv.SoChungMinh,
		nv.SoDienThoai,
		nv.Email,
		nv.DiaChi,
		nv.MaSoThue,
		nv.HinhAnh,
		nv.NgayTao,
		nv.NgaySua,
		nv.DangLamViec,
		tk.Id,
		cvnv.ChucVuId,
		cvnv.BoPhanId
	FROM NhanVien nv JOIN TaiKhoan tk ON nv.Id = tk.Id
	JOIN ChucVuNhanVien cvnv ON cvnv.NhanVienId=nv.Id
	WHERE nv.Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayBoPhan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <10/10/2019>
-- Description:	<Lấy Bộ Phận để viết viewbag>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayBoPhan]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Ten FROM BoPhan
	WHERE DangHoatDong=1 AND DaXoa=0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_LayBoPhanTheoId]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <11/10/2019>
-- Description:	<Sua bộ phận>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LayBoPhanTheoId]
			(@Id INT)
AS
BEGIN
	SELECT Id, Ten,DangHoatDong FROM BoPhan
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_layChucVu]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <10/10/2019>
-- Description:	<lấy Chức Vụ>
-- =============================================
CREATE PROCEDURE [dbo].[sp_layChucVu]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM ChucVu
	WHERE DangHoatDong=1 AND DaXoa=0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_layQuyenTruyCap]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <10/10/2019>
-- Description:	<lấy Quyền Truy Cập>
-- =============================================
CREATE PROCEDURE [dbo].[sp_layQuyenTruyCap]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT Id,Quyen  FROM QuyenTruyCap
		WHERE DangHoatDong=1 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaboPhan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <11/10/2019>
-- Description:	<Sua bộ phận>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SuaboPhan]
			(@Id INT,
			@Ten NVARCHAR(100),
			@DangHoatDong BIT)
AS
BEGIN
	UPDATE BoPhan SET
	Ten=@Ten,
	DangHoatDong=@DangHoatDong
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaThongTinNhanVien]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaThongTinNhanVien](
	@Id INT
      ,@Ho NVARCHAR(50)
      ,@Ten NVARCHAR(50)
      ,@GioiTinh BIT
      ,@NgaySinh DATE
	  ,@SoChungMinh NVARCHAR(100)
      ,@SoDienThoai NVARCHAR(50)
      ,@Email NVARCHAR(100)
      ,@DiaChi NVARCHAR(500)
      ,@MaSoThue NVARCHAR(50)
      ,@HinhAnh NVARCHAR(MAX)
      ,@NgayTao DATE
      ,@NgaySua DATE
      ,@DangLamViec BIT
	  ,@QuyenId INT
	  ,@ChucVuId INT
	  ,@BoPhanId INT
      )
AS
BEGIN
	UPDATE NhanVien SET
	Ho=@Ho,
	Ten=@Ten,
	GioiTinh=@GioiTinh,
	NgaySinh=@NgaySinh,
	SoChungMinh=@SoChungMinh,
	SoDienThoai=@SoDienThoai,
	Email=@Email,
	DiaChi=@DiaChi,
	MaSoThue=@MaSoThue,
	HinhAnh=@HinhAnh,
	NgayTao=@NgayTao,
	NgaySua=@NgaySua,
	DangLamViec=@DangLamViec
	WHERE NhanVien.Id=@Id
	UPDATE TaiKhoan  SET
	QuyenId=@QuyenId,
	Email=@Email
	WHERE Id=@Id
	UPDATE ChucVuNhanVien SET
	ChucVuId=@ChucVuId,
	BoPhanId=@BoPhanId
	WHERE NhanVienId=@Id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoMoiBoPhan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <11/10/2019>
-- Description:	<tạo mới bộ phận>
-- =============================================
CREATE PROCEDURE [dbo].[sp_TaoMoiBoPhan]
			(@Ten NVARCHAR(50))
AS
BEGIN
	INSERT INTO BoPhan (Ten,DangHoatDong,DaXoa) 
	VALUES(@Ten,1,0)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemNhanVien](
	
       @Ho NVARCHAR(50)
      ,@Ten NVARCHAR(50)
      ,@GioiTinh BIT
      ,@NgaySinh DATE
	  ,@SoChungMinh NVARCHAR(100)
      ,@SoDienThoai NVARCHAR(50)
      ,@Email NVARCHAR(100)
      ,@DiaChi NVARCHAR(500)
      ,@MaSoThue NVARCHAR(50)
      ,@HinhAnh NVARCHAR(MAX)
	  ,@QuyenId INT
	  ,@ChucVuId INT
	  ,@BoPhanId INT
	  ,@MatKhau NVARCHAR(100)
      )
AS
BEGIN

	DECLARE @ID INT
	INSERT INTO NhanVien(Ho,Ten,GioiTinh,NgaySinh,SoChungMinh,SoDienThoai,Email,DiaChi,MaSoThue,HinhAnh,NgayTao,NgaySua,DangLamViec,DaXoa) 
	VALUES(@Ho,@Ten,@GioiTinh,@NgaySinh,@SoChungMinh,@SoDienThoai,@Email,@DiaChi,@MaSoThue,@HinhAnh,GETDATE(),GETDATE(),1,0)
	SET @ID = SCOPE_IDENTITY()
	INSERT INTO TaiKhoan VALUES (@ID,@QuyenId,@Email,@MatKhau,1)
	INSERT INTO ChucVuNhanVien VALUES(@ID,@ChucVuId,@BoPhanId)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_thongTinPhongBan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_thongTinPhongBan]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT bp.Id,bp.Ten,(SELECT COUNT(*)  FROM  NhanVien nv JOIN ChucVuNhanVien cvnv ON nv .Id=cvnv.NhanVienId WHERE cvnv.BoPhanId=bp.Id AND
	 nv.DangLamViec=1)as SoLuong FROM BoPhan bp	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_XemThongTinNhanVienTheoPhongBan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tu Nguyen
-- Create date: <9/10/2019>
-- Description:	<danh sach Thong tin nhan vien theo ID  phong ban>
-- =============================================
CREATE PROCEDURE [dbo].[sp_XemThongTinNhanVienTheoPhongBan](
	@Id int)
	
AS
BEGIN
		SELECT nv.Id,nv.Ho,nv.Ten,nv.GioiTinh,nv.Email,nv.SoDienThoai FROM NhanVien nv
		JOIN ChucVuNhanVien cvnv ON nv.Id=cvnv.NhanVienId
		WHERE cvnv.BoPhanId=@Id AND
		nv.DangLamViec=1 AND
		nv.DaXoa=0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaBoPhan]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <11/10/2019>
-- Description:	<Xóa bộ phận>
-- =============================================
CREATE PROCEDURE [dbo].[sp_XoaBoPhan]
			(@Id INT)
AS
BEGIN
	UPDATE BoPhan SET
	DangHoatDong=0,
	DaXoa=1
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 10/11/2019 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tú>
-- Create date: <10/10/2019>
-- Description:	<Delete NhanVien>
-- =============================================
CREATE PROCEDURE [dbo].[sp_XoaNhanVien](
	@Id INT)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   UPDATE NhanVien SET DaXoa=1 
   WHERE NhanVien.Id=@Id
   UPDATE TaiKhoan SET DangHoatDong=0
   WHERE TaiKhoan.Id=@Id
   DELETE  FROM ChucVuNhanVien
   WHERE NhanVienId=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[ThongKeNhanVienTheoId]    Script Date: 10/11/2019 4:36:14 PM ******/
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
