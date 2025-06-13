USE [GCI]
GO

/****** Object:  View [dbo].[usv_GC_Vendedores_AsistenteVPM]    Script Date: 4/11/2024 17:20:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_GC_Vendedores_AsistenteVPM]
as
Select  vdeasis.idAsistente, vdeasis.idVendedor, asis.Nombres_Asist+' '+asis.apepat_Asist as ASISTENTE, 
Persona.Nombre as VENDEDOR, asis.Transacc_1, asis.Transacc_2
From GC_Vendedores_AsistenteVPM vdeasis
Left outer join GC_AsistenteVPM asis On asis.pkid = vdeasis.idAsistente 
Left outer join Persona On Persona.pkid = vdeasis.idVendedor 

GO

select*from GC_Vendedores_AsistenteVPM
select *from GC_AsistenteVPM
select*from Persona where PKID=5642

update GC_AsistenteVPM set Nombres_Asist='INGRID',apepat_Asist='MORALES' WHERE pkid=1
update GC_AsistenteVPM set Nombres_Asist='MIGUEL',apepat_Asist='CALDERON' WHERE pkid=3



