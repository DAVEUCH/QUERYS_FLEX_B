--USE [FREDDY_prueba]
--GO

--/****** Object:  View [dbo].[usv_AnalisisVentas_Sum]    Script Date: 5/12/2024 15:26:59 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

ALTER view [dbo].[usv_AnalisisVentas_Sum]
as
Select año, mes, right('0'+cast(vtas.Mes as varchar(2)),2) + '-' + cast(vtas.Año as varchar) as Periodo,
PDVALQ=Sum(vtas.PDVALQ),
PDVPM_TERO=Sum(vtas.PDVPM_TERO),
PDV06=Sum(vtas.PDV06),
PDV02=Sum(vtas.PDV02),
--PDV04=Sum(vtas.PDV04),
PDV05=Sum(vtas.PDV05),
--PDV07=Sum(vtas.PDV07),
PDV07 = SUM(CASE WHEN vtas.Mes <= 7 THEN vtas.PDV07 ELSE 0 END),
--[PDV09-CORPORATIVO]=Sum(vtas.PDV07),
 [PDV09-CORPORATIVO] = SUM(CASE WHEN vtas.Mes > 7 THEN vtas.PDV07 ELSE 0 END),
PDV09=Sum(vtas.PDV09),
PDVVPM_GCI=Sum(vtas.PDVVPM_GCI),
PDVVPM_IRC=Sum(vtas.PDVVPM_IRC),
Vtas_Interes=Sum(vtas.Vtas_Interes),
Vtas_Obsequios=Sum(vtas.Vtas_Obsequios),
Vtas_Anticipos=Sum(vtas.Vtas_Anticipos), 
Vtas_Total=Sum(vtas.ValorVentaSoles) 
From usv_AnalisisVentas vtas
Group by año, mes, right('0'+cast(vtas.Mes as varchar(2)),2) + '-' + cast(vtas.Año as varchar) 
GO


