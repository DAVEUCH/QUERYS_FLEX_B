SELECT  
 dbo.Cp.NumCp,
 dbo.Cp.Fecha,
 dbo.Cp.Hora,
 dbo.Cp.PersonaNombre,
 dbo.Persona.DocIdentidad AS PersonaDocIdentidad,
 Departamento.Descripcion  as Localidad, 
 dbo.Pedido.EstadoAprobacion, 
 dbo.Pedido.EstadoFacturacion,
 dbo.Pedido.EstadoEntrega,
 dbo.Cp.Total,
 dbo.Sucursal.Nombre AS SucursalNombre,
 dbo.Sucursal.PKID AS SucursalID,
 dbo.cp.Observacion,
Freddy.PedidoFreddy.PorcentajeComisionExterna as PorcentajeComision,
Persona_1.Nombre as Vendedor,
dbo.ModalidadCredito.Descripcion AS ModalidadCredito,
prose.Codigo,
mar.Descripcion as Marca,
prose.Descripcion as Nom_prod,
icp.Cantidad
FROM dbo.TipoDocIdentidad 
INNER JOIN dbo.Cp WITH (NOLOCK)
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID
INNER JOIN dbo.Pedido WITH (NOLOCK) ON dbo.Cp.PKID = dbo.Pedido.PKID 
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID 
INNER JOIN dbo.Persona WITH (NOLOCK) ON dbo.Cp.IDPersona = dbo.Persona.PKID ON dbo.TipoDocIdentidad.PKID = dbo.Persona.IDTipoDocIdentidad 
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID 
INNER JOIN dbo.Vendedor ON Persona_1.PKID = dbo.Vendedor.PKID 
INNER JOIN dbo.Direccion ON dbo.Direccion.IDPersona = dbo.Cp.IDPersona and dbo.Direccion.DireccionPrincipal=1
INNER JOIN dbo.Departamento ON dbo.Direccion.IDDepartamento = dbo.Departamento.PKID 
LEFT OUTER JOIN dbo.FEstado ON dbo.Pedido.PKID = dbo.FEstado.IDEntidad 
LEFT OUTER JOIN Freddy.PedidoFreddy ON dbo.Pedido.PKID = Freddy.PedidoFreddy.PKID 
LEFT OUTER JOIN dbo.FuerzaVentas INNER JOIN dbo.Zona 
INNER JOIN dbo.CpDistribucion WITH (NOLOCK) ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaReparto ON dbo.FuerzaVentas.PKID = dbo.CpDistribucion.IDFuerzaVentas ON  dbo.Cp.PKID = dbo.CpDistribucion.PKID 
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.Pedido.IDModalidadCredito = dbo.ModalidadCredito.PKID 
LEFT OUTER JOIN dbo.LineaCreditoPorFuerzaVentas ON dbo.LineaCreditoPorFuerzaVentas.IDFuerzaVentas = dbo.CpDistribucion.IDFuerzaVentas AND 
dbo.LineaCreditoPorFuerzaVentas.IDCliente = dbo.Cp.IDPersona 
LEFT OUTER JOIN dbo.DireccionZona AS DZ ON DZ.IDCliente = dbo.LineaCreditoPorFuerzaVentas.IDCliente AND DZ.IDZona = dbo.CpDistribucion.IDZonaVenta
left join ItemCp icp on icp.IDCp=dbo.Cp.PKID
left join ItemPedido iped on icp.PKID=iped.PKID
left join ItemProducto ipro on ipro.PKID=iped.PKID
left join ProductoServicio prose on prose.PKID=ipro.IDProducto
left join Producto pro on pro.PKID=ipro.IDProducto
left join Marca mar on mar.PKID= pro.IDMarca
where dbo.Cp.Fecha between '20240901' and '20240919'
and  dbo.Cp.NumCp='814-0048826'

select*from Estado