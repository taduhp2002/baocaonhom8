--Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965.
SELECT *,NGSINH FROM NHANVIEN
WHERE DATENAME(YEAR, NGSINH)>= 1960 AND DATENAME(YEAR, NGSINH) <= 1965

--Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
SELECT 'Tên nhân viên'=(HONV+' '+TENLOT+' '+TENNV), DATEDIFF(YEAR, NGSINH,GETDATE()) +1 AS 'Tuổi đến thời điểm hiện tại' FROM NHANVIEN ;

--Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
SELECT 'Nhân viên'=(HONV+' '+TENLOT+' '+TENNV), 'Sinh vào'=DATENAME(WEEKDAY, NGSINH)  FROM NHANVIEN ;

--Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)
SELECT a.TRPHG, 'Họ tên nhân viên'=(c.HONV +' '+c.TENLOT+' '+c.TENNV),
'Ngày nhận chức'=(CONVERT(VARCHAR,a.NG_NHANCHUC,105)),'Số lượng'=(b.SL -1)
FROM PHONGBAN a INNER JOIN
(SELECT PHG,COUNT(MANV) AS SL FROM NHANVIEN GROUP BY PHG) b ON a.MAPHG=b.PHG
INNER JOIN NHANVIEN c ON a.TRPHG=c.MANV;