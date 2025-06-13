SELECT UA.PKID, UA.IDUsuario, IDActividad, ac.Descripcion
FROM UsuarioActividad UA
LEFT JOIN Actividad ac ON ac.PKID = UA.IDActividad
WHERE
UA.IDUsuario = 4208
  AND
  ac.Descripcion IN (
  'EvaluarDescuentoA ',
 'EvaluarDescuentoB ',
 'EvaluarDescuentoC ',
 'EvaluarDescuentoD ',
 'Modificar cp caja transferencia ',
 'EliminarCpOrdenPago ',
 'Modificar tipo cliente ',
 'Anular Cp Caja Transferencia ',
 'Modificar Percepcion3 ',
 'CopiarTipoCargoCobranza ',
 'Crear cp inventario de transferencia ',
 'Anular Canje Letras3 ',
 'Modificar Solicitud Compra ',
 'Eliminar Percepcion ',
 'Modificar cargo cobranza ',
 'Modificar Pedido ',
 'Crear Cp Caja Transferencia ',
 'ModificarPedidoFreddy2 ',
 'Modificar cp venta ',
 'Eliminar Cp Confirmar Medio Pago ',
 'ConvertirClienteAVendedor ',
 'Mostrar nota de débito ',
 'Eliminar Tipo Nota Debito ',
 'Cancelar pedido ',
 'Eliminar tipo cliente ',
 'Crear modalidad credito ',
 'Eliminar Cp Inventario Transferencia ',
 'Modificar Tipo Nota Debito ',
 'Copiar Tipo de nota de débito ',
 'Modificar Tipo canje Letra ',
 'Freddy Modificar orden de compra ',
 'Anular Nota Credito ',
 'Desaprobar Pedido ',
 'Crear tipo de confirmación de medio de pago recibido ',
 'Modificar cliente ',
 'Ejecutar reporte con visor OCX ',
 'Eliminar Cp Caja Transferencia ',
 'Generacion Cp Compra Desde Cp Compra ',
 'Modificar cp caja salida ',
 'Aprobar pedido ',
 'Modificar Cp Inventario Transferencia ',
 'Copiar tipo de confirmación de medio de pago recibido ',
 'Generacion Nota Debito Desde Cp Venta ',
 'Eliminar cobranza del consolidado de carga ',
 'Imprimir Comprobante ',
 'Crear cliente ',
 'Modificar cotizacion ',
 'Modificar Nota Credito ',
 'Anular cp venta ',
 'Generacion Percepcion Desde Cp Caja Entrada ',
 'Crear Cp Confirmar Medio De Pago Tercero ',
 'Crear requerimiento de mercaderia ',
 'copiar pedido ',
 'Anular Nota Debito ',
 'Generacion Nota Credito Desde Cp Inventario Entrada ',
 'Modificar canje letras3 ',
 'Crear Cp Retencion3 ',
 'Modificar tipo de comprobante de percepción ',
 'mostrar voucher contable ',
 'Editar Campos Extras Cliente ',
 'Crear cargo cobranza ',
 'Crear Cp Confirmar Medio De Pago Propio ',
 'Eliminar Solicitud Cotizacion3 ',
 'Crear solicitud de compra ',
 'Copiar Tipo de nota de crédito ',
 'mostrar letra ',
 'Eliminar Canje Letras3 ',
 'ImportacionModificacionLetra ',
 'CrearCpOrdenPago ',
 'Crear Cp Caja Salida ',
 'Mostrar comprobante de retención ',
 'Modificar canje letras ',
 'Eliminar modalidad credito ',
 'Generar ingreso a caja desde cargo de cobranza ',
 'Eliminar Tipo Cargo Cobranza ',
 'Generacion Cp Inventario Entrada Desde Nota Credito ',
 'Modificar Tipo Cargo Cobranza ',
 'Copiar Tipo Pedido ',
 'ConvertirPersonaACliente ',
 'Modificar modalidad credito ',
 'Mostrar canje de letras ',
 'Modificar cp confirmar medio pago ',
 'Editar cobranza desde el consolidado de carga ',
 'Crear Tipo Cargo Cobranza ',
 'Eliminar Cp Retencion ',
 'Mostrar comprobante de venta ',
 'Modificar Solicitud Cotizacion3 ',
 'Generar excel desde reporte ',
 'Crear PedidoOmitirPoliticaCredito ',
 'Eliminar Nota Debito ',
 'Crear tipo cliente ',
 'Modificar cp caja entrada ',
 'Eliminar Canje Letras ',
 'Copiar Tipo letra ',
 'Modificar tipo de comprobante de retención ',
 'Eliminar Requerimiento Mercaderia ',
 'Generacion Cp Inventario Entrada Desde Orden Compra ',
 'Modificar cp retencion ',
 'Crear Canje Letras3 ',
 'Modificar Tipo canje Letra de terceros ',
 'Modificar Cp Inventario Salida ',
 'Freddy Eliminar orden de compra ',
 'Crear Tipo canje de letra ',
 'Eliminar Cp Retencion3 ',
 'Eliminar Cp Confirmar Medio De Pago Tercero ',
 'Crear cp venta ',
 'ConvertirClienteAEmpleado ',
 'Desaprobar Pedido Freddy ',
 'Aprobar Pedido Freddy ',
 'copiar canje letras ',
 'Generacion Cp Compra Desde Cp Inventario Entrada ',
 'Crear Cp Caja Entrada ',
 'Mostrar orden de compra ',
 'Modificar tipo de comprobante de venta ',
 'Modificar cp confirmar medio de pago tercero ',
 'Modificar letra ',
 'Copiar tipo de comprobante de retención ',
 'Mostrar nota de crédito ',
 'Crear cotizacion ',
 'EliminarPedidoFreddy ',
 'Eliminar Cp Inventario Entrada ',
 'Eliminar Solicitud Compra ',
 'mostrar formulario cp confirmar medio de pago recibido ',
 'Asignar Direccion Cliente ',
 'Crear Percepcion3 ',
 'Crear Canje Letras ',
 'Crear Tipo de nota de débito ',
 'Eliminar categoria cliente ',
 'Anular Canje Letras ',
 'Modificar Tipo Nota Credito ',
 'Eliminar Tipo Canje Letra ',
 'cambiar estado letra ',
 'Eliminar Cotizacion ',
 'Crear Cp Confirmar Medio Pago ',
 'Eliminar tipo de comprobante de venta ',
 'Modificar Tipo Letra ',
 'Eliminar cargo cobranza ',
 'Imprimir Comprobante2 ',
 'ModificarCpOrdenPago ',
 'Eliminar Tipo Letra ',
 'Crear categoria de cliente ',
 'Crear Tipo letra ',
 'Modificar Reporte Vista Previa ',
 'Eliminar Cotizacion3 ',
 'Generacion Cp Inventario Entrada Desde Cp Inventario Salida ',
 'Modificar Categoria de Cliente ',
 'Eliminar cliente ',
 'ModificarPedidoFreddy ',
 'Generacion Cp Compra Desde Orden Compra ',
 'Crear Percepcion ',
 'CrearPedidoFreddy ',
 'Modificar cp retencion3 ',
 'Crear Tipo de nota de crédito ',
 'Modificar Tipo Confirmacion Medio de Pago de clientes ',
 'Eliminar Tipo Nota Credito ',
 'ImportarObjetos ',
 'Eliminar Percepcion3 ',
 'Crear nota de debito ',
 'Generacion Nota Credito Desde Cp Venta ',
 'Ejecutar reporte con visor NET ',
 'Modificar Tipo letra de terceros ',
 'Anular Pedido ',
 'Generacion Cp Inventario Entrada Desde Cp Compra ',
 'Modificar cp confirmar medio de pago propio ',
 'Crear nota de credito ',
 'Crear Letra ',
 'Crear cp inventario de salida ',
 'Modificar Cp Inventario Entrada ',
 'ConvertirClienteAProveedor ',
 'Crear Cp Retencion ',
 'Modificar valores por defecto del usuario actual ',
 'eliminar cp confirmar medio de pago propio ',
 'Crear cp inventario de entrada ',
 'Modificar Percepcion ',
 'Modificar Cotizacion3 ',
 'Modificar Nota Debito ',
 'Freddy Crear orden de compra ',
 'Crear Solicitud Cotizacion3 ',
 'Modificar tipo de comprobante de caja ',
 'Ver Pedido ',
 'Crear Cotizacion3 ',
 'Modificar Requerimiento Mercaderia '

  )
  select*from Usuario where IDPerfilUsuario=400083
  
   select*from Usuario where IDUsuario='SROSASL'

  SELECT*FROM ePerfilUsuario WHERE TipoUsuario='PERFIL' AND IDUsuario='JEFE DE FINANZAS' -- 400083
  select*from UsuarioActividad WHERE IDUsuario=4214

exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '00AEED4B-B99F-4B30-9B20-E02B07479560     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '018C7F4C-4DB4-454F-840A-C8FEE91CC0F2     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '04A4AEA2-62E7-473C-9EC6-7CB38D9F585B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '063F4717-AAA7-4795-895B-BA1325E915DC     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0656A42B-13B2-4819-B9DC-979158CE7579     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '075026DB-CFA1-40DE-8D67-9524AA1548C7     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0B6B0292-9144-4393-BD6F-D42071FC9BFB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0C13E609-34B1-47BF-A99A-45DC552A6A34     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0CB0C2C8-DED1-4CC9-A7DD-B3A595AED81F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0CEED971-D308-4A95-9B4F-1E9747C72243     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0D959054-39D4-4EAB-AE59-1767AADA99C6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '0E35680E-A2B3-4EF8-BDF5-09F6E7A7EF63     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '10F9CDA7-8438-4524-A855-3485806E9A11     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '112CE46B-024F-44A3-9E76-28DCA7746701     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '143BC4C5-FDAA-4B32-A4A8-9138DEC35D3E     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '170F967B-E968-42B2-AAFC-8B4592E2F6A1     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '1C077244-9672-4DB4-BBC0-0D5F1C5BF7FF     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '1C754294-7E66-4EF2-AD8C-C04A28612799     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '1F45E594-0E76-458A-ADD9-7389B5D5ECEA     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '219371E7-5566-4CD3-8CF7-7A6BDAB3007D     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '262CF747-B067-4826-A6F6-3C3B3CB8C625     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '266C4F3F-667D-4920-9CF2-2614036AD4EA     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '269F09BD-12D0-4940-86DE-F2879DCE44C9     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '26BFB1D0-FBDD-4804-87AD-5AB83E2E7625     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '273FD9FE-8048-4955-A27D-4325CDA27823     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '2884DF7B-BD23-48AD-A96D-FC4C6C6BB19A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '299E2C95-E444-42A9-9259-96198E56DE31     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '2FD41F73-B5B2-40DF-B8B5-7E5EB1D10573     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '30FEEE65-A93A-4855-A643-79B5CE68BF2C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '311E2842-F276-4B20-A16F-440754902C02     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '31CCC4E2-2ADE-4765-BCDE-41BB4D3424B1     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '32166CEC-3EE1-4A4B-A56A-A2D5C55606D7     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '334B41D0-A924-42F7-89D1-4C8285ABCDF8     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '363E44B1-0A08-4052-9352-2D901377E44E     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '364911BE-46FD-48DD-A401-B93BAD412352     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '36FB65DF-1691-4D04-B190-6135DADE09C5     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '3966CB90-D0BA-4902-84F4-1CA3784B4FA8     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '3A88F05A-26E6-4F8F-8AC3-EB56533B6897     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '3AF99A2A-E491-42C4-B13E-50E6405C273B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '3DAEE61B-CDD8-4D68-84CB-A8C1EAC5CF07     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '3DE00A9C-3B9D-45B2-AA14-62385F5180D0     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4077E430-0E49-4FED-96B6-38CCDC82255C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '42891CF5-678A-4ED3-BCFD-6735B327267E     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4397C028-1D57-4628-AB02-D53C75E6EF30     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4508FBA9-A8B7-4881-A1D5-186BE8E7BA53     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '45143937-019B-4CE2-AEE0-9DBB403132AE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4776AA01-C3C9-4F3B-A840-E3FD58076D87     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '47B8DD9F-9F62-4563-A000-53E0AA410B31     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '48BEE4BC-DC31-4C76-B809-FA5B147C6BA6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '494D2B25-9E19-41AA-8D84-C0EA2E2DF9E4     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '49A803BB-6F55-4710-880D-1417F57B5C97     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4A07A698-F6AB-4D25-A3F3-FAA612D0C340     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4A6C4B4F-B642-4D00-ABDF-5C737524DB88     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4AB07B4C-1D1D-4B8B-B419-CD71EF394371     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4F60035D-5F95-4ABA-9599-520A67EB8DCF     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '4F7BFF81-5C30-4C1D-B460-ACD2C1659A3B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '542CA782-7765-49B8-8ACC-CD9629C6BB79     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '54676978-4EF8-41BB-906D-3B2F6746AA1F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '5596A138-8F62-47CB-98DF-DB3FE73735BB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '55BA78D7-3C8D-4208-AE14-E7B2CC1A331F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '55DE3C1A-870C-4281-B336-2ED82185742A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '56D870AA-C2DC-4980-AB41-CB9D6E2F1B43     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '57280419-9CAB-49E8-910F-8B87C047DFBE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '57DAF030-5F76-4890-9E60-887DE308FE34     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '57FFAF34-B5A0-4888-8245-17FF53466F2B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '58212543-B0EB-44E0-96F4-12C1074C0FA8     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '5A79E0A8-ED23-4B39-A79F-40A020FE640D     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '5D02C73C-CDD9-4E89-862E-DE539B30E045     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '5DA676E1-5BD5-4D03-910F-9A22F0CEB830     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '5F216380-1482-4BDB-9122-7E991B7065B4     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '603D1011-0D54-4049-88FF-109D193D4D2A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '61B0D1B4-F1CA-46A8-A8CA-F9575E43CF93     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '662212EA-664C-4EBE-A123-F481F512C93A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '6756F068-05CD-4FED-821F-F8275C64B666     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '68281086-5EB2-4D50-9BC6-D3048CCFCE0B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '68DF736C-8A7E-46C6-AEDC-287DB7266198     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '6CC4AE5C-34AA-456C-9573-A4944AF7D240     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '6F3255D1-5030-4720-B99E-2CA8212B6C77     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '6F3F990D-7A8F-4773-8671-26EFC22B996E     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '6FD6FB38-30BB-4EFB-8A15-A06F29BDC130     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '71B6F372-FFF2-453A-B9EA-11B5911A15B6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '72AB1F39-2F6A-4C7F-BA79-18B482AA859D     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '72FFAB13-3E9B-4508-A5A0-36F303EE97EF     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '77B204BA-5462-4667-8165-5309C7B5BACC     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '77DF7E8F-030D-40C5-9DBF-63961214FC5A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '79D97AC1-4FB3-456C-B870-AFA3E3CF23D3     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '7A868BFC-7A41-4D2F-AA8E-99EE5F7CEAEE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '7AF57053-EFA3-4CA6-A3D2-2EBD1A085980     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '7E3414D6-38BC-4471-9B78-A27B5256F530     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '805B7401-9911-48D0-BD8A-2636F5CDFEEC     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '80C75251-082B-44F6-B989-E1090091F173     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '820325D5-7744-4AD7-9062-D482C6BDD4EC     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '821B0543-6C36-46FD-BD20-7460AFC5A3CB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '85AA1ECD-0260-444B-A88A-65B80C2FA225     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '866F1659-BA6F-4A11-9989-97F014F68304     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '875BF259-6D77-4CCA-AC02-FA46620E00F5     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '88DC3A4C-C2A2-490D-BECB-66167B616BE6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8AD020A7-F38F-4FF1-AA83-01C35DBD2BB1     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8B345460-FD90-4950-A340-ED02DC534BCD     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8B6F8327-7EF9-417F-BFC1-EDDA2D348B23     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8C019911-FF17-4659-B7D6-523DD4F89D19     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8CD390DF-8CD9-4607-AB11-71AC1A6262DE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8DCBC6A3-AD97-41E8-A4C0-9BAC0E1772CF     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8E4F46BA-438F-4AC2-B25D-3A0AEBCF6F0D     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8F9A65F2-D051-4FB9-9A93-C5D5C95737D1     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '8FEF4B69-CCFD-41AC-B835-5F78C67FC6E4     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '91A89D25-9295-4E63-8506-9FFD2F5FF0D6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '91E6A21C-0EC5-4BEF-83F9-F51C0367F4EF     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '9297A480-8195-4595-9DF6-CF27C94737F6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '934EA9FA-4857-4B97-B540-8F7D1E4F4FBA     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '952C0E9F-FFE4-4199-8C85-8CFDF41EBE6F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '96A55052-E30F-41B1-85D4-DCEAC568E276     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '96E7106C-CCBF-4CE1-8696-AFC4E76CA05B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '98C6B53B-1C7A-45D1-8F6C-265B5DBE8508     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '9B3B95C4-02A5-4770-BDD0-0D7585132C83     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = '9BEDC256-65FF-40E1-A889-89D6A9F0A745     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A01DF841-AA1D-4F17-A0F9-5561DB93B5E2     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A025A9B9-519B-4165-B67C-4A8A096ACD63     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A1096228-4383-490F-A485-DC51BAE0BFC8     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A16831F3-1F9E-44B8-9B4E-4EC2ECE92B85     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A177F9F7-F57C-4DF4-9C12-F714A63EA4F6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A244C3FF-38B9-41DA-B964-633FA55DC3F6     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A317317D-9F1E-4E57-985D-A0178C205562     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A348CDD5-368E-4295-AB54-4B1195AF3ADA     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'A68FB2BA-E803-42AD-B9E2-F035ADD7D709     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'ADD64D39-E786-418F-B7E6-7A3C3714D7F4     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'AE19D062-33AB-464E-992B-292C97517B9F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'AE2E9E42-7955-4804-8440-BB8DC4D0AAC2     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'AF112845-3E9D-4513-85F9-3950F45BC370     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'AFE31742-C1E5-4FFC-AA62-9D2CCF932E57     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B053FAF1-4371-4F95-92E8-691AC08F8A84     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B10E8353-D525-44A8-974B-031A5C2B3121     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B467DADE-7961-4BFA-A2BD-10488D0C66E7     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B59A1C26-4191-45DC-956C-4B2DAA588088     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B617BA3B-FCF0-4837-A9C4-1032280CCAFB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B6C84B0A-5A7A-4332-AC37-5C030B9C11F1     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'B6FFE120-87CC-4223-A0F6-B92F3EFCCFA7     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'BA99D267-6EE4-452E-B61B-B47F51CE9D40     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'BE858759-4679-4873-9BD2-FEB8CDF1CCBE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C03AE926-0B71-4A49-BFBA-BB94F4F40A5C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C0BBA479-FB21-48BC-BCE9-6D71B52F7A64     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C172A997-B47E-4B7C-B196-BA5F36BC2E3C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C5B2B181-6E5B-421D-86FE-3978F073C869     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C6A7A229-7E74-452E-9807-B3939ACD9259     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C7A8A67F-1938-4DFA-ACF3-F5FB89EAE088     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'C9F28692-A7A7-4CB6-A575-5F67D52B1EF4     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CA8E68C7-D944-449D-83FD-CD8AADB9167C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CD8AA908-592F-4057-AD07-5BBF51E2D04A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CDDD9A4C-2AC6-4769-80FE-6E54E4ABF81E     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CE0B99A9-2B40-46EC-AA50-A0157218FCDD     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CEE941B7-1AE7-4D4A-B7EC-611BE3841978     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'CFC6D45A-DEBF-49D0-B54F-715241FF71A9     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D35A1382-91F8-4E89-A00D-D51946087C05     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D3610108-51F7-44C4-84FF-DA4C02799B40     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D48524A9-81F1-43D6-8AD0-C6AE8A735471     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D501A79F-8207-4E06-AADA-CE4C30957732     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D53F5BEB-6C95-4F94-BF29-81DC4DAF678A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D61E050A-936D-4C64-98CF-AB44CC859E75     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D6CABAB1-BD30-40B7-B0DB-C3EB91D06500     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'D6E76D37-C791-4228-BAFA-2DE9ACE34F6A     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'DB16FD23-4DD4-453F-96A5-C9E38678C402     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'DC3F08D5-F153-49F0-A3DD-868E2EB8B8FB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'DD4172FE-F3A4-4198-8292-625591EECA57     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'DEAAF022-4B48-4B7E-9A86-485EC4DD9C22     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'DFC92916-0EED-4CF9-BF77-4435A5119184     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'E188D752-326A-4684-8D75-C736DDF8142D     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'E5BA14AD-E941-4290-A168-E92EC8B0A7A3     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'E8F5747F-9308-4837-88CC-8A7C9DDBA8FE     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'ED38F67C-CA76-48F2-BA5D-2F02163D5435     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'EDC422FB-E701-48CB-8D57-C5185ECF572B     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'EE6DD062-2DB5-44DE-91D2-7C9F94C5A359     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F049753F-97AE-4757-8633-0CC4CCB46B3C     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F13CED7C-9CCE-420A-8BFE-380D0074E1FD     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F262CE90-A5A0-446E-8248-CA0F60C8014F     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F4C91DF9-B80D-4211-BDD9-45213FD329F9     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F68F67B8-93AC-4ED0-802A-13DEBD2F07BC     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'F7218369-29C6-46E5-A860-6C141CA56DBB     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'FACA980D-20CD-4B12-9413-9F383F03BDC8     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'FD2E7A8E-F087-4F99-89F0-EF026E59D0CA     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'FD93BB76-5032-4272-9A0E-60D30E879D30     ',@Accion = 'AGREGAR'
exec sp_ActualizarxActividadesxUsuario @IDUsuario = 300092,@IDActividad = 'FD9D4DA1-83AC-4B4D-AEEC-CB597913389D     ',@Accion = 'AGREGAR'


