select 
CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub
--,gcc.codigoGICP
--CLsub.Descripcion_Abrev
from ClaseProductoServicio CLprin
inner join ClaseProductoServicio CLsub on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
--inner join Grupodeimpresion_ClaseProductoServicio gcc on CLprin.PKID=gcc.IDClaseProductoServicio and CLsub.IDClaseProductoServicioPadre=CLprin.PKID
where
CLprin.Activo=1 and
CLprin.Descripcion  IN (
'ACCESORIOS',
'Accesorios-Aditivos',
'ADITIVOS',
'FRENO-EMBRAGUE',
'CAJA-TRANSMISION',
'DIRECCION-SUSPENSION',
'Encendido-Fuel Injection',
'CARBURACION',
'ENCENDIDO',
'FUEL INJECTION',
'ELECTRICO',
'ALTERNADOR COMPLETO',
'ARRANCADOR COMPLETO',
'PARTES MOTOR',
'RETEN-RODAJE',
'OBSEQUIOS',
'Otros',
'SERVICIOS')
ORDER BY CLprin.Descripcion  ASC

SELECT TOP 1*FROM Grupodeimpresion_ClaseProductoServicio WHERE IDClaseProductoServicio=1021

select  Descripcion, gcc.codigoGICP from ClaseProductoServicio class
LEFT join Grupodeimpresion_ClaseProductoServicio gcc on gcc.IDClaseProductoServicio=class.PKID
where
Activo=1 and
Descripcion  IN (
'ACCESORIOS',
'Accesorios-Aditivos',
'ADITIVOS',
'FRENO-EMBRAGUE',
'CAJA-TRANSMISION',
'DIRECCION-SUSPENSION',
'Encendido-Fuel Injection',
'CARBURACION',
'ENCENDIDO',
'FUEL INJECTION',
'ELECTRICO',
'ALTERNADOR COMPLETO',
'ARRANCADOR COMPLETO',
'PARTES MOTOR',
'RETEN-RODAJE',
'OBSEQUIOS',
'Otros',
'SERVICIOS')
ORDER BY Descripcion  ASC

