SELECT *  FROM dbo.usf_CuentaCorrienteProveedor_2()

select  pers.DocIdentidad, pers.NombreCliente, pers.Direccion_Cliente, pers.Localidad_Cliente, pers.Telefono, 
Linea_Credito, Linea_Utilizada, Linea_Disponible, ctacte.* 
from usv_ClientesDatosPrincipales pers 
left outer join ness_cuentacorriente_cliente_new ctacte On pers.IDersona = ctacte.DocumentoPagoPersonaID
where pers.DocIdentidad='90000000161'

select*from Persona where DocumentoPagoPersonaCodigo=20101066992        

select *from Cuentas_proveedor_2025 

where
DocumentoPagoPersonaNombre='ADI MARKETING, INC.'   

select*from Cp where NumCp=''
--and 
--DocumentoPagoCuentaNumero in('FF25-0033953','FF25-0034026','FF25-0034153') 

select *from Persona where Nombre='ADI MARKETING, INC.'  

SCB10-0028262