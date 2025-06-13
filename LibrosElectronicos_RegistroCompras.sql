SELECT        Periodo, CUO, NumAsientoCorrelativo, FechaEmision, FechaVencimiento, TipoComprobantePagoCodigo, NumSerieDocumento, AñoDUA, 
   NumeroDocumento, ' ' AS NumeroFinal, TipoDocIdentidad, NumeroDocIdentidad, RazonSocial, BaseGravada14, ImpuestoBaseGravada14, BaseGravada16,
   ImpuestoBaseGravada16, BaseGravada18, ImpuestoBaseGravada18, ValorNoGravada, ValorISC, ValorICB, ValorOtrosCargos, ImporteTotal, 
                       CodigoMoneda,
    TipoDeCambio, ReferenciaFechaEmision, ReferenciaTipoComprobantePago, ReferenciaNumeroSerie, CodigoDUA, ReferenciaNumero,
                ComprobanteDetraccionFechaEmision, ComprobanteDetraccionNumero, MarcaDocumentoSujetoRetencion, 
                         ClasificacionBienesServicios,
                CampoLibre as IdentificacionContrato, '1' AS ErrorTC, '1' AS ErrorTP, '1' AS ErrorTP2, '1' AS ErrorDNI, '1' AS IndicadorTCP, 
                EstadoIdentificaAnotacion, CampoLibre
FROM         [LibrosElectronicos].[RegistroCompras](100000479)
WHERE        
   CUO NOT LIKE '255%'
   and NumSerieDocumento='F002' and NumeroDocumento='0001064'

   select*from Periodo
   select*from Cp where NumCp='F002-0001064' and PKID=812823

   select*from TipoCp where PKID=5756
   
   select*from CptoOperacion where PKID in( 1176,1974)