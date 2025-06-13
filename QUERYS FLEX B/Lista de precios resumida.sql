select PKID,Codigo,Descripcion from ProductoServicio where  Codigo in ('TC.U3768')
select PKID,CodigoFabrica from Producto where CodigoFabrica in ('a4137')
---------------------
SELECT
ilp.PKID as IdItemListaPrecios,
IDListaPrecios,
lp.Descripcion,
ilp.IDProducto
FROM ItemListaPrecios ilp
left join ListaPrecios lp on lp.PKID=ilp.IDListaPrecios
WHERE 
--IDListaPrecios in(6,7,8,9)
--and
IDListaPrecios in(2)
and
IDProducto in (
53910)
-----------------------------------
select PKID,IDItemListaPrecios from UnidadItemListaPrecios where IDItemListaPrecios in (
4246)

update Escala set MargenNegociacionPorcentualA='38.44', MargenNegociacionPorcentualB='0.00' 
where IDUnidadItemListaPrecios=278140