select
--per.*
cpv.PKID,
cpv.NumCp,
cpV.FechaEmision,
per.Codigo,
cpven.DocIdentidad,
emp.IDCargoEmpleado,
tcpv.Codigo as codigodoc,
tcpv.TipoCp,
tcpv.Descripcion,
cpv.PersonaNombre,
cpven.Direccion,
per.Nombre as Cliente,
cpven.EstadoDevolucion,
cpo.Descripcion,
ven.Nombre as Vendedor,
dire.Descripcion as Direccion,
mar.Descripcion as Marca,
mon.Simbolo as Moneda,
alpdv.Codigo+' - '+ alpdv.Nombre as Almacen,
prose.Codigo,
prose.Descripcion as Nom_prod,
icp.Cantidad,
und.Abreviacion as UM,
iven.PrecioLista as Precio_unit_Det,
iven.DescuentoAplicado as Descu_Det,
round(icp.ValorUnitario,2) as Precio_neto_Det,
round(icp.SubTotal,2) as Total_Det,
cpv.ValorAfecto,
cpv.ValorInafecto,
cpv.ValorVenta,
cpv.SubTotal
from Cp cpv
INNER join CpVenta cpven  on cpven.PKID=cpv.PKID
INNER join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join CptoOperacion cpo on cpo.PKID=cpv.IDCptoOperacion
left join Moneda mon on mon.PKID=cpv.IDMoneda
left join CptoOperacion co on co.PKID=cpv.IDCptoOperacion
left join Sucursal su on su.PKID=Cpv.IDSucursal 
left join Almacen_PDV alpdv on alpdv.IDSucursal=su.PKID
left join ItemCp icp on icp.IDCp=cpv.PKID--INSERT
left join ItemCpVenta iven on icp.PKID=iven.PKID
left join ItemProducto ipro on ipro.PKID=iven.PKID 
left join ProductoServicio prose on prose.PKID=ipro.IDProducto
left join Producto pro on pro.PKID=ipro.IDProducto
left join Unidad und on und.PKID=ipro.IDUnidad
left join Marca mar on mar.PKID= pro.IDMarca
left join Persona ven on ven.PKID=cpv.IDResponsable
left join Direccion dire on dire.IDPersona=per.PKID
where cpv.NumCp='F05-0011227' and cpv.PKID=2858856
order by cpV.FechaEmision
