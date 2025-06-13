USE [FREDDY_prueba]
GO

/****** Object:  View [dbo].[usv_ventas_alquiler]    Script Date: 2/12/2024 22:23:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_ventas_alquiler]
as
Select FechaEmision, Año, Mes, idPeriodo, 
IDCliente, IDCptoOperacion, IDTipocp, 
SucursalID,
--IDSucursal, 
ValorVentaSoles, ValorIGVSoles, TotalSoles
From usv_ventasGenerales_asoles
Where (IDCliente in (3582,398)) --vinculadas
AND (IDCptoOperacion in (1056, 1624, 1641, 1749, 1896) ) --CONCEPTO OTROS SERVICIOS (ARRENDAMIENTO)
GO


