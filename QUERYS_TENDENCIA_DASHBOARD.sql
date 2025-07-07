----REPORTE DEL PRODUCTO MAS VENDIDO
SELECT  
ProductoCodigo AS CODIGOPROD, 
ProductoDescripcion AS DESPRODUCTO, 
dbo.fn_Descripcion_Padre_clase(ClaseProductoID)as  CLASEPROD,
dbo.fn_descripcion_resumida(ProductoID) AS DESRESPROD,
dbo.fn_cantidad_vendida_sucursal(ProductoID,SucursalID,@fecini,@fecfin) as CANT_VENTA,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000197) as Stk_PDV2,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000198) as Stk_PDV4,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000199) as Stk_PDV5,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000203) as Stk_PDV6,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000200) as Stk_PDV7,
dbo.fn_stock_producto_Sucursal(ProductoID, 100000201) as Stk_PDV9,
dbo.[fn_stock_producto](ProductoID) as Stk_tot
FROM  dbo.vrpteVentasPorProducto
   where Fecha>=@fecini and Fecha<=@fecfin
GROUP BY ProductoCodigo, ProductoDescripcion, ClaseProductoDescripcion, ProductoID, ClaseProductoID,SucursalNombre,SucursalID
order by CANT_VENTA desc

-------------RENDIMIENTO Y ANALITICA----

Select   EntidadCodigo , EntidadNombre,
SUM( ValorVentaSolesRelacionada) as ValorVentaSolesRelacionada,
SUM( ValorVentaSolesGeneral  ) as   ValorVentaSolesGeneral,
SUM( ValorVentaDolaresRelacionada) as   ValorVentaDolaresRelacionada, 
SUM(ValorVentaDolaresGeneral ) as  ValorVentaDolaresGeneral,
SUM(TotalVentaSolesRelacionada ) as  TotalVentaSolesRelacionada,
SUM( TotalVentaSolesGeneral ) as   TotalVentaSolesGeneral,
SUM(TotalVentaDolaresRelacionada) as  TotalVentaDolaresRelacionada,
SUM( TotalVentaDolaresGeneral ) as   TotalVentaDolaresGeneral, 
ClaseProductoDescripcion,  DescripcionResumida,
CantidadVendidaGeneral,  
SUM(Devolucion) as Devolucion, 
CantidadVendidaRela, CantidadNotacreGeneral, CantidadNotacreRela, 
ProductoID, SucursalNombre 
From VentasGeneral01(@fecini, @fecfin) 
Group by ClaseProductoDescripcion,  
DescripcionResumida,
CantidadVendidaGeneral, CantidadVendidaRela,
CantidadNotacreGeneral, CantidadNotacreRela, 
ProductoID,
SucursalNombre, 
EntidadCodigo, 
EntidadNombre 
Order by EntidadCodigo, DescripcionResumida desc

------VENTAS POR CLIENTE--------

SELECT     ClienteCodigo AS EntidadCodigo, ClienteNombre AS EntidadNombre,
 SUM(ValorVentaDolares) AS ValorVentaDolares,
 SUM(ValorVenta) AS ValorVentaSoles,
 SUM(Total) AS TotalVentaSoles, 
 SUM(TotalDolares) AS TotalVentaDolares,
 dbo.[fn_vendedor_cliente](ClienteID)  AS Vendedor,
 dbo.[fn_Localidad](ClienteID)  AS Localidad,
dbo.[fn_Linea_Disponible](ClienteID) AS LineaDisponible,
--dbo.[fn_Morosidad](ClienteID) AS Moroso,
descrip_ModalidadCredito as ModalidadCredito, 
dbo.fn_fecha_ultima_compra(ClienteID) AS UltimaFechaCompra,
ClienteID
FROM         dbo.vrpteVentasPorProducto03 WHERE ClienteID<>'3582'
GROUP BY ClienteCodigo, ClienteNombre, descrip_ModalidadCredito, ClienteID

---------------------VENTAS POR MARCA------------
SELECT   SUM(ValorVenta) AS ValorVentaSoles
  , SUM(ValorVentaDolares) AS ValorVentaDolares
  , SUM(Total) AS TotalVentaSoles
  , SUM(TotalDolares) AS TotalVentaDolares
  ,  MarcaDescripcion AS EntidadNombre
  , MarcaCodigo AS EntidadCodigo
FROM dbo.vrpteVentasPorProducto
where Fecha>=@fecini and Fecha<=@fecfin
GROUP BY MarcaDescripcion,MarcaCodigo

-----VENTAS POR PRODUCTO---
SELECT  ProductoCodigo AS EntidadCodigo, ProductoDescripcion AS EntidadNombre
  , SUM(ValorVenta) AS ValorVentaSoles
  , SUM(ValorVentaDolares) AS ValorVentaDolares
  , SUM(Total) AS TotalVentaSoles
  , SUM(TotalDolares) AS TotalVentaDolares
   , dbo.fn_Descripcion_Padre_clase(ClaseProductoID)as  ClaseProductoDescripcion
  , dbo.fn_descripcion_resumida(ProductoID) AS DescripcionResumida
  , dbo.[fn_stock_producto](ProductoID) as Stock
  , dbo.fn_cantidad_vendida_sucursal_solo_freddy(ProductoID,SucursalID,@fecini,@fecfin) as CantidadVendida
  ,ProductoID
  ,SucursalNombre
FROM  dbo.vrpteVentasPorProducto
   where Fecha>=@fecini and Fecha<=@fecfin
GROUP BY ProductoCodigo, ProductoDescripcion, ClaseProductoDescripcion, ProductoID, ClaseProductoID,SucursalNombre,SucursalID
order by EntidadCodigo, CantidadVendida, DescripcionResumida desc


-----VentasPorLineayProducto

SELECT  ProductoCodigo AS EntidadCodigo, ProductoDescripcion AS EntidadNombre
  , SUM(ValorVenta) AS ValorVentaSoles
  , SUM(ValorVentaDolares) AS ValorVentaDolares
  , SUM(Total) AS TotalVentaSoles
  , SUM(TotalDolares) AS TotalVentaDolares
  , dbo.fn_Descripcion_Padre_clase(ClaseProductoID)as  ClaseProductoDescripcion
  , dbo.fn_descripcion_resumida(ProductoID) AS DescripcionResumida
  , dbo.[fn_stock_producto](ProductoID) as Stock
  , dbo.fn_cantidad_vendida_producto(ProductoID,@fecini,@fecfin) as CantidadVendida
  , ClaseProductoCodigo AS LineaCodigo
  , ClaseProductoDescripcion AS LineaDescripcion
FROM dbo.vrpteVentasPorProducto
where Fecha>=@fecini and Fecha<=@fecfin  and ClienteID<>'3582' 
GROUP BY ProductoCodigo, ProductoDescripcion, ClaseProductoID, ProductoID,
ClaseProductoCodigo,ClaseProductoDescripcion

-----ESTADO PEDIDOS---
SELECT     dbo.Cp.NumCp,
dbo.Cp.Fecha,dbo.Cp.Hora,
vendedor_1.Nombre as Vendedor,
dbo.Persona.DocIdentidad AS PersonaDocIdentidad,
dbo.Cp.PersonaNombre, 
CASE WHEN Provincia.Descripcion = 'LIMA' THEN Distrito.Descripcion ELSE Provincia.Descripcion END AS Localidad,
dbo.Pedido.EstadoFacturacion, dbo.Pedido.EstadoEntrega,dbo.Cp.Total,
dbo.Sucursal.Nombre AS SucursalNombre,dbo.Sucursal.PKID AS SucursalID,
dbo.TipoCp.Codigo as Codigo_doc,dbo.TipoCp.Descripcion as Tipo_doc,
dbo.CptoOperacion.Codigo AS Codigo_Tip_Op,dbo.CptoOperacion.Descripcion AS Tipo_Tip_Op,
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
              dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID  LEFT JOIN
              dbo.TipoCp on dbo.Cp.IDTipoCp=dbo.TipoCp.PKID   LEFT JOIN
              dbo.CptoOperacion on dbo.Cp.IDCptoOperacion=dbo.CptoOperacion.PKID   


---------- KARDEX

select * from dbo.fFB_KardexNoValoradoAlmacen2010DMA(@FechaDesde, @FechaHasta,@IDAlmacen)

-----------SALDO PRODUCTO DE ALMACEN------------

select * from usv_AlmacenesDetalles
                      




