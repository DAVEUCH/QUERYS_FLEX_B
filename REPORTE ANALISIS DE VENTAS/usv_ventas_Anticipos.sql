USE [FREDDY_prueba]
GO

/****** Object:  View [dbo].[usv_ventas_Anticipos]    Script Date: 2/12/2024 23:03:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_ventas_Anticipos]
as
Select FechaEmision, Año, Mes, idPeriodo, 
IDCliente, IDCptoOperacion, IDTipocp,
SucursalID,
--IDSucursal, 
ValorVentaSoles, ValorIGVSoles, TotalSoles
From usv_ventasAnticipos_asoles
GO


