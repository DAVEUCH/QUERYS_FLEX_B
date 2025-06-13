 SELECT 
dbo.TipoCp.Codigo AS CodTipCp,
dbo.TipoCp.Descripcion AS TipoCp,
dbo.Cp.IDSucursal AS SucursalID,
dbo.Cp.IDResponsable AS VendedorID,
dbo.Cp.Fecha,
dbo.Cp.NumCp AS Numcp,
Persona_1.Codigo, 
Persona_1.Nombre AS Vendedor,
CGI_ConsultaComisionesDocumento_1.MontoComision AS ComisionNeto,
CGI_ConsultaComisionesDocumento_1.FechaCancelacion AS Fecha_EoC, 
dbo.Persona.Nombre AS Cliente, 
(CASE moneda.MonedaBase
WHEN 0 THEN CASE WHEN dbo.Cp.IDTipoAsociado = '10002'
THEN dbo.Cp.Total
ELSE Cp.ValorVenta 
END 
ELSE 
CASE WHEN dbo.Cp.IDTipoAsociado = '10002' 
THEN dbo.Cp.Total ELSE
Cp.ValorVenta END / Cp.TipoCambio END) * dbo.CpCobrarPagar.MovSaldo AS ValorVentaDolares
FROM dbo.Persona
INNER JOIN dbo.Cp ON dbo.Persona.PKID = dbo.Cp.IDPersona 
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID
INNER JOIN dbo.CGI_ConsultaComisionesDocumento2('2024-06-01', '2024-06-10')AS CGI_ConsultaComisionesDocumento_1 ON dbo.Cp.PKID = CGI_ConsultaComisionesDocumento_1.IDCp
INNER JOIN dbo.CpCobrarPagar ON dbo.Cp.PKID = dbo.CpCobrarPagar.PKID 
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID
where dbo.Cp.NumCp='001-0130893'

-- Crear una función en SQL Server
alter FUNCTION ObtenerInformacionFacturasxLetra()
RETURNS TABLE
AS
RETURN
(
    SELECT 
	    cpv.IDCp,
        cpa.NumCp AS facturaa,
        cpa.FechaEmision,
        cpa.PersonaNombre,
        cpv.IDLetra,
        cpl.NumCp AS letraa,
        per.Nombre,
		per.Codigo,
		per.PKID
    FROM usv_CpVentaLetra cpv
    INNER JOIN Cp cpa ON cpa.PKID = cpv.IDCp
    INNER JOIN Cp cpl ON cpl.PKID = cpv.IDLetra
    INNER JOIN Persona per ON per.PKID = cpa.IDResponsable
);
select*from Cp where PKID=66955    002-0036045
select*from Cp where PKID=69584    001-0053734
