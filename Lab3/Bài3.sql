----Danh sách những nhân viên (HONV, TENLOT, TENNV, DCHI) có trên 2 thân nhân,thỏa các yêu cầu
--Dữ liệu cột HONV được viết in hoa toàn bộ
--Dữ liệu cột TENLOT được viết chữ thường toàn bộ
--Dữ liệu chột TENNV có ký tự thứ 2 được viết in hoa, các ký tự còn lại viết thường( ví dụ: kHanh)
--Dữ liệu cột DCHI chỉ hiển thị phần tên đường, không hiển thị các thông tin khác như số nhà hay thành phố.

SELECT 'Họ'=UPPER(HONV),'Tên lót'=LOWER(TENLOT),'Tên'=TENNV,
'Tên viết hoa kí tự thứ 2'=(LOWER(LEFT(TENNV,1)) + UPPER(SUBSTRING(TENNV,2,1)) + LOWER(SUBSTRING(TENNV,3,LEN(TENNV)))),'Địa chỉ'=DCHI,
'Tên đường'=SUBSTRING(DCHI,CHARINDEX(' ',DCHI)+1,CHARINDEX(',',DCHI)-CHARINDEX(' ',DCHI)-1)
FROM NHANVIEN

----Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất, hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”
DECLARE @ThongKe TABLE(MAP int,MANVTP int, TK int);
INSERT INTO @ThongKe
	SELECT PHG,MA_NQL,COUNT(MANV)
	FROM NHANVIEN
	GROUP BY PHG,MA_NQL;
DECLARE @Max int;
SELECT @Max= MAX(TK) 
FROM @ThongKe
SELECT 'Tên phòng'=TENPHG,'Họ tên'=(HONV+' '+TENLOT+' '+TENNV),'Tên thay thế'=(HONV+' '+TENLOT+' '+ 'FPoly')
FROM PHONGBAN
a INNER JOIN (SELECT * FROM @ThongKe WHERE TK = @Max) b ON a.MAPHG = b.MAP
INNER JOIN NHANVIEN c ON c.MANV = b.MANVTP;