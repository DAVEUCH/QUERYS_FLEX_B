-----------
UPDATE ProductoServicio SET IDClaseProductoServicio=964 WHERE PKID=10028
SELECT TOP 10*FROM ProductoServicio WHERE PKID=25253
select 
--CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
--CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub
--,
--CLsub.Descripcion_Abrev
from ClaseProductoServicio CLprin
left join ClaseProductoServicio CLsub on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
where
CLprin.Activo=1 and
CLprin.Descripcion  IN ('ACCESORIOS',
'ADITIVOS',
'ALTERNADOR COMPLETO',
'ARRANCADOR COMPLETO',
'CARBURACION',
'CAJA-TRANSMISION',
'DIRECCION-SUSPENSION',
'ELECTRICO',
'ENCENDIDO',
'FUEL INJECTION',
'FRENO-EMBRAGUE',
'OBSEQUIOS',
'PARTES MOTOR',
'RETEN-RODAJE',
'SERVICIOS',
'TECNOLOGÍA - INFRAESTRUCTURA')
ORDER BY CLprin.Descripcion  ASC

select *from ClaseProductoServicio where Activo=0

UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT BITUBO' WHERE PKID=959
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT CARTUC' WHERE PKID=960
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT MCPHER' WHERE PKID=961
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT BITUBO' WHERE PKID=962
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT HDMCPHE' WHERE PKID=963
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT CONVEN' WHERE PKID=964
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT BITUBO' WHERE PKID=965
UPDATE ClaseProductoServicio SET Descripcion_Abrev='AMORT CONVEN' WHERE PKID=966


ORDER BY CLsub.Descripcion ASC

select 
pro.PKID as IdProd,
pro.Codigo,
pro.Descripcion as producto, 
CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub  
from ProductoServicio pro
LEFT JOIN ClaseProductoServicio CLsub on CLsub.PKID=pro.IDClaseProductoServicio
left join ClaseProductoServicio CLprin on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
--left join Marca mar on mar.PKID=
WHERE LTRIM(RTRIM(pro.Codigo)) IN ( 
 'RT.CMKD-2',
 'RT.CMKH-26',
 'RT.CMKH-2',
 'RT.CMKH-17',
 'RT.CMKH-9',
 'RT.CMKH-13',
 'RT.CMKH-8',
 'RT.CMKH-10',
 'RT.GA0102',
 'RT.CMKH-11',
 'RT.CMKH-14',
 'RT.CMKH-1',
 'RT.CMKH-25',
 'RT.CMKH-24',
 'RT.GA0103',
 'RT.GA0106L',
 'RT.GA0106R',
 'RT.GA0105')
 order by case Codigo
when  'RT.CMKD-2' then 1
when  'RT.CMKH-26 ' then 2
when  'RT.CMKH-2 ' then 3
when  'RT.CMKH-17' then 4
END
  select top 1*from ClaseProductoServicio where PKID=878
  UPDATE ClaseProductoServicio SET img_lp=1 where PKID=878 
-------------------------
select CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub  
from ClaseProductoServicio CLprin
left join ClaseProductoServicio CLsub on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
where CLsub.Descripcion='AMORTIGUADOR CONVENCIONAL'
ORDER BY CLsub.Descripcion ASC



