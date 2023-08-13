--Viết function cho hệ thống
--function 1 : Viết hàm in ra danh sách giáo viên bao gồm mã gv, tên gv, giới tính, ngày sinh, địa chỉ, sdt, môn học mà giáo viên đó dạy.
--Input :
--Output :
Create function fuInDanhSachGV
(
)
returns @DSGV table (magv char(10), tengv nvarchar(30), gioitinh char(3), ngaysinh datetime, 
					diachi varchar(150), sdt varchar(20), monhocdamnhiem nvarchar(30))
as
begin
	insert into @DSGV (magv, tengv, gioitinh, ngaysinh, diachi, sdt, monhocdamnhiem)
	select MAGV, HOTEN, GIOITINH, NGAYSINH, DIACHI, DIENTHOAI, TENMH
	from GIAOVIEN GV, MONHOC MH
	where GV.MAMH = MH.MAMH and GV.MAMH = MH.TENMH

	return;
end

go
--gọi thực thi
select*from dbo.fuInDanhSachGV ()

--function 2: Tạo function cho biết số lượng học sinh của một lớp với mã lớp là tham số truyền vào
Create function fuDemSoLuongHS (@malop char(10))
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
select dbo.fuDemSoLuongHS ('L01')

select dbo.fuDemSoLuongHS ('L02')
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
select dbo.fuDemSoLuongHS ('L01')

select dbo.fuDemSoLuongHS ('L02')

-- function 4 : Viết hàm in điểm thi của học sinh bao gồm tên môn học, học kì, điểm thi miệng, điểm thi 15p, điểm thi 45p
--điểm thi học kì với mã học sinh là tham số truyền vào
Create function fuInDiemThiHS (@mahs char(10))
returns @DTHS table (tenmonhoc nvarchar(30),hocki char(10), diemmieng float, diem15p float, diem45p float, diemhocki float)
as
begin
	insert into @DTHS (tenmonhoc, hocki, diemmieng, diem15p, diem45p, diemhocki)
	select TENMH, HOCKY, DIEMTHIMIENG, DIEMTHI15P, DIEMTHI1TIET, DIEMTHIHOCKY
	from KETQUA KQ, MONHOC MH
	where KQ.MAMH = MH.MAMH and KQ.MAMH = MH.TENMH

	return;
end

--gọi thực thi
select*from dbo.fuInDiemThiHS ('10HS00001')

select*from dbo.fuInDiemThiHS ('10HS00002')
