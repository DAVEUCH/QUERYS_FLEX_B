---RVG0.01
SELECT
SucursalID,
SucursalCodigo,
SucursalNombre,
CodigoTipoCp,
TipoCp,
Fecha,
ClienteCodigo AS EntidadCodigo,
ClienteNombre AS EntidadNombre,
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
FROM         dbo.vrpteVentasPorProducto03
WHERE 
ClienteID<>'3582'
and Fecha='28-09-2024'
and SucursalNombre='SUCURSAL - PDV 07'
--and  CodigoTipoCp in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7')
GROUP BY ClienteCodigo, ClienteNombre, descrip_ModalidadCredito, ClienteID,CodigoTipoCp,SucursalNombre,TipoCp,Fecha,SucursalID,SucursalCodigo

--------------------------------------------
--CODIGO ORIGINAL  - RVG0.01
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
FROM         dbo.vrpteVentasPorProducto WHERE ClienteID<>'3582'
GROUP BY ClienteCodigo, ClienteNombre, descrip_ModalidadCredito, ClienteID

---CODIGO ORIGINAL - RVG01 MOD ULTIMO
SELECT     CodigoTipoCp as Cod_Doc,TipoCp as Nombre_Doc,
ClienteCodigo AS EntidadCodigo, ClienteNombre AS EntidadNombre,
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
FROM         dbo.vrpteVentasPorProducto WHERE ClienteID<>'3582'
GROUP BY ClienteCodigo, ClienteNombre, descrip_ModalidadCredito, ClienteID,CodigoTipoCp,TipoCp

-------------------------------------------------------------------------------------


select top 10*from vrpteVentasPorProducto

select*from TipoCp
CodigoTipoCp
BV007
select*fro 

---RVG 12

SELECT   SucursalCodigo AS EntidadCodigo, SucursalNombre AS EntidadNombre, SUM(ValorVenta) AS ValorVentaSoles, SUM(Total) AS TotalVentaSoles,  SUM(ValorVentaDolares) AS ValorVentaDolares, SUM(TotalDolares) AS TotalVentaDolares 
FROM vrpteVentasPorProducto01  
where Fecha between '20240902' and '20240902'
GROUP BY SucursalCodigo, SucursalNombre

---RVG54

Select SucursalNombre, 
SUM(Total) as Ventas_Total, 
SUM(Total_aSoles) as Ventas_Total_aSoles, 
SUM(case Modalidad_Credito_cod when 0 then Total_aSoles else 0 end) as Ventas_Contado_aSoles, 
SUM(case Modalidad_Credito_cod when 1 then Total_aSoles else 0 end) as Ventas_Credito_aSoles, 

SUM(Total_aDolares) as Ventas_Total_aDolares, 
SUM(case Modalidad_Credito_cod when 0 then Total_aDolares else 0 end) as Ventas_Contado_aDolares, 
SUM(case Modalidad_Credito_cod when 1 then Total_aDolares else 0 end) as Ventas_Credito_aDolares, 

case when SUM(Total)<=0 then 0 else (SUM(case Modalidad_Credito_cod when 0 then Total_aSoles else 0 end) * 100) / SUM(Total) 
end as porc_Ventas_Contado,  

case when SUM(Total)<=0 then 0 else (SUM(case Modalidad_Credito_cod when 1 then Total_aSoles else 0 end) * 100) / SUM(Total) 
end as porc_Ventas_Credito  
From vrpteVentas_DetComprobantes01  

Where Fecha='28-09-2024'
Group by SucursalNombre


--SELECT*FROM vrpteVentas_DetComprobantes  WHERE Fecha='28-09-2024'