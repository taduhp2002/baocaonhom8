--Hi?n th? thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
select HONV, TENNV, TENPHG, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG

create view v_DD_PhongBan
as
select HONV, TENNV, TENPHG, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG 
select * from v_DD_PhongBan

--Hi?n th? thông tin TenNv, L??ng, Tu?i.
select TENNV, LUONG, YEAR(GETDATE())-YEAR(NGSINH) as 'Tuoi' from NHANVIEN

create view v_TuoiNV
as
select TENNV, LUONG, YEAR(GETDATE())- YEAR(NGSINH) as 'Tuoi' from NHANVIEN

select * from v_TuoiNV

--Hi?n th? tên phòng ban và h? tên tr??ng phòng c?a phòng ban có ?ông nhân viên nh?t
select TENPHG,TRPHG,B.TENNV,COUNT(A.MANV) as 'SoLuongNV' from NHANVIEN A
inner join PHONGBAN on PHONGBAN.MAPHG= A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG, B.TENNV
order by SoLuongNV desc