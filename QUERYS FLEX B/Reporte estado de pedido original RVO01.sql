SELECT     dbo.Cp.NumCp,
dbo.Cp.Fecha,dbo.Cp.Hora,
vendedor_1.Nombre as Vendedor,
dbo.Persona.DocIdentidad AS PersonaDocIdentidad,
dbo.Cp.PersonaNombre, 
CASE WHEN Provincia.Descripcion = 'LIMA' THEN Distrito.Descripcion ELSE Provincia.Descripcion END AS Localidad,
dbo.Pedido.EstadoFacturacion, dbo.Pedido.EstadoEntrega,dbo.Cp.Total,
dbo.Sucursal.Nombre AS SucursalNombre,dbo.Sucursal.PKID AS SucursalID,
dbo.cp.Observacion,Freddy.PedidoFreddy.PorcentajeComisionExterna as PorcentajeComision,
dbo.ModalidadCredito.Descripcion AS ModalidadCredito
                      
FROM         dbo.TipoDocIdentidad INNER JOIN
              dbo.Cp WITH (NOLOCK) INNER JOIN 
              dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID INNER JOIN
              dbo.Pedido WITH (NOLOCK) ON dbo.Cp.PKID = dbo.Pedido.PKID INNER JOIN
              dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID INNER JOIN
              dbo.Persona WITH (NOLOCK) ON dbo.Cp.IDPersona = dbo.Persona.PKID ON dbo.TipoDocIdentidad.PKID = dbo.Persona.IDTipoDocIdentidad INNER JOIN
              dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID INNER JOIN
              dbo.Vendedor ON Persona_1.PKID = dbo.Vendedor.PKID LEFT OUTER JOIN
              dbo.FEstado ON dbo.Pedido.PKID = dbo.FEstado.IDEntidad LEFT OUTER JOIN
              Freddy.PedidoFreddy ON dbo.Pedido.PKID = Freddy.PedidoFreddy.PKID LEFT OUTER JOIN
              dbo.FuerzaVentas INNER JOIN dbo.Zona INNER JOIN 
              dbo.CpDistribucion WITH (NOLOCK) ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaReparto ON dbo.FuerzaVentas.PKID = dbo.CpDistribucion.IDFuerzaVentas ON 
              dbo.Cp.PKID = dbo.CpDistribucion.PKID LEFT OUTER JOIN 
              dbo.ModalidadCredito ON dbo.Pedido.IDModalidadCredito = dbo.ModalidadCredito.PKID LEFT OUTER JOIN
              dbo.LineaCreditoPorFuerzaVentas ON dbo.LineaCreditoPorFuerzaVentas.IDFuerzaVentas = dbo.CpDistribucion.IDFuerzaVentas AND 
              dbo.LineaCreditoPorFuerzaVentas.IDCliente = dbo.Cp.IDPersona LEFT OUTER JOIN
              dbo.DireccionZona AS DZ ON DZ.IDCliente = dbo.LineaCreditoPorFuerzaVentas.IDCliente AND DZ.IDZona = dbo.CpDistribucion.IDZonaVenta  inner join
              dbo.Persona AS Vendedor_1 ON dbo.Cp.IDResponsable = Vendedor_1.PKID  inner join 
              dbo.Direccion ON dbo.Persona.PKID = dbo.Direccion.IDPersona AND dbo.Direccion.DireccionPrincipal = 1 INNER JOIN
              dbo.Departamento ON dbo.Direccion.IDDepartamento = dbo.Departamento.PKID LEFT OUTER JOIN
              dbo.Provincia ON dbo.Direccion.IDProvincia = dbo.Provincia.PKID LEFT OUTER JOIN
              dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID  
                      
                      
