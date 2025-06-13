--USE [FREDDY_prueba]
--GO

--/****** Object:  View [dbo].[usv_AnalisisVentas]    Script Date: 2/12/2024 22:39:05 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--se cambio IDSucursal por el campo SucursalID
ALTER view [dbo].[usv_AnalisisVentas]
as
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=case SucursalID when 100000203 then ValorVentaSoles else 0 end, 
PDV02=case SucursalID when 100000197 then ValorVentaSoles else 0 end, 
PDV04=case SucursalID when 100000198 then ValorVentaSoles else 0 end, 
PDV05=case SucursalID when 100000199 then ValorVentaSoles else 0 end, 
PDV07=case SucursalID when 100000200 then ValorVentaSoles else 0 end, 
PDV09=case SucursalID when 100000201 then ValorVentaSoles else 0 end,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_pdvs_sinVincSinVPM 
union all
Select Año, Mes, ValorVentaSoles as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_Alquiler
union all
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
ValorVentaSoles as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_Vinculadas_GCI
union all
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, ValorVentaSoles as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_Vinculadas_IRC

union all
Select Año, Mes, 0 as PDVALQ, ValorVentaSoles as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_TercerosVPM

union all
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, ValorVentaSoles as Vtas_Interes, 0 as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_intereses
union all
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, 0 as Vtas_Obsequios, ValorVentaSoles as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_Anticipos
union all
Select Año, Mes, 0 as PDVALQ, 0 as PDVPM_TERO, 
PDV06=0, PDV02=0, PDV04=0, PDV05=0, PDV07=0, PDV09=0,
0 as PDVVPM_GCI, 0 as PDVVPM_IRC, 0 as Vtas_Interes, ValorVentaSoles as Vtas_Obsequios, 0 as Vtas_Anticipos, ValorVentaSoles
From usv_ventas_Obsequios
GO


