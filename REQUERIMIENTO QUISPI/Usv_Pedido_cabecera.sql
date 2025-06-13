--USE [GCI]
--GO

--/****** Object:  View [dbo].[usv_Pedido_cabecera]    Script Date: 13/06/2025 12:28:03 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

ALTER view [dbo].[usv_Pedido_cabecera]  
as  
SELECT 
dbo.Cp.PKID AS PedidoID, dbo.TipoCp.Abreviacion AS PedidoTDoc, dbo.Cp.NumCp as PedidoNro, Cp.Fecha,   
CONVERT(nvarchar(10), Cp.Fecha, 3) as PedidoFechaEmision, CONVERT(nvarchar(5), Cp.Hora, 108) as PedidoHoraEmision,   
dbo.Moneda.Simbolo AS PedidoMoneda, dbo.Cp.Total as PedidoTotal,   
Pedido.EstadoAprobacion AS PedidoEstadoAprobacion,    
CONVERT(nvarchar(10), dbo.Pedido.FechaAprobacion, 3) as PedidoFechaAprobacion,    
CONVERT(nvarchar(5), dbo.Pedido.FechaAprobacion, 108) as PedidoHoraAprobacion,    
dbo.Cp.PersonaNombre AS ClienteNombre, dbo.Sucursal.Nombre AS SucursalNombre,   
Persona_1.Codigo AS VendedorCodigo, Persona_1.Nombre AS VendedorNombre, ZonaREPA.Codigo as ZonaReparto,
Direccion.Descripcion as Direccion_cliente,
UBI.Distrito as Distrito,
UBI.Provincia as Provincia,
UBI.Departamento as Departamento,
ISNULL(t.Telefonos, '') AS Telefonos,
upct.NombreAgenTransp as Nombre_agencia,
upct.Direccion_Entrega as Direccion_Agencia
FROM dbo.Cp WITH (NOLOCK)   
INNER JOIN dbo.Pedido WITH (NOLOCK) ON dbo.Cp.PKID = dbo.Pedido.PKID   
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID   
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID   
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID   
INNER JOIN dbo.Persona AS tCliente WITH (NOLOCK) ON dbo.Cp.IDPersona = tCliente.PKID   
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID   
INNER JOIN dbo.Vendedor ON Persona_1.PKID = dbo.Vendedor.PKID   
LEFT OUTER JOIN dbo.Direccion On dbo.Direccion.Descripcion = dbo.Pedido.DireccionEntrega  AND  tCliente.DocIdentidad = dbo.Pedido.DocIdentidad
LEFT OUTER JOIN dbo.DireccionCliente On dbo.DireccionCliente.PKID = Direccion.PKID
LEFT OUTER JOIN dbo.Zona as ZonaREPA On dbo.DireccionCliente.IDZonaReparto = ZonaREPA.PKID
inner JOIN usv_DireccionyUbigeo UBI ON UBi.IDCliente=tCliente.PKID
inner JOIN usv_Pedido_ClienteyTransporte upct on upct.PKIDPedido=dbo.Pedido.PKID
OUTER APPLY (
    SELECT 
        Telefonos = STUFF((
            SELECT '/' + t2.NumeroTelefono
            FROM Telefono t2
            WHERE t2.IDPersona = tCliente.PKID
            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')
        , 1, 1, '')
) t
WHERE Cp.Anulado = 0
GO

select *from usv_Pedido_ClienteyTransporte where NumeroPedido='814-0052044'
select*from Persona where DocIdentidad='20447724856'
select top 1*from Pedido
select top 1 *from Direccion
select top 1 *from Departamento
select top 1 *from Provincia
select top 1 *from Distrito
select top 1*from eDireccionCliente
select top 1*from  usv_Direcciones_Ubigeo
select top 1*from  usv_DireccionyUbigeo





