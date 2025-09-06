SELECT     Periodo, 
NumeroCAR, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN 
SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber))) 
ELSE '0.00' END AS Debe, 
CASE WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) 
- SUM(CONVERT(decimal(16, 2), Debe))) ELSE '0.00' END AS Haber, 
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE   
(convert(date,FechaOperacion,103) BETWEEN @FDesde AND @FHasta)
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0) OR MAX(CodigoOperacion) = '1-05-2025-0000277'
ORDER BY CONVERT(date, FechaOperacion), NumeroCAR

select*from vrpte_LE_LibroDiario2010_001_v2 where CodigoOperacion='1-05-2025-0000277' 

--------------------------------------------------------------------------------------------------------------------

SELECT     Periodo, 
NumeroCAR, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN '0.00'
ELSE CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe))) END AS Debe,
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)))
WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)))
ELSE '0.00' END AS Haber,
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN @FDesde AND @FHasta)
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0) OR MAX(CodigoOperacion) = '1-05-2025-0000277'
ORDER BY CONVERT(date, FechaOperacion), NumeroCAR

-------------------------------------------------------------------------------------------------------

SELECT     Periodo, 
NumeroCAR, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN '0.00'
WHEN SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)))
ELSE '0.00' END AS Debe,
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)))
WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)))
ELSE '0.00' END AS Haber,
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN @FDesde AND @FHasta)
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0) OR MAX(CodigoOperacion) = '1-05-2025-0000277'
ORDER BY CONVERT(date, FechaOperacion), NumeroCAR
--------------------------------------------------------------------

SELECT     Periodo, 
NumeroCAR, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN '0.00'
WHEN SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)))
ELSE '0.00' END AS Debe,
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)))
WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)))
ELSE '0.00' END AS Haber,
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN @FDesde AND @FHasta)
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0) OR MAX(CodigoOperacion) = '1-05-2025-0000277'
ORDER BY CONVERT(date, FechaOperacion), NumeroCAR


-------------------------------------------CONFEEE--quedoooo 20-08-2025------------

SELECT     Periodo, 
NumeroCAR, CodigoOperacion
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa,
SUM(CONVERT(decimal(16,2), Debe)) AS Debe,SUM(CONVERT(decimal(16,2), Haber)) AS Haber,
CorrelativoRegistroVentas,CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones, 
EstadoOperacion, CampoLibre FROM dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN '01-06-2025' AND '02-06-2025')
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, 
FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones, 
CodigoOperacion, EsDebe UNION ALL
SELECT     Periodo, 
NumeroCAR, CodigoOperacion
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa,
CASE WHEN SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 
THEN SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) 
ELSE 0.00 END AS Debe, 
CASE WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 
THEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) 
ELSE 0.00 END AS Haber,CorrelativoRegistroVentas,
CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones, 
EstadoOperacion, CampoLibre
FROM dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN '01-06-2025' AND '02-06-2025')
GROUP BY Periodo, NumeroCAR, CodigoOperacion,CodigoPlanCuentas, CodigoCuentaContable, 
FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0)	

select*from vrpte_LE_LibroDiario2010_001_v2 where CodigoOperacion='6-06-2025-0000064'

select*from Cp where NumCp='FI01-0001349'

----------------------------------19-08-2025---------------------------------------------

SELECT     Periodo, 
NumeroCAR, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN '0.00'
WHEN SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)))
ELSE '0.00' END AS Debe,
CASE WHEN MAX(CodigoOperacion) = '1-05-2025-0000277' THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)))
WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)))
ELSE '0.00' END AS Haber,
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE (convert(date,FechaOperacion,103) BETWEEN @FDesde AND @FHasta)
GROUP BY Periodo, NumeroCAR, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0) OR MAX(CodigoOperacion) = '1-05-2025-0000277'
ORDER BY CONVERT(date, FechaOperacion), NumeroCAR








