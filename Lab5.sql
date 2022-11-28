--In ra dòng ‘Xin chào’ + @ten với @ten là tham số đầu vào là tên Tiếng Việt có dấu của bạn.
CREATE PROCEDURE sp_Lab5Bai1 @ten nvarchar(20)
AS
BEGIN
	print N'Xin Chào: '+ @ten
END

EXECUTE sp_Lab5Bai1 N'Phú Đạt'

--Nhập vào 2 số @s1,@s2. In ra câu ‘Tổng là : @tg’ với @tg=@s1+@s2.
CREATE PROCEDURE sp_tong @s1 int, @s2 int
AS
	BEGIN
		DECLARE @tg int = 0;
		SET @tg=@s1+@s2
		print N'Tổng là: ' + CAST(@tg as varchar(10))
	END

EXECUTE sp_tong 3,7

--Nhập vào số nguyên @n. In ra tổng các số chẵn từ 1 đến @n.
CREATE PROCEDURE sp_tongsochan @n int
AS
	BEGIN
		DECLARE @tg int = 0, @i int = 0;
		WHILE @i<=@n
			BEGIN
				SET @tg +=@i
				SET @i = @i + 2 
			END
		print N'Tổng các số chẵn là: ' + CAST(@tg as varchar(10))
	END

EXECUTE sp_tongsochan 10

--Nhập vào 2 số. In ra ước chung lớn nhất của chúng
CREATE PROCEDURE sp_ucll @a int, @b int
AS
	BEGIN
		DECLARE @temp int;
		IF (@a > @b)
		BEGIN
			SELECT @temp = @a, @a = @b, @b = @temp
		END
		WHILE (@b % @a != 0)
		BEGIN
			SELECT @temp = @a, @a = @b % @a, @b = @temp
		END
		print N'Ước chung lớn nhất là ' + CAST(@a as varchar)
	END

EXECUTE sp_ucll 50, 5
