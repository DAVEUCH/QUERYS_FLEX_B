Select * from usv_ClientesSinCodEstable


create view usv_ClientesSinCodEstable_2025
as
SELECT DISTINCT 
    Persona.docIdentidad, 
    Persona.Nombre AS Cliente,
    dclient.descripcion AS direccionCliente,
	dis.Descripcion as Distrito,
	pro.Descripcion as Provincia,
	dep.Descripcion as Departamento,
	ISNULL(t.Telefonos, '') AS Telefonos
FROM dbo.Cp WITH (NOLOCK)           
LEFT JOIN dbo.CpVenta WITH (NOLOCK) ON dbo.Cp.pkid = dbo.CpVenta.PKID  
LEFT OUTER JOIN Persona WITH (NOLOCK) ON dbo.Cp.IDPersona = Persona.PKID  
LEFT JOIN Cliente cli ON cli.PKID = dbo.Cp.IDPersona 
LEFT  JOIN direccion dclient ON dclient.idpersona = Cp.IDPersona
left join Departamento dep on dep.PKID= dclient.IDDepartamento
left join Provincia pro on pro.PKID= dclient.IDProvincia
left join Distrito dis on dis.PKID= dclient.IDDistrito
OUTER APPLY (
    SELECT 
        Telefonos = STUFF((
            SELECT '/' + t2.NumeroTelefono
            FROM Telefono t2
            WHERE t2.IDPersona = Persona.PKID
            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')
        , 1, 1, '')
) t
WHERE  
    dbo.Cp.Anulado = 0 
    ------AND dbo.Cp.Tercero = 0 
    ------AND dbo.Cp.Preliminar = 0   
    ----AND dbo.Cp.Total > 0                 
    --AND dbo.Cp.IDTipoAsociado IN ('883')  --, '868'  , '818'
    AND cp.FechaEmision >= '01/01/2023'
    AND ISNULL(dclient.Sucursal, '') = ''
    AND Persona.Codigo NOT LIKE 'A%'
	and Cp.IDCptoOperacion in (1891,1938)
GO



select*from Persona where DocIdentidad in ('09126478','20547868839')

select*from TipoTercero

select*from CptoOperacion where Codigo in ('VE006','SM007')

select top 1*from direccion

select top 10*from Telefono