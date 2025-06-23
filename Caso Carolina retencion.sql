select* from Cp where NumCp='R001-0000322' and PKID=848624
update Cp set Anulado=1 where NumCp='R001-0000285' and PKID=844962
--update Cp set Fecha=
select*  from ItemCp where IDCp=848624
--select*from ItemProducto where PKID=8091164
select*  from CpRetencion where PKID=848624
--select*from eCpRetencion3 where ID=2637640
select* from ItemCpRetencion where PKID in (5076209,
5076210,
5076211,
5076212,
5076213,
5076214)
select* from VoucherContable where IDCp=844962
update VoucherContable set Anulado=1 where IDCp=844962
select* from Asiento where IDVoucher=844962
select* from CargoAbono where IDAsiento=2757798
select* from CargoAbono where IDAsiento=2757799
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
----------------------------------
select* from Cp where NumCp='F001-0026813' and PKID=829060
select*  from ItemCp where IDCp=829060
SELECT*from VoucherContable where IDCp=829060
select top 10*from CpCobrarPagar where PKID=829060
update CpCobrarPagar set Saldo='4.73'  where PKID=829060
select*from DocCobrarPagar where IDCp=829060
update DocCobrarPagar set Saldo='4.73'  where IDCp=829060

----------------------------------------------------

select* from Cp where NumCp='F001-0026949' and PKID=831402
select*  from ItemCp where IDCp=831402
SELECT*from VoucherContable where IDCp=831402
select top 10*from CpCobrarPagar where PKID=831402
update CpCobrarPagar set Saldo='10.69'  where PKID=831402
select*from DocCobrarPagar where IDCp=831402
update DocCobrarPagar set Saldo='10.69'  where IDCp=831402

------------------------------------------------------
select* from Cp where NumCp='F001-0026950' and PKID=831403
select*  from ItemCp where IDCp=831403
SELECT*from VoucherContable where IDCp=831403
select top 10*from CpCobrarPagar where PKID=831403
update CpCobrarPagar set Saldo='8.47'  where PKID=831403
select*from DocCobrarPagar where IDCp=831403
update DocCobrarPagar set Saldo='8.47'  where IDCp=831403
----------------------------------------------------------

select* from Cp where NumCp='F001-0026951' and PKID=831404
select*  from ItemCp where IDCp=831404
SELECT*from VoucherContable where IDCp=831404
select top 10*from CpCobrarPagar where PKID=831404
update CpCobrarPagar set Saldo='7.64'  where PKID=831404
select*from DocCobrarPagar where IDCp=831404
update DocCobrarPagar set Saldo='7.64'  where IDCp=831404

----------------------------------------------------------

select* from Cp where NumCp='F001-0026953' and PKID=831406
select*  from ItemCp where IDCp=831406
SELECT*from VoucherContable where IDCp=831406
select top 10*from CpCobrarPagar where PKID=831406
update CpCobrarPagar set Saldo='5.58'  where PKID=831406
select*from DocCobrarPagar where IDCp=831406
update DocCobrarPagar set Saldo='5.58'  where IDCp=831406

-----------------------------------------------------------

select* from Cp where NumCp='F001-0026954' and PKID=831407
select*  from ItemCp where IDCp=831407
SELECT*from VoucherContable where IDCp=831407
select top 10*from CpCobrarPagar where PKID=831407
update CpCobrarPagar set Saldo='0.9'  where PKID=831407
select*from DocCobrarPagar where IDCp=831407
update DocCobrarPagar set Saldo='0.9'  where IDCp=831407