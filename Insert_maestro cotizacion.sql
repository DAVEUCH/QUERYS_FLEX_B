select*from Cp where NumCp='214-0020179'and PKID=3061649
select*from Cotizacion where PKID=3061649
select*from ItemCp where IDCp=3061649
select*from ItemCotizacion where PKID=9532207
select*from ItemProducto where PKID=9532207

insert into Cp (PKID,IDTipoCp,IDPersona,IDMoneda,IDCptoOperacion,IDPeriodo,IDSucursal,IDTipoPersona, IDMotivoAnulacion, Fecha,
FechaEmision, Hora, Impreso, NumCp,NumCpContable,Observacion,PersonaNombre,Total,Anulado, Contabilizado, IDVoucherContable,
Preliminar, MonedaBase, Tercero, NumeroVerificacion,IDImpuesto, IDLibroAuxiliar, IDResponsable, ValorAfecto,ValorInafecto,
ValorVenta,SubTotal, ValorDescuento, TieneImpuesto, PreciosIncImpto, Administrativo, IDTipoAsociado, TipoCambio, FechaTipoCambio,
Revisado,AjusteImpuesto, EvaluarPercepcion, EvaluarDetraccion, SumarPercepcionAlTotal, MontoPercepcion,
MontoDetraccion)
values(
3061650, --PKID--obligatorio
4930, --IDTipoCp --obligatorio
1614, --IDPersona --obligatorio
2, --IDMoneda --obligatorio
1732,--IDCptoOperacion --obligatorio
100000502,--IDPeriodo --obligatorio
100000197,--IDSucursal--obligatorio
477,--IDTipoPersona--obligatorio
0,--IDMotivoAnulacion --obligatorio por default 0
'20250901',--Fecha --obligatorio
'20250901',--FechaEmision --obligatorio
'20250901',--Hora --obligatorio
0,--Impreso --obligatorio 0
'214-0020180',--NumCp--obligatorio
'09-2025-4930-214-0020180',--NumCpContable --- periodo+IDTipoCp+Numcp -- obligatorio
'PRUEBA',--Observacion
'DAVID GOMEZ DIESEL SOCIEDAD COMERCIAL DE RESPONSABILIDAD LIMITADA',--PersonaNombre --obligatorio
'79.3600',--Total--obligatorio
0,--Anulado --obligatorio
0,--Contabilizado --obligatorio
0,--IDVoucherContable --obligatorio
0,--Preliminar --obligatorio
1,--MonedaBase --obligatorio
0,--Tercero --obligatorio
'4930214-0020180',--NumeroVerificacion --obligatorio
1,--IDImpuesto --obligatorio
0,--IDLibroAuxiliar, --obligatorio
8502,--IDResponsable --obligatorio
'67.250000',--ValorAfecto -- --obligatorio
'0.000000',--ValorInafecto --obligatorio
'150.660000',--ValorVenta --obligatorio
'177.780000',--SubTotal --obligatorio
'0.000000',--ValorDescuento --obligatorio
1,--TieneImpuesto --obligatorio
1,--PreciosIncImpto --obligatorio
1,--Administrativo --obligatorio
'876',--IDTipoAsociado --obligatorio
'3.789000',--TipoCambio  --obligatorio
'20250901',--FechaTipoCambio --obligatorio
0,--Revisado --obligatorio
'0.000000',--AjusteImpuesto --obligatorio
--'',--NumCpReferenciado --opcional  
1,--EvaluarPercepcion --obligatorio
0,--EvaluarDetraccion --obligatorio
1,--SumarPercepcionAlTotal --obligatorio
'0.000000',--MontoPercepcion obligatorio
'0.000000'--MontoDetraccion obligatorio
)
--------------------------------------
insert into Cotizacion(PKID,IDModalidadCredito,DocIdentidad,EstadoAceptacion,EstadoAtencion,EstadoAprobacion,Credito,ClienteDescriptivo,EstadoFacturacion,
EscalaPreferencial,FechaPago,TiempoValidez,NumeroOrdenCompra,IDCpInventario,Direccion,DireccionEntrega)
values(
3061650,--PKID --obligatorio
0,--IDModalidadCredito--obligatorio depende del maestro cliente
'20389146260',--DocIdentidad --obligatorio
0,--EstadoAceptacion --obligatorio
'PENDIENTE',--EstadoAtencion obligatorio por default
0,--EstadoAprobacion obligatorio 0
0,--Credito obligatorio depende del maestro cliente
0,--ClienteDescriptivo --obligatorio
'',--EstadoFacturacion null por defecto
0,--EscalaPreferencial obligatorio 0
'2025-09-01 00:00:00.000',--FechaPago obligatorio 
0,--TiempoValidez obligatorio 0
'',--NumeroOrdenCompra null
2370006,--IDCpInventario obligatorio 
'MZA. O LOTE. 3 COO. VVDA MIGUEL GRAU',--Direccion obligatorio depende del maestro cliente
'MZA. O LOTE. 3 COO. VVDA MIGUEL GRAU'--DireccionEntrega obligatorio depende del maestro cliente
)
--select*from Cp where PKID=2370006
--select*from TipoCp where PKID=5060

-------------------------------------------------------------------------------------
insert into ItemCp (PKID,IDCp,Cantidad,Descripcion,TipoItemCp,Total,ValorUnitario,PorcentajeImpto,Inafecto,Bonificacion,ValorAfecto,ValorVenta,SubTotal,
ValorDescuento,ValorInafecto,BonificacionManual,DescuentoPieCp,RecargoPieCp,PorcentajePercepcion,MontoPercepcion,PorcentajeDetraccion,MontoDetraccion,
ValorReferencialDetraccion,EsAgrupacion,EsItemAgrupacion,IDAgrupacion,PorcentajeAgrupacion,Anulado)
values
(9532208,--PKID --obligatorio
3061650,--IDCp --obligatorio
'1.0000',--Cantidad --obligatorio
'TAIWAN NKBO0355 BOMBA ACEITE CHEVROLET PRISMA SPIN ONIX 4CIL 1.8L 15-20 24578508',--Descripcion --obligatorio
1,--TipoItemCp --obligatorio
'79.3600000',--Total --obligatorio
'79.3600000',--ValorUnitario --obligatorio
'18.0000000',--PorcentajeImpto --obligatorio
0,--Inafecto --obligatorio 0
0,--Bonificacion --obligatorio 0
'67.2542370',--ValorAfecto --obligatorio
'67.2542370',--ValorVenta --obligatorio
'79.3600000',--SubTotal --obligatorio
'0.0000000',--ValorDescuento --obligatorio
'0.0000000',--ValorInafecto --obligatorio
0,--BonificacionManual --obligatorio 0
'0.0000000',--DescuentoPieCp --obligatorio
'0.0000000',--RecargoPieCp obligatorio 0
'0.000000',--PorcentajePercepcion obligatorio 0
'0.000000',--MontoPercepcion obligatorio 0
'0.000000',--PorcentajeDetraccion obligatorio 0
'0.000000',--MontoDetraccion obligatorio 0
'0.000000',--ValorReferencialDetraccion obligatorio 0
0,--EsAgrupacion-- obligatorio 0
0,--EsItemAgrupacion obligatorio 0
0,--IDAgrupacion obligatorio 0
0,--PorcentajeAgrupacion obligatorio 0
0--Anulado obligatorio 0
)
--------------------------------------------
insert into ItemCotizacion (PKID,BalanceFacturacion,EscalaPreferencial,PrecioLista,AplicaDescuentoConVale,
DescuentoAplicado,DescuentoFijo,IDDefinicionBonificacion,BalanceAtencion)
values(
9532208, --PKID obligatorio 
'0.00',--BalanceFacturacion obligatorio 0
0,--EscalaPreferencial obligatorio 0
'79.3600',--PrecioLista obligatorio
0,--AplicaDescuentoConVale obligatorio 0
'0.0000',--DescuentoAplicado obligatorio 0
0,--DescuentoFijo obligatorio 0
0,--IDDefinicionBonificacion obligatorio 0
'0.00'--BalanceAtencion obligatorio 0
)
------------------------------------------------
INSERT INTO ItemProducto (PKID,IDProducto,IDUnidad,Factor,CantidadBase,IDAlmacen,Agrupacion,IDLoteFabricacion,NumeroLote,Observacion,IDCentroDeCosto,Peso,Largo,
Ancho,LargoB,AnchoB,IDUnidadMedidaOrigen,IDUnidadMedidaDestino,IDConversionUnidad,CantidadB,PrecioB,FactorConversion,UsarUnidadMedida,FactorUnidadMedida,IDCpInventario)
values 
(9532208,--PKID
55261,--IDProducto
57765,--IDUnidad
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
2370006--IDCpInventario
)