SELECT  * FROM vrpteRegistroCompras2010 where NumeroContable in ('1-02-2025-00034','1-02-2025-00033')

select * from Cp where PKID=842796
select*from VoucherContable where NumCp='1-05-2025-00009'

select * from Cp where PKID=828567
select*from VoucherContable where NumCp='1-02-2025-00034'

select*from Cp where NumCp='F581-2580933' AND PKID=841736
--SELECT*FROM Cp WHERE PKID=833277

select *from CpCobrarPagar where PKID in (828566,842796)
select *from CpCobrarPagar where PKID=841736


update CpCobrarPagar set MovSaldo=1 where PKID=842796