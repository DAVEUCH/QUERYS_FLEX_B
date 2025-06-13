USE [FREDDY]
GO

/****** Object:  View [dbo].[usv_RelacionPedido_Guia_v2]    Script Date: 5/11/2024 09:25:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_RelacionPedido_Guia_v2]
as
select top 10
cpl.PKID as pkid_op,
cpl.FechaEmision as Fecha_op,
cpl.Hora as Hora_op,
cpl.NumCp as op,
cpa.PKID as pkid_guia,
cpa.FechaEmision as Fecha_guia,
cpa.Hora as Hora_guia,
cpa.NumCp as guia
from usv_RelacionPedido_Guia urg
inner join Cp cpa on cpa.PKID=urg.GR_Relacion
inner join Cp cpl on cpl.PKID= urg.pedido
GO


