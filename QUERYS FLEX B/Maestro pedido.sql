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
iped.CantidadPedida as cant2,
--iped.CantidadAEntregar as cant3,
--ipro.CantidadB as cant4,
ipro.CantidadBase as cant5,
und.Abreviacion as UM,
iped.PrecioLista as Precio_unit_Det,
iped.DescuentoAplicado as Descu_Det,
round(icp.ValorUnitario,2) as Precio_neto_Det,
round(icp.SubTotal,2) as Total_Det,
cpv.ValorAfecto as Valor_Afecto,
cpv.Total - cpv.ValorAfecto as Impuesto,
cpv.Total

FROM CP cpv
inner join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join Pedido pe on pe.PKID=cpv.PKID--INSERT
left join Moneda mon on mon.PKID=cpv.IDMoneda
left join CptoOperacion co on co.PKID=cpv.IDCptoOperacion
left join Sucursal su on su.PKID=Cpv.IDSucursal 
left join Almacen_PDV alpdv on alpdv.IDSucursal=su.PKID
left join ItemCp icp on icp.IDCp=cpv.PKID--INSERT
left join ItemPedido iped on icp.PKID=iped.PKID --INSERT
left join ItemProducto ipro on ipro.PKID=iped.PKID --INSERT
left join ProductoServicio prose on prose.PKID=ipro.IDProducto
left join Producto pro on pro.PKID=ipro.IDProducto
left join Unidad und on und.PKID=ipro.IDUnidad
left join Marca mar on mar.PKID= pro.IDMarca
left join Persona ven on ven.PKID=cpv.IDResponsable
left join Direccion dire on dire.IDPersona=per.PKID
where 
 cpv.Fecha Between '20241101'  AND  '20241105'
 and
 tcpv.TipoCp='Pedido'
 and cpv.Anulado=0
 ----and tcpv.Codigo like 'PT0%'
--cpv.NumCp='814-0049311'

select top 3*from Cp where PKID=2828513
select top 3*from Pedido where PKID=2784437 --order by PKID desc 
select top 3*from ItemCp where IDCp=2784437
select top 3*from ItemPedido where PKID in (8606779,8606780)
select top 3*from ItemProducto where PKID in (8606779,8606780)
select top 3* from ProductoServicio where PKID in (22815,22824)
--select top 10*from Direccion
select top 3*from Cp order by PKID desc 
select top 3* from CptoOperacion
select top 3* from Cp where NumCp='914-0048241'
select top 1000* from Almacen_PDV
select top 3* from Cliente
select top 3 *from TipoCp
select top 3* from Almacen
select top 3* from ItemProducto
select top 3*from TipoVoucher
select top 3* from Periodo
select * from Sucursal
select top 3* from Producto
select top 3* from ProductoServicio where PKID in (22815,22824)
select top 3* from Unidad where PKID in (22815,22824)
select top 10*from Persona where Codigo='20608636065'
select top 10*from Direccion where IDPersona=9055


--select top 10*from Cp
--where PKID=785199 order by PKID desc 

select*
FROM CP cpv
inner join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join Pedido pe on pe.PKID=cpv.PKID



