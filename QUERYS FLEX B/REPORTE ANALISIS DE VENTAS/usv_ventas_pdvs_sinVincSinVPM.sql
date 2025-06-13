--USE [FREDDY]
--GO

--/****** Object:  View [dbo].[usv_ventas_pdvs_sinVincSinVPM]    Script Date: 2/12/2024 14:48:41 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

ALTER view [dbo].[usv_ventas_pdvs_sinVincSinVPM]
as
Select FechaEmision, Año, Mes, idPeriodo, 
IDCliente, IDCptoOperacion, IDTipocp, 
SucursalID,
--IDSucursal, 
ValorVentaSoles, ValorIGVSoles, TotalSoles
From usv_ventasGenerales_asoles
Where IDCptoOperacion <> 1630
AND (IDCliente <> 3582 and IDCliente <> 398) --Excluyendo vinculadas
AND (IDTipoCp NOT IN (5155, 5157, 5158)) --VPM
--and Año='2024'
--and SucursalID=100000200
--order by Mes
GO


