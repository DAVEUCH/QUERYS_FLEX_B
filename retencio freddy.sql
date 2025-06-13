delete from Cp where NumCp='R001-0000285' and PKID=844962
update Cp set Anulado=1 where NumCp='R001-0000285' and PKID=844962
--update Cp set Fecha=
delete from ItemCp where IDCp=844962
--select*from ItemProducto where PKID=8091164
delete from CpRetencion where PKID=844962
--select*from eCpRetencion3 where ID=2637640
delete from ItemCpRetencion where PKID in (5050707,
5050708,
5050709,
5050710,
5050711,
5050712)
delete from VoucherContable where IDCp=844962
update VoucherContable set Anulado=1 where IDCp=844962
delete from Asiento where IDVoucher=844962
delete from CargoAbono where IDAsiento=2757798
delete from CargoAbono where IDAsiento=2757799
select 
CA.PKID,
IDAsiento,
CA.IDCuentaContable,
CC.Descripcion,
CC.Cuenta,
CC.PKID AS ID_CUENTA,
DCP.IDCp,
DCP.Total AS TOTAL_DOCXCOBRAR,
CA.IDAuxiliar,
Cargo,
Abono,
CargoMonedaBase,
AbonoMonedaBase,
Glosa,
CargoMonedaDocumento,
AbonoMonedaDocumento
from CargoAbono CA
LEFT JOIN CuentaContable CC ON CC.PKID=CA.IDCuentaContable
left join DocCobrarPagar DCP ON DCP.PKID=CA.IDDocCobrarPagar
where IDAsiento=2757798
SELECT TOP 1*FROM DocCobrarPagar
--update cp set MontoDetraccion='0.000000' where PKID=788499---0.000000
select *from CargoAbono where PKID in(15880374,15880375)
SELECT*FROM CptoOperacion WHERE PKID=1763