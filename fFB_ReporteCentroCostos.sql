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
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CargoAbono.CargoMonedaBase) - SUM(CargoAbono.AbonoMonedaBase)), 0) AS Total, 
		'0.00' as Proyectado_ENERO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 1 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS ENERO, 
		'0.00' as Proyectado_FEBRERO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 2 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS FEBRERO,
		'0.00' as Proyectado_MARZO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 3 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS MARZO,
		'0.00' as Proyectado_ABRIL,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 4 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS ABRIL,
		'0.00' as Proyectado_MAYO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 5 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS MAYO, 
		'0.00' as Proyectado_JUNIO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 6 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS JUNIO, 
		'0.00' as Proyectado_JULIO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 7 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS JULIO,
		'0.00' as Proyectado_AGOSTO,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 8 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS AGOSTO, 
		'0.00' as Proyectado_SEPTIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 9 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS SEPTIEMBRE,
		'0.00' as Proyectado_OCTUBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 10 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS OCTUBRE,
		'0.00' as Proyectado_NOVIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 11 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS NOVIEMBRE,
		'0.00' as Proyectado_DICIEMBRE,
        ISNULL(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(INT, Periodo.Mes) WHEN 12 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)), 0) AS DICIEMBRE  
		
    FROM CargoAbono 
    INNER JOIN Asiento ON Asiento.PKID = CargoAbono.IDAsiento 
    INNER JOIN VoucherContable ON Asiento.IDVoucher = VoucherContable.PKID 
    INNER JOIN Periodo ON Periodo.PKID = VoucherContable.IDPeriodo 
    INNER JOIN Ejercicio ON Ejercicio.PKID = Periodo.IDEjercicio 
    INNER JOIN CuentaContable ON CuentaContable.PKID = CargoAbono.IDCuentaContable 
    INNER JOIN CentroDeCosto ON CentroDeCosto.PKID = CargoAbono.IDCentroDeCosto 
    INNER JOIN CentroDeCosto AS CentroCostoPadre ON CentroCostoPadre.PKID = CentroDeCosto.IDCentroDeCostoPadre       
    LEFT OUTER JOIN GC_CCyCtaContyRubroyCosto 
        ON GC_CCyCtaContyRubroyCosto.pkid_CC = CargoAbono.IDCentroDeCosto        
        AND GC_CCyCtaContyRubroyCosto.CuentaContable = CuentaContable.Cuenta  
        AND GC_CCyCtaContyRubroyCosto.IDPlanCuentas = CuentaContable.IDPlanCuentas
    WHERE VoucherContable.Anulado = 0          
      AND CargoAbono.IDCentroDeCosto <> 0           
      AND Ejercicio.Año = @Anio          
    GROUP BY CentroDeCosto.Codigo, CentroCostoPadre.Descripcion, CentroDeCosto.Descripcion, 
             CuentaContable.Descripcion, CuentaContable.Cuenta, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,Ejercicio.Año        
)
GO

Select * From fFB_ReporteCentroCostos(2024)
