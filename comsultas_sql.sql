select*from Proveedor
SELECT*FROM Persona
SELECT*FROM Direccion
---cliente
SELECT
    CLI.PKID AS IdCliente,
	PER.PKID AS IdPersona,
    PER.Codigo,
    PER.DocIdentidad,
    PER.Nombre,
	--telf.NumeroTelefono,
	--telf.TipoTelefono,
	DIRE.Descripcion,
	PER.fechaCrea,
	iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
--left join Telefono telf on telf.IDPersona=CLI.PKID
WHERE PER.Codigo='20610215280'
ORDER BY PER.Codigo
select top 10*from Direccion where IDPersona=68901

update Direccion set Descripcion='MZA. D LOTE. 13 SEC. NATASHA ALTA LA LIBERTAD' where IDPersona=68901

-------
select top(10)*from Cliente
select top(10)*from Persona

SELECT
    CLI.PKID AS IdCliente,
    PER.PKID AS IdPersona,
    PER.Codigo,
    PER.DocIdentidad,
    PER.Nombre,
	dire.descripcion,
    PER.fechaCrea,
	
    CASE
        WHEN PER.Codigo = PER.DocIdentidad THEN 'Iguales'
        ELSE 'Diferentes'
    END AS Comparativa,
	emp.IDCargoEmpleado
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
left join Empleado emp on emp.PKID=PER.PKID
left join Direccion dire on dire.IDPersona= PER.PKID
where per.Codigo='20613108662'
ORDER BY PER.Codigo;

----------------------------------------------


select*from Direccion


select*from Telefono
--UPDATE Persona set DocIdentidad=11111111 where PKID=9322

select top(100)* from GC_Cliente



--proveedor
SELECT
    PRO.PKID AS Id,
    PER.Codigo,
    PER.DocIdentidad,
    PER.Nombre,
	DIRE.Descripcion,
	iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc
FROM Proveedor PRO
LEFT JOIN Persona PER ON PER.PKID = PRO.PKID
LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
WHERE PER.Nombre IS NOT NULL 
ORDER BY PER.Nombre

--vendedor
SELECT
    ven.PKID AS Id,
    PER.Codigo,
    PER.DocIdentidad,
    PER.Nombre,
	DIRE.Descripcion,

	iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc
FROM Vendedor ven
LEFT JOIN Persona PER ON PER.PKID = ven.PKID
LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
--WHERE PER.Nombre IS NOT NULL and ven.PKID=9241
ORDER BY PER.Nombre

---Rangos de aprobacion---
select*from RangoAprobacionOrdenCompra
select*from UsuarioRangoAprobacion
select*from Usuario
select*from Moneda

select
ROC.PKID AS Id_rango,
USU.Nombre,
MO.Descripcion,
MO.Simbolo,
hasta
from RangoAprobacionOrdenCompra ROC
LEFT JOIN UsuarioRangoAprobacion URA ON URA.IDRangoAprobacionOrdenCompra = ROC.PKID
left join Usuario USU on usu.PKID= URA.IDUsuario
left join Moneda MO on MO.PKID=ROC.IDMoneda

---orden de compra ---
select*from TipoCp
select*from TipoOrdenCompra
---esto son lo tipos de formatos que manejan el modulo compras--
select*from TipoOrdenCompra TOC
left join TipoCp TC ON TC.PKID=TOC.PKID
 
select*from Cp
select*from OrdenCompra

select*from Producto

select*from CpVenta
select*from Cliente
select*from Persona where PKID=2972
select*from Persona where PKID=9952
select
per.Nombre+' '+per.ApellidoPaterno as persona

from Cp
left join Persona per on per.PKID= cp.IDPersona

where NumCp='001-0129466'

select * from Cp where NumCp='814-0050048'
select*from Pedido where PKID=813024
select * from Cp where NumCp='814-0050049'
select*from Pedido where PKID=813025

select * from Cp where NumCp='814-0050060'
select*from itemcp where IDCp=813159
select*from ItemProducto where PKID in (
4809439,
4809440,
4809441,
4809442,
4809443,
4809444,
4809445)


select*from itemcp where IDCp=813024
select*from ItemProducto where PKID in (
4809399,
4809400,
4809401,
4809402,
4809403,
4809404,
4809405,
4809406,
4809407,
4809408,
4809409,
4809410,
4809411,
4809412,
4809413,
4809414,
4809415,
4809416,
4809417,
4809418,
4809419,
4809420,
4809421,
4809422,
4809423,
4809424,
4809425,
4809426,
4809427)
--update ,edido set EstadoEntrega='PENDIENTE' where PKID=813024

----ventas---
select *from Cp where NumCp='F02-0030910' and PKID=2851242
select*from CpVenta where PKID=2851242
select top 1*from CpInventarioSalida where PKID=2850674

update CpVenta set DireccionEntrega='Av. Nicolás Ayllón 8694 Ate LIMA' where PKID=2851242

--select top(100) *from TipoCp --- v. Nicolás Ayllón 8694, Ate 15487  real plaza santa clara, ATE, LIMA
select top(100) *from CpVenta
----------comparativa fac
select
--per.*
cpv.PKID,
cpv.NumCp,
cpV.FechaEmision,
per.Codigo,
cpven.DocIdentidad,
    CASE
        WHEN PER.Codigo = cpven.DocIdentidad THEN 'Iguales'
        ELSE 'Diferentes'
    END AS Comparativa_fac,
	emp.IDCargoEmpleado,
	tcpv.Codigo as codigodoc,
	tcpv.TipoCp,
	tcpv.Descripcion,
cpv.PersonaNombre,
cpven.Direccion,
per.Nombre as Cliente,
cpven.EstadoDevolucion,
cpo.Descripcion,
cpv.ValorAfecto,
cpv.ValorInafecto,
cpv.ValorVenta,
cpv.SubTotal
from CpVenta cpven
INNER join cp cpv  on cpv.PKID=cpven.PKID
INNER join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join CptoOperacion cpo on cpo.PKID=cpv.IDCptoOperacion
--where PER.Codigo='20602249256'
--where tcpv.Codigo='FVC07'
where cpv.NumCp='F001-0025564'
AND cpv.PKID=810179
order by cpV.FechaEmision

SELECT*FROM CpVenta where PKID=810182

update CpVenta set DocIdentidad='20613108662' where PKID=810181



UPDATE Cotizacion set DocIdentidad='20525558259' where PKID=802406
SELECT*FROM Persona WHERE Codigo='20525558259'
SELECT*FROM CP where NumCp='T001-00005433'
SELECT*FROM CpInventarioSalida WHERE PKID=802536
SELECT*FROM CP where NumCp='814-0049290'
select*from Pedido where PKID=802436
select*from Cp where NumCp='814-0007053' --802406
select*from Cotizacion where PKID=802406






select*from Cp where PKID=2857481
select*from CpVenta where PKID=2857481

select*from CpInventario where PKID=2214956
select  *from CpInventarioSalida where IDCpInventario=838


Factura Venta ELECTRONICA CORP - PDV 07
FVC07
SELECT *FROM CpCobrarPagar

SELECT top(10)*FROM Cp where NumCp='F002-0040896'
update Cp set Anulado=0 where NumCp='F002-0000862'
SELECT top(10)*FROM CpVenta
select top(10)*from eCpVenta where NumCp in('F002-0000813','F002-0000862')
select top(10)*from eCpVenta
--inner join Persona_1 per1 on 
--WHERE cpv.IDCptoOperacion IN (1008, 1736) AND cpv.FechaEmision BETWEEN '2024-01-05' AND '2023-29-07'
select*from MedioDePago where FechaEmision='2024-17-08'
select*from forma
select top(10)*from cp where NumCp='214-0112210'
select*from CpInventarioSalida where PKID=2783868
select*from Pedido where PKID=2783858
select*from CpVenta where PKID= 792163
SELECT*FROM Cp WHERE PKID=792163
SELECT*FROM PAGO
update CpVenta set DocIdentidad='20501583732' where PKID=2783871
update CpInventarioSalida set DocIdentidad='20501583732' where PKID=2783868
update Pedido set DocIdentidad='20501583732' where PKID=2783858



---------ENTRADA INVENTARIO---
SELECT
cpv.PKID,
cpv.NumCp,
cpV.FechaEmision,
per.Codigo,
NC.DocIdentidad as DocindenNC,
emp.IDCargoEmpleado,
tcpv.Codigo as codigodoc,
tcpv.TipoCp,
invsa.DocIdentidad,
per.Codigo,
cpv.PersonaNombre,
invsa.DireccionEntrega,
invsa.IDDireccionEntrega,
cpv.Anulado
FROM CP cpv
inner join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
LEFT JOIN NotaCredito NC on NC.PKID=cpv.PKID
left join notadebito ND on ND.PKID=cpv.PKID
left join CpInventarioSalida invsa on invsa.PKID=cpv.PKID
--LEFT JOIN CpVenta cpven on cpven.PKID=cpv.PKID
where
cpv.NumCp in ('T007-00000805','T007-00000806')

select*from Distrito where Descripcion='SANTIAGO DE SURCO'
select*from Provincia where Descripcion='LIMA'
select*from Departamento where Descripcion='LIMA'
SELECT*FROM Persona WHERE Codigo='20513857218'
select*from Cp where PKID=2885699
SELECT*FROM CpInventarioSalida WHERE PKID=2885699
SELECT*FROM Direccion WHERE IDPersona=18636
--update Direccion set Descripcion='Urb. Villas del Sol Mz. C Lt. 35 Los Portales' where PKID=71536
select top 10*from DireccionCliente
--UPDATE CpInventarioSalida SET DireccionEntrega='Urb. Villas del Sol Mz. C Lt. 35 Los Portales' WHERE PKID=2885699

LOTE. 34-H EX-FUNDO CHACRA CERRO (SUB-LOTE AV. TAMBO RIO ALTURA CUADRA 2)

LOTE. 34-H EX-FUNDO CHACRA CERRO (SUB-LOTE AV. TAMBO RIO ALTURA CUADRA 2)

select * 
from dbo.vInfoCpVentaFacturaFreddy where NumCp='FC01-0001793'
select *from dbo.vrpt_FacturaGuia where CpVentaID=2857481
select *from dbo.vrpt_FacturaGuia_1 where CpVentaID=2857481

Urb. Villas del Sol Mz. C Lt. 35–Los Portales
------------------------------------------------
CREATE VIEW vrpt_FacturaGuia_1 AS
SELECT 
    Cp.PKID AS CpVentaID,
    STUFF(
        (SELECT '/' + Cp_1.NumCp
         FROM dbo.Cp AS Cp_1 
         INNER JOIN dbo.CpRelacionado ON Cp_1.PKID = dbo.CpRelacionado.IDCpRelacionado
         WHERE dbo.CpRelacionado.IDCp = Cp.PKID
         FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 
        1, 1, '') AS GuiaNumCp
FROM 
    dbo.Cp
INNER JOIN 
    dbo.CpVenta ON dbo.Cp.PKID = dbo.CpVenta.PKID
GROUP BY 
    Cp.PKID;

	--------------------------------------------

	ComprobanteNumcpRelacionado
T007-00000558/T007-00000579 

select*from CpVenta where PKID=2857481
select top 10 *from ItemCpRelacionado
select *from CpRelacionado where IDCp=2857481

select*from CpInventario where PKID=2214426
select top 2 *from CpInventarioSalida where PKID=2856849

--per.Codigo='20602249256'
SELECT*FROM CP WHERE    NumCp='GSI09-0012566' --914-0049607
SELECT*FROM CP WHERE    NumCp='GSI09-0012567' --914-0049609
--SELECT*FROM CP WHERE    NumCp='T009-00000210'
SELECT*FROM CP WHERE    NumCp='GSI05-0011098'

SELECT*FROM CpInventarioSalida WHERE PKID=2866486
SELECT*FROM CpInventarioSalida WHERE PKID=2866487
SELECT*FROM CpInventarioSalida WHERE PKID=2858850



select *from CpRelacionado where IDCp=2857481


SELECT*FROM ItemCp where IDCp=2866487
select*from Persona where Codigo='000003618175'
--select*from Cliente where PKID=69779
select*from Persona where  pkid=36127 
select*from Cliente where PKID=36127
select*from ItemCpInventario where PKID=
--update cp set Anulado=0 where PKID=2823774
--where cpv.NumCp in ('T006-00000494', 'T009-00000210')
select top 1*from CpInventarioSalida where PKID=2850674
update CpInventarioSalida set DireccionEntrega='AV.LUNA PIZARRO Nº500-' where PKID=800255
select*from Cp where NumCp='T002-00001084'
DireccionEntrega
LUNA PIZARRO NRO.669
-----
select*from Cp where NumCp='PF02-0003423'
select*from CpInventarioSalida where PKID IN (2771566,2819776)
select*from Cp where PKID IN (2771566,2819776)
select*from ItemCpCajaEntradaSalida
select*from Cp where PKID=2819776
SELECT*FROM NotaCredito where PKID=787195
select*from NotaDebito where PKID=791422
select top(10) *from usv_NotaCredito_RelacionadoOriyDest where Numero='FND2-0001568'
select*from Cp where NumCp='F02-0003427' and PKID=2818257
select top(10) * from Percepcion where PKID=2818257
select top(10)*from ItemCp where IDCp=2818257
select top(10)*From usv_ComprobantePercepcionYDocs
select top(10)*from usv_ComprobaPercepcion_Detalle where pkid=2818257
select top(10)*from usv_ItemCp_Percepcion -- porcentaje
select top(10)*from vInfoCpPercepcion_ness where ComprobanteNumCp='F02-0003427'
select top(10)*from CpCajaEntrada where PKID=2763229 
select top(10)*from DocCobrarPagar where IDCp=2755733 -- pkd de factura 2755733  - F02-0041958
select*from cp where PKID=4193074
select top(10)*from TipoCp
--select top(10)*from ItemDocCobrarPagar

select top(10)*from caja 
----------------------------

--update NotaCredito set DocIdentidad='20609267306' where PKID=787195
--cpv.NumCp='F001-0023638'
SELECT top(10)*FROM Cp where NumCp='FND2-0001568'
SELECT top(10)*FROM Cp where NumCp='F001-0022909' --DOC RELACIONADO
select *from vInfoCpVentaNotaDebitoGCI where ComprobanteNumCp='FND2-0001567'  --doc relacionado: F001-0023575 779405
select *from vInfoCpVentaNotaDebitoGCI where ComprobanteNumCp='FND2-0001568' --doc relacionado: F001-0022909 767773
select top(10)*from CpRelacionado where IDCp=791422
insert into CpRelacionado (IDCp,IDCpRelacionado,IDTipoCpRelacionado,IDTipoCpDestino)
values (791422,767773,883,868)
update Cp set Anulado=0 where NumCp='FND2-0001568'


IDCp	IDCpRelacionado	IDTipoCpRelacionado	IDTipoCpDestino
789707	  779405	         883	                     868

SELECT fecha,NumCp,Observacion FROM cp where Observacion like '%REC%' and Fecha between '2024-01-01' AND '2024-16-07'
order by Fecha


select
cpv.FechaEmision,
cpo.Descripcion,
cpv.NumCp,
cpv.Observacion
from Cp cpv
left join CptoOperacion cpo on cpo.PKID=cpv.IDCptoOperacion
LEFT OUTER JOIN CpCajaEntrada ON CpCajaEntrada.PKID = cpv.PKID
LEFT OUTER JOIN dbo.Caja ON dbo.CpCajaEntrada.IDCaja = dbo.Caja.PKID 
where cpv.IDCptoOperacion IN (1008, 1736)
AND cpv.FechaEmision between '2024-01-01' AND '2024-16-07'
and cpv.Observacion like '%REC%'
and cpv.Anulado=0
And   Caja.EsBanco = '0'



--Cp.Anulado=0  
--And   Cp.IDCptoOperacion in (1008,1736) --EC002
--And   Cp.Observacion like '%REC%'  
--And   Caja.EsBanco = '0'  
--And   isnull(CpFact.numcp,'')<>''

SELECT TOP(10)*FROM Persona 
-------------- ITEM---
SELECT
ICP.IDCp,
ICP.Cantidad,
pro.Codigo,
ICP.Descripcion
FROM ItemCp ICP
left join ItemProducto IPP ON IPP.PKID=ICP.PKID 
left join ProductoServicio pro on pro.PKID=IPP.IDProducto
where IDCp=2736805

select *from Producto
---------------orden de compra--
select 
cpv.PKID,
cpv.NumCp,
cpV.FechaEmision,
--oc.DocIdentidad,
--cpv.PersonaNombre,
--oc.Direccion,
--per.Nombre,
--oc.EstadoAprobacion,
cpv.NumeroVerificacion
--from CpVenta cpven
from OrdenCompra oc
inner join cp cpv  on cpv.PKID=oc.PKID
inner join Persona per on per.PKID= cpv.IDResponsable
where 
CONVERT(DATE, cpv.Fecha) BETWEEN '2024-07-01' AND '2024-07-25'
and cpv.NumeroVerificacion='4998821-0000677'

update cp set NumeroVerificacion='9998821-0000677' where PKID=2796226

-------------------

--ACTUALIZAR DIRECCIONES 
--SELECT*FROM CpVenta WHERE DocIdentidad='07805893' and PKID=2786606
--UPDATE CpVenta SET Direccion='Jiron Huaroc Mz A Lote 2 Urbanización Nueva Castilla', 
--DireccionEntrega='Jiron Huaroc Mz A Lote 2 Urbanización Nueva Castilla' where 
--PKID=2786606

select 
per.PKID,
per.Codigo,
per.Nombre AS Vendedor,
cpa.NumCp as factura,
cpa.FechaEmision,
cpa.PersonaNombre,
cpv.IDLetra,
cpl.NumCp as letraa
from usv_CpVentaLetra cpv
inner join Cp cpa on cpa.PKID=cpv.IDCp
inner join Cp cpl on cpl.PKID = cpv.IDLetra
inner join Persona per on per.PKID= cpa.IDResponsable
where cpa.NumCp='F001-0023635'
--------------------------------------------
select top 10 *from Pedido
select top 10 *from usv_CpVentaLetra
--select top 10 *from venta
--select* from usv_CpVentaLetra
--select* from Cp where NumCp='001-0130894'
--select top(100)*from Cp
--select top(100)*from CpVenta
--select *from TipoCanjeLetra
--select*from usv_CpVentaLetra
--select *from usv_CanjeLetrasClientes where PKID=770284
--select top(100)*from Letra
--select top(100)*from CanjeLetras
--select top(100)*from ItemCanjeLetras
--select top(100)*from CGI_ConsultaComisionesDocumento_1

-- Declarar las variables para las fechas de inicio y fin
--DECLARE @FechaDesde DATE = '2024-06-01';
--DECLARE @FechaHasta DATE = '2024-06-05';

-- Ejecutar la función y seleccionar el resultado
--SELECT * 
--FROM CGI_ConsultaComisionesDocumento2(@FechaDesde, @FechaHasta);

select
PS.PKID,
PS.Codigo as Codigo,
pro.CodigoFabrica as Codigo_Fabrica,
pro.Stock,
pro.StockContable,
pro.StockPorEntregar,
fpf.CodigoInterno as Codigo_Interno,
fpf.ProductoAlias as Alias,
ps.Descripcion as Nombre_Prod,
ps.DescripcionResumida as Nombre_Prod_Abre,
cps.Descripcion as Linea,
tps.Descripcion as Tipo_prod,
mar.Descripcion as Marca,
mon.Simbolo as Moneda,
IIF(ps.ArticuloVenta=1,'SI','NO') AS Articulo_de_venta,
IIF(ps.ArticuloCompra =1,'SI','NO') AS Articulo_de_Compra,
IIF(ps.ArticuloInventario=1,'SI','NO') AS Articulo_de_Inventario,
IIF(ps.Granel=1,'SI','NO') AS Articulo_de_Granel,
IIF(pro.Agrupacion=1,'SI','NO') AS Agrupacion,
IIF(pro.Consignacion=1,'SI','NO') AS Consignacion,
IIF(pro.GestionaLoteFabricacion=1,'SI','NO') AS Gestiona_Lote_Fabricacion,
IIF(pro.PrecioPorPeso=1,'SI','NO') AS Precio_Por_Peso,
IIF(ps.Activo=1,'SI','NO') AS Activo,
carac1.Descripcion as Marca_Auto,
carac2.Descripcion as Modelo_Auto,
carac3.Descripcion as Año_Auto,
carac4.Descripcion as Nombre_Motor,
carac5.Descripcion as Nombre_Cilindros,
carac6.Descripcion as Nombre_Litros,
carac7.Descripcion as Nombre_Medidas,
carac8.Descripcion as Nombre_Voltios,
carac9.Descripcion as Nombre_Tipo_Encendido,
carac10.Descripcion as Nombre_Lado,
pro.Observacion
from ProductoServicio ps
left join Producto pro on pro.PKID= ps.PKID
left join Freddy.ProductoFreddy fpf on fpf.PKID=ps.PKID
left join ClaseProductoServicio cps on  cps.PKID=ps.IDClaseProductoServicio
left join TipoProductoServicio tps on tps.PKID=ps.IDTipoProductoServicio
left join Marca mar on mar.PKID=pro.IDMarca
left join Moneda mon on mon.PKID=pro.IDMoneda
left join Caracteristica carac1 on carac1.PKID=pro.IDCaracteristica1
left join Caracteristica carac2 on carac2.PKID=pro.IDCaracteristica2
left join Caracteristica carac3 on carac3.PKID=pro.IDCaracteristica3
left join Caracteristica carac4 on carac4.PKID=pro.IDCaracteristica4
left join Caracteristica carac5 on carac5.PKID=pro.IDCaracteristica5
left join Caracteristica carac6 on carac6.PKID=pro.IDCaracteristica6
left join Caracteristica carac7 on carac7.PKID=pro.IDCaracteristica7
left join Caracteristica carac8 on carac8.PKID=pro.IDCaracteristica8
left join Caracteristica carac9 on carac9.PKID=pro.IDCaracteristica9
left join Caracteristica carac10 on carac10.PKID=pro.IDCaracteristica10
where pro.CodigoFabrica='a4137'


select TOP(10)*from ProductoServicio where Codigo='AA.'
select TOP(10)*from Producto where  CodigoFabrica='GWDW-47A.'
select TOP(10) *from Freddy.ProductoFreddy where CodigoInterno='96307717'
select*from ClaseProductoServicio where Descripcion='BOMBA AGUA' 
select*from Marca
select top(10)*from Unidad order by PKID desc
select*from tClasesProductos WHERE ClaseProductoID=177
select top(10)*from usv_VentasPorProductoClase_select2
select top(10)*from TipoProductoServicio
select top(10)*from Marca
select *from Moneda
select top(10)*from Caracteristica

AE47H7H7H3DH73H7DH387DEH38HD8H387HD8H38DH83BD83BDE
------RQ-------
--Código, codigo de fábrica, código interno, alias, descripci´n, descripción abreviada, YA ESTA 
--línea, tipo, marca, moneda, falg de artículos de venta, inventario, compra, granel, ya esta 
--activo, agrupación, producción, lotes,consignación, pesos; ya esta 
--características de la 1 a la 10 (cada una en su columna/independiente), observación.


SELECT*FROM TipoCp WHERE Codigo NOT LIKE 'RG0%' ORDER BY Descripcion

SELECT*FROM Cp WHERE IDSucursal = 100000197  OR  AlmacenDestino.IDSucursal= 100000197

(Cp.IDSucursal = 100000197  OR  AlmacenDestino.IDSucursal= 100000197)

select top 10 *from usv_ProductosenPedidos_Pendientes_Facturar
select top 10 *from usv_ProductosenPedidosConGuia_Pendientes_Facturar
select top 10 *from vrpt_FacturaLetra---
select top 10 *from Cp where NumCp='F001-0022843'  
select top 10 *from Cp where NumCp='814-0047560'2467
select top 10 *from Cp where PKID=876
select top 10 *from CpRelacionado where IDCp=775932 -- pedido
select top 10 *from CpRelacionado where IDCp=775923
select top 10 *from usv_pedido_vendedor

select top(10)*from Unidad order by PKID desc

update Unidad set Peso= '0.856 ' WHERE IDProductoServicio=27663
update Unidad set Peso= '1.318 ' WHERE IDProductoServicio=18152
update Unidad set Peso= '0.974 ' WHERE IDProductoServicio=27664
update Unidad set Peso= '0.366 ' WHERE IDProductoServicio=17971
update Unidad set Peso= '1.402 ' WHERE IDProductoServicio=27666
update Unidad set Peso= '1.206 ' WHERE IDProductoServicio=25221
update Unidad set Peso= '0.424 ' WHERE IDProductoServicio=14243
update Unidad set Peso= '1.146 ' WHERE IDProductoServicio=18815
update Unidad set Peso= '1.146 ' WHERE IDProductoServicio=27665
update Unidad set Peso= '0.922 ' WHERE IDProductoServicio=17395
update Unidad set Peso= '0.616 ' WHERE IDProductoServicio=25388
update Unidad set Peso= '0.616 ' WHERE IDProductoServicio=25389
update Unidad set Peso= '0.748 ' WHERE IDProductoServicio=17440
update Unidad set Peso= '0.748 ' WHERE IDProductoServicio=17441
update Unidad set Peso= '0.392 ' WHERE IDProductoServicio=4166
update Unidad set Peso= '0.398 ' WHERE IDProductoServicio=19929
update Unidad set Peso= '0.664 ' WHERE IDProductoServicio=19050
update Unidad set Peso= '0.664 ' WHERE IDProductoServicio=19051
update Unidad set Peso= '0.834 ' WHERE IDProductoServicio=20418
update Unidad set Peso= '0.37 ' WHERE IDProductoServicio=27766
update Unidad set Peso= '0.37 ' WHERE IDProductoServicio=27767
update Unidad set Peso= '0.66 ' WHERE IDProductoServicio=27662
update Unidad set Peso= '0.718 ' WHERE IDProductoServicio=18756
update Unidad set Peso= '0.408 ' WHERE IDProductoServicio=27657
update Unidad set Peso= '0.292 ' WHERE IDProductoServicio=21201
update Unidad set Peso= '0.752 ' WHERE IDProductoServicio=27661
update Unidad set Peso= '0.224 ' WHERE IDProductoServicio=27646
update Unidad set Peso= '0.714 ' WHERE IDProductoServicio=27647
update Unidad set Peso= '0.252 ' WHERE IDProductoServicio=27653
update Unidad set Peso= '0.384 ' WHERE IDProductoServicio=27652
update Unidad set Peso= '0.28 ' WHERE IDProductoServicio=27651
update Unidad set Peso= '0.702 ' WHERE IDProductoServicio=28005
update Unidad set Peso= '0.778 ' WHERE IDProductoServicio=27590
update Unidad set Peso= '0.66 ' WHERE IDProductoServicio=27656
update Unidad set Peso= '0.618 ' WHERE IDProductoServicio=27765
update Unidad set Peso= '0.404 ' WHERE IDProductoServicio=25029
update Unidad set Peso= '0.412 ' WHERE IDProductoServicio=26081
update Unidad set Peso= '0.166 ' WHERE IDProductoServicio=19775
update Unidad set Peso= '0.292 ' WHERE IDProductoServicio=27120
update Unidad set Peso= '1.142 ' WHERE IDProductoServicio=27159
update Unidad set Peso= '0.35 ' WHERE IDProductoServicio=27121
update Unidad set Peso= '0.604 ' WHERE IDProductoServicio=27154
update Unidad set Peso= '0.42 ' WHERE IDProductoServicio=27123
update Unidad set Peso= '0.404 ' WHERE IDProductoServicio=27157
update Unidad set Peso= '0.46 ' WHERE IDProductoServicio=27124
update Unidad set Peso= '0.32 ' WHERE IDProductoServicio=27162



