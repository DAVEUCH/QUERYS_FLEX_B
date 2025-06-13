select*from Cp where NumCp='92795746' and PKID=2846154
select*from ItemCp where IDCp=2846154 --8811581
and Descripcion='MAHLE E196X-030 ANILLO PISTON DODGE D100 ASPEN CORONET 1961-1987 225 6CIL 3.7L 2*2*4.76-86.36MM 6 UNIDADES'
select *from ItemProducto where PKID=8811584
select *from ItemProducto where PKID=8811581
select *from ItemCpCompra where PKID=8811584
--select *from ItemCpCompra where PKID=8811581
select*from ProductoServicio where codigo='HM.50276CP.030'
select*from ProductoServicio where codigo='HM.41873CP.020'
select*from ProductoServicio where codigo='SH.030 012'
select*from ProductoServicio where codigo='CF.10770'
select*from ProductoServicio where PKID=53269
select*from ProductoServicio where codigo='HM.50276CP.030'
select*from Producto where PKID=58691
--select*from Producto where  PKID=50800
select*from Producto where  PKID=54204



select*from Unidad where PKID=56764
update Unidad set Base=1 where PKID=56764
select*from Unidad where PKID=61184

update Producto set Stock='6.00',StockContable='6.00',StockPorRecibir='6.00',
StockPorEntregar='6.00' where PKID=54204

update ItemCpCompra set BalanceDevolucion='0.00', BalanceEntrega='1.00' where PKID=8811584


