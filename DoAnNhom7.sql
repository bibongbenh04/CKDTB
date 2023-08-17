﻿USE MASTER
GO

--DROP DATABASE DoAnNhom7
GO

CREATE DATABASE DoAnNhom7 on primary
(
	name = DoAnNhom7_primary,
	filename = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_primary.mdf',
	size = 3MB,
	maxsize = 10MB,
	filegrowth = 10%
),
filegroup Nhom7
(
	name = DBDoAnNhom7_1,
	filename = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_1.ndf',
	size = 2MB,
	maxsize = 5MB,
	filegrowth = 10%
),
(
	name = DBDoAnNhom7_2,
	filename = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_2.ndf',
	size = 2MB,
	maxsize = 5MB,
	filegrowth = 10%
)
log on (
	name = DoAnNhom7_Log,
	filename = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Log.ldf',
	size = 1MB,
	maxsize = 5MB,
	filegrowth = 10%
)
GO

USE DoAnNhom7
GO

CREATE TABLE LOP
(
	MALOP CHAR(10)NOT NULL,
	TENLOP NVARCHAR(10),	
	SISO INT,
	CONSTRAINT PK_MALOP PRIMARY KEY(MALOP)
)
GO

CREATE TABLE GIAOVIEN
(
	MAGV CHAR(10) NOT NULL,
	HOTEN NVARCHAR(30),
	GIOITINH CHAR(3),
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(150),
	DIENTHOAI VARCHAR(20),
	MAMH CHAR(10),
	CONSTRAINT PK_MAGV PRIMARY KEY(MAGV)
)
GO

CREATE TABLE HOCSINH
(
	MAHS CHAR(10) NOT NULL,
	HOTEN NVARCHAR(30),
	GIOITNH CHAR(3),
	NGAYSINH DATETIME,
	MALOP CHAR(10),
	DIACHI NVARCHAR(150),
	DIENTHOAI VARCHAR(20),
	CONSTRAINT PK_MAHS PRIMARY KEY(MAHS),
)
GO																									

CREATE TABLE MONHOC
(
	MAMH CHAR(10) NOT NULL,
	TENMH NVARCHAR(30),
	CONSTRAINT PK_MAMH PRIMARY KEY(MAMH)
)
GO

CREATE TABLE KETQUA
(
	MAHS CHAR(10) NOT NULL,
	MAMH CHAR(10) NOT NULL,
	HOCKY CHAR(10) NOT NULL,
	DIEMTHIMIENG FLOAT,
	DIEMTHI15P FLOAT,
	DIEMTHI1TIET FLOAT,
	DIEMTHIHOCKY FLOAT
	CONSTRAINT PK_KETQUA PRIMARY KEY(MAHS,MAMH,HOCKY),
	CONSTRAINT PK_KQ_MAHS FOREIGN KEY(MAHS) REFERENCES HOCSINH(MAHS),
	CONSTRAINT PK_KQ_MAMH FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
)
GO

CREATE TABLE TAIKHOAN
(
	LOAITK CHAR(2),
	TENDANGNHAP CHAR(10),
	MATKHAU VARCHAR(16)
	CONSTRAINT PK_TENDANGNHAP PRIMARY KEY(TENDANGNHAP)
)
GO

CREATE TABLE XEPLOAI
(
	MAHS CHAR(10),
	HOCKY CHAR(10),
	GPA FLOAT,
	XEPLOAI NVARCHAR(10),
	CONSTRAINT PK_MAHS_HK PRIMARY KEY(MAHS, HOCKY),
	CONSTRAINT PK_HS_MAHS FOREIGN KEY(MAHS) REFERENCES HOCSINH(MAHS)
)
GO

CREATE TABLE THOIKHOABIEUGIAOVIEN
(	
	HOCKY CHAR(10),
	MAGV CHAR(10),
	TIET CHAR(10) PRIMARY KEY,
	THU_2 CHAR(10),
	THU_3 CHAR(10),
	THU_4 CHAR(10),
	THU_5 CHAR(10),
	THU_6 CHAR(10),
	THU_7 CHAR(10),
	CONSTRAINT PK_MAGV_TKB FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV),
)
GO

CREATE TABLE THOIKHOABIEUHOCSINH
(	
	HOCKY CHAR(10),
	MAHS CHAR(10),
	TIET NCHAR(10) PRIMARY KEY,
	THU_2 NCHAR(10),
	THU_3 NCHAR(10),
	THU_4 NCHAR(10),
	THU_5 NCHAR(10),
	THU_6 NCHAR(10),
	THU_7 NCHAR(10),
	CONSTRAINT PK_MAHS_TKB FOREIGN KEY(MAHS) REFERENCES HOCSINH(MAHS)
)
GO

ALTER TABLE HOCSINH
ADD CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES	LOP(MALOP)

ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES	MONHOC(MAMH)

INSERT INTO LOP (MALOP,TENLOP)
VALUES
('L01','10/1'),
('L02','10/2'),
('L03','10/3'),
('L04','11/1'),
('L05','11/2'),
('L06','11/3'),
('L07','12/1'),
('L08','12/2'),
('L09','12/3');
GO

SET DATEFORMAT DMY
GO

INSERT INTO HOCSINH(MAHS,HOTEN,MALOP,GIOITNH,NGAYSINH,DIACHI,DIENTHOAI)
VALUES
('10HS00001',N'Lâm Bích Vân','L01','Nu','01/01/2008',N'110 Võ Văn Tần, phường 4, quận 3, TP Hồ Chí Minh','0913211452'),
('10HS00002',N'Nguyễn Thị Hồng','L01','Nu','20/01/2008',N'200 An Dương Vương, phường 4, quận 5, TP Hồ Chí Minh','0975112352'),
('10HS00003',N'Huỳnh Đức Hiếu','L02','Nam','25/08/2008',N'351 Lạc Long Quân, phường 5, quận 51, TP Hồ Chí Minh','0772556391'),
('10HS00004',N'Huỳnh Đức Toàn','L02','Nam','25/08/2008',N'351 Lạc Long Quân, phường 5, quận 51, TP Hồ Chí Minh','0903511456'),
('10HS00005',N'Nguyễn Văn Anh','L03','Nu','03/12/2008',N'240 Lạc Long Quân, phường 5, quận 51, TP Hồ Chí Minh','0905132269'),
('10HS00006',N'Nguyễn Thị Lạc','L03','Nu','22/11/2008',N'199 An Dương Vương, phường 3, quận 5, TP Hồ Chí Minh','0905128773'),
('11HS00001',N'Tạ Quang Lân','L04','Nam','02/11/2007',N'201 An Dương Vương, phường 3, quận 5, TP Hồ Chí Minh','0905121363'),
('11HS00002',N'Tạ Thị Nữ','L04','Nu','19/10/2007',N'120 An Dương Vương, phường 1, quận 5, TP Hồ Chí Minh','0905251364'),
('11HS00003',N'Huỳnh Công Anh','L05','Nam','25/07/2007',N'49 Cao Lo, phường 4, quận 8, TP Hồ Chí Minh','0905121999'),
('11HS00004',N'Lê Đức Lợi','L05','Nam','11/04/2007',N'50 Phạm Hùng, phường 4, quận 8, TP Hồ Chí Minh','0903522799'),
('11HS00005',N'Trần Thị Lệ','L06','Nu','30/07/2007',N'112 Nguyễn Văn Cừ, phường 1, quận 5, TP Hồ Chí Minh','0905366123'),
('11HS00006',N'Nguyễn Văn Tài','L06','Nam','21/10/2007',N'100 Nguyễn Văn Cừ, phường 1, quận 5, TP Hồ Chí Minh','0905355693'),
('12HS00001',N'Nguyen Văn Thành Lợi','L07','Nam','21/10/2006',N'Chung cư Topaz Elite, phường 4, quận 8, TP Hồ Chí Minh','0905300193'),
('12HS00002',N'Trần Thị Thanh Thanh','L07','Nu','20/11/2006',N'220 Nguyễn Trãi, phường 4, quận 5, TP Hồ Chí Minh','0905354413'),
('12HS00003',N'Huỳnh Thị Anh Đào','L08','Nu','11/03/2006',N'110 Tran Hung Dao, phường 2, quận 5, TP Hồ Chí Minh','0905321667'),
('12HS00004',N'Dương Bá Nam','L08','Nam','19/05/2006',N'23 Cao Lo, phường 4, quận 8, TP Hồ Chí Minh','0905112778'),
('12HS00005',N'Hoàng Thùy Linh','L09','Nu','12/10/2006',N'1123 Tran Hung Dao, phường 4, quận 5, TP Hồ Chí Minh','0905311213'),
('12HS00006',N'Hoàng Thị Thùy Linh','L09','Nu','02/01/2006',N'111 Cong Quynh, phường 3, quận 5, TP Hồ Chí Minh','0905311213');

INSERT INTO MONHOC(MAMH,TENMH)
VALUES
('MH100001',N'Toán'),
('MH100002',N'Văn'),
('MH100003',N'Anh'),
('MH110001',N'Toán'),
('MH110002',N'Văn'),
('MH110003',N'Anh'),
('MH120001',N'Toán'),
('MH120002',N'Văn'),
('MH120003',N'Anh');

INSERT INTO GIAOVIEN ( MAGV,HOTEN,GIOITINH,NGAYSINH,DIACHI,DIENTHOAI,MAMH)
VALUES
('GV00001',N'Trần Thị Thương','Nu','01/01/1975',N'109 Võ Văn Tần, phường 4, quận 3, TP Hồ Chí Minh','0912321452','MH100001'),
('GV00002',N'Đỗ Văn Nhỏ','Nam','22/11/1985',N'112 Nguyễn Trãi, phường 4, quận 5, TP Hồ Chí Minh','0772332112','MH100002'),
('GV00003',N'Nguyễn Công Phương','Nam','25/11/1980',N'Chung Cu Gò Dầu 2, phường Tân Sơn Nhì, quận Tân Phú, TP Hồ Chí Minh','0913114252','MH100003'),
('GV00004',N'Nguyễn Thị Thùy Nhiên','Nu','31/12/1984',N'112 Lý Thái Tổ, phường 3, quận 3, TP Hồ Chí Minh','0975445778','MH110001'),
('GV00005',N'Huỳnh Công Ba','Nam','22/09/1979',N'208 Lý Thái Tổ, phường 3, quận 3, TP Hồ Chí Minh','0973625311','MH110002'),
('GV00006',N'Huỳnh Thị Kim Anh','Nu','02/09/1989',N'269 Nguyễn Thị Minh Khai, phường 3, quận 5, TP Hồ Chí Minh','0975963112','MH110003'),
('GV00007',N'Đỗ Quang Mạnh','Nam','09/11/1991',N'111 Hùng Vương, phường 6, quận 5, TP Hồ Chí Minh','0975961798','MH120001'),
('GV00008',N'Trần Thị Nữ','Nu','22/05/1993',N'209 Hong Bang, phường 11, quận 5, TP Hồ Chí Minh','0975932165','MH120002'),
('GV00009',N'Thái Văn Tư','Nam','09/11/1973',N'33 Ngo Quyen, phường 11, quận 5, TP Hồ Chí Minh','0975433699','MH120003')

INSERT INTO KETQUA (MAHS,MAMH,HOCKY,DIEMTHIMIENG,DIEMTHI15P,DIEMTHI1TIET,DIEMTHIHOCKY)
VALUES
('10HS00001','MH100001','1',9.5,10,8.8,10),
('10HS00001','MH100002','1',4.5,3.5,8,9.5),
('10HS00001','MH100003','1',10,10,8.8,10),
('10HS00002','MH100001','1',5.6,7.8,8.2,9.5),
('10HS00002','MH100002','1',7.8,7.8,8.2,9.5),
('10HS00002','MH100003','1',10,10,9,9.5),
('10HS00003','MH100001','1',7.5,4.8,9.2,7.5),
('10HS00003','MH100002','1',9,8.8,7.2,9),
('10HS00003','MH100003','1',8,9.2,9.5,10)

INSERT INTO THOIKHOABIEUHOCSINH (HOCKY,MAHS,TIET,THU_2,THU_3,THU_4,THU_5,THU_6,THU_7)
VALUES
('1','10HS00001','Tiet 1',N'Toán',N'Ngữ văn',N'Tiếng Anh',N'Toán', N'Tiếng Pháp',N'Tin học'),
('1','10HS00001','Tiet 2',N'Toán',N'Ngữ văn',N'Tiếng Anh',N'Vật lí', N'Tiếng Pháp',N'Tin học'),
('1','10HS00001','Tiet 3',N'Địa lý',N'Tin học',N'Lịch sử',N'Vật lí', N'Hóa học',N'Tin học'),
('1','10HS00001','Tiet 4',N'Địa lý',N'Tin học',N'Lịch sử',N'Ngữ văn',N'Thể dục',N'Ngữ Văn'),
('1','10HS00001','Tiet 5',N'Chào cờ','GDCD',N'Toán', N'Hóa học',N'Thể dục',N'SHCN')


INSERT INTO THOIKHOABIEUGIAOVIEN (HOCKY,MAGV,TIET,THU_2,THU_3,THU_4,THU_5,THU_6,THU_7)
VALUES
('1','GV00001','Tiet 1','10/1','10/2','10/3',NULL, '10/1','10/2'),
('1','GV00001','Tiet 2','10/1','10/2','10/3',NULL, '10/1','10/2'),
('1','GV00001','Tiet 3','10/3',NULL,NULL,NULL, NULL,NULL),
('1','GV00001','Tiet 4','10/3',NULL,NULL,NULL, NULL,NULL),
('1','GV00001','Tiet 5',NULL,NULL,NULL, NULL,NULL,NULL)

INSERT INTO TAIKHOAN(LOAITK, TENDANGNHAP, MATKHAU)
VALUES
	('AD', 'ADMIN', 'ADMIN');
GO	



CREATE PROC IN_DANH_SACH_HOC_SINH
AS
BEGIN
	SELECT MAHS, HOTEN, (SELECT TENLOP FROM LOP WHERE HOCSINH.MALOP = LOP.MALOP) AS TEN_LOP, GIOITNH AS GIOI_TINH, CONVERT(VARCHAR(10),NGAYSINH,103), DIENTHOAI, DIACHI FROM HOCSINH
END
--EXEC IN_DANH_SACH_HOC_SINH
GO

-- In danh sách các lơp giáo viên dạy
CREATE PROC IN_CAC_LOP_GIAO_VIEN_DAY @MAGV CHAR(10)
AS
BEGIN
	SELECT TIET,THU_2,THU_3,THU_4,THU_5,THU_6,THU_7 FROM THOIKHOABIEUGIAOVIEN WHERE MAGV=@MAGV
END
--EXEC IN_CAC_LOP_GIAO_VIEN_DAY 'GV00001'
go


--In tkb HS
CREATE PROC IN_TKB_HOCSINH @MAHS CHAR(10)
AS
BEGIN
	SELECT TIET, THU_2,THU_3,THU_4,THU_5,THU_6,THU_7 FROM THOIKHOABIEUHOCSINH WHERE MAHS=@MAHS
END
go 


--EXEC IN_TKB_HOCSINH '10HS00001'
CREATE PROC XOA_GV @MAGV CHAR(10)
AS
BEGIN
	DELETE FROM TAIKHOAN WHERE TENDANGNHAP = @MAGV; 
	DELETE FROM THOIKHOABIEUGIAOVIEN WHERE MAGV = @MAGV;
	DELETE FROM GIAOVIEN WHERE MAGV = @MAGV;
END
GO

CREATE PROC XOA_HS @MAHS CHAR(10)
AS
BEGIN
	DELETE FROM TAIKHOAN WHERE TENDANGNHAP = @MAHS; 
	DELETE FROM THOIKHOABIEUHOCSINH WHERE MAHS = @MAHS;
	DELETE FROM KETQUA WHERE MAHS = @MAHS;
	DELETE FROM XEPLOAI WHERE MAHS = @MAHS;
	DELETE FROM HOCSINH WHERE MAHS = @MAHS;
END
GO

				  
CREATE FUNCTION fuInDanhSachGV()
returns @DSGV table (MAGV char(10), TENGV nvarchar(30), GIOITINH nchar(3), NGAYSINH datetime, 
					DIACHI nvarchar(150), SDT varchar(20), MONDAMNHIEM nvarchar(30))
as
begin
	insert into @DSGV (MAGV, TENGV, GIOITINH, NGAYSINH, DIACHI, SDT, MONDAMNHIEM)
	select MAGV, HOTEN, CASE WHEN GV.GIOITINH= 'Nam' then 'Nam' else N'Nữ' 
	END AS GIOITINH, NGAYSINH, DIACHI, DIENTHOAI, TENMH
	from GIAOVIEN GV, MONHOC MH
	where MH.MAMH=GV.MAMH
	return;
end
go
--gọi thực thi
--SELECT *FROM GIAOVIEN
--select*from fuInDanhSachGV ()

--function 2: Tạo function cho biết số lượng học sinh của một lớp với mã lớp là tham số truyền vào
CREATE function fuDemSoLuongHS (@malop char(10))
returns int 
as 
begin
	declare @dem int;
	select @dem = count(HS.MALOP) 
	from HOCSINH HS
	where HS.MALOP = @malop
	return @dem;
end

--gọi thực thi
go
--select dbo.fuDemSoLuongHS ('L01')

--select dbo.fuDemSoLuongHS ('L02')

--function 3 : Viết hàm in ra danh sách học sinh bao gồm mã học sinh, tên học sinh thuộc lớp đó với mã lớp là tham số truyền vào
Create function fuDanhSachHS (@malop char(10))
returns table 
as 
return
(
	select MAHS, HOTEN
	from HOCSINH HS
	where @malop = HS.MALOP
);

--gọi thực thi
go 
--select * from dbo.fuDanhSachHS ('L01')

--select * from dbo.fuDanhSachHS ('L02')

-- function 4 : Viết hàm in điểm thi của học sinh bao gồm tên môn học, học kì, điểm thi miệng, điểm thi 15p, điểm thi 45p
--điểm thi học kì với mã học sinh là tham số truyền vào
Create function fuInDiemThiHS (@mahs char(10))
returns @DTHS table (tenmonhoc nvarchar(30),hocki char(10), diemmieng float, diem15p float, diem45p float, diemhocki float)
as
begin
	insert into @DTHS (tenmonhoc, hocki, diemmieng, diem15p, diem45p, diemhocki)
	select TENMH, HOCKY, DIEMTHIMIENG, DIEMTHI15P, DIEMTHI1TIET, DIEMTHIHOCKY
	from KETQUA KQ, MONHOC MH
	where KQ.MAMH = MH.MAMH and KQ.MAHS = @mahs
	return;
end
GO

CREATE TRIGGER CAPNHAT_SISO
ON HOCSINH
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	UPDATE LOP
	SET SISO = (SELECT COUNT(*) FROM HOCSINH WHERE MALOP = LOP.MALOP)
	WHERE MALOP IN (SELECT DISTINCT MALOP FROM INSERTED)
END
GO
--2. Cập nhật thông tin tài khoản đăng nhập
--HS
CREATE TRIGGER CAPNHAP_TK_HS
ON HOCSINH
AFTER INSERT, UPDATE
AS
BEGIN
    -- Xóa các dòng trong TAIKHOAN có TENDANGNHAP nằm trong danh sách dòng INSERTED
    DELETE FROM TAIKHOAN WHERE TENDANGNHAP IN (SELECT MAHS FROM INSERTED);
    
    -- Thêm các dòng mới từ INSERTED vào bảng TAIKHOAN
    INSERT INTO TAIKHOAN (LOAITK, TENDANGNHAP, MATKHAU)
    SELECT 'HS', MAHS, CONVERT(VARCHAR(10), NGAYSINH, 103) FROM INSERTED;
END
GO
--GV
CREATE TRIGGER CAPNHAP_TK_GV
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    -- Xóa các dòng trong TAIKHOAN có TENDANGNHAP nằm trong danh sách dòng INSERTED
    DELETE FROM TAIKHOAN WHERE TENDANGNHAP IN (SELECT MAGV FROM INSERTED);
    
    -- Thêm các dòng mới từ INSERTED vào bảng TAIKHOAN
    INSERT INTO TAIKHOAN (LOAITK, TENDANGNHAP, MATKHAU)
    SELECT 'GV', MAGV, CONVERT(VARCHAR(10), NGAYSINH, 103) FROM INSERTED;
END
GO
--3. Check thông tin nhập điểm thi (0<= DIEM <=10)

CREATE TRIGGER CHECK_DIEM
ON KETQUA
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(	
		SELECT 1
		FROM INSERTED
		WHERE (DIEMTHIMIENG NOT BETWEEN 0 AND 10) 
			OR (DIEMTHI15P NOT BETWEEN 0 AND 10)
			OR (DIEMTHI1TIET NOT BETWEEN 0 AND 10)
			OR (DIEMTHIHOCKY NOT BETWEEN 0 AND 10)
	)
	BEGIN
		RAISERROR(N'ĐIỂM THI PHẢI NẰM TRONG KHOẢNG 0 -> 10.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END
END
GO

--4. Check Họ và Tên đúng với chuẩn, không chứa các kí tự đặc biệt
--GV
CREATE TRIGGER CHECK_TENHO_GV
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT 1
		FROM INSERTED
		WHERE PATINDEX('%[^a-zA-Z]%', HOTEN) < 0
	)
	BEGIN
		RAISERROR(N'TÊN CỦA GIÁO VIÊN CHỨA KÍ TỰ ĐẶC BIỆT, VUI LÒNG KIỂM TRA LẠI.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END
END
GO
--HS
CREATE TRIGGER CHECK_TENHO_HS
ON HOCSINH
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT 1
		FROM INSERTED
		WHERE PATINDEX('%[^a-zA-Z]%', HOTEN) <= 0
	)
	BEGIN
		RAISERROR(N'TÊN CỦA HỌC SINH CHỨA KÍ TỰ ĐẶC BIỆT, VUI LÒNG KIỂM TRA LẠI.', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END
END
GO
--6. Kiểm tra ngày sinh của học sinh, giáo viên phải trước ngày hiện tại 
--HS
CREATE TRIGGER CHECKNGAYSINH_HS
ON HOCSINH
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM INSERTED WHERE NGAYSINH > GETDATE())
	BEGIN
		RAISERROR('NGAY SINH PHAI BE HON NGAY HIEN TAI', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END
END
GO
--GV
CREATE TRIGGER CHECKNGAYSINH_GV
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM INSERTED WHERE NGAYSINH > GETDATE())
	BEGIN
		RAISERROR('NGAY SINH PHAI BE HON NGAY HIEN TAI', 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END
END
GO


-- Thêm mới học sinh
CREATE PROC Them_moi_hoc_sinh 
	@MSHS CHAR(10),
	@HOTEN NVARCHAR(30),
	@TENLOP NVARCHAR(10), 
	@GIOITINH CHAR(3),
	@NGAYSINH DATETIME,
	@DIENTHOAI VARCHAR(20),
	@DIACHI VARCHAR(150)
AS
BEGIN
	DECLARE @MALOP CHAR(10);
	SET @MALOP= (SELECT MALOP FROM LOP WHERE TENLOP=@TENLOP);
	INSERT INTO HOCSINH
	(
		MAHS,HOTEN,MALOP,GIOITNH,NGAYSINH,DIENTHOAI,DIACHI
	)
	VALUES
	(
		@MSHS,
		@HOTEN,
		@MALOP,
		@GIOITINH,
		@NGAYSINH,
		@DIENTHOAI,
		@DIACHI
	)
	if @@ROWCOUNT >0 RETURN 1
	ELSE RETURN 0;
END
GO

--EXEC Them_moi_hoc_sinh '10HS00012',N'Trần Thị Ánh Dương','10/1','Nữ','22/2/2008','0913477858','112 Hùng Vương, phường 4, quận 5, Tp Hồ Chí Minh'
-- Cập nhật thông tin học sinh

CREATE PROC Cap_nhat_thong_tin_hoc_sinh 
	@MAHS CHAR(10),
	@HOTEN NVARCHAR(30),
	@TENLOP NVARCHAR(10), 
	@GIOITINH CHAR(3),
	@NGAYSINH DATETIME,
	@DIENTHOAI VARCHAR(20),
	@DIACHI VARCHAR(150)
AS
BEGIN
	UPDATE HOCSINH
	SET HOTEN=@HOTEN, MALOP=(SELECT MALOP FROM LOP WHERE TENLOP=@TENLOP), GIOITNH=@GIOITINH,NGAYSINH=@NGAYSINH,DIENTHOAI=@DIENTHOAI,DIACHI=@DIACHI
	WHERE MAHS =@MAHS;
	if @@ROWCOUNT >0 RETURN 1
	ELSE RETURN 0;
END
go

--SELECT * FROM HOCSINH	
--EXEC Cap_nhat_thong_tin_hoc_sinh'10HS00010',N'Trần Thị Ánh Dương','10/2','Nu','22/1/2008','0905321332','221 Hùng Vương, phường 4, quận 5, TP Hồ Chí Minh'


-- Hiển thị thông tin chi tiết của hoc sinh
CREATE PROC SELECTHS
	@MAHS CHAR(10)
AS
BEGIN	
	SELECT MAHS, HOTEN, (SELECT TENLOP FROM LOP WHERE LOP.MALOP=HOCSINH.MALOP) AS TENLOP, 
	CASE WHEN GIOITNH= 'Nam' then 'Nam' else N'Nữ' 
	END AS GIOITINH,
	CONVERT (VARCHAR(10),NGAYSINH,103) AS NGAYSINH,DIENTHOAI,DIACHI 
	FROM HOCSINH
	WHERE MAHS=@MAHS
END
go


--EXEC SELECTHS '10HS00010'


-- Check dang nhap
CREATE PROC CheckLogin @LOAITK CHAR(2), @MAHS CHAR(10), @MATKHAU CHAR(10)
AS
BEGIN
	SELECT 1 AS 'TRANGTHAI' FROM TAIKHOAN WHERE LOAITK = @LOAITK AND @MAHS = TAIKHOAN.TENDANGNHAP AND @MATKHAU = MATKHAU;
END
go 


-- Hien thi thong tin chi tiet cua giao vien
CREATE PROC SELECTGV
	@MAGV CHAR(10)
AS
BEGIN	
	SELECT MAGV, HOTEN, GIOITINH,
	CONVERT (VARCHAR(10),NGAYSINH,103) AS NGAYSINH,DIENTHOAI,DIACHI 
	FROM GIAOVIEN
	WHERE MAGV=@MAGV
END
go

CREATE PROC Them_moi_giao_vien 
	@MSGV CHAR(10),
	@HOTEN NVARCHAR(30), 
	@GIOITINH NCHAR(3),
	@NGAYSINH DATETIME,
	@DIENTHOAI VARCHAR(20),
	@DIACHI NVARCHAR(150)
AS
BEGIN
	INSERT INTO GIAOVIEN
	(
		MAGV,HOTEN,GIOITINH,NGAYSINH,DIENTHOAI,DIACHI
	)
	VALUES
	(
		@MSGV,
		@HOTEN,
		@GIOITINH,
		@NGAYSINH,
		@DIENTHOAI,
		@DIACHI
	)
	if @@ROWCOUNT >0 RETURN 1
	ELSE RETURN 0;
END
GO

CREATE PROC Cap_nhat_thong_tin_giao_vien 
	@MAGV CHAR(10),
	@HOTEN NVARCHAR(30),
	@GIOITINH CHAR(3),
	@NGAYSINH DATETIME,
	@DIENTHOAI VARCHAR(20),
	@DIACHI VARCHAR(150)
AS
BEGIN
	UPDATE GIAOVIEN
	SET HOTEN=@HOTEN, GIOITINH=@GIOITINH,NGAYSINH=@NGAYSINH,DIENTHOAI=@DIENTHOAI,DIACHI=@DIACHI
	WHERE MAGV = @MAGV;
	if @@ROWCOUNT >0 RETURN 1
	ELSE RETURN 0;
END
GO

CREATE PROC Tra_cuu_diem @MAHS CHAR(10)
AS
BEGIN

	SELECT (SELECT TENMH FROM MONHOC WHERE MONHOC.MAMH=KETQUA.MAMH) AS MON_HOC,DIEMTHIMIENG,DIEMTHI15P,DIEMTHI1TIET,DIEMTHIHOCKY
	FROM KETQUA
	WHERE MAHS=@MAHS
END

--EXEC Tra_cuu_diem '10HS00001'
GO 


DECLARE CURSORDIEMTRUNGBINH CURSOR 
FOR SELECT MAHS, HOCKY FROM XEPLOAI

OPEN CURSORDIEMTRUNGBINH
DECLARE @MAHS CHAR(10), @HOCKY CHAR (10)

FETCH NEXT FROM CURSORDIEMTRUNGBINH INTO @MAHS, @HOCKY
WHILE @@FETCH_STATUS = 0
BEGIN 
	DECLARE @DIEM1 FLOAT, @DIEM2 FLOAT , @DIEM3 FLOAT, @DIEM4 FLOAT, @DIEMTB FLOAT
	--DIEM THI MIENG
	SELECT @DIEM1 = DIEMTHIMIENG
	FROM KETQUA
	WHERE MAHS = @MAHS AND HOCKY = @HOCKY
	--DIEM 15P
	SELECT @DIEM2 = DIEMTHI15P
	FROM KETQUA
	WHERE MAHS = @MAHS AND HOCKY = @HOCKY
	--DIEM THI 1 TIET
	SELECT @DIEM3 = DIEMTHI1TIET
	FROM KETQUA
	WHERE MAHS = @MAHS AND HOCKY = @HOCKY
	--DIEM THI HOC KY
	SELECT @DIEM4 = DIEMTHIHOCKY
	FROM KETQUA
	WHERE MAHS = @MAHS AND HOCKY = @HOCKY
	--DIEM TRUNG BINH
	SET @DIEMTB = (@DIEM1*0.1 + @DIEM2*0.1 + @DIEM3*0.3 + @DIEM4*0.5)
	FETCH NEXT FROM CURSORDIEMTRUNGBINH INTO @MAHS, @HOCKY
END

CLOSE CURSORDIEMTRUNGBINH
DEALLOCATE CURSORDIEMTRUNGBINH
GO

SP_ADDROLE 'GIAOVIEN';
GO

GRANT SELECT , INSERT , UPDATE 
ON KETQUA TO GIAOVIEN
GO


GRANT SELECT , INSERT , UPDATE
ON LOP TO GIAOVIEN
GO

SP_ADDROLE 'HOCSINH';
GO

GRANT SELECT 
ON KETQUA TO HOCSINH 
GO