USE [FREDDY_prueba]
GO

/****** Object:  View [dbo].[usv_ventasAnticipos_asoles]    Script Date: 2/12/2024 23:03:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_ventasAnticipos_asoles]
as
Select Cp.pkid as IDVta, Cp.FechaEmision, cast(Ejercicio.Año as int) as Año, cast(Periodo.Mes as int) as Mes, Cp.idPeriodo, Cp.numCp as NumeroDoc, 
Cp.IDPersona as IDCliente, Cp.PersonaNombre as NombreCliente, 
Cp.IDCptoOperacion, Cp.IDTipocp, 
-----recien agregado 2-12-2024
case when dbo.TipoCp.Codigo in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07',
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 100000200 else dbo.Cp.IDSucursal end as SucursalID,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then '0008' else dbo.Sucursal.Codigo end as SucursalCodigo,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 'SUCURSAL - PDV 07' else dbo.Sucursal.Nombre end as SucursalNombre,
--Cp.IDSucursal, 
(case Cp.IDMoneda when 1 then Cp.ValorVenta else (Cp.ValorVenta*Cp.TipoCambio) end) * case Cp.idCptoOperacion when 1897 then -1 else 1 end as ValorVentaSoles, 
(case Cp.IDMoneda when 1 then (Cp.Subtotal-Cp.ValorVenta) else ((Cp.Subtotal-Cp.ValorVenta)*Cp.TipoCambio) end) * case Cp.idCptoOperacion when 1897 then -1 else 1 end as ValorIGVSoles, 
(case Cp.IDMoneda when 1 then Cp.Total else (Cp.Total*Cp.TipoCambio) end) * case Cp.idCptoOperacion when 1897 then -1 else 1 end as TotalSoles
From Cp 
inner join Periodo on Periodo.pkid = Cp.IDPeriodo 
inner join Ejercicio on Ejercicio.pkid = Periodo.IDEjercicio 
inner join CpCobrarPagar on CpCobrarPagar.pkid = Cp.pkid
---recien agregado 2-12-2024
INNER JOIN dbo.TipoCp  ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp
INNER JOIN dbo.Sucursal  ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID   
Where Cp.Anulado = 0
And (Cp.IDTipoAsociado IN ('883', '818', '868')) 
And (Cp.idCptoOperacion in (1850, 1897, 1898)) -- anticipos


GO


