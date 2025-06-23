select*from Vendedor where PKID=2483


select*from Persona where Codigo='A06753025'

select*from Persona where Codigo='A08858329'

insert into Vendedor (PKID,IDGrupoVentas,FueraDeRuta,ComisionVenta,ComisionCobranza,DiasDeGracia,IDSucursal) values
(10720,18,0,'0.00','0.00',0,0)

select top 1* from dbo.usf_ConsultaComisionDocumento('2025-01-01', '2025-01-01') llave PKID
select top 1 *from Cp left join cp.numcp=usf_ConsultaComisionDocumento.numcp
select top 1*from ItemCp LEFT JOIN  ItemCp.IDCP=cp.PKID
select top 1 *from ItemProducto LEFT JOIN ItemProducto.PKID=ItemCp.PKID
select top 1*from Producto LEFT JOIN Producto.PKID=ItemProducto.IdProducto
select top 1*from Marca left join Marca.pkid=Producto.IDMARCA



alter PROCEDURE sp_ConsultaComisionExtendida
@NumCp VARCHAR(50)
    --@de DATE,
    --@al DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        
        f.CodTipCp,
		f.TipoCp,
		f.SucursalID,
		f.VendeID,
		f.Fecha,
		f.Numcp,
		f.Codigo,
		f.Vendedor,
		f.ComisionNeto,
		f.Fecha_EoC,
	    f.Cliente,
		f.ValorVentaDolares,
		f.NumCp,
        m.Descripcion as Marca
    FROM dbo.usf_ConsultaComisionDocumento(DEFAULT, DEFAULT) f
    LEFT JOIN Cp cp ON cp.NumCp = f.NumCp
    LEFT JOIN ItemCp icp ON icp.IDCP = cp.PKID
    LEFT JOIN ItemProducto ip ON ip.PKID = icp.PKID
    LEFT JOIN Producto p ON p.PKID = ip.IdProducto
    LEFT JOIN Marca m ON m.PKID = p.IDMARCA
	WHERE f.NumCp = @NumCp
END

EXEC sp_ConsultaComisionExtendida '2025-01-01', '2025-06-30'

EXEC sp_ConsultaComisionExtendida @NumCp = 'F001-0027032'

select*from Cp


