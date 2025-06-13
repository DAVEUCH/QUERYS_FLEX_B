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

select*from Cp where NumCp='FNC1-0005212' and PKID=834789

select*from ItemCp where IDCp=834789
select*from ItemProducto where PKID in (4977553)
--select*from Cotizacion where PKID=831789
update Cotizacion set EstadoAceptacion=0,EstadoAprobacion=1 where PKID=831789

--update Cp set Fecha='2024-12-08',FechaEmision='2024-12-08',TipoCambio='3.731', FechaTipoCambio='2024-12-08',Hora='2024-12-08 11:33:48.007' where NumCp='814-0045732'

select*from ProductoServicio where Codigo='RK.40151.025'  AND PKID=19447 

select*from ProductoServicio where Codigo='FW.R126'  AND PKID=8110
select*from ProductoServicio where Codigo='GB.GWT-161A'  AND PKID=25621
select*from ProductoServicio where Codigo='GB.GWN-107A'  AND PKID=25619---GCI
select*from ProductoServicio where Codigo='EI.GN-327'  AND PKID=26363
select*from ProductoServicio where Codigo='EI.GT-223'  AND PKID=263657
select*from ProductoServicio where Codigo='FW.R123'  AND PKID=19378
select*from ProductoServicio where Codigo='KL.C9406'  AND PKID=28001
select*from ProductoServicio where Codigo='KY.NP916'  AND PKID=19384
select*from ProductoServicio where Codigo='BU.SD3035'  AND PKID=27200
select*from ProductoServicio where Codigo='ZM.8589007'  AND PKID=27200
select*from ProductoServicio where Codigo='TO.TT-113'  AND PKID=5410
select*from ProductoServicio where Codigo='TB.L371-0079A'  AND PKID=25951
select*from ProductoServicio where Codigo='FW.R128'  AND PKID=21931 
select*from ProductoServicio where Codigo='FW.R121'  AND PKID=22531 
select*from ProductoServicio where Codigo='SE.KB-610'  AND PKID=11054 
select*from ProductoServicio where Codigo='GB.GWN-78A'  AND PKID=10175
select*from ProductoServicio where Codigo='GB.GWT-78A'  AND PKID=12286---GCI 
select*from ProductoServicio where Codigo='EI.GT-231'  AND PKID=26366


select top 10 *from ProductoAlmacen where StockPorRecibir < 0

select *from ProductoAlmacen where IDProducto=25619

--where IDProducto=8110


update ProductoAlmacen set StockPorRecibir=100 where PKID=85990

select*from Cp where NumCpContable in ('2-03-2025-00085',
'2-03-2025-00086',
'2-03-2025-00087',
'2-03-2025-00109',
'2-03-2025-00122',
'2-03-2025-00183',
'2-03-2025-00222',
'2-03-2025-00319',
'2-03-2025-00321',
'1-03-2025-00024'
)
select*from TipoCp where PKID=5350
select*from TipoCp where PKID=5154
select*from CptoOperacion where PKID=1176
select*from CptoOperacion where PKID=1826

--update ProductoAlmacen set StockPorEntregar=0 where PKID=117672

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
	where IDProducto=58731 and IDAlmacen in(2,3,4,5,6,7,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,48,50,51,133,155)

--SELECT*FROM ProductoAlmacen WHERE IDProducto=28001

SELECT
pa.PKID as pkid_pa,
pa.IDProducto,
ps.Codigo,
pa.IDAlmacen,
pa.StockFisico,
pa.StockContable,
pa.StockPorEntregar,
StockPorRecibir
FROM ProductoAlmacen pa
left join ProductoServicio ps on ps.PKID=pa.IDProducto
WHERE IDProducto IN(18721) and IDAlmacen=2

--select top 100 *from ProductoServicio where Codigo='TO.TT-113'

		--select top *from Cp

update ProductoAlmacen set StockPorRecibir=5 where  PKID=37858
update ProductoAlmacen set StockPorRecibir=1209 where  PKID=155145
update ProductoAlmacen set StockPorRecibir=10 where  PKID=176808
update ProductoAlmacen set StockPorRecibir=20 where  PKID=205229
update ProductoAlmacen set StockPorRecibir=10 where  PKID=205245
update ProductoAlmacen set StockPorRecibir=10 where  PKID=219648
update ProductoAlmacen set StockPorRecibir=10 where  PKID=205253
update ProductoAlmacen set StockPorRecibir=10 where  PKID=205237
update ProductoAlmacen set StockPorRecibir=10 where  PKID=37858


--update Producto set Stock='0.00', StockContable='0.00',StockPorRecibir='0.00' where PKID=54204
select*from ProductoServicio where Codigo IN('KL.C9406','EI.GN-327','EI.GT-205','EI.GT-223','EI.GT-231','FW.R126','FW.R121','FW.R123','NW.MIC-S3033','TO-TT-113') 
select*from Producto where PKID=54204


	select al.PKID,
	su.Nombre,al.Nombre as Nom_alma,StockFisico,StockContable,StockPorEntregar,StockPorRecibir, al.Codigo
	from vrptStockAlmacen  alm
	left join Sucursal su on su.PKID=alm.IDSucursal
	left join Almacen al on alm.IDAlmacen=al.PKID
	where IDProducto IN( 26363,
26364,
26365,
26366,
22531,
19378,
8110,
28001,
22510) and IDAlmacen in(2,3,4,5)

