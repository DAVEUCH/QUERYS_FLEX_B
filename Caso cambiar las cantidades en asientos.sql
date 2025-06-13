select  cpi.PKID as PKID_cp,fecha, FechaEmision, NumCp,NumCpContable, cpi.Total as TotalCp, Saldo, cpp.Total as Total_xpagar
from Cp cpi
left join CpCobrarPagar cpp on cpp.PKID=cpi.PKID
left join CpCompra cc on cc.PKID=cpi.PKID
where NumCpContable between '6-10-2024-00001' and '6-10-2024-00015'
-----------------------------------------------------
select*from Cp where NumCp='33234225'
select*from ItemCp where IDCp=800973
select*from ItemCpCompra where PKID=4721931

SELECT top 10*from CpCobrarPagar where PKID=800921

SELECT*FROM CpCompra WHERE PKID=800921

--------------------------
update CpCobrarPagar set Saldo='6.43',Total='6.43' where PKID=801077 --6.4300

update Cp set Total='37.1200',ValorInafecto='37.120000',
ValorVenta='37.120000' , SubTotal='37.120000' where PKID=800973

update ItemCp set Total='37.1200000',ValorUnitario='37.1200000',
ValorInafecto='37.1200000', ValorVenta='37.1200000',SubTotal='37.1200000' where IDCp=800973

--update ItemCpCompra set CostoParalelo='42.100000' where PKID=4721866

select*from Cp where NumCp='91748'
-----------------------------------------
select top 10  * from VoucherContable where
--PKID=2773888
--and 
NumCp='6-10-2024-00004'
and Fecha='20240511' 
and IDSucursal='100000200' 
and PKID=2751310 and IDCp=2751310  --1-05-2024-0000102 /2751310/ 2751310
--------------------------------------------------
select *from Asiento where IDVoucher=800973
--and PKID=5779472 RENDICIÓN DE GASTOS VPM SRA. CONSUELO SRA. ELVIRA
--update Asiento set Glosa='POR EL PAGO DE DUA 118-2024-10-330886 Y PERCEPCION' where PKID=5976984
update  Asiento set TotalCargo='78.34', TotalAbono='78.34' where PKID=2513023
update  Asiento set TotalCargo='78.34', TotalAbono='78.34' where PKID=2513024

--------------------------------------------------------------
select *from Asiento where IDVoucher=800940 
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
where IDAsiento=2513023
--SELECT*FROM CargoAbono
-------------------------------------------------------
update CargoAbono set Cargo='78.340000' where PKID=8174623
update CargoAbono set Abono='78.340000' where PKID=8174626

update CargoAbono set IDCuentaContable='900014859' where PKID=8173727
update CargoAbono set IDCuentaContable='900016289' where PKID=8173731

--select*from Cp where NumCp='F015-0061221' 2751310
--select *from CuentaContable where Cuenta='4221101' and PKID='400008933'
select *from CuentaContable where Cuenta='2851101' and PKID='900014859'
select *from CuentaContable where Cuenta='6132104' and PKID='900016289'
select*from CuentaContable where PKID='900015093'
select*from CuentaContable where PKID='900015769'
select*from CuentaContable where PKID='900014968'

SELECT*FROM PlanCuentas