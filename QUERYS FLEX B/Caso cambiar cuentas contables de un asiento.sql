select*from Cp where NumCpContable=''
select*from Cp where NumCp='E001-0001066' and PKID=2871720
select*from CpCompra where  PKID=2871720
--update Cp set IDMoneda=1 where NumCp='E001-0000022' and PKID=2871801
SELECT TOP 5*FROM Cp where NumCp='PSB10-0002561' and PKID=2893031
SELECT TOP 5*FROM Cp where NumCp='PSB10-0002562' and PKID=2893042
-----------------------------------------
select*from VoucherContable where NumCp='4-11-2024-0003808' and PKID=2893031

select*from VoucherContable where NumCp='4-11-2024-0003809' and PKID=2893042
select*from VoucherContable where PKID=2871720
update VoucherContable set Fecha='2024-26-10', FechaTipoCambio='2024-26-10', TipoCambioFecha='3.758' where PKID=2867174


select * from VoucherContable where
NumCp='001-0021125'

and Fecha='20240511' 
and IDSucursal='100000200'
and PKID=2751310 and IDCp=2751310  --1-05-2024-0000102 /2751310/ 2751310
select*from CpCobrarPagar where PKID=2871720
select top 12*from dbo.CpCobrarPagar
select top 15*from dbo.Impuesto
select top 10*from dbo.DUA where PKID=2871720
select*from DocCobrarPagar where IDCp=2871720
--------------------------------------------------
select *from Asiento where IDVoucher=799594 
update Asiento set Glosa='REGULARIZACIÓN DE ENTREGAS A RENDIR DE GERENCIA' where PKID=2506244
--and PKID=5779472 RENDICIÓN DE GASTOS VPM SRA. CONSUELO SRA. ELVIRA
--update Asiento set TotalCargo='1149.66',TotalAbono='1149.66',
--TotalCargoMonedaBase='4292.83',TotalAbonoMonedaBase='4292.83'
--where PKID=6036066

--select *from Asiento where IDVoucher=2871720 
select *from Asiento where IDVoucher=2893031 

select *from Asiento where IDVoucher=2893042 

select  *from CargoAbono where IDAsiento=6081167
update CargoAbono set IDCuentaContable='900014716' where PKID=17443356
select  *from CargoAbono where IDAsiento=6081201
update CargoAbono set IDCuentaContable='900014716' where PKID=17443484

update CargoAbono set CargoMonedaBase='1149.66' where PKID=17306755
update CargoAbono set CargoMonedaBase='206.94' where PKID=17306756
update CargoAbono set AbonoMonedaBase='1356.60' where PKID=17306757

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
where IDAsiento=6036240

--------------------------------------------------------------

select TOP 10 *from CargoAbono where IDAsiento=6036065
select *from CuentaContable where Cuenta='4212101'
-------------------------------------------------------

update CargoAbono set IDCuentaContable='900014968' where PKID=17307217

--select*from Cp where NumCp='F015-0061221' 2751310
--select *from CuentaContable where Cuenta='4221101' and PKID='400008933'
SELECT*FROM VoucherContable WHERE PKID=1893277
SELECT*FROM Asiento WHERE PKID=4049151
select *from CargoAbono where IDCuentaContable=900015121
select *from CargoAbono where IDAsiento=2507463

select *from CuentaContable where Cuenta='6211101' and PKID='900015121'


select *from CuentaContable where Cuenta='4711101' 
select*from CuentaContable where PKID='900015310'
select*from CuentaContable where PKID='900015769'
select*from CuentaContable where PKID='900014968'

select*from CpCobrarPagar where PKID=2862485

select*from CpCobrarPagar where PKID=4346479

select*from DocCobrarPagar where PKID=4346479


SELECT*FROM PlanCuentas