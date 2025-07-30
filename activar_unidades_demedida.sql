select 
ps.PKID,ps.Codigo,ps.Descripcion, 
und.PKID AS PKID_UM,und.Descripcion as um, und.Activo
from ProductoServicio ps
left join Unidad und on und.IDProductoServicio=ps.PKID
where ps.Codigo in ( 
'GR.P2127.040' ,
'GR.P5087.000',
	'KO.C3931-010')
 and und.Descripcion IN ('JGO', 'UNIDAD')
 

select top 10*from Unidad where IDProductoServicio=10607

update Unidad set Activo=0 where IDProductoServicio=10607 and PKID=10607
update Unidad set Activo=0 where IDProductoServicio=10607 and PKID=10607
update Unidad set Activo=0 where IDProductoServicio=40811 and PKID=42387
update Unidad set Activo=0 where IDProductoServicio=40725 and PKID=42301
update Unidad set Activo=0 where IDProductoServicio=40845 and PKID=42421
update Unidad set Activo=0 where IDProductoServicio=40667 and PKID=42243
update Unidad set Activo=0 where IDProductoServicio=10656 and PKID=10656
update Unidad set Activo=0 where IDProductoServicio=10666 and PKID=10666
update Unidad set Activo=0 where IDProductoServicio=10686 and PKID=10686
update Unidad set Activo=0 where IDProductoServicio=40723 and PKID=42299
update Unidad set Activo=0 where IDProductoServicio=40791 and PKID=42367
update Unidad set Activo=0 where IDProductoServicio=19972 and PKID=19972
update Unidad set Activo=0 where IDProductoServicio=52604 and PKID=55102
update Unidad set Activo=0 where IDProductoServicio=19987 and PKID=19987
update Unidad set Activo=0 where IDProductoServicio=54206 and PKID=56752
update Unidad set Activo=0 where IDProductoServicio=54156 and PKID=56702
update Unidad set Activo=0 where IDProductoServicio=18713 and PKID=18713
update Unidad set Activo=0 where IDProductoServicio=46040 and PKID=47905
update Unidad set Activo=0 where IDProductoServicio=21640 and PKID=21640
update Unidad set Activo=0 where IDProductoServicio=21641 and PKID=21641
update Unidad set Activo=0 where IDProductoServicio=21642 and PKID=21642
update Unidad set Activo=0 where IDProductoServicio=21659 and PKID=21659
update Unidad set Activo=0 where IDProductoServicio=24680 and PKID=24680
update Unidad set Activo=0 where IDProductoServicio=24695 and PKID=24695
update Unidad set Activo=0 where IDProductoServicio=24709 and PKID=24709
update Unidad set Activo=0 where IDProductoServicio=24712 and PKID=24712
update Unidad set Activo=0 where IDProductoServicio=24716 and PKID=24716
update Unidad set Activo=0 where IDProductoServicio=24740 and PKID=24740
update Unidad set Activo=0 where IDProductoServicio=34286 and PKID=34162
update Unidad set Activo=0 where IDProductoServicio=48896 and PKID=50540

update Unidad set Activo=0 where IDProductoServicio=10677 and PKID=10677
update Unidad set Activo=0 where IDProductoServicio=10712 and PKID=10712
update Unidad set Activo=0 where IDProductoServicio=56597 and PKID=59293
