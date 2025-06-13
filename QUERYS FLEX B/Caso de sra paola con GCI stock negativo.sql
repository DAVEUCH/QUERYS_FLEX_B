SELECT 

[Items.Descripcion] AS DESCRIPCION,
CP1.NumCp AS COMPROBANTE, 
CP1.Fecha AS FECHA,
Tienda.Nombre AS SUCURSAL
FROM eItemPedido 
INNER JOIN Cp AS CP1 ON CP1.PKID=[Items.IDCp]
INNER JOIN Sucursal AS Tienda ON  Tienda.PKID=CP1.IDSucursal 
INNER JOIN Pedido AS Pedidoe on Pedidoe.PKID=CP1.PKID
WHERE 
Cp1.Anulado=0 
And  Pedidoe.EstadoFacturacion<>'TOTAL'
and [Items.Descripcion] ='CTR JEBE BARRA ESTABILIZADORA 54183-2Y000 HYUNDAI KIA TUCSON. SPORTAGE OPTIMA 2013-2015 44*44*23 DEL'

--select*from ProductoServicio where Codigo='RT.CVKH-189'

select*from Cp where NumCp='814-0051412'

--update Cp set Fecha='2024-12-08',FechaEmision='2024-12-08',TipoCambio='3.731', FechaTipoCambio='2024-12-08',Hora='2024-12-08 11:33:48.007' where NumCp='814-0045732'

select*from ProductoServicio where Codigo='FW.R126'  AND PKID=8110 

select*from ProductoServicio where Codigo='TC.E2999'  AND PKID=20720 
select*from ProductoServicio where Codigo='FW.R125'  AND PKID=1124 
select*from ProductoServicio where Codigo='ZM.ZM-401'  AND PKID=8056---GCI 
select*from ProductoServicio where Codigo='TC.E3816'  AND PKID=16391
select*from ProductoAlmacen where IDProducto=8110



update ProductoAlmacen set StockPorRecibir=2229 where PKID=56758

--update ProductoAlmacen set StockPorEntregar=10 where IDProducto=21563 and PKID=170118

--update ProductoAlmacen set StockPorEntregar=10 where IDProducto=21563 and PKID=170118
--update ProductoAlmacen set StockPorEntregar=0 where  PKID=170119
--update ProductoAlmacen set StockPorEntregar=0 where   PKID=170116
--update ProductoAlmacen set StockPorEntregar=0 where  PKID=170115
--update ProductoAlmacen set StockPorEntregar=0 where  PKID=170114
--update ProductoAlmacen set StockPorEntregar=0 where   PKID=170117
--update ProductoAlmacen set StockPorEntregar=0 where  PKID=170113
--update ProductoAlmacen set StockPorEntregar=0 where  PKID=170120



814-0035315
814-0045643
814-0049360
	select al.PKID,
	su.Nombre,al.Nombre as Nom_alma,StockFisico,StockContable,StockPorEntregar,StockPorRecibir, al.Codigo
	from vrptStockAlmacen  alm
	left join Sucursal su on su.PKID=alm.IDSucursal
	left join Almacen al on alm.IDAlmacen=al.PKID
	where IDProducto=56513 and IDAlmacen in(2,3,4,5,6,7,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,48,50,51,133,155)

	SELECT*FROM ProductoAlmacen WHERE IDProducto=56513
	SELECT*FROM ProductoServicio WHERE Codigo='DJ.P423'
		SELECT*FROM ProductoAlmacen WHERE IDProducto=58691

		select top 100 *from Producto

		select top *from Cp

update ProductoAlmacen set StockFisico=6, StockContable=6 where  PKID=1961295
--update Producto set Stock='0.00', StockContable='0.00',StockPorRecibir='0.00' where PKID=54204
select*from ProductoServicio where Codigo='HM.50276CP.030'  AND PKID=54204 
select*from Producto where PKID=54204


	select al.PKID,
	su.Nombre,al.Nombre as Nom_alma,StockFisico,StockContable,StockPorEntregar,StockPorRecibir, al.Codigo
	from vrptStockAlmacen  alm
	left join Sucursal su on su.PKID=alm.IDSucursal
	left join Almacen al on alm.IDAlmacen=al.PKID
	where IDProducto=8056 and IDAlmacen in(2,3,4,5)

