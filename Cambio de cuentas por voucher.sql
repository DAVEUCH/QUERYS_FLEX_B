select * from VoucherContable where
NumCp in ( '4-12-2024-0003018',--
'4-12-2024-0003026',--
'4-12-2024-0003132',--
'4-12-2024-0003030',--
'4-12-2024-0003031',--
'4-12-2024-0003139',--
'4-12-2024-0003140',--
'4-12-2024-0003206',--
'4-12-2024-0003207',--
'4-12-2024-0003245')
ORDER BY CASE  NumCp
when'4-12-2024-0003018' then 1
when'4-12-2024-0003026' then 2
when'4-12-2024-0003132' then 3
when'4-12-2024-0003030' then 4
when'4-12-2024-0003031' then 5
when'4-12-2024-0003139' then 6
when'4-12-2024-0003140' then 7
when'4-12-2024-0003206' then 8
when'4-12-2024-0003207' then 9
when'4-12-2024-0003245' then 10
end

SELECT*FROM CptoOperacion where PKID=1176
SELECT*FROM CptoOperacion where PKID=1176
SELECT*FROM CptoOperacion where PKID=1974
select*from cp where NumCp='F002-0001064' and PKID=812823
select*from cp where NumCp='F002-0001073' and PKID=813338
select*from cp where NumCp='FR01-7186327' and PKID=814027
select *from Asiento where IDVoucher=2905580 

select 
CA.PKID,
IDAsiento,
IDCuentaContable,
CC.Descripcion,
CC.Cuenta,
CC.PKID AS ID_CUENTA,
IDAuxiliar,
Cargo,
Abono,
CargoMonedaBase,
AbonoMonedaBase,
Glosa,
CargoMonedaDocumento,
AbonoMonedaDocumento
from CargoAbono CA
LEFT JOIN CuentaContable CC ON CC.PKID=CA.IDCuentaContable
where IDAsiento=6112890

select TOP 10 *from CargoAbono where IDAsiento=6036065
select *from CuentaContable where Cuenta='1041101' and IDPlanCuentas=3
-------------------------------------------------------

update CargoAbono set IDCuentaContable='900014716' where PKID=17532847