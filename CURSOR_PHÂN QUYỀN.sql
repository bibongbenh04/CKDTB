﻿CREATE DATABASE DoAnNhom7
USE DoAnNhom7
GO

CREATE TABLE LOP
(
	MALOP CHAR(10)NOT NULL,
	TENLOP NVARCHAR(10),	
	SISO INT,
	CONSTRAINT PK_MALOP PRIMARY KEY(MALOP)
)

CREATE TABLE GIAOVIEN
(
	MAGV CHAR(10) NOT NULL,
	HOTEN NVARCHAR(30),
	GIOITINH CHAR(3),
	NGAYSINH DATETIME,
	DIACHI VARCHAR(150),
	DIENTHOAI VARCHAR(20),
	MAMH CHAR(10),
	CONSTRAINT PK_MAGV PRIMARY KEY(MAGV)
)

CREATE TABLE HOCSINH
(
	MAHS CHAR(10) NOT NULL,
	HOTEN NVARCHAR(30),
	GIOITNH CHAR(3),
	NGAYSINH DATETIME,
	MALOP CHAR(10),
	DIACHI VARCHAR(150),
	DIENTHOAI VARCHAR(20),
	CONSTRAINT PK_MAHS PRIMARY KEY(MAHS),
)

CREATE TABLE MONHOC
(
	MAMH CHAR(10) NOT NULL,
	TENMH NVARCHAR(30),
	CONSTRAINT PK_MAMH PRIMARY KEY(MAMH)
)

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

CREATE TABLE TAIKHOAN
(
	LOAITK CHAR(2),
	TENDANGNHAP CHAR(10),
	MATKHAU VARCHAR(16)
	CONSTRAINT PK_TENDANGNHAP PRIMARY KEY(TENDANGNHAP)
)

CREATE TABLE XEPLOAI
(
	MAHS CHAR(10),
	HOCKY CHAR(10),
	GPA FLOAT,
	XEPLOAI VARCHAR(10),
	CONSTRAINT PK_MAHS_HK PRIMARY KEY(MAHS, HOCKY),
	CONSTRAINT PK_HS_MAHS FOREIGN KEY(MAHS) REFERENCES HOCSINH(MAHS)
)
ALTER TABLE HOCSINH
ADD CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES	LOP(MALOP)
ALTER TABLE XEPLOAI
ADD DIEMTRUNGBINH FLOAT


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


SET DATEFORMAT DMY

INSERT INTO HOCSINH(MAHS,HOTEN,MALOP,GIOITNH,NGAYSINH,DIACHI,DIENTHOAI)
VALUES
('10HS00001','Lam Bich Van','L01','Nu','01/01/2008','110 Vo Van Tan, phuong 4, quan 3, TP Ho Chi Minh','0913211452'),
('10HS00002','Nguyen Thi Hong','L01','Nu','20/01/2008','200 An Duong Vuong, phuong 4, quan 5, TP Ho Chi Minh','0975112352'),
('10HS00003','Huynh Duc Hieu','L02','Nam','25/08/2008','351 Lac Long Quan, phuong 5, quan 11, TP Ho Chi Minh','0772556391'),
('10HS00004','Huynh Duc Toan','L02','Nam','25/08/2008','351 Lac Long Quan, phuong 5, quan 11, TP Ho Chi Minh','0903511456'),
('10HS00005','Nguyen Van Anh','L03','Nu','03/12/2008','240 Lac Long Quan, phuong 5, quan 11, TP Ho Chi Minh','0905132269'),
('10HS00006','Nguyen Thi Lac','L03','Nu','22/11/2008','199 An Duong Vuong, phuong 3, quan 5, TP Ho Chi Minh','0905128773'),
('11HS00001','Ta Quang Lan','L04','Nam','02/11/2007','201 An Duong Vuong, phuong 3, quan 5, TP Ho Chi Minh','0905121363'),
('11HS00002','Ta Thi Nu','L04','Nu','19/10/2007','120 An Duong Vuong, phuong 1, quan 5, TP Ho Chi Minh','0905251364'),
('11HS00003','Huynh Cong Anh','L05','Nam','25/07/2007','49 Cao Lo, phuong 4, quan 8, TP Ho Chi Minh','0905121999'),
('11HS00004','Le Duc Loi','L05','Nam','11/04/2007','50 Pham Hung, phuong 4, quan 8, TP Ho Chi Minh','0903522799'),
('11HS00005','Tran Thi Le','L06','Nu','30/07/2007','112 Nguyen Van Cu, phuong 1, quan 5, TP Ho Chi Minh','0905366123'),
('11HS00006','Nguyen Van Tai','L06','Nam','21/10/2007','100 Nguyen Van Cu, phuong 1, quan 5, TP Ho Chi Minh','0905355693'),
('12HS00001','Nguyen Van Than Loi','L07','Nam','21/10/2006','Chung cu Topaz Elite, phuong 4, quan 8, TP Ho Chi Minh','0905300193'),
('12HS00002','Tran Thi Thanh Thanh','L07','Nu','20/11/2006','220 Nguyen Trai, phuong 4, quan 5, TP Ho Chi Minh','0905354413'),
('12HS00003','Huynh Thi Anh Dao','L08','Nu','11/03/2006','110 Tran Hung Dao, phuong 2, quan 5, TP Ho Chi Minh','0905321667'),
('12HS00004','Duong Ba Nam','L08','Nam','19/05/2006','23 Cao Lo, phuong 4, quan 8, TP Ho Chi Minh','0905112778'),
('12HS00005','Hoang Thuy Linh','L09','Nu','12/10/2006','1123 Tran Hung Dao, phuong 4, quan 1, TP Ho Chi Minh','0905311213'),
('12HS00006','Hoang Thi Thuy Linh','L09','Nu','02/01/2006','111 Cong Quynh, phuong 3, quan 1, TP Ho Chi Minh','0905311213');

INSERT INTO MONHOC(MAMH,TENMH)
VALUES
('MH100001','TOAN 10'),
('MH100002','VAN 10'),
('MH100003','ANH 10'),
('MH110001','TOAN 11'),
('MH110002','VAN 11'),
('MH110003','ANH 11'),
('MH120001','TOAN 12'),
('MH120002','VAN 12'),
('MH120003','ANH 12');

INSERT INTO GIAOVIEN ( MAGV,HOTEN,GIOITINH,NGAYSINH,DIACHI,DIENTHOAI,MAMH)
VALUES
('GV00001','Tran Thi Thuong','Nu','01/01/1975','109 Vo Van Tan, phuong 4, quan 3, TP Ho Chi Minh','0912321452','MH100001'),
('GV00002','Do Van Nho','Nam','22/11/1985','112 Nguyen Trai, phuong 4, quan 5, TP Ho Chi Minh','0772332112','MH100002'),
('GV00003','Nguyen Cong Phuong','Nam','25/11/1980','Chung Cu Go Dau 2, phuong Tan Son Nhi, quan Tan Phu, TP Ho Chi Minh','0913114252','MH100003'),
('GV00004','Nguyen Thi Thuy Nhien','Nu','31/12/1984','112 Ly Thai To, phuong 3, quan 3, TP Ho Chi Minh','0975445778','MH110001'),
('GV00005','Huynh Cong Ba','Nam','22/09/1979','208 Ly Thai To, phuong 3, quan 3, TP Ho Chi Minh','0973625311','MH110002'),
('GV00006','Huynh Thi Kim Anh','Nu','02/09/1989','269 Nguyen Thi Minh Khai, phuong 3, quan 1, TP Ho Chi Minh','0975963112','MH110003'),
('GV00007','Do Quang Manh','Nam','09/11/1991','111 Hung Vuong, phuong 6, quan 5, TP Ho Chi Minh','0975961798','MH120001'),
('GV00008','Tran Thi Nu','Nu','22/05/1993','209 Hong Bang, phuong 11, quan 5, TP Ho Chi Minh','0975932165','MH120002'),
('GV00009','Thai Van To','Nam','09/11/1973','33 Ngo Quyen, phuong 11, quan 5, TP Ho Chi Minh','0975433699','MH120003')

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

--CURSOR DIEMTRUNGBINH
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

--PHÂN QUYỀN 
SP_ADDROLE 'GIAOVIEN'
SP_ADDROLE 'HOCSINH'

GRANT SELECT , INSERT , UPDATE 
ON KETQUA TO GIAOVIEN

GRANT SELECT , INSERT , UPDATE
ON LOP TO GIAOVIEN

GRANT SELECT 
ON KETQUA TO HOCSINH



