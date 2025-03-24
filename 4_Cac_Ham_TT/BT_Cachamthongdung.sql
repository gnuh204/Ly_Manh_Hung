use QuanLySinhVien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * 
FROM subjects 
WHERE Credit = (SELECT MAX(Credit) FROM subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.*
FROM subjects s
JOIN mark m ON s.SubID = m.SubID
WHERE m.Mark = (SELECT MAX(Mark) FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT st.StudentID, st.StudentName, st.ClassID, 
       AVG(m.Mark) AS Avgk
FROM student st
JOIN mark m ON st.StudentID = m.StudentID
GROUP BY st.StudentID, st.StudentName, st.ClassID
ORDER BY Avgk DESC;


