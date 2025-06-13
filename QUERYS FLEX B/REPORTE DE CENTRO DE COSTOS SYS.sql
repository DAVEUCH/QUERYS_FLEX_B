SELECT           

CentroDeCosto.Codigo AS Cod_CC,           

CentroCostoPadre.Descripcion AS CentroCostoPadre, CentroDeCosto.Descripcion AS CentroCostoHijo,           

CuentaContable.Descripcion AS CuentaContableDescripcion, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,        

CuentaContable.Cuenta,  

Ejercicio.Año,

        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CargoAbono.CargoMonedaBase) - SUM(CargoAbono.AbonoMonedaBase)), 0) AS Total, 
		--'0.00' as Proyectado_ENERO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 1 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS ENERO, 
		--'0.00' as Proyectado_FEBRERO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 2 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS FEBRERO,
		--'0.00' as Proyectado_MARZO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 3 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS MARZO,
		--'0.00' as Proyectado_ABRIL,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 4 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS ABRIL,
		--'0.00' as Proyectado_MAYO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 5 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS MAYO, 
		--'0.00' as Proyectado_JUNIO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 6 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS JUNIO, 
		--'0.00' as Proyectado_JULIO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 7 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS JULIO,
		--'0.00' as Proyectado_AGOSTO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 8 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS AGOSTO, 
		--'0.00' as Proyectado_SEPTIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 9 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS SEPTIEMBRE,
		--'0.00' as Proyectado_OCTUBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 10 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS OCTUBRE,
		--'0.00' as Proyectado_NOVIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 11 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS NOVIEMBRE,
		--'0.00' as Proyectado_DICIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 12 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS DICIEMBRE         

FROM CargoAbono
INNER JOIN Asiento ON Asiento.PKID = CargoAbono.IDAsiento
INNER JOIN VoucherContable ON Asiento.IDVoucher = VoucherContable.PKID
INNER JOIN Periodo ON Periodo.PKID = VoucherContable.IDPeriodo
INNER JOIN Ejercicio ON Ejercicio.PKID = Periodo.IDEjercicio
INNER JOIN CuentaContable ON CuentaContable.PKID = CargoAbono.IDCuentaContable
inner join usv_RelacionCOM_VOUCHER usv on 
INNER JOIN CentroDeCosto ON CentroDeCosto.PKID = CargoAbono.IDCentroDeCosto
INNER JOIN CentroDeCosto AS CentroCostoPadre ON CentroCostoPadre.PKID = CentroDeCosto.IDCentroDeCostoPadre       
--LEFT JOIN GC_CuentaContable_GastoyRubro ON CuentaContable.Cuenta = GC_CuentaContable_GastoyRubro.CuentaContable      
LEFT OUTER JOIN GC_CCyCtaContyRubroyCosto ON  GC_CCyCtaContyRubroyCosto.pkid_CC = CargoAbono.IDCentroDeCosto       
AND GC_CCyCtaContyRubroyCosto.CuentaContable = CuentaContable.Cuenta  and GC_CCyCtaContyRubroyCosto.IDPlanCuentas = CuentaContable.IDPlanCuentas
WHERE   (VoucherContable.Anulado=0)          
AND  (CargoAbono.IDCentroDeCosto <> 0)           
AND  (Ejercicio.Año = '2024')          
GROUP BY CentroDeCosto.Codigo, CentroCostoPadre.Descripcion, CentroDeCosto.Descripcion, CuentaContable.Descripcion,       
CuentaContable.Cuenta, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,Ejercicio.Año      
ORDER BY CentroCostoPadre, CentroCostoHijo, CuentaContable.Cuenta

---------------------------------------------------------------------------------------------------


select*from cp where NumCp='CTSER-0000003'
select*from Cp where NumCp='OS-0005'
SELECT*FROM Cp WHERE NumCp='F001-123456'
SELECT*FROM CpCompra WHERE PKID=2878956
select *from VoucherContable where IDCp=2878956
--------------------------------------------
alter view usv_RelacionCOTI_OC
as
select
Cotizacion3.PKID as Cotizacion3,
isnull((select top 1 IDCp from CpRelacionado where IDTipoCpDestino='4CC4E458-E69D-4E5A-84B5-8E3F4AB4635B' and idCpRelacionado=CP.pkid),0) as OC_Relacion
From Cp 
Inner join Cotizacion3 On Cotizacion3.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal 
GO

----

alter view usv_RelacionCOTI_OC_2
as
select 
cpl.PKID as pkid_cot,
cpl.FechaEmision as Fecha_cot,
cpl.Hora as Hora_cot,
cpl.NumCp as coti,
cpl.Total as total_coti,
cpa.PKID as pkid_oc,
cpa.FechaEmision as Fecha_oc,
cpa.Hora as Hora_oc,
cpa.NumCp as oc
from usv_RelacionCOTI_OC coco
inner join Cp cpa on cpa.PKID=coco.OC_Relacion
inner join Cp cpl on cpl.PKID= coco.Cotizacion3

GO

------oc_compras
alter view usv_RelacionOC_COM
as
SELECT
urcco.pkid_cot,
urcco.coti,
urcco.total_coti,
pkid_oc,
oc,
fecha_oc,
com.PKID as PKID_COMPRA,
cpa.numcp as compra
FROM usv_RelacionCOTI_OC_2  urcco
inner join Cp cpb on cpb.PKID=urcco.pkid_oc
inner join CpCompra com on com.NumeroReferencia=urcco.oc
inner join cp cpa on cpa.pkid=com.pkid

WHERE pkid_cot=2878948
-------------------------compra-voucher
SELECT*FROM CpCompra WHERE PKID=2878956
select *from VoucherContable where IDCp=2878956
--select*from Cp where PKID=2878956

alter view usv_RelacionCOM_VOUCHER
AS
select
uroccom.pkid_cot,
uroccom.coti,
uroccom.total_coti,
cpcom.PKID as idcom,
cpcom.NumCp as serie_com,
oc as oc_reac,
vc.PKID as idvoucher,
vc.NumCp as voucher,
asi.Glosa,
--asi.TotalCargo,
--asi.TotalAbono
carb.PKID as id_cargobono,
carb.IDAsiento,
IDCuentaContable,
CargoMonedaBase,
AbonoMonedaBase
from Cp cpcom
left join VoucherContable vc on vc.IDCp=cpcom.PKID
left join Asiento asi on asi.IDVoucher=vc.PKID
left join CargoAbono carb on carb.IDAsiento=asi.PKID
left join usv_RelacionOC_COM uroccom on uroccom.PKID_COMPRA=cpcom.PKID
where cpcom.PKID=2878956




select top 10*from CargoAbono

--SELECT TOP 500*FROM NumCpContable WHERE NumCp='11-2024-5765-CTSER-0000003'