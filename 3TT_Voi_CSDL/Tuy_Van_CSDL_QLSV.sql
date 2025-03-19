use QuanLySinhVien;
-- Hiển thị danh sách tất cả các học viên
select * from Student;

-- Hiển thị danh sách các học viên đang theo học
select * from Student where Status = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
select * from subjects where  Credit < 10;

-- Hiển thị danh sách học viên lớp A1
select S.StudentID , S.StudentName, S.Address , S.Phone , C.ClassName
from Student S join Class C on S.ClassID = C.ClassID
where ClassName = 'A1';

-- Hiển thị điểm môn CF của các học viên.
select S.StudentID, S.StudentName,Sj.SubName,M.Mark
from Student S join Mark M on S.StudentID = M.StudentID join Subjects Sj on M.SubID = Sj.SubID
where Sj.SubName = 'CF';
