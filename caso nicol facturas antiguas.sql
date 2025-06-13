select  cpi.PKID as PKID_cp,fecha, FechaEmision, NumCp,NumCpContable, cpi.Total as TotalCp, Saldo, cpp.Total as Total_xpagar
from Cp cpi
left join CpCobrarPagar cpp on cpp.PKID=cpi.PKID
left join CpCompra cc on cc.PKID=cpi.PKID
where NumCpContable between '6-10-2024-00001' and '6-10-2024-00015'
--select*from Cp where NumCp='FC1-000172' and PKID=1193572
select*from Cp where NumCp='FC01-0001815' and PKID=2880851
select*from Cp where NumCp='07014436' and PKID=2366517
select*from Cp where NumCp='011-0011527' and PKID=289780  ---692003
select*from Cp where NumCp='011-0011527' and PKID=692003
select*from Cp where NumCp='011-0011528' and PKID=289781 



select*from Cp where NumCp='FNC2-0000363' and PKID=1825651--------------
--select*from Cp where NumCp='011-0012135' and PKID=346647 


--select*from Cp where NumCp='011-0012152' and PKID=348782 
--select*from Cp where NumCp='011-0012311' and PKID=367407 
--select*from Cp where NumCp='011-0012312' and PKID=367408
--select*from Cp where NumCp='011-0012532' and PKID=394302 
--select*from Cp where NumCp='011-0012533' and PKID=394303 
select*from Cp where NumCp='BNC9-0000079' and PKID=1978907 ---pagar
select*from Cp where NumCp='FNC2-0000363' and PKID=1825651 ---pagar
select*from Cp where NumCp='FNC2-0000364' and PKID=1825698 ---pagar
select*from Cp where NumCp='FNC5-0000073' and PKID=1693846 ---pagar
select*from Cp where NumCp='FNC9-0000118' and PKID=1874587 ---pagar
select*from Periodo 
select*from TipoCp where PKID=5584
select  *from TipoCp where Descripcion like 'nota%'

--update Cp set EvaluarPercepcion=1 where PKID=289780

--select*from VoucherContable where NumCp='2-02-2018-0001824'
--select*from VoucherContable where NumCp='08-2022-4151-07014436'
select*from VoucherContable where NumCp='2-10-2024-0002308'
select*from VoucherContable where NumCp='2-02-2015-0001539'
--select*from VoucherContable where NumCp='2-05-2016-0001315'---692003+
select*from VoucherContable where NumCp='2-02-2015-0001540'--
--select*from VoucherContable where NumCp='2-04-2015-0000998'
--select*from VoucherContable where NumCp='2-04-2015-0001245'
--select*from VoucherContable where NumCp='2-04-2015-0003510'
--select*from VoucherContable where NumCp='2-04-2015-0003511'
--select*from VoucherContable where NumCp='2-05-2015-0003304'
--select*from VoucherContable where NumCp='2-05-2015-0003305'
select*from VoucherContable where NumCp='2-02-2021-0001174'--PAGAR
select*from VoucherContable where NumCp='2-06-2020-0001076' --PAGAR
select*from VoucherContable where NumCp='2-06-2020-0001085' --PAGAR
select*from VoucherContable where NumCp='2-10-2019-0002708' --PAGAR
select*from VoucherContable where NumCp='2-09-2020-0001150' --PAGAR

--SELECT *FROM CpCobrarPagar where PKID=1193572
--SELECT *FROM CpCobrarPagar where PKID=2366517
--select*from Cp where NumCp='FNC2-0000363' and PKID=1825651--------------
--SELECT *FROM CpCobrarPagar where PKID=1825651------------------------288.00
select *from DocCobrarPagar where IDCp=1825651

--select*from Cp where NumCp='FNC5-0000858' and PKID=2907371--------------
--SELECT *FROM CpCobrarPagar where PKID=2907371------------------------
select *from DocCobrarPagar where IDCp=2907371--




update CpCobrarPagar set Total='288.00' where PKID=1825651
update DocCobrarPagar set Total='288.00' where  IDCp=1825651

--SELECT *FROM CpCobrarPagar where PKID=346647
--SELECT *FROM CpCobrarPagar where PKID=348782
--SELECT *FROM CpCobrarPagar where PKID=367407
--SELECT *FROM CpCobrarPagar where PKID=367408
--SELECT *FROM CpCobrarPagar where PKID=394302
--SELECT *FROM CpCobrarPagar where PKID=394303
SELECT *FROM CpCobrarPagar where PKID=1978907
SELECT *FROM CpCobrarPagar where PKID=1825651
SELECT *FROM CpCobrarPagar where PKID=1825698
SELECT *FROM CpCobrarPagar where PKID=1693846
SELECT *FROM CpCobrarPagar where PKID=1874587
--------------------------re--------------------
select *from DocCobrarPagar where IDCp=1978907
update DocCobrarPagar set IDCuentaContable=900014730 where PKID=619719
update DocCobrarPagar set Saldo='1.31' where PKID=619719
--400008600  - 1
--900014730  - 3

select *from DocCobrarPagar where IDCp=2869900
select top 1*from CpCobrarPagar where 

select *from DocCobrarPagar where IDCp=1978907

--------------------------------------

update CpCobrarPagar set Saldo='0.00' where PKID=289780
select top 12*from CpCaja
-----------------------------------------------------
select*from Cp where NumCp='FNC4-0000002'
SELECT *FROM CpCobrarPagar WHERE PKID=824605
select  *from DocCobrarPagar WHERE IDCp= 824605

update CpCobrarPagar set Saldo='54.00' where PKID=824605
update DocCobrarPagar set Saldo='54.00' where IDCp= 824605

SELECT*FROM VoucherContable WHERE PKID=824605
SELECT*FROM Asiento where IDVoucher=824605
select*from CargoAbono where IDAsiento=2638933

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
select *from Asiento where IDVoucher=289780
select *from Asiento where IDVoucher=289781
select *from Asiento where IDVoucher=346647
select *from Asiento where IDVoucher=348782--367407
select *from Asiento where IDVoucher=367407
select *from Asiento where IDVoucher=367408
select *from Asiento where IDVoucher=394302
select *from Asiento where IDVoucher=394303
--and PKID=5779472 RENDICIÓN DE GASTOS VPM SRA. CONSUELO SRA. ELVIRA
--update Asiento set Glosa='POR EL PAGO DE DUA 118-2024-10-330886 Y PERCEPCION' where PKID=5976984
update  Asiento set TotalCargo='78.34', TotalAbono='78.34' where PKID=2513023
update  Asiento set TotalCargo='78.34', TotalAbono='78.34' where PKID=2513024

--------------------------------------------------------------
select TOP 10*from LibroAuxiliar
select *from Asiento where IDVoucher=289780 
select *from CargoAbono where PKID=1783871 
select *from CargoAbono where PKID=1783872 
select *from CargoAbono where PKID=1783873 

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
where IDAsiento=835160
--SELECT*FROM CargoAbono
select *from CuentaContable where Cuenta='1212101'
select *from CuentaContable where Cuenta='4011101'
select *from CuentaContable where Cuenta='7011101'
-------------------------------------------------------
update CargoAbono set Cargo='78.340000' where PKID=8174623
update CargoAbono set Abono='78.340000' where PKID=8174626

update CargoAbono set IDCuentaContable='900014730' where PKID=2422216
update CargoAbono set IDCuentaContable='900015769' where PKID=2422217
update CargoAbono set IDCuentaContable='900016099' where PKID=2422218

--select*from Cp where NumCp='F015-0061221' 2751310
--select *from CuentaContable where Cuenta='4221101' and PKID='400008933'
select *from CuentaContable where Cuenta='1212101' and PKID='900014859'
select *from CuentaContable where Cuenta='6132104' and PKID='900016289'
select*from CuentaContable where PKID='900015093'
select*from CuentaContable where PKID='900015769'
select*from CuentaContable where PKID='900014968'

select *  from vSeleccionCpCobrarPagar WHERE IDPersona=3318 AND Saldo > 0  FOR XML RAW

select*from DocCobrarPagar where PKID=874744
select*from CpCobrarPagar where PKID=455370
update DocCobrarPagar set saldo='1825.04' where PKID=874744--1944.16
update CpCobrarPagar set saldo='1825.04' where PKID=455370--1944.16

select top 1*from tipocp



select*from Persona where Codigo='20100130204'



select*from VoucherContable where Fecha='2015-09-04' and  IDSucursal=100000199

select*from Sucursal



------hoy 02-04*-2025----------------------------------------------
select*from Cp where NumCp='002-0002505' and PKID=45372 
update Cp set MonedaBase=0 where NumCp='002-0002505' and PKID=45372 
select*from VoucherContable where PKID=45372
select*from Asiento where IDVoucher=45372
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
where IDAsiento=49931

select*from CargoAbono where IDAsiento=49931
update CargoAbono set CargoMonedaDocumento='111.14' where PKID=162760--110.70

SELECT *FROM CpCobrarPagar where PKID=45372------------------------
select *from DocCobrarPagar where IDCp=45372
update CpCobrarPagar set Saldo='0.00' where PKID=45372
update DocCobrarPagar set Saldo='0.00' where IDCp= 45372
---------------------------------------------------------------------------------
select*from Cp where NumCp='002-0005320' and PKID=405040 
update Cp set MonedaBase=0 where NumCp='002-0005320' and PKID=405040 
SELECT *FROM CpCobrarPagar where PKID=405040
select *from DocCobrarPagar where IDCp=405040

select*from VoucherContable where PKID=405040
select*from Asiento where IDVoucher=405040

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
where IDAsiento=1151766

select*from CargoAbono where IDAsiento=1151766
update CargoAbono set CargoMonedaDocumento='37.00' where PKID=4057904--36.96
update CargoAbono set CargoMonedaDocumento='36.96' where PKID=4057904--36.96

update CpCobrarPagar set Saldo='0.00' where PKID=405040
update DocCobrarPagar set Saldo='0.00' where IDCp= 405040

---------------------------------------------------------

select*from Cp where NumCp='FNC2-0002069' and PKID=827771 
SELECT *FROM CpCobrarPagar where PKID=827771------------------------
select *from DocCobrarPagar where IDCp=827771
update CpCobrarPagar set Saldo='0.41' where PKID=827771
update DocCobrarPagar set Saldo='0.41' where IDCp= 827771

select * from dbo.usf_ConsultaComisionDocumento(@de, @al)


