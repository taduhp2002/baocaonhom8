--1. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'

--2. In ra danh sách các s?n ph?m (MASP, TENSP) có ??n v? tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN('CAY', 'QUYEN')

--3. In ra danh sách các s?n ph?m (MASP,TENSP) có mã s?n ph?m b?t ??u là “B” và k?t thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE'B%01'

--4. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Qu?c” s?n xu?t có giá t? 30.000 ??n 40.000.
SELECT MASP,TENSP,NUOCSX
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
AND GIA BETWEEN 30000 AND 40000

--5. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” ho?c “Thai Lan” s?n xu?t có giá t? 30.000 ??n 40.000.
SELECT MASP, TENSP, NUOCSX
FROM SANPHAM
WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'THAI LAN') AND GIA BETWEEN 30000 AND 40000

--6. In ra các s? hóa ??n, tr? giá hóa ??n bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD >= '1/1/2007' AND NGHD <= '1/2/2007'

--7. In ra các s? hóa ??n, tr? giá hóa ??n trong tháng 1/2007, s?p x?p theo ngày (t?ng d?n) và tr? giá c?a hóa ??n (gi?m d?n).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC

--8. In ra danh sách các khách hàng (MAKH, HOTEN) ?ã mua hàng trong ngày 1/1/2007.
SELECT K.MAKH, HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE NGHD = '1/1/2007'

--9. In ra s? hóa ??n, tr? giá các hóa ??n do nhân viên có tên “Nguyen Van B” l?p trong ngày 28/10/2006.
SELECT SOHD, TRIGIA
FROM HOADON H INNER JOIN NHANVIEN N
ON H.MANV = N.MANV
WHERE NGHD = '10/28/2006'
AND HOTEN = 'NGUYEN VAN B'

--10. In ra danh sách các s?n ph?m (MASP,TENSP) ???c khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
AND EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)

--11. Tìm các s? hóa ??n ?ã mua s?n ph?m có mã s? “BB01” ho?c “BB02”.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')

--12. Tìm các s? hóa ??n ?ã mua s?n ph?m có mã s? “BB01” ho?c “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
AND SL BETWEEN 10 AND 20

--13. Tìm các s? hóa ??n mua cùng lúc 2 s?n ph?m có mã s? “BB01” và “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
SELECT SOHD
FROM CTHD A
WHERE A.MASP = 'BB01'
AND SL BETWEEN 10 AND 20
AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02'
AND SL BETWEEN 10 AND 20
AND A.SOHD = B.SOHD)

--14. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t ho?c các s?n ph?m ???c bán ra trong ngày 1/1/2007.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC'
AND C.SOHD IN(SELECT DISTINCT C2.SOHD
FROM CTHD C2 INNER JOIN HOADON H
ON C2.SOHD = H.SOHD
WHERE NGHD ='1/1/2007')

--15. In ra danh sách các s?n ph?m (MASP,TENSP) không bán ???c.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NOT EXISTS(SELECT * 
FROM SANPHAM S2 INNER JOIN CTHD C
ON S2.MASP = C.MASP
AND S2.MASP = S.MASP)