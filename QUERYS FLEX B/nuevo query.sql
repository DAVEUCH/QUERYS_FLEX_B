SELECT 
tc.Codigo AS CodTipCp,
tc.Descripcion AS TipoCp,
cpAlias.IDSucursal AS SucursalID,
cpAlias.IDResponsable AS VendedorID,
cpAlias.Fecha,
cpAlias.NumCp AS Numcp,
--info.Codigo,
--info.Nombre,
info.Codigo AS Codigo,
info.Nombre AS Vendedor,
 --select (select  IDCp from CGI_ConsultaComisionesDocumento2('2024-06-01', '2024-06-05'))  AS ComisionNeto,
CGI_ConsultaComisionesDocumento_1.MontoComision AS ComisionNeto, 
CGI_ConsultaComisionesDocumento_1.FechaCancelacion AS Fecha_EoC,
Persona_1.Nombre AS Cliente,
(CASE mon.MonedaBase WHEN 0 THEN CASE WHEN cpAlias.IDTipoAsociado = '10002' THEN cpAlias.Total ELSE cpAlias.ValorVenta END ELSE CASE WHEN cpAlias.IDTipoAsociado = '10002' THEN cpAlias.Total ELSE cpAlias.ValorVenta
END / cpAlias.TipoCambio END) * dbo.CpCobrarPagar.MovSaldo AS ValorVentaDolares,
info.letraa
FROM Cp cpAlias
inner JOIN Persona Persona_1 ON Persona_1.PKID = cpAlias.IDPersona
INNER JOIN TipoCp tc ON cpAlias.IDTipoCp = tc.PKID 
left JOIN dbo.ObtenerInformacionFacturasxLetra() AS info ON cpAlias.NumCp=info.facturaa
 
-- AND  cpAlias.NumCp='F001-0000014'
--,'LC001', 'LC006'
--sp_helptext CGI_ConsultaComisionesDocumento2
-- INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID
INNER JOIN dbo.CGI_ConsultaComisionesDocumento2('2024-06-01', '2024-06-05') AS CGI_ConsultaComisionesDocumento_1 ON cpAlias.PKID = CGI_ConsultaComisionesDocumento_1.IDCp 
INNER JOIN dbo.CpCobrarPagar ON cpAlias.PKID = dbo.CpCobrarPagar.PKID 
INNER JOIN Moneda mon ON cpAlias.IDMoneda = mon.PKID
--LEFT OUTER JOIN dbo.ObtenerInformacionFacturasxLetra() AS info ON CGI_ConsultaComisionesDocumento_1.IDCp = info.PKID
where tc.Codigo in ('FVE08','NCCE8','NCEDE')
