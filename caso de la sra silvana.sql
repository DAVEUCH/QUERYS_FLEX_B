use gci
select pro.DocIdentidad, pro.NombreCliente, pro.Direccion_Cliente, pro.Localidad_Cliente, pro.Telefono, 
Linea_Credito, Linea_Utilizada, Linea_Disponible, ctacte.* 
from usv_ProveedorDatosPrincipales pro 
left outer join ness_cuentacorriente_proveedor_new ctacte On pro.IDersona = ctacte.DocumentoPagoPersonaID


SELECT 
    pro.DocIdentidad, 
    pro.NombreCliente, 
    pro.Direccion_Cliente, 
    pro.Localidad_Cliente, 
    pro.Telefono, 
    ctacte.*
FROM usv_ProveedorDatosPrincipales pro
OUTER APPLY dbo.usf_CuentaCorrienteProveedor_NEW2025(pro.IDersona) ctacte 

where pro.IDersona=70477


SELECT 
    pro.DocIdentidad, 
    pro.NombreCliente, 
    pro.Direccion_Cliente, 
    pro.Localidad_Cliente, 
    pro.Telefono, 
    ctacte.*
FROM usv_ProveedorDatosPrincipales pro
OUTER APPLY dbo.usf_CuentaCorrienteProveedor_NEW2025(pro.IDPersona) ctacte
WHERE pro.IDPersona = 70477;



SELECT *  FROM dbo.usf_CuentaCorrienteProveedor_NEW2025(70477)

select *from Persona where Nombre LIKE '%ADI'

select *from Persona where Codigo='90000000161'