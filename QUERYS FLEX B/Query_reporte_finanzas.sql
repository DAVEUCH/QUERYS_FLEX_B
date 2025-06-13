SELECT dbo.TipoCp.Codigo AS CodTipCp,
dbo.TipoCp.Descripcion AS TipoCp,
dbo.Cp.IDSucursal AS SucursalID,
ISNULL(info.PKID, dbo.Cp.IDResponsable) AS VendedorID,
dbo.Cp.Fecha, dbo.Cp.NumCp AS Numcp, ISNULL(info.Codigo,Persona_1.Codigo) AS Codigo,
ISNULL(info.Nombre, Persona_1.Nombre) AS Vendedor,
CGI_ConsultaComisionesDocumento_1.MontoComision AS ComisionNeto, 
CGI_ConsultaComisionesDocumento_1.FechaCancelacion AS Fecha_EoC,
dbo.Persona.Nombre AS Cliente, 
(CASE moneda.MonedaBase WHEN 0 THEN CASE WHEN dbo.Cp.IDTipoAsociado = '10002' THEN dbo.Cp.Total ELSE Cp.ValorVenta END ELSE CASE WHEN dbo.Cp.IDTipoAsociado = '10002' THEN dbo.Cp.Total ELSE Cp.ValorVenta
END / Cp.TipoCambio END) * dbo.CpCobrarPagar.MovSaldo AS ValorVentaDolares
FROM dbo.Persona
INNER JOIN dbo.Cp ON dbo.Persona.PKID = dbo.Cp.IDPersona
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID 
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID
INNER JOIN dbo.CGI_ConsultaComisionesDocumento2('2024-06-01', '2024-06-05') AS CGI_ConsultaComisionesDocumento_1 ON dbo.Cp.PKID = CGI_ConsultaComisionesDocumento_1.IDCp 
INNER JOIN dbo.CpCobrarPagar ON dbo.Cp.PKID = dbo.CpCobrarPagar.PKID 
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID
LEFT OUTER JOIN dbo.ObtenerInformacionFacturasxLetra() AS info ON CGI_ConsultaComisionesDocumento_1.IDCp = info.PKID