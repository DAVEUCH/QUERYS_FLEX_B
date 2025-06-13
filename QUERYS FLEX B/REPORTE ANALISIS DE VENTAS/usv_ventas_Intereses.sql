USE [FREDDY_prueba]
GO

/****** Object:  View [dbo].[usv_ventas_Intereses]    Script Date: 2/12/2024 23:04:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_ventas_Intereses]
as
Select FechaEmision, Año, Mes, idPeriodo, 
IDCliente, IDCptoOperacion, IDTipocp,
SucursalID,
--IDSucursal,
ValorVentaSoles, ValorIGVSoles, TotalSoles
From usv_ventasGenerales_asoles
Where (IDCptoOperacion = 1920) -- intereses

GO


