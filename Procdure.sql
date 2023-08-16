﻿-- In danh sách học sinh
ALTER PROC IN_DANH_SACH_HOC_SINH
AS
BEGIN
	SELECT MAHS, HOTEN, (SELECT TENLOP FROM LOP WHERE HOCSINH.MALOP = LOP.MALOP) AS TEN_LOP, GIOITNH AS GIOI_TINH, NGAYSINH, DIENTHOAI, DIACHI FROM HOCSINH
END
EXEC IN_DANH_SACH_HOC_SINH

-- In danh sách các lơp giáo viên dạy
CREATE PROC IN_CAC_LOP_GIAO_VIEN_DAY @MAGV CHAR(10)
AS
BEGIN
	SELECT TIET,THU_2,THU_3,THU_4,THU_5,THU_6,THU_7 FROM THOIKHOABIEUGIAOVIEN WHERE MAGV=@MAGV
END
EXEC IN_CAC_LOP_GIAO_VIEN_DAY 'GV00001'
--In tkb HS
CREATE PROC IN_TKB_HOCSINH @MAHS CHAR(10)
AS
BEGIN
	SELECT TIET, THU_2,THU_3,THU_4,THU_5,THU_6,THU_7 FROM THOIKHOABIEUHOCSINH WHERE MAHS=@MAHS
END
EXEC IN_TKB_HOCSINH '10HS00001'

-- PROC DANG NHAP
CREATE PROC DANG_NHAP @LOAITK CHAR(20),@TENDANGNHAP CHAR(10), @MATKHAU CHAR(16)
AS
BEGIN
	IF (@LOAITK='AD') SELECT*FROM TAIKHOAN WHERE TENDANGNHAP= @TENDANGNHAP and MATKHAU= @MATKHAU
	ELSE IF(@LOAITK='GV') SELECT *FROM GIAOVIEN WHERE MAGV= @TENDANGNHAP AND MATKHAU=@MATKHAU
	ELSE SELECT *FROM HOCSINH WHERE MAHS =@TENDANGNHAP AND MATKHAU=@MATKHAU
END
EXEC DANG_NHAP 'HS','10HS00001','@Abc123'