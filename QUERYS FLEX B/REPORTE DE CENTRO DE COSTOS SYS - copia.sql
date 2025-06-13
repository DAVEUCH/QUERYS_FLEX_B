SELECT           

CentroDeCosto.Codigo AS Cod_CC,           

CentroCostoPadre.Descripcion AS CentroCostoPadre, CentroDeCosto.Descripcion AS CentroCostoHijo,           

CuentaContable.Descripcion AS CuentaContableDescripcion, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,        

CuentaContable.Cuenta,  

Ejercicio.Año,

isnull(CONVERT(DECIMAL(10, 2), SUM(CargoAbono.CargoMonedaBase) - SUM(CargoAbono.AbonoMonedaBase)),0) AS Total,           

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  1 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS ENERO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  2 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS FEBRERO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  3 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS MARZO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  4 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS ABRIL,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  5 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS MAYO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  6 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS JUNIO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  7 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS JULIO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  8 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS AGOSTO,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN  9 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS SEPTIEMBRE,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN 10 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS OCTUBRE,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN 11 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS NOVIEMBRE,         

isnull(CONVERT(DECIMAL(10, 2), SUM(CASE CONVERT(int, Periodo.Mes) WHEN 12 THEN CargoAbono.CargoMonedaBase - CargoAbono.AbonoMonedaBase END)),0) AS DICIEMBRE          

FROM CargoAbono INNER JOIN          

Asiento ON Asiento.PKID = CargoAbono.IDAsiento INNER JOIN          

VoucherContable ON Asiento.IDVoucher = VoucherContable.PKID INNER JOIN          

Periodo ON Periodo.PKID = VoucherContable.IDPeriodo INNER JOIN          

Ejercicio ON Ejercicio.PKID = Periodo.IDEjercicio INNER JOIN          

CuentaContable ON CuentaContable.PKID = CargoAbono.IDCuentaContable INNER JOIN          

CentroDeCosto ON CentroDeCosto.PKID = CargoAbono.IDCentroDeCosto INNER JOIN          

CentroDeCosto AS CentroCostoPadre ON CentroCostoPadre.PKID = CentroDeCosto.IDCentroDeCostoPadre       

--LEFT JOIN GC_CuentaContable_GastoyRubro ON CuentaContable.Cuenta = GC_CuentaContable_GastoyRubro.CuentaContable      

LEFT OUTER JOIN GC_CCyCtaContyRubroyCosto ON  GC_CCyCtaContyRubroyCosto.pkid_CC = CargoAbono.IDCentroDeCosto       

            AND GC_CCyCtaContyRubroyCosto.CuentaContable = CuentaContable.Cuenta  and GC_CCyCtaContyRubroyCosto.IDPlanCuentas = CuentaContable.IDPlanCuentas

WHERE   (VoucherContable.Anulado=0)          

AND  (CargoAbono.IDCentroDeCosto <> 0)           

AND  (Ejercicio.Año = '2024')          

GROUP BY CentroDeCosto.Codigo, CentroCostoPadre.Descripcion, CentroDeCosto.Descripcion, CuentaContable.Descripcion,       

CuentaContable.Cuenta, GC_CCyCtaContyRubroyCosto.Costo, GC_CCyCtaContyRubroyCosto.Rubro,Ejercicio.Año      

ORDER BY CentroCostoPadre, CentroCostoHijo, CuentaContable.Cuenta