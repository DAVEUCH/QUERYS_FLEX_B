USE [FREDDY_prueba]
GO

/****** Object:  View [dbo].[usv_ventas_Vinculadas_IRC]    Script Date: 2/12/2024 22:27:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_ventas_Vinculadas_IRC]
as
Select FechaEmision, Año, Mes, idPeriodo, 
IDCliente, IDCptoOperacion, IDTipocp,
SucursalID,
--IDSucursal, 
ValorVentaSoles, ValorIGVSoles, TotalSoles
From usv_ventasGenerales_asoles
Where (IDCliente=398)
AND (IDCptoOperacion <> 1630)  
AND (IDTipoCp IN (5155, 5157, 5158, 5535, 5541)) --VPM
GO


