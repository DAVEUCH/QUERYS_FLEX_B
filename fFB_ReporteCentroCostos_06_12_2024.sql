create FUNCTION fFB_ReporteCentroCostos(@Anio INT)
RETURNS TABLE
AS
RETURN
(
  SELECT           
        CentroDeCosto.Codigo AS Cod_CC,
		Ejercicio.Año,
        CentroCostoPadre.Descripcion AS CentroCostoPadre, 
        CentroDeCosto.Descripcion AS CentroCostoHijo,           
        CuentaContable.Descripcion AS CuentaContableDescripcion, 
        GC_CCyCtaContyRubroyCosto.Costo, 
        GC_CCyCtaContyRubroyCosto.Rubro,        
        CuentaContable.Cuenta,    

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 1 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_ENERO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 1 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as ENERO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 2 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_FEBRERO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 2 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as FEBRERO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 3 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_MARZO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 3 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as MARZO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 4 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_ABRIL,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 4 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as ABRIL,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 5 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_MAYO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 5 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as MAYO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 6 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_JUNIO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 6 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as JUNIO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 7 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_JULIO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 7 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as JULIO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 8 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_AGOSTO,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 8 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as AGOSTO,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 9 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_SEPTIEMBRE,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 9 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as SEPTIEMBRE,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 10 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_OCTUBRE,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 10 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as OCTUBRE,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 11 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_NOVIEMBRE,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 11 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as NOVIEMBRE,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then CASE CONVERT(INT, Periodo.Mes) WHEN 12 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END else 0 end)), 0) 
		as Proyectado_DICIEMBRE,	
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(case cp.IDCptoOperacion when 1977 then 0 else CASE CONVERT(INT, Periodo.Mes) WHEN 12 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END end)), 0) 
		as DICIEMBRE,

		ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE WHEN cp.IDCptoOperacion = 1977 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase ELSE 0 END)), 0) AS Total_Proyectado,
		ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE WHEN cp.IDCptoOperacion <> 1977 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase ELSE 0 END)), 0) AS Total
		--ISNULL(CONVERT(DECIMAL(10, 2), SUM(CargoAbono.CargoMonedaBase) - SUM(CargoAbono.AbonoMonedaBase)), 0) AS Total

    FROM CargoAbono 
    INNER JOIN Asiento ON Asiento.PKID = CargoAbono.IDAsiento 
    INNER JOIN VoucherContable ON Asiento.IDVoucher = VoucherContable.PKID 
    INNER JOIN Periodo ON Periodo.PKID = VoucherContable.IDPeriodo 
    INNER JOIN Ejercicio ON Ejercicio.PKID = Periodo.IDEjercicio 
    INNER JOIN CuentaContable ON CuentaContable.PKID = CargoAbono.IDCuentaContable 
    INNER JOIN CentroDeCosto ON CentroDeCosto.PKID = CargoAbono.IDCentroDeCosto 
    INNER JOIN CentroDeCosto AS CentroCostoPadre ON CentroCostoPadre.PKID = CentroDeCosto.IDCentroDeCostoPadre       
	LEFT JOIN Cp on cp.pkid=VoucherContable.PKID 
    LEFT OUTER JOIN GC_CCyCtaContyRubroyCosto 
        ON GC_CCyCtaContyRubroyCosto.pkid_CC = CargoAbono.IDCentroDeCosto        
        AND GC_CCyCtaContyRubroyCosto.CuentaContable = CuentaContable.Cuenta  
        AND GC_CCyCtaContyRubroyCosto.IDPlanCuentas = CuentaContable.IDPlanCuentas
    WHERE VoucherContable.Anulado = 0          
      AND CargoAbono.IDCentroDeCosto <> 0           
      AND Ejercicio.Año = @Anio 
	  --and CuentaContable.PKID=900014065
    GROUP BY CentroDeCosto.Codigo, CentroCostoPadre.Descripcion, CentroDeCosto.Descripcion, 
             CuentaContable.Descripcion, CuentaContable.Cuenta, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,Ejercicio.Año
		
		)
GO	 

select*from CptoOperacion where Codigo='CG031'
			 
			 select*from Cp where NumCp IN('COM-0000001','COM-0000002')
			 select*from Cp where NumCp='F001-123987'
			 select *from VoucherContable where PKID IN (2878996,2879001)


alter view usv_RelacionCOM_VOUCHER
AS
select
--uroccom.pkid_cot,
--uroccom.coti,
--uroccom.total_coti,
cpcom.PKID as idcom,
cpcom.NumCp as serie_com,
--oc as oc_reac,
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
--left join usv_RelacionOC_COM uroccom on uroccom.PKID_COMPRA=cpcom.PKID
where vc.PKID IN (2878996,2879001)
