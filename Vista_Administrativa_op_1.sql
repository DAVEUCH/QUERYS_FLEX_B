SELECT DISTINCT ISNULL(dbo.Cp.Revisado, 0) AS Expr1, dbo.Cp.PKID AS ID, dbo.TipoCp.Abreviacion AS Doc, dbo.Cp.NumCp, dbo.Cp.Hora, dbo.Cp.Fecha, 
dbo.Cp.FechaEmision,dbo.Cp.Total, CASE WHEN dbo.Cp.Anulado = 1 THEN '**ANULADO**' ELSE ' ' END AS Anulado, dbo.Moneda.Simbolo AS Moneda, 
dbo.Cp.PersonaNombre,
LEN(dbo.Persona.DocIdentidad) AS PersonaTipoDocumentoLongitud, dbo.TipoDocIdentidad.Abreviacion AS PersonaTipoDocumento,
dbo.Persona.DocIdentidad AS PersonaDocIdentidad, dbo.Pedido.EstadoFacturacion, dbo.Pedido.EstadoEntrega, dbo.Pedido.EstadoAprobacion, 
dbo.Pedido.NumeroOrdenCompra,
dbo.Pedido.Cancelado, dbo.Sucursal.Nombre AS SucursalNombre, dbo.ModalidadCredito.Descripcion AS ModalidadCredito,dbo.Zona.Codigo AS ZonaRepartoCodigo, 
dbo.Zona.Descripcion AS ZonaRepartoDescripcion, 
CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END AS DiaPedido, 
dbo.fun_ObtenerCodigoVehiculoReparto(dbo.CpDistribucion.IDZonaReparto,CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END) AS CodigoVehiculo, 
dbo.fun_ObtenerNombreVehiculoReparto(dbo.CpDistribucion.IDZonaReparto, CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END) AS NombreVehiculo, 
dbo.Cp.PKID AS Expr4, dbo.Pedido.Ajustado, 
dbo.Persona.Nombre AS Expr2, Persona_1.Codigo AS VendedorCodigo, Persona_1.Nombre AS VendedorNombre, 
dbo.Pedido.FechaAprobacion, dbo.FuerzaVentas.Nombre AS FuerzaVentas, dbo.LineaCreditoPorFuerzaVentas.Monto AS TotalLinea, 
dbo.LineaCreditoPorFuerzaVentas.Monto - dbo.LineaCreditoPorFuerzaVentas.BalanceSoles AS TotalSaldo, 
REPLICATE('0', 4 - LEN(CAST(DZ.OrdenVisita AS varchar))) + CAST(DZ.OrdenVisita AS varchar) AS OrdenVisita, dbo.FEstado.Descripcion, 
usv_direccion_Zonareparto.CodigoZonaREPA As ZonaREP, 
UCOC.cot_o AS Cot_Reac,
case isnull(GC_PedidosCliente.IDPedido,0) when 0 then '' else 'SI' end AS REGISTRAPLAZOS

FROM dbo.TipoDocIdentidad 
INNER JOIN dbo.Cp WITH (NOLOCK) 
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID 
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID 
INNER JOIN dbo.Pedido WITH (NOLOCK) ON dbo.Cp.PKID = dbo.Pedido.PKID 
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID 
INNER JOIN dbo.Persona WITH (NOLOCK) ON dbo.Cp.IDPersona = dbo.Persona.PKID 
ON dbo.TipoDocIdentidad.PKID = dbo.Persona.IDTipoDocIdentidad 
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID 
INNER JOIN dbo.Vendedor ON Persona_1.PKID = dbo.Vendedor.PKID 
LEFT OUTER JOIN dbo.FEstado ON dbo.Pedido.PKID = dbo.FEstado.IDEntidad 
LEFT OUTER JOIN Freddy.PedidoFreddy ON dbo.Pedido.PKID = Freddy.PedidoFreddy.PKID 
LEFT OUTER JOIN dbo.FuerzaVentas 
INNER JOIN dbo.Zona 
INNER JOIN dbo.CpDistribucion WITH (NOLOCK) ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaReparto 
ON dbo.FuerzaVentas.PKID = dbo.CpDistribucion.IDFuerzaVentas ON 
dbo.Cp.PKID = dbo.CpDistribucion.PKID 
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.Pedido.IDModalidadCredito = dbo.ModalidadCredito.PKID 
LEFT OUTER JOIN dbo.LineaCreditoPorFuerzaVentas ON dbo.LineaCreditoPorFuerzaVentas.IDFuerzaVentas = dbo.CpDistribucion.IDFuerzaVentas AND 
dbo.LineaCreditoPorFuerzaVentas.IDCliente = dbo.Cp.IDPersona 
LEFT OUTER JOIN dbo.DireccionZona AS DZ ON DZ.IDCliente = dbo.LineaCreditoPorFuerzaVentas.IDCliente AND 
DZ.IDZona = dbo.CpDistribucion.IDZonaVenta
LEFT OUTER JOIN GC_PedidosCliente ON GC_PedidosCliente.IDPedido = dbo.Cp.PKID
LEFT OUTER JOIN usv_direccion_Zonareparto ON usv_direccion_Zonareparto.IDPedido = dbo.Cp.PKID
LEFT JOIN usv_Consulta_op_cot UCOC ON UCOC.pkid_op=dbo.Pedido.PKID
where dbo.Cp.FechaEmision ='2024-10-07' and dbo.Sucursal.Nombre='PDV - 08'