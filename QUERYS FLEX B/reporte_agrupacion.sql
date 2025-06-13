select top 10*from ProductoServicio
select top 10*from Producto
select top 10*from ProductoAgrupacion
--select top 10*from ItemProductoAgrupacion
--select top 10*from 

select
PS.PKID AS Id_Prodserv_padre,
PS.Codigo as Cod_Pdre,
ps.Descripcion as Des_padre,
--PRO.CodigoFabrica as fa,
ps1.Codigo as cod_hijo,
ps1.Descripcion as Des_hijo,
ps1.Activo,
PRO.StockContable
from ProductoAgrupacion pagru
left join ProductoServicio ps on pagru.IDProductoPadre=ps.PKID
left join Producto PRO ON PRO.PKID=PS.PKID
left join ProductoServicio ps1 on pagru.IDProducto=ps1.PKID
where
PRO.Agrupacion=1
and PS.Activo=1
and PRO.PKID=15476
--LEFT JOIN ProductoAgrupacion PROA on PROA.IDProductoPadre=PS.PKID
--left join ProductoAgrupacion PS1 ON PS1.IDProducto=PS.PKID

select*from ProductoServicio where PKID=15476
select*from Producto where PKID=15476
SELECT TOP 10*FROM vInfoProductoAgrupacion where IDProductoPadre=15476


PKID
36265
40964
49847
56208
56720
57938