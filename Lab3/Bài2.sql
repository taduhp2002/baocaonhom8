----Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--Xuất định dạng “tổng số giờ làm việc” với hàm CEILING
SELECT 'Tên đề án'=TENDEAN, CEILING(CAST(SUM(THOIGIAN) AS DECIMAL(5,2))) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

--Xuất định dạng “tổng số giờ làm việc” với hàm FLOOR
SELECT 'Tên đề án'=TENDEAN, FLOOR(CAST(SUM(THOIGIAN) AS DECIMAL(5,2))) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

--Xuất định dạng “tổng số giờ làm việc” làm tròn tới 2 chữ số thập phân
SELECT 'Tên đề án'=TENDEAN, ROUND((CAST(SUM(THOIGIAN) AS DECIMAL(5,2))),2) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

----Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"
SELECT 'Họ tên nhân viên'=(HONV+' '+TENLOT+' '+TENNV),'Lương'=LUONG
FROM NHANVIEN
WHERE LUONG> (SELECT ROUND(AVG(LUONG),2) FROM NHANVIEN WHERE PHG=(SELECT MAPHG FROM PHONGBAN WHERE TENPHG=N'Nghiên cứu'))