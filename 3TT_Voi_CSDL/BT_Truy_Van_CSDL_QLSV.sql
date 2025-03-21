use QuanLySinhVien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student 
where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where StartDate like '%-12-%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select C.ClassID, C.ClassName,C.Status,Sj.Credit, Sj.Status 
from class C join subjects Sj on C.Status = Sj.Status
where Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

UPDATE Class C
JOIN Student S ON C.Status = S.Status
SET S.ClassID = 2, 
    C.ClassID = 2
WHERE S.StudentName = 'Hung';