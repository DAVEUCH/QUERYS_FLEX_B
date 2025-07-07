-----------
UPDATE ProductoServicio SET IDClaseProductoServicio=964 WHERE PKID=10028
SELECT TOP 10*FROM ProductoServicio WHERE PKID=25253
select CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub  
from ClaseProductoServicio CLprin
left join ClaseProductoServicio CLsub on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
where 
--CLprin.PKID =763
--and
CLsub.Descripcion  IN (
'AMORTIGUADOR MCPHERSON',
'AMORTIGUADOR BITUBO',
'AMORTIGUADOR COMPUERTA')

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
WHERE LTRIM(RTRIM(pro.Codigo)) IN (
'CH.9700 ',
 'CH.9901 ',
 'CH.9023 ',
 'CH.9055 ',
 'CH.9060 ',
 'CH.9408 ',
 'CH.9409 ',
 'CH.9006 ',
 'CH.9410 ',
 'CH.9412 ',
 'CH.9201 ',
 'CH.CJ8 ',
 'CH.DJ8J ',
 'CH.F11YC ',
 'CH.J18YC ',
 'CH.J8C ',
 'CH.L87YC ',
 'CH.L92YC ',
 'CH.N11YC ',
 'CH.P-RG6HCC ',
 'CH.RA6HC ',
 'CH.RA7YC ',
 'CH.RA8HC ',
 'CH.RC10DMC ',
 'CH.RC10YC4 ',
 'CH.RC12LYC ',
 'CH.RC12YC ',
 'CH.RC14YC ',
 'CH.RC89TMC ',
 'CH.RE14MCC4 ',
 'CH.RE14MCC5 ',
 'CH.REA8MCX ',
 'CH.REC10YC4 ',
 'CH.RER8MC ',
 'CH.RER8YC ',
 'CH.RF11YC ',
 'CH.RJ19LM ',
 'CH.RN11YC ',
 'CH.RN11YC4 ',
 'CH.RS12YC ',
 'CH.RS14LC ',
 'CH.RS14YC ',
 'CH.RV12C ',
 'CH.RV12YC ',
 'CH.CT-481 ')
 order by case Codigo
WHEN  'CH.9700 ' THEN 1
WHEN  'CH.9901 ' THEN 2
WHEN  'CH.9023 ' THEN 3
WHEN  'CH.9055 ' THEN 4
WHEN  'CH.9060 ' THEN 5
WHEN  'CH.9408 ' THEN 6
WHEN  'CH.9409 ' THEN 7
WHEN  'CH.9006 ' THEN 8
WHEN  'CH.9410 ' THEN 9
WHEN  'CH.9412 ' THEN 10
WHEN  'CH.9201 ' THEN 11
WHEN  'CH.CJ8 ' THEN 12
WHEN  'CH.DJ8J ' THEN 13
WHEN  'CH.F11YC ' THEN 14
WHEN  'CH.J18YC ' THEN 15
WHEN  'CH.J8C ' THEN 16
WHEN  'CH.L87YC ' THEN 17
WHEN  'CH.L92YC ' THEN 18
WHEN  'CH.N11YC ' THEN 19
WHEN  'CH.P-RG6HCC ' THEN 20
WHEN  'CH.RA6HC ' THEN 21
WHEN  'CH.RA7YC ' THEN 22
WHEN  'CH.RA8HC ' THEN 23
WHEN  'CH.RC10DMC ' THEN 24
WHEN  'CH.RC10YC4 ' THEN 25
WHEN  'CH.RC12LYC ' THEN 26
WHEN  'CH.RC12YC ' THEN 27
WHEN  'CH.RC14YC ' THEN 28
WHEN  'CH.RC89TMC ' THEN 29
WHEN  'CH.RE14MCC4 ' THEN 30
WHEN  'CH.RE14MCC5 ' THEN 31
WHEN  'CH.REA8MCX ' THEN 32
WHEN  'CH.REC10YC4 ' THEN 33
WHEN  'CH.RER8MC ' THEN 34
WHEN  'CH.RER8YC ' THEN 35
WHEN  'CH.RF11YC ' THEN 36
WHEN  'CH.RJ19LM ' THEN 37
WHEN  'CH.RN11YC ' THEN 38
WHEN  'CH.RN11YC4 ' THEN 39
WHEN  'CH.RS12YC ' THEN 40
WHEN  'CH.RS14LC ' THEN 41
WHEN  'CH.RS14YC ' THEN 42
WHEN  'CH.RV12C ' THEN 43
WHEN  'CH.RV12YC ' THEN 44
WHEN  'CH.CT-481 ' THEN 45
END

select top 10*from ProductoServicio where PKID=24289
-------------------------
select CLprin.PKID as IdClasePrinc,
CLprin.Descripcion as descipprincial,
CLsub.PKID as IdClaseSub,
CLsub.Descripcion as descisub  
from ClaseProductoServicio CLprin
left join ClaseProductoServicio CLsub on CLsub.IDClaseProductoServicioPadre=CLprin.PKID
where CLsub.Descripcion='AMORTIGUADOR CONVENCIONAL'
ORDER BY CLsub.Descripcion ASC

select * from Grupodeimpresion_ClaseProductoServicio where IDClaseProductoServicio=765
select *from ClaseProductoServicio where PKID=889
select *from ClaseProductoServicio where PKID in (383,460,489,839,909,953)

---habilitar imagenes
--update ClaseProductoServicio set Descripcion_Abrev='SWITCH EMERGENCIA' where PKID=909
--update ClaseProductoServicio set Descripcion_Abrev='VALVULA CANISTER' where PKID=953
--update ClaseProductoServicio set img_lp=1 where PKID in (383,460,489,839,909,953)

SELECT*FROM ClaseProductoServicio WHERE Descripcion='PRUEBAAAAA'

---------------------actualuizar la linea del producto
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=24289
