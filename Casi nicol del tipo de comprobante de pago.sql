select  CPP.PKID AS PKI_CP,Fecha,IDTipoCp,TIP.Descripcion AS TipoCp,CPP.IDPeriodo, COP.Descripcion AS CPTOOP,IDPeriodo,NumCp,PersonaNombre  
from Cp CPP
LEFT JOIN TipoCp TIP ON TIP.PKID=CPP.IDTipoCp
LEFT JOIN CptoOperacion COP ON COP.PKID=IDCptoOperacion
where NumCp in (
'F001-1967581',
'F001-1967582',
'F001-1967581',
'F001-1967583',
'FD01-1749272',
'F004-1441780',
'F004-1441781',
'F004-1441782',
'F004-1441783')

SELECT*FROM TipoComprobantePago WHERE PKID=11

SELECT*FROM TipoCp WHERE PKID=5219

SELECT        Periodo, CUO, NumAsientoCorrelativo, FechaEmision, FechaVencimiento, TipoComprobantePagoCodigo, NumSerieDocumento, AñoDUA, 
   NumeroDocumento, ' ' AS NumeroFinal, TipoDocIdentidad, NumeroDocIdentidad, RazonSocial, BaseGravada14, ImpuestoBaseGravada14, BaseGravada16,
   ImpuestoBaseGravada16, BaseGravada18, ImpuestoBaseGravada18, ValorNoGravada, ValorISC, ValorICB, ValorOtrosCargos, ImporteTotal, 
                       CodigoMoneda,
    TipoDeCambio, ReferenciaFechaEmision, ReferenciaTipoComprobantePago, ReferenciaNumeroSerie, CodigoDUA, ReferenciaNumero,
                ComprobanteDetraccionFechaEmision, ComprobanteDetraccionNumero, MarcaDocumentoSujetoRetencion, 
                         ClasificacionBienesServicios,
                CampoLibre as IdentificacionContrato, '1' AS ErrorTC, '1' AS ErrorTP, '1' AS ErrorTP2, '1' AS ErrorDNI, '1' AS IndicadorTCP, 
                EstadoIdentificaAnotacion, CampoLibre
FROM         [LibrosElectronicos].[RegistroCompras](100000495)


SELECT * FROM vrpteRegistroCompras2010 WHERE IDPeriodo=100000495
