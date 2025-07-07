SELECT DISTINCT LTRIM(RTRIM(CuentaContable.Cuenta)) 
FROM CuentaContable 
WHERE CuentaContable.Cuenta LIKE '%6211101%'

SELECT vcpe.Año, CuentaContable.Cuenta, CuentaContable.Descripcion,
       CentroDeCosto.Codigo AS Cod_CC, CentroDeCosto.Descripcion AS CentroCosto,
       vcpe.ENERO, vcpe.FEBRERO, vcpe.TOTAL
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable ON CuentaContable.PKID = vcpe.IDCuentaContable
INNER JOIN CentroDeCosto ON CentroDeCosto.PKID = vcpe.IDCentroDeCosto
WHERE CuentaContable.Cuenta = '6211101'
  AND vcpe.Año = 2025


  SELECT CptoOperacionID, COUNT(*) AS Cantidad, SUM(TOTAL) AS TotalMonto
FROM VoucherContable_PresupuestosyEjecutados
WHERE IDCuentaContable = 900015091 AND IDCentroDeCosto = 104 AND Año = 2025
GROUP BY CptoOperacionID

SELECT CptoOperacionID, SUM(ENERO) AS TotalEnero
FROM VoucherContable_PresupuestosyEjecutados
WHERE IDCuentaContable = 900015091  AND IDCentroDeCosto = 104 AND Año = 2025
GROUP BY CptoOperacionID

SELECT 
  vcpe.CptoOperacionID,
  vcpe.ENERO
  --COUNT(*) AS NroFilas
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE LTRIM(RTRIM(cc.Cuenta)) = '6211101'
  AND vcpe.Año = 2025
GROUP BY vcpe.CptoOperacionID

select*from CargoAbono where IDCuentaContable=900015091 and id

select  IDVoucher,NumCp,per.Descripcion as periodo, asi.Glosa,IDCuentaContable,Cuenta,Cargo,Abono,IDCentroDeCosto from VoucherContable vou
left join Asiento asi on asi.IDVoucher=vou.PKID
left join CargoAbono carg on carg.IDAsiento=asi.PKID
left join CuentaContable cuen on carg.IDCuentaContable=cuen.PKID
left join Periodo per on per.PKID=vou.IDPeriodo
where cuen.Cuenta='6251101'
and vou.IDPeriodo=100000484
select*from Cp where NumCp='001-0021821'
select*from CuentaContable where Cuenta='6211101' 
select*from CuentaContable where Cuenta='6251101' 

select *from VoucherContable_PresupuestosyEjecutados where Año='2025' and IDCuentaContable=900015103

select *from GC_CCyCtaContyRubroyCosto where CuentaContable='6211101'
--select top 10*from Asiento
--select top 10*from CargoAbono
--select*from LibroAuxiliar
select*from Periodo

SELECT *
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE LTRIM(RTRIM(cc.Cuenta)) = '6211101'
  AND vcpe.Año = 2025
  AND vcpe.CptoOperacionID <> 1977





SELECT vcpe.CptoOperacionID, SUM(vcpe.ENERO) AS TotalEnero
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE cc.Cuenta = '6211101' AND vcpe.IDCentroDeCosto = 104 AND vcpe.Año = 2025
GROUP BY vcpe.CptoOperacionID

SELECT cc.Cuenta, cc.Descripcion, vcpe.IDCentroDeCosto, vcpe.CptoOperacionID, vcpe.ENERO, vcpe.Año
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE LTRIM(RTRIM(cc.Cuenta)) = '6211101'
  AND vcpe.Año = 2025

  SELECT PKID, Codigo, Descripcion 
FROM CentroDeCosto 
WHERE PKID = 14


SELECT vcpe.CptoOperacionID,cc.Cuenta, SUM(vcpe.ENERO) AS TotalEnero
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE LTRIM(RTRIM(cc.Cuenta)) = '6211101'
  AND vcpe.IDCentroDeCosto = 14
  AND vcpe.Año = 2025
GROUP BY vcpe.CptoOperacionID,cc.Cuenta


SELECT 
  cc.Cuenta, 
  cc.Descripcion AS CuentaDescripcion,
  cdc.Codigo AS CodCentroCosto,
  cdc.Descripcion AS DescCentroCosto,
  SUM(CASE WHEN vcpe.CptoOperacionID = 1977 THEN vcpe.TOTAL ELSE 0 END) AS Total_Proyectado,
  SUM(CASE WHEN vcpe.CptoOperacionID <> 1977 THEN vcpe.TOTAL ELSE 0 END) AS Total_Ejecutado
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
INNER JOIN CentroDeCosto cdc ON cdc.PKID = vcpe.IDCentroDeCosto
WHERE vcpe.Año = 2025
GROUP BY cc.Cuenta, cc.Descripcion, cdc.Codigo, cdc.Descripcion
HAVING 
  SUM(CASE WHEN vcpe.CptoOperacionID = 1977 THEN vcpe.TOTAL ELSE 0 END) > 0 AND
  SUM(CASE WHEN vcpe.CptoOperacionID <> 1977 THEN vcpe.TOTAL ELSE 0 END) = 0


  ---------------------------
  -- Esto devuelve datos
SELECT cc.Cuenta, vcpe.CptoOperacionID, vcpe.ENERO
FROM VoucherContable_PresupuestosyEjecutados vcpe
INNER JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE LTRIM(RTRIM(cc.Cuenta)) = '6211101' AND vcpe.Año = 2025


-- Buscar cuentas que tienen solo proyectado (1977) pero no ejecutado (0 u otro)
SELECT cc.Cuenta, cc.Descripcion, vcpe.IDCentroDeCosto, COUNT(*) AS Registros
FROM VoucherContable_PresupuestosyEjecutados vcpe
JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE vcpe.Año = 2025
GROUP BY cc.Cuenta, cc.Descripcion, vcpe.IDCentroDeCosto
HAVING 
	SUM(CASE WHEN vcpe.CptoOperacionID = 1977 THEN 1 ELSE 0 END) > 0 AND
	SUM(CASE WHEN vcpe.CptoOperacionID <> 1977 THEN 1 ELSE 0 END) = 0

	----------------------------

	SELECT 
  vcpe.CptoOperacionID,
  vcpe.ENERO,
  cc.Cuenta,
  cc.Descripcion,
  vcpe.IDCentroDeCosto
FROM VoucherContable_PresupuestosyEjecutados vcpe
JOIN CuentaContable cc ON cc.PKID = vcpe.IDCuentaContable
WHERE cc.Cuenta = '6211101'
  AND vcpe.Año = 2025
  AND vcpe.CptoOperacionID <> 1977
-------------------------------------
select top 1*from VoucherContable_PresupuestosyEjecutados
select*from CuentaContable where Cuenta='6211101'

----

sp_helptext 'VoucherContable_Ejecutados'


SELECT *
FROM VoucherContable_Ejecutados
WHERE IDCuentaContable IN (
  SELECT PKID FROM CuentaContable WHERE Cuenta = '6211101'
)
AND Año = 2025


SELECT DISTINCT IDCentroDeCosto
FROM CargoAbono
INNER JOIN CuentaContable cc ON cc.PKID = CargoAbono.IDCuentaContable
WHERE cc.Cuenta = '6211101'
  AND CargoAbono.IDCentroDeCosto = 0



  SELECT *
FROM CargoAbono ca
INNER JOIN CuentaContable cc ON cc.PKID = ca.IDCuentaContable
INNER JOIN Asiento asi ON asi.PKID = ca.IDAsiento
INNER JOIN VoucherContable vou ON vou.PKID = asi.IDVoucher
INNER JOIN Periodo per ON per.PKID = vou.IDPeriodo
INNER JOIN Ejercicio eje ON eje.PKID = per.IDEjercicio
INNER JOIN CP cp ON cp.PKID = vou.IDCp
WHERE cc.Cuenta = '6211101'
  AND vou.Anulado = 0
  AND cp.Anulado = 0
  AND cp.IDCptoOperacion <> 1977
  AND eje.Año = 2025



SELECT ca.IDCuentaContable, ca.IDCentroDeCosto, eje.Año, cp.IDCptoOperacion, ca.CargoMonedaBase, ca.AbonoMonedaBase
FROM CargoAbono ca
INNER JOIN CuentaContable cc ON cc.PKID = ca.IDCuentaContable
INNER JOIN Asiento asi ON asi.PKID = ca.IDAsiento
INNER JOIN VoucherContable vou ON vou.PKID = asi.IDVoucher
INNER JOIN Periodo per ON per.PKID = vou.IDPeriodo
INNER JOIN Ejercicio eje ON eje.PKID = per.IDEjercicio
INNER JOIN Cp cp ON cp.PKID = vou.IDCp
WHERE cc.Cuenta = '6211101'
  AND vou.Anulado = 0
  AND cp.Anulado = 0
  AND cp.IDCptoOperacion <> 1977
  AND eje.Año = 2025



SELECT cp.IDCptoOperacion, COUNT(*) AS Registros
FROM CargoAbono ca
INNER JOIN CuentaContable cc ON cc.PKID = ca.IDCuentaContable
INNER JOIN Asiento asi ON asi.PKID = ca.IDAsiento
INNER JOIN VoucherContable vou ON vou.PKID = asi.IDVoucher
INNER JOIN Periodo per ON per.PKID = vou.IDPeriodo
INNER JOIN Ejercicio eje ON eje.PKID = per.IDEjercicio
INNER JOIN Cp cp ON cp.PKID = vou.IDCp
WHERE cc.Cuenta = '6211101'
  AND vou.Anulado = 0
  AND cp.Anulado = 0
  AND eje.Año = 2025
GROUP BY cp.IDCptoOperacion


Select * From fFB_ReporteCentroCostosProyectados(2025)



