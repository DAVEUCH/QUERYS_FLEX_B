select top 3* from Cp where NumCp='214-0112807' and PKID=2798784
select*from Pedido  where PKID=2798784
delete from Cp where PKID=2798784
delete from Pedido where PKID=2798784
select top 10* from cp
--where NumCp like '814-%' 
order by PKID desc
--ultimo cp 2798838
--ultimo numcp 814-0001636
select top 5*from cp order by PKID desc 
select top 10*from ItemCp  order by PKID desc 
select *from ItemPedido WHERE PKID=4602301 order by PKID desc 
select top 10*from ItemProducto where PKID=4602301 order by PKID desc
select*from TipoCp where PKID=4884
select*from Clasificador
------------------INSERT CP DE PEDIDO----------------------------------------------
insert into Cp (PKID,IDTipoCp,IDPersona,IDMoneda,IDCptoOperacion,IDPeriodo,IDSucursal,IDTipoPersona, IDMotivoAnulacion, Fecha,
FechaEmision, Hora, Impreso, NumCp,NumCpContable,Observacion,PersonaNombre,Total,Anulado, Contabilizado, IDVoucherContable,
Preliminar, MonedaBase, Tercero, NumeroVerificacion,IDImpuesto, IDLibroAuxiliar, IDResponsable, ValorAfecto,ValorInafecto,
ValorVenta,SubTotal, ValorDescuento, TieneImpuesto, PreciosIncImpto, Administrativo, IDTipoAsociado, TipoCambio, FechaTipoCambio,
Revisado,AjusteImpuesto, EvaluarPercepcion, EvaluarDetraccion, SumarPercepcionAlTotal, MontoPercepcion,
MontoDetraccion)
values(
2798844, --PKID
4872, --IDTipoCp
453, --IDPersona
1, --IDMoneda
1729,--IDCptoOperacion
100000489,--IDPeriodo
100000197,--IDSucursal
477,--IDTipoPersona
0,--IDMotivoAnulacion
'20241008',--Fecha
'20241008',--FechaEmision
'20241008',--Hora
0,--Impreso
'214-0112810',--NumCp
'10-2024-4872-214-0112810',--NumCpContable
'PRUEBA',--Observacion
'TRANSPORTES JOAVEL E I R L',--PersonaNombre
'177.7800',--Total
0,--Anulado
0,--Contabilizado
0,--IDVoucherContable
0,--Preliminar
1,--MonedaBase
0,--Tercero
'4872214-0112810',--NumeroVerificacion
1,--IDImpuesto
0,--IDLibroAuxiliar,
53847,--IDResponsable
'150.660000',--ValorAfecto
'0.000000',--ValorInafecto
'150.660000',--ValorVenta
'177.780000',--SubTotal
'0.000000',--ValorDescuento
1,--TieneImpuesto
1,--PreciosIncImpto
1,--Administrativo
'0D2C3641-09EB-474D-9ADD-4B3651817973',--IDTipoAsociado
'3.789000',--TipoCambio
'20241008',--FechaTipoCambio
0,--Revisado
'0.000000',--AjusteImpuesto
--'',--NumCpReferenciado
1,--EvaluarPercepcion
0,--EvaluarDetraccion
1,--SumarPercepcionAlTotal
'0.000000',--MontoPercepcion
'0.000000'--MontoDetraccion
)

--------------------------INSERT PEDIDO----------------------------------
insert into Pedido (PKID,IDCpInventario,IDTipoMedioDePago,IDModalidadCredito,DocIdentidad,EstadoEntrega,EstadoFacturacion,EstadoAprobacion,	
SaldoCancelado,	Credito	,FechaPago,	ClienteDescriptivo	,Direccion,	MontoDctoPromocional,	DireccionEntrega,	Cancelado,	VentaEspecial,
EscalaPreferencial,	NumeroOrdenCompra,	PagoEfectivo,	RequiereAprobacion,	EfectivoRestringido	,AplicaDistribucion	,OmitirPoliticasCredito	,
FechaEntrega,	Ajustado,	IDCliente2	,FechaAprobacion	,IDGrupoVentas	,IDDireccionEntrega	,IDDireccionCliente)
values( 
2798844,--PKID
2169423	,--IDCpInventario
0	,--IDTipoMedioDePago
0	,--IDModalidadCredito
'20101308082',--DocIdentidad
'PENDIENTE',--EstadoEntrega
'PENDIENTE',--EstadoFacturacion
'APROBADO',--EstadoAprobacion
0,--SaldoCancelado
0,--Credito
'20241008',--FechaPago
0,--ClienteDescriptivo
'JR. GRAL FEL SANTIA SALAVERRY NRO. 260 URB. EL PINO (ALT CDRA 18 DE AV CIRCUNVALACION)',--Direccion
'0.0000',--MontoDctoPromocional
'JR. GRAL FEL SANTIA SALAVERRY NRO. 260 URB. EL PINO (ALT CDRA 18 DE AV CIRCUNVALACION)',--DireccionEntrega
0,--Cancelado
0,--VentaEspecial
0,--EscalaPreferencial
'',--NumeroOrdenCompra
0,--PagoEfectivo
0,--RequiereAprobacion
'0.0000',--EfectivoRestringido
0,--AplicaDistribucion
0,--OmitirPoliticasCredito
'20241008',--FechaEntrega
0,--Ajustado
0,--IDCliente2
'20241008',--FechaAprobacion
0,--IDGrupoVentas
453,--IDDireccionEntrega   
453--IDDireccionCliente
)


----------------------INSERT DETALLE CP---------------------------------------------
insert into ItemCp (PKID,IDCp,Cantidad,Descripcion,TipoItemCp,Total,ValorUnitario,PorcentajeImpto,Inafecto,Bonificacion,ValorAfecto,ValorVenta,SubTotal,
ValorDescuento,ValorInafecto,BonificacionManual,DescuentoPieCp,RecargoPieCp,PorcentajePercepcion,MontoPercepcion,PorcentajeDetraccion,MontoDetraccion,
ValorReferencialDetraccion,EsAgrupacion,EsItemAgrupacion,IDAgrupacion,PorcentajeAgrupacion,Anulado)
values
(8658218,--PKID
2798844,--IDCp
'1.0000',--Cantidad
'GATES 1.9LOHC TEMPLADOR FAJA DISTRIBUCION FORD ESCORT 1991-UP 116 4CIL',--Descripcion
1,--TipoItemCp
'177.7759200',--Total
'177.7759200',--ValorUnitario
'18.0000000',--PorcentajeImpto
0,--Inafecto
0,--Bonificacion
'150.6575590',--ValorAfecto
'150.6575590',--ValorVenta
'177.7759200',--SubTotal
'0.0000000',--ValorDescuento
'0.0000000',--ValorInafecto
0,--BonificacionManual
'0.0000000',--DescuentoPieCp
'0.0000000',--RecargoPieCp
'0.000000',--PorcentajePercepcion
'0.000000',--MontoPercepcion
'0.000000',--PorcentajeDetraccion
'0.000000',--MontoDetraccion
'0.000000',--ValorReferencialDetraccion
0,--EsAgrupacion--
0,--EsItemAgrupacion
0,--IDAgrupacion
0,--PorcentajeAgrupacion
0--Anulado
)

----------INSERT DETALLE PEDIDO----
INSERT INTO ItemPedido(PKID,BalanceEntrega,BalanceFacturacion,PrecioLista,AplicaDescuentoConVale,EscalaPreferencial,DescuentoAplicado,DescuentoFijo,CantidadPedida,CantidadAEntregar,IDDefinicionBonificacion,
IDDefinicionDescuento,VentaEspecial)
values
(8658218,--PKID
0.00,--*BalanceEntrega
0.00,--BalanceFacturacion
'177.7759200',--*PrecioLista
0,--AplicaDescuentoConVale
0,--EscalaPreferencial
'0.0000000',--DescuentoAplicado
0,--DescuentoFijo
'1.00',--CantidadPedida
'0.00',--CantidadAEntregar
0,--IDDefinicionBonificacion
0,--IDDefinicionDescuento
0--VentaEspecial
)
----------INSERT DETALLE POR PRODUCTO Y PEDIDO---
INSERT INTO ItemProducto (PKID,IDProducto,IDUnidad,Factor,CantidadBase,IDAlmacen,Agrupacion,IDLoteFabricacion,NumeroLote,Observacion,IDCentroDeCosto,Peso,Largo,
Ancho,LargoB,AnchoB,IDUnidadMedidaOrigen,IDUnidadMedidaDestino,IDConversionUnidad,CantidadB,PrecioB,FactorConversion,UsarUnidadMedida,FactorUnidadMedida,IDCpInventario)
values 
(8658218,--PKID
12199,--IDProducto
12199,--IDUnidad
1,--Factor
1,--CantidadBase
3,--IDAlmacen
0,--Agrupacion
0,--IDLoteFabricacion
'',--NumeroLote
'',--Observacion
0,--IDCentroDeCosto
'2.3700000',--Peso
'0.0000000',--Largo
'0.0000000',--Ancho
'0.0000000',--LargoB
'0.0000000',--AnchoB
0,--IDUnidadMedidaOrigen
0,--IDUnidadMedidaDestino
0,--IDConversionUnidad
'0.0000000',--CantidadB
'0.0000000',--PrecioB
0,--FactorConversion
0,--UsarUnidadMedida
0,--FactorUnidadMedida
2169423--IDCpInventario
)

--------------INSERT PEDIDO  FREDDY.PEDIDOFREDY

insert into Freddy.PedidoFreddy(PKID,PorcentajeComisionExterna,IDEmpresaTransporte)
values
(2798844,'0.00',0)
