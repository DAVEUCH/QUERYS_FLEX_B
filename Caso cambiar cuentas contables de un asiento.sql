select*from Cp where NumCpContable=''
select*from Cp where NumCp='274669' and PKID=800921
select*from CpCompra where  PKID=2871720
--update Cp set IDMoneda=1 where NumCp='E001-0000022' and PKID=2871801
--SELECT TOP 5*FROM Cp where NumCp='PSB10-0002561' and PKID=2893031
--SELECT TOP 5*FROM Cp where NumCp='PSB10-0002562' and PKID=2893042
-----------------------------------------
select*from cp where PKID=828567
select*from VoucherContable where NumCp='1-02-2025-00034'
select*from CptoOperacion where PKID=1764

--select*from VoucherContable where NumCp='4-11-2024-0003809' and PKID=2893042
select*from VoucherContable where PKID=2871720
update VoucherContable set Fecha='2024-26-10', FechaTipoCambio='2024-26-10', TipoCambioFecha='3.758' where PKID=2867174
--------------------------------------
--esto es cuando se equivocan de moneda en las compras 
SELECT *FROM Cp  WHERE  PKID=2903619
select*from CpCompra where PKID=2903619
select*from ItemCp where IDCp=2903619
select*from ItemProducto where PKID in(9001604,9001605)
select top 10*from DUA where PKID=2903619
select*from VoucherContable
where
NumCp='1-12-2024-0000136' 
select *from Asiento where IDVoucher=2903619 
select *from DUA
select*from Cp where MonedaBase=2
update cp set MonedaBase=1 where PKID=2903619
update Asiento set TotalAbonoMonedaBase='2262.00',TotalCargoMonedaBase='2262.00' where PKID=6106713
update Asiento set TotalAbonoMonedaBase='1916.95',TotalCargoMonedaBase='1916.95' where PKID=6106714
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
where IDAsiento=6106714
update CargoAbono set CargoMonedaBase='1916.95' where PKID=17515682 --AbonoMonedaBase='2262.00'
--update CargoAbono set CargoMonedaBase='345.05' where PKID=17515680
update CargoAbono set AbonoMonedaBase='1916.95' where PKID=17515683
-----------------------------
select*from Cp where NumCp='E001-0001126'
AND PKID=2903619
select*from DocCobrarPagar where IDCp=2903619
select top 10*from CuentaContable where PKID=900016173
select*from CuentaContable where Cuenta='4212101'
update DocCobrarPagar set IDCuentaContable=900014968 where PKID=4404985
and Fecha='20240511' 
and IDSucursal='100000200'
and PKID=2751310 and IDCp=2751310  --1-05-2024-0000102 /2751310/ 2751310
select*from CpCobrarPagar where PKID=2903619
select top 12*from dbo.CpCobrarPagar
select top 15*from dbo.Impuesto
select top 10*from dbo.DUA where PKID=2871720
select*from DocCobrarPagar where IDCp=2903619
select *from CargoCobranza
--------------------------------------------------
select *from Asiento where IDVoucher=2903619 
--update Asiento set TotalAbonoMonedaBase='1916.95'
--update Asiento set Glosa='REGULARIZACIÓN DE ENTREGAS A RENDIR DE GERENCIA' where PKID=2506244
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
where IDAsiento=6106713

--------------------------------------------------------------

select TOP 10 *from CargoAbono where IDAsiento=6036065
select *from CuentaContable where Cuenta='4212101' and IDPlanCuentas=3
-------------------------------------------------------

--update CargoAbono set IDCuentaContable='900014968', Abono='2262.00', AbonoMonedaDocumento='2262.00' where PKID=17515681
update CargoAbono set AbonoMonedaBase='8588.81' where PKID=17515681

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

--------------------------------------
--SELECT * FROM dbo.fFB_LibroMayor2010_2(@idPlanCuentas, @idEjercicio, @idPeriodoInicial, @idPeriodoFinal, @cuentaInicial, @cuentaFinal, @Nivel)
SELECT *
FROM dbo.fFB_LibroMayor2010_2(3, 100000034, 100000491, 100000491, 1212101, 1212101, 6) AS LM
WHERE LM.AsientoGlosa = 'PROVISION DE COBRANZA DUDOSA FACTURAS DEL 2019 Y 2020'

select*from Periodo
--SELECT *FROM Cp 
--WHERE  NumCp='F001-0026461'
select*from VoucherContable
where
NumCp='001-0011618' 
select *from Asiento where IDVoucher=2957275
update Asiento set Glosa='COBRO FT F21-0000128 GC IMPORTADORES S.A.C.' where PKID=6226955
--update Asiento set Glosa='PROVISIÓN DE ITF' where PKID=26696806274816
select 
CA.PKID,
IDAsiento,
IDCuentaContable,
CC.Descripcion,
CC.Cuenta,
CC.IDPlanCuentas,
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
where IDAsiento=6226518

update CargoAbono set IDCuentaContable=900014730 where PKID in (17861815,17861820,17861821,17861822,17861825,17861828,17861833,17861868,17861869)

select top 10*from CargoAbono

update CargoAbono set IDCuentaContable=900014968 where PKID=17601184

select*from CuentaContable where Cuenta='4212101'

update CargoAbono set CargoMonedaBase='484.64' where PKID=17735864--AbonoMonedaBase='2262.00'
update CargoAbono set AbonoMonedaBase='484.64' where PKID=17735865
--------
update CargoAbono set CargoMonedaBase='484.64' where PKID=17735861
update CargoAbono set CargoMonedaBase='87.24' where PKID=17735862
update CargoAbono set AbonoMonedaBase='571.88' where PKID=17735863

update VoucherContable
set
Fecha='2025-10-02',
FechaTipoCambio='2025-10-02',
TipoCambioFecha='3.718' 
where PKID=2937582

update Cp set
--IDMoneda=1
FechaEmision='2025-10-02',
Hora='2025-10-02 10:34',
FechaTipoCambio='2025-10-02',
TipoCambio='3.718'
where NumCp='F001-0026461'
-------------------------------------------------------------------------------------
--SELECT *FROM Cp 
--WHERE  PKID=2861576
SELECT *FROM Cp 
WHERE NumCp='F001-0000079' AND PKID=3013518

select*from VoucherContable
where
NumCp='1-06-2025-0000015' 
select *from Asiento where IDVoucher=3013518

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
where IDAsiento=6106714

update CargoAbono set CargoMonedaBase='296.65' where PKID=17612962--AbonoMonedaBase='2262.00'
update CargoAbono set AbonoMonedaBase='296.65' where PKID=17612963
----------------------------------------------------------------------
update CargoAbono set CargoMonedaBase='296.65' where PKID=17612958
update CargoAbono set CargoMonedaBase='53.40' where PKID=17612959
update CargoAbono set AbonoMonedaBase='350.05' where PKID=17612960
update CargoAbono set AbonoMonedaBase='0.00' where PKID=17612961

update VoucherContable
set
Fecha='2025-31-05',
FechaTipoCambio='2025-31-05',
TipoCambioFecha='3.632' ,
NumCp='1-05-2025-0000295'
where PKID=3013518

update Cp set
--IDMoneda=1
FechaEmision='2025-31-05',
Fecha='2025-31-05',
Hora='2025-31-05 10:34',
FechaTipoCambio='2025-31-05',
TipoCambio='3.632'
where NumCp='F001-0000079' AND PKID=3013518

SELECT TOP 500*FROM VoucherContable WHERE IDPeriodo=100000498 ORDER BY PKID DESC 

SELECT*FROM Periodo


-------------------------------------------------------------
select top 10*from vMoran_MetaCuota_Vendedores
select*from Cp where IDResponsable=64962 and Fecha='19-04-2025'
select*from Persona WHERE Nombre LIKE 'TORRES IBARRA%'
select*from Persona where PKID=64962
select*from Persona where PKID=15426
select*from Vendedor WHERE PKID=64962
select*from Vendedor WHERE PKID=15426
select*from GrupoVentas
select*from Sucursal where PKID=100000203
 Exec usp_ComisionVendedor_EscalaMarcaXVentaVendeAnioyMes_Sum 2025, 4, 64962
-------------------------------------------------------------
--------------------------------------------------
--SELECT *FROM Cp 
--WHERE  PKID=2919842
SELECT * FROM Cp WHERE NumCp='F581-2580933' AND PKID=841414
--select*from TipoCp where PKID=5367
--select*from CpCobrarPagar where PKID=2990376
--select top 9*from DocCobrarPagar  where IDCp=2990376
--update DocCobrarPagar set Saldo='23.08' , Total='23.08' where IDCp=2990376
--update CpCobrarPagar set Saldo='23.08' , Total='23.08' where PKID=2990376
--select*from ItemCp where IDCp=2990376
--update ItemCp set Total='23.08', ValorUnitario='23.08',ValorAfecto='19.56',ValorVenta='23.08', SubTotal='23.08' where IDCp=2990376
----select*from ItemProducto where PKID=9291735
--select*from eNotaCredito3 where [NotaCredito.PKID]=2990376
--update cp set ValorAfecto='19.56',ValorVenta='19.56', SubTotal='23.08',Total='23.08' WHERE NumCp='FC73-0312988' AND PKID=2990376
                                                                                    
--update  cp set IDLibroAuxiliar=3 where PKID=836251
--select*from CpCobrarPagar where PKID=2990893

--update CpCobrarPagar set FechaVencimiento='2025-16-05',FechaProgramacionPago='2025-16-05' where PKID=2990893

select*from VoucherContable
where
--NumCp='1-04-2025-00006' and
PKID=841414

select *from Asiento where IDVoucher=841414

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
where IDAsiento=6297856


update CargoAbono set CargoMonedaBase='420.77' where PKID=8687440--AbonoMonedaBase='2262.00'
update CargoAbono set AbonoMonedaBase='420.77' where PKID=8687441
----------------------------------------------------------------------
update CargoAbono set CargoMonedaBase='420.77' where PKID=8687437
update CargoAbono set CargoMonedaBase='75.74' where PKID=8687438
update CargoAbono set AbonoMonedaBase='496.51' where PKID=8687439
--update CargoAbono set CargoMonedaBase='2438.36' where PKID=8655541
update CargoAbono set Abono='11.736' where PKID=18063461
update CargoAbono set Abono='7.824' where PKID=18063462
update CargoAbono set Cargo='19.56' where PKID=18063463
--update CargoAbono set AbonoMonedaBase='0.00' where PKID=8655541
update CargoAbono set AbonoMonedaBase='43.188' where PKID=18063461
update CargoAbono set AbonoMonedaBase='28.792' where PKID=18063462
update CargoAbono set CargoMonedaBase='71.98' where PKID=18063463


update CargoAbono set CargoMonedaBase='2438.36' where PKID=8655539
update CargoAbono set AbonoMonedaBase='0.00' where PKID=8655539
update CargoAbono set AbonoMonedaBase='2066.41' where PKID=8655541
update CargoAbono set CargoMonedaBase='0.00' where PKID=8655541


--update CargoAbono set AbonoMonedaBase='0.00' where PKID=8655542
--update CargoAbono set CargoMonedaBase='0.00' where PKID=8655540
--update CargoAbono set AbonoMonedaBase='0.00' where PKID=17794303

update VoucherContable
set
Fecha='2025-03-04',
FechaTipoCambio='2025-03-04',
TipoCambioFecha='3.680' 
where PKID=835621

update Cp set
Fecha='2025-03-04',
FechaEmision='2025-03-04',
Hora='2025-03-04 17:03',
FechaTipoCambio='2025-03-04',
TipoCambio='3.680'
where NumCp='FF20-0000823' AND PKID=835621

