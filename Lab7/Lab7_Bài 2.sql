--Hi?n th? th�ng tin HoNV,TenNV,TenPHG, DiaDiemPhg.
select HONV, TENNV, TENPHG, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG

create view v_DD_PhongBan
as
select HONV, TENNV, TENPHG, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG 
select * from v_DD_PhongBan

--Hi?n th? th�ng tin TenNv, L??ng, Tu?i.
select TENNV, LUONG, YEAR(GETDATE())-YEAR(NGSINH) as 'Tuoi' from NHANVIEN

create view v_TuoiNV
as
select TENNV, LUONG, YEAR(GETDATE())- YEAR(NGSINH) as 'Tuoi' from NHANVIEN

select * from v_TuoiNV

--Hi?n th? t�n ph�ng ban v� h? t�n tr??ng ph�ng c?a ph�ng ban c� ?�ng nh�n vi�n nh?t
select TENPHG,TRPHG,B.TENNV,COUNT(A.MANV) as 'SoLuongNV' from NHANVIEN A
inner join PHONGBAN on PHONGBAN.MAPHG= A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG, B.TENNV
order by SoLuongNV desc