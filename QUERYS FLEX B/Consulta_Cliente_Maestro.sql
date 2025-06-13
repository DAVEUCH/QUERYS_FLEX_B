SELECT
    CLI.PKID AS IdCliente,
    PER.PKID AS IdPersona,
    PER.Codigo,
	tter.Descripcion as Tipo_persona,
	iif(PER.IDTipoDocIdentidad=1,'DNI',IIF(PER.IDTipoDocIdentidad=4,'CE',IIF(PER.IDTipoDocIdentidad=5,'RUC',IIF(PER.IDTipoDocIdentidad=7,'PAS',IIF(PER.IDTipoDocIdentidad=13,'CED',
	IIF(PER.IDTipoDocIdentidad=15,'OTROS','')))))) AS Tipo_Doc,
	PER.Nombre as Nombre_RazonSocial,
    PER.DocIdentidad as RUC_DNI,
    DIRE.Descripcion as Direccion,
	per.DocIdentidad,
	per.Activo,
	per.Extranjero,
	per.ExceptuadoDePercepcion,
	per.AgenteRetencion,
	per.AgentePercepcion,
	iif(cli.CreditoContado=1,'Credito','Contado') as Forma_Pago,
	mc.Descripcion as Dias_Credito,
	cli.LineaCredito,
	cli.BalanceSoles,
	cli.BalanceDolares,
	cli.DiasCredito,
	mo.Simbolo as Moneda,
	cc.Descripcion as Tipo_Categoria,
	tc.Descripcion as Tipo_Cliente,
	telf.NumeroTelefono,
	telf.TipoTelefono,
	iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc,
	con.Nombre as Nombre_Contacto,
	con.Cargo as Cargo_Contacto,
	con.Email as Email_Contacto,
	con.Telefono1 as Telefono_Contacto,
	per.Email as Email_Cliente,
	per.Web as Pagina_Web,
	per.Observacion,
	usu.IDUsuario,
	CliAudi.Operacion
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
left join Telefono telf on telf.IDPersona=CLI.PKID
left join TipoTercero tter on tter.PKID= PER.IDTipoTercero
left join TipoDocIdentidad tdi on tdi.PKID= PER.DocIdentidad
left join ModalidadCredito mc on mc.PKID=CLI.IDModalidadCredito
left join Moneda mo on mo.PKID=CLI.IDMoneda
left join CategoriaCliente cc on cc.PKID=cli.IDCategoriaCliente
left join TipoCliente tc on tc.PKID=CLI.IDTipoCliente
left join Contacto con on con.IDPersona=PER.PKID
left join (Select PC, IDEntidad, IDUsuario, Operacion, Fecha From Auditoria Where NombreTipo='Cliente'
And (Operacion = 'Modificar' OR Operacion = 'Crear' OR Operacion = 'Eliminar'))CliAudi on  CliAudi.IDEntidad=CLI.PKID
left outer join Usuario usu on usu.pkid= CliAudi.IDUsuario
WHERE PER.Codigo='000003618175'
ORDER BY PER.Codigo


select*from Persona where Codigo='000003618175'
--select*from Persona where  pkid=36127 
select*from Persona where  pkid=68774 
--select*from Cliente where PKID=69779
select*from Cliente where PKID=69779
select*from Cliente where PKID=68774
update Cliente set IDTipoMedioDePago=0 where PKID=69779

select*from Direccion where IDPersona=69779
select*from Direccion where IDPersona=68774

select*from Direccion where Sucursal is null
select*from DireccionCliente where PKID=71026
select*from DireccionCliente where PKID=69943


SELECT * 
FROM Direccion 
WHERE Sucursal IS NULL OR Sucursal = ''

--insert Persona (PKID,IDTipoTercero,IDTipoDocIdentidad,Email,Web,Observacion,DocIdentidad,Codigo,Nombre,ApellidoPaterno,ApellidoMaterno,PrimerNombre,SegundoNombre,Descriptivo,Activo,
--AgenteRetencion,AgentePercepcion,Extranjero,CuentaBancaria,FechaAniversario,FechaCumpleaños,IDDireccionPrincipal,ExceptuadoDePercepcion,fechaCrea)
--values (68353,2,5,'','','','20510870099','20510870099','REPUESTOS NITON SAC','','','','',0,1,0,0,0,'','2024-07-08','2024-07-07',69744,0,'2024-08-08')

--insert Cliente(PKID,IDCategoriaCliente,IDMoneda,LineaCredito,BalanceSoles,BalanceDolares,MejorPrecio,IDModalidadCredito,DiasCredito,IDTipoMedioDePago,CreditoContado,
--InhabilitadoBonificacion,InhabilitadoDescuento, IDTipoCliente, LineaCreditoPorFuerzaVentas,MaximoCuentasPorCobrarVencidas,Campo1,Campo2,Campo3,Campo4,IDCaracteristica1,IDCaracteristica2,IDCaracteristica3,
--IDCaracteristica4,Corporativo,IDClienteCorporativo,LineaCreditoCorporativa,LineaCreditoActiva)
--values (68354,11,1,'3000.00','0.00','0.00',1,100000014,0,0,1,0,0,16,0,0,'','','','',0,0,0,0,0,0,0,1)

--insert Direccion(PKID,IDDistrito,IDProvincia,IDDepartamento,IDPersona,Descripcion,DireccionPrincipal,Sucursal)
--values (69503,1249,128,15,68352,'sjl',1,'000')

--INSERT Auditoria(IDUsuario,NombreTipo,Operacion,IDEntidad,PC,Fecha,ContenidoXML)
--values (600208,'Cliente','Crear',68353,'GCICPUOFADM004','2024-07-08','')

select top(10)*from Direccion






select*from Usuario where IDUsuario='DMARIÑASO'
select*from Direccion where IDPersona=68352
UPDATE Persona SET IDDireccionPrincipal=69502 WHERE PKID=68352
DELETE FROM Direccion where IDPersona=68352
select*from DireccionCliente
select*from Direccion
--select*from TipoCliente
--select*from TipoPersona
--select*from TipoTercero
--select*from tTipoCliente
select*from Persona where PKID=68352
select *from Cliente where PKID=68352
--select*from CategoriaCliente
--select*from TipoDocIdentidad
--select*from Moneda
--select*from TipoMedioDePago
--select*from Contacto
--select*from ModalidadCredito
--select*from Contacto
--select*from ConfiguracionVista where Nombre like 'cliente%'
--select top(10)*from Auditoria where NombreTipo like 'cliente%'
Select top(10)* from usv_PedidosModificados

Select PC, IDEntidad, IDUsuario, Operacion, Fecha From Auditoria Where NombreTipo='Cliente'
And (Operacion = 'Modificar' OR Operacion = 'Crear' OR Operacion = 'Eliminar')

select *from Auditoria where NombreTipo like 'cliente%'
select *from Auditoria where Fecha between '2024-07-01' and '2024-08-09'

SELECT TOP 10 *FROM Auditoria ORDER BY Fecha DESC;

select*from Cliente where PKID=68352




