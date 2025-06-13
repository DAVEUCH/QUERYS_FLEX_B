USE [FREDDY]
GO

/****** Object:  View [dbo].[usv_RelacionPedido_Guia]    Script Date: 5/11/2024 09:38:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_RelacionPedido_Guia]
as
select
Pedido.PKID as pedido,
isnull((select top 1 IDCp from CpRelacionado where IDTipoCpDestino='878' and idCpRelacionado=CP.pkid),0) as GR_Relacion
From Cp 
Inner join Pedido On Pedido.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal 
GO


