--USE [FREDDY]
--GO
--/****** Object:  StoredProcedure [dbo].[usp_propuesta_rvie_noexisten]    Script Date: 9/06/2025 16:02:26 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

--ALTER procedure [dbo].[usp_propuesta_rvie_noexisten]
--(
--@Periodocod	varchar(10)
--)
--as
Select pvta.TipoDoc_identidad, pvta.NroDoc_Identidad, pvta.Razon_Social_prov, pvta.Serie_CDP, pvta.NroCp_inicial, 
pvta.BI_GravadoDG as ValorVta, pvta.IGV_IPMDG as ValorIGV, pvta.TotalCP as Total, pvta.Fecha_emision as fecEmision 
From propuesta_rvie pvta
left outer join (Select * from usv_vrpteRegistroVentas where Periodocod=202503) vta on left(vta.NroDocIdentidad,12)=pvta.NroDoc_Identidad 
--and vta.TipoComprobantePagoCod=pvta.TipoDoc_identidad 
and vta.NUmeroSerie=pvta.Serie_CDP and vta.NumCp=pvta.NroCp_inicial
and vta.ValorVta=(pvta.BI_GravadoDG+pvta.Dscto_BI) and vta.ValorIGV=(pvta.IGV_IPMDG+pvta.Dscto_IGVIPM) and vta.Total=pvta.TotalCP 
Where isnull(vta.NumCp,'')=''
And pvta.periodo=202503

select top 10*from propuesta_rvie
select*from Periodo

select*from Persona where DocIdentidad='90000000006' 
select*from Proveedor where PKID=8232
select *from proveedorext_codpais where idProveedor=8232
insert into proveedorext_codpais (idProveedor,codPais) values
(8232,9249)