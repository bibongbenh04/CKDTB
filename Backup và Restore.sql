Create database DoAnNhom7
on primary
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
log on
	name = DoAnNhom7_Log,
	filename = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Log.ldf',
	size = 1MB,
	maxsize = 5MB,
	filegrowth = 10%
)

--Thực hiện sao lưu dự án đề phòng gặp sự cố, kế hoạch sao lưu như nào sẽ trình bày rõ trong word
--Sao lưu Full Backup
Backup database DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Full.bak'
with init, description = 'Backup database DoAnNhom7'

--Sao lưu Differential Backup
Backup database DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Diff.bak'
with differential;

--Sao lưu Log Backup
Backup log DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with description = 'DoAnNhom7 Log Backup';

--Không may, dự án xảy ra sự cố
drop database DoAnNhom7;

--Lên kế hoạch phục hồi dự án
--Trước hết backup đuôi vào chung file DoAnNhom7_log.trn
Backup log DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with no_truncate

--Bước tiếp theo, phục hồi bản full backup gần nhất với tuỳ chọn with norecovery
Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Full.bak'
with norecovery

--Bước 3. Phục hồi bản differential backup với tuỳ chọn with norecovery
Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Diff.bak'
with norecovery

--Bước 4. Phục hồi bản Log backup với tuỳ chọn with norecovery
Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with flie = 1, norecovery

--Bước 5. Phục hồi bản Log backup cái đuôi với tuỳ chọn with recovery
Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with flie = 2, recovery




