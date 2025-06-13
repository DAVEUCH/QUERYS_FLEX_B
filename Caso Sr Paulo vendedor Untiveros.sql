select top 10*from vMoran_MetaCuota_Vendedores
select*from Cp where IDResponsable=64962 and Fecha='19-04-2025'
select*from Persona WHERE Nombre LIKE 'TORRES IBARRA%'
select*from Persona where PKID=64962
select*from Persona where PKID=15426
select*from Vendedor WHERE PKID=64962
select*from Vendedor WHERE PKID=15426

select*from Vendedor where IDSucursal=100000203
select*from GrupoVentas
select*from Sucursal where PKID=100000203
 Exec usp_ComisionVendedor_EscalaMarcaXVentaVendeAnioyMes_Sum 2025, 4, 64962

SELECT DISTINCT VendedorID FROM dbo.usf_ComisionVendedor_EscalaMarcaXVentaVende_AnioYMes(2025, 4, 15426)

select top 1*from usp_ComisionVendedor_EscalaMarcaXVentaVendeAnioyMes_Sum

select *from GC_Vendedor_Categoria where IDVendedor=64962

--insert into GC_Vendedor_Categoria (IDVendedor,	ch_codCatVende) values 
--(64962,'V1')

select*from GC_CategoriaVende    where IDVendedor=64962   

select*from GC_Vende_RangoVentas  


