--USE [FREDDY]
--GO

--/****** Object:  View [dbo].[usv_ventasGenerales_asoles]    Script Date: 2/12/2024 14:49:38 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


ALTER view [dbo].[usv_ventasGenerales_asoles]
as
Select
--top 10
Cp.pkid as IDVta, Cp.FechaEmision, cast(Ejercicio.Año as int) as Año, cast(Periodo.Mes as int) as Mes, Cp.idPeriodo, Cp.numCp as NumeroDoc, 
dbo.TipoCp.Codigo,
Cp.IDPersona as IDCliente, Cp.PersonaNombre as NombreCliente, 
Cp.IDCptoOperacion,
Cp.IDTipocp, 
-----recien agregado 2-12-2024
case when dbo.TipoCp.Codigo in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07',
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 100000200 else dbo.Cp.IDSucursal end as SucursalID,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then '0008' else dbo.Sucursal.Codigo end as SucursalCodigo,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 'SUCURSAL - PDV 07' else dbo.Sucursal.Nombre end as SucursalNombre,
--Cp.IDSucursal, 
(case Cp.IDMoneda when 1 then Cp.ValorVenta else (Cp.ValorVenta*Cp.TipoCambio) end) * CpCobrarPagar.MovSaldo as ValorVentaSoles, 
(case Cp.IDMoneda when 1 then (Cp.Subtotal-Cp.ValorVenta) else ((Cp.Subtotal-Cp.ValorVenta)*Cp.TipoCambio) end) * CpCobrarPagar.MovSaldo as ValorIGVSoles, 
(case Cp.IDMoneda when 1 then Cp.Total else (Cp.Total*Cp.TipoCambio) end) * CpCobrarPagar.MovSaldo as TotalSoles
From Cp 
inner join Periodo on Periodo.pkid = Cp.IDPeriodo 
inner join Ejercicio on Ejercicio.pkid = Periodo.IDEjercicio 
inner join CpCobrarPagar on CpCobrarPagar.pkid = Cp.pkid
---recien agregado 2-12-2024
INNER JOIN dbo.TipoCp  ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp
INNER JOIN dbo.Sucursal  ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID   
Where Cp.Anulado = 0
And (Cp.IDTipoAsociado in ('883', '818', '868')) 
And (Cp.idcptoOperacion not in (1850, 1897, 1898))  -- anticipos
--and Año='2024'
--and dbo.Cp.IDSucursal=100000200
--and dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
--'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7')
--and mes in(10,11,12)
--order by Mes asc
GO

--select *from usv_ventasGenerales_asoles where SucursalID=100000200 AND Mes in(10,11,12) AND Año='2024'

--select*from Cp where
--IDPeriodo in(100000489,100000490,100000491) 
--and IDTipoCp in (4902,4904,4945,5507,5513,5519,
--5577,5583,5638,5639,5641,5642)

--select*from TipoCp where Codigo in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07',
--'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') 

--select*from Periodo




