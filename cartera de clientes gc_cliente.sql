Select Codigo, Nombre, Direccion, Localidad, Telefono, Email ,Linea_Credito, Linea_Utilizada, 
Linea_Disponible, Categoria, TipoCliente, UltimaFechaVenta, Condicion_Cliente, Estado_Cliente, 
Score_Cliente, Vendedor, Vende_Asignado, RUCCliente, fechaCrea, OBSERVACION, CATEGORIZACION,
Fecha_UltimaCompra_Contado, Fecha_UltimaCompra_Credito from usv_CarteraClientes_new 
where Codigo='20480311613'

SELECT
    CLI.PKID AS Id,
    --GCC.IDPersona,
    PER.DocIdentidad,
    --PER.Nombre,
	--DIRE.Descripcion,
	--PER.fechaCrea,
	--iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc,
	GCC.fecUlt_Vta_credito,
	GCC.fecUlt_Vta_contado,
	GCC.fecAnt_aUlt_Vta,
	GCC.fecUlt_Vta,
	GCC.Estado_Contribuyente_SUNAT,
	GCC.Score
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
--LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
left join GC_Cliente GCC on GCC.IDPersona=CLI.PKID
WHERE PER.Codigo in ( '20480311613')

select top 10*from GC_Cliente where fecUlt_Vta is null
select*from Persona where DocIdentidad in (
'20480311613',
'20525307418')

select*from GC_Cliente where IDPersona in (
279,823)

update GC_Cliente set fecUlt_Vta_contado='18-06-2025' where IDPersona in (306)
update GC_Cliente set fecUlt_Vta_contado='20-02-2012' where IDPersona in (309)
update GC_Cliente set fecUlt_Vta_contado='25-06-2025' where IDPersona in (359)
update GC_Cliente set fecUlt_Vta_contado='22/02/2014' where IDPersona in (611)
update GC_Cliente set fecUlt_Vta_contado='13/01/2014' where IDPersona in (640)
update GC_Cliente set fecUlt_Vta_contado='26/07/2013' where IDPersona in (756)
update GC_Cliente set fecUlt_Vta_contado='9/08/2016' where IDPersona in (789)
update GC_Cliente set fecUlt_Vta_contado='10/06/2025' where IDPersona in (827)
update GC_Cliente set fecUlt_Vta_contado='13/06/2014' where IDPersona in (937)
update GC_Cliente set fecUlt_Vta_contado='29/09/2012' where IDPersona in (1055)
update GC_Cliente set fecUlt_Vta_contado='31/08/2012' where IDPersona in (1163)
update GC_Cliente set fecUlt_Vta_contado='13/12/2021' where IDPersona in (1408)


update GC_Cliente set fecUlt_Vta_credito='20-10-2017' where IDPersona in (279)
update GC_Cliente set fecUlt_Vta_credito='27-03-2013' where IDPersona in (823)

