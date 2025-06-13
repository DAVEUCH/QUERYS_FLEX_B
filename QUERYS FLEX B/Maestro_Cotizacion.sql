SELECT
cpv.PKID,
co.Codigo as CodConcepto,
co.Descripcion as NombCodConcepto,
tcpv.Codigo as Codigodoc,
tcpv.Descripcion as DescDocumen,
tcpv.TipoCp,
cpv.NumCp,
cpV.FechaEmision,
per.Codigo,
cpv.PersonaNombre,
ven.Nombre as Vendedor,
dire.Descripcion as Direccion,
mar.Descripcion as Marca,
mon.Simbolo as Moneda,
alpdv.Codigo+' - '+ alpdv.Nombre as Almacen,
prose.Codigo,
prose.Descripcion as Nom_prod,
icp.Cantidad,
und.Abreviacion as UM,
icot.PrecioLista as Precio_unit_Det,
icot.DescuentoAplicado as Descu_Det,
round(icp.ValorUnitario,2) as Precio_neto_Det,
round(icp.SubTotal,2) as Total_Det,
cpv.ValorAfecto as Valor_Afecto,
cpv.Total - cpv.ValorAfecto as Impuesto,
cpv.Total

FROM CP cpv
inner join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join Cotizacion coti on coti.PKID=cpv.PKID--INSERT
left join Moneda mon on mon.PKID=cpv.IDMoneda
left join CptoOperacion co on co.PKID=cpv.IDCptoOperacion
left join Sucursal su on su.PKID=Cpv.IDSucursal 
left join Almacen_PDV alpdv on alpdv.IDSucursal=su.PKID
left join ItemCp icp on icp.IDCp=cpv.PKID--INSERT
left join ItemCotizacion icot on icp.PKID=icot.PKID --INSERT
left join ItemProducto ipro on ipro.PKID=icot.PKID --INSERT
left join ProductoServicio prose on prose.PKID=ipro.IDProducto
left join Producto pro on pro.PKID=ipro.IDProducto
left join Unidad und on und.PKID=ipro.IDUnidad
left join Marca mar on mar.PKID= pro.IDMarca
left join Persona ven on ven.PKID=cpv.IDResponsable
left join Direccion dire on dire.IDPersona=per.PKID
where cpv.NumCp='214-0017994' and cpv.PKID=2786772