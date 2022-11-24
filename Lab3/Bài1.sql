----Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
--Xuất định dạng “tổng số giờ làm việc” kiểu decimal với 2 số thập phân.
SELECT 'Tên đề án'=TENDEAN, CAST(SUM(THOIGIAN) AS DECIMAL(5,2)) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

SELECT 'Tên đề án'=TENDEAN, CONVERT (DECIMAL(5,2),SUM(THOIGIAN)) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

--Xuất định dạng “tổng số giờ làm việc” kiểu varchar
SELECT 'Tên đề án'=TENDEAN, CAST(SUM(THOIGIAN) AS VARCHAR(15)) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN

SELECT 'Tên đề án'=TENDEAN, CONVERT (VARCHAR(15),SUM(THOIGIAN)) AS 'Tổng số giờ làm việc'
FROM CONGVIEC
INNER JOIN DEAN ON CONGVIEC.MADA=DEAN.MADA
INNER JOIN PHANCONG ON CONGVIEC.MADA=PHANCONG.MADA
GROUP BY TENDEAN


----Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--Xuất định dạng “luong trung bình” kiểu decimal với 2 số thập phân, sử dụng dấu phẩy để phân biệt phần nguyên và phần thập phân.
SELECT 'Tên phòng ban'=TENPHG,CAST(AVG(LUONG) AS DECIMAL(10,2)) AS 'Lương trung bình'
FROM NHANVIEN
INNER JOIN PHONGBAN ON NHANVIEN.PHG=PHONGBAN.MAPHG
GROUP BY TENPHG

SELECT 'Tên phòng ban'=TENPHG,CONVERT(DECIMAL(10,2),AVG(LUONG)) AS 'Lương trung bình'
FROM NHANVIEN
INNER JOIN PHONGBAN ON NHANVIEN.PHG=PHONGBAN.MAPHG
GROUP BY TENPHG

--Xuất định dạng “luong trung bình” kiểu varchar. Sử dụng dấu phẩy tách cứ mỗi 3 chữ số trong chuỗi ra, gợi ý dùng thêm các hàm Left, Replace
SELECT 'Tên phòng ban'=TENPHG,LEFT(CAST(AVG(LUONG) AS VARCHAR(10)),3)+',' +REPLACE(CAST(AVG(LUONG) AS VARCHAR(10)),LEFT(CAST(AVG(LUONG) AS VARCHAR(10)),3),',')
AS 'Lương trung bình'
FROM NHANVIEN
INNER JOIN PHONGBAN ON NHANVIEN.PHG=PHONGBAN.MAPHG
GROUP BY TENPHG

SELECT 'Tên phòng ban'=TENPHG,LEFT(CONVERT(VARCHAR(10),AVG(LUONG)),3)+',' +REPLACE(CONVERT(VARCHAR(10),AVG(LUONG)),LEFT(CONVERT(VARCHAR(10),AVG(LUONG)),3),',')
AS 'Lương trung bình'
FROM NHANVIEN
INNER JOIN PHONGBAN ON NHANVIEN.PHG=PHONGBAN.MAPHG
GROUP BY TENPHG