--Thực hiện sao lưu dự án đề phòng gặp sự cố, kế hoạch sao lưu như nào sẽ trình bày rõ trong word
--Sao lưu Full Backup
Backup database DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Full.bak'
with init, description = 'Backup database DoAnNhom7'
GO

--Sao lưu Differential Backup
Backup database DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Diff.bak'
with differential;
GO

--Sao lưu Log Backup
Backup log DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with description = 'DoAnNhom7 Log Backup';
GO

--Không may, dự án xảy ra sự cố
USE master
GO

drop database DoAnNhom7;
GO

--Lên kế hoạch phục hồi dự án
--Trước hết backup đuôi vào chung file DoAnNhom7_log.trn

Backup log DoAnNhom7
To disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with no_truncate
GO

--Bước tiếp theo, phục hồi bản full backup gần nhất với tuỳ chọn with norecovery

Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Full.bak'
with norecovery
GO

--Bước 3. Phục hồi bản differential backup với tuỳ chọn with norecovery

Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_Diff.bak'
with norecovery		  
GO

--Bước 4. Phục hồi bản Log backup với tuỳ chọn with norecovery

Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with file = 1, norecovery
GO

--Bước 5. Phục hồi bản Log backup cái đuôi với tuỳ chọn with recovery

Restore database DoAnNhom7
from disk = 'D:\7 - Xây dựng phần mềm quản lí học sinh của trường THPT Trần Phú\DoAnNhom7_log.trn'
with file = 2, recovery
GO