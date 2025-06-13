select  pers.DocIdentidad, pers.NombreCliente, pers.Direccion_Cliente, pers.Localidad_Cliente, pers.Telefono, 
Linea_Credito, Linea_Utilizada, Linea_Disponible, ctacte.* 
from usv_ClientesDatosPrincipales pers 
left outer join ness_cuentacorriente_cliente_new ctacte On pers.IDersona = ctacte.DocumentoPagoPersonaID



select top 1 pro.DocIdentidad, pro.NombreCliente, pro.Direccion_Cliente, pro.Localidad_Cliente, pro.Telefono, 
Linea_Credito, Linea_Utilizada, Linea_Disponible, ctacte.* 
from usv_ProveedorDatosPrincipales pro 
left outer join ness_cuentacorriente_proveedor_new ctacte On pro.IDersona = ctacte.DocumentoPagoPersonaID

select top 100 *from Proveedor where PKID=895
select*from Persona where PKID=895

