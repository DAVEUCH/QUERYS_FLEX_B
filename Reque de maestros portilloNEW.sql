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
WHERE LTRIM(RTRIM(pro.Codigo)) IN (   'B1.MP8612 ',
 'B1.MP8611 ',
 'B1.832605 ',
 'B1.MP-8572 ',
 'B1.832496 ',
 'B1.950055 ',
 'B1.950045 ',
 'B1.930095 ',
 'B1.930089 ',
 'B1.832595 ',
 'B1.832454 ',
 'B1.MP069 ',
 'B1.MP105 ',
 'B1.MP107 ',
 'B1.MP8501 ',
 'B1.MP8521 ',
 'B1.MP8638 ',
 'B1.MP8382 ',
 'B1.832537 ',
 'B1.MP8552 ',
 'B1.MP8551 ',
 'B1.MP8650 ',
 'B1.MP8649 ',
 'B1.MP8648 ',
 'B1.MP8020 ',
 'B1.832034 ',
 'B1.832536 ',
 'B1.930150 ',
 'GM.13331988 ',
 'GM.95259955 ',
 'MO.81770-4H000 ',
 'MO.54300-5L500 ',
 'MO.55300-5L700 ',
 'MO.54660-4H050 ',
 'MO.54650-4H050 ',
 'MO.54660-1Y001 ',
 'MO.54650-1Y001 ',
 'SH.318 285 ',
 'SH.312 949 ',
 'SH.200 846 ',
 'SH.315 893 ',
 'SH.315 892 ',
 'SH.310 740 ',
 'SH.310 741 ',
 'SH.310 742 ',
 'SH.310 743 ',
 'SH.310 355 ',
 'SH.310 359 ',
 'SH.310 360 ',
 'SH.310 354 ',
 'SH.310 353 ',
 'SH.280 953 ',
 'SH.313 238 ',
 'SH.313 239 ',
 'SH.313 237 ',
 'SH.313 901 ',
 'SH.313 902 ',
 'SH.316 735 ',
 'SH.316 736 ',
 'SH.317 186 ',
 'SH.317 185 ',
 'SH.312 616 ',
 'SH.310 375 ',
 'SH.318 777 ',
 'SH.317 653 ',
 'SH.310 378 ',
 'SH.317 581 ')
 order by case Codigo
when  'B1.MP8612 ' then 1
when  'B1.MP8611 ' then 2
when  'B1.832605 ' then 3
when  'B1.MP-8572 ' then 4
when  'B1.832496 ' then 5
when  'B1.950055 ' then 6
when  'B1.950045 ' then 7
when  'B1.930095 ' then 8
when  'B1.930089 ' then 9
when  'B1.832595 ' then 10
when  'B1.832454 ' then 11
when  'B1.MP069 ' then 12
when  'B1.MP105 ' then 13
when  'B1.MP107 ' then 14
when  'B1.MP8501 ' then 15
when  'B1.MP8521 ' then 16
when  'B1.MP8638 ' then 17
when  'B1.MP8382 ' then 18
when  'B1.832537 ' then 19
when  'B1.MP8552 ' then 20
when  'B1.MP8551 ' then 21
when  'B1.MP8650 ' then 22
when  'B1.MP8649 ' then 23
when  'B1.MP8648 ' then 24
when  'B1.MP8020 ' then 25
when  'B1.832034 ' then 26
when  'B1.832536 ' then 27
when  'B1.930150 ' then 28
when  'GM.13331988 ' then 29
when  'GM.95259955 ' then 30
when  'MO.81770-4H000 ' then 31
when  'MO.54300-5L500 ' then 32
when  'MO.55300-5L700 ' then 33
when  'MO.54660-4H050 ' then 34
when  'MO.54650-4H050 ' then 35
when  'MO.54660-1Y001 ' then 36
when  'MO.54650-1Y001 ' then 37
when  'SH.318 285 ' then 38
when  'SH.312 949 ' then 39
when  'SH.200 846 ' then 40
when  'SH.315 893 ' then 41
when  'SH.315 892 ' then 42
when  'SH.310 740 ' then 43
when  'SH.310 741 ' then 44
when  'SH.310 742 ' then 45
when  'SH.310 743 ' then 46
when  'SH.310 355 ' then 47
when  'SH.310 359 ' then 48
when  'SH.310 360 ' then 49
when  'SH.310 354 ' then 50
when  'SH.310 353 ' then 51
when  'SH.280 953 ' then 52
when  'SH.313 238 ' then 53
when  'SH.313 239 ' then 54
when  'SH.313 237 ' then 55
when  'SH.313 901 ' then 56
when  'SH.313 902 ' then 57
when  'SH.316 735 ' then 58
when  'SH.316 736 ' then 59
when  'SH.317 186 ' then 60
when  'SH.317 185 ' then 61
when  'SH.312 616 ' then 62
when  'SH.310 375 ' then 63
when  'SH.318 777 ' then 64
when  'SH.317 653 ' then 65
when  'SH.310 378 ' then 66
when  'SH.317 581 ' then 67
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
select *from ClaseProductoServicio where PKID=176
select *from ClaseProductoServicio where PKID in (383,460,489,839,909,953)

---habilitar imagenes
--update ClaseProductoServicio set Descripcion_Abrev='SWITCH EMERGENCIA' where PKID=909
--update ClaseProductoServicio set Descripcion_Abrev='VALVULA CANISTER' where PKID=953
--update ClaseProductoServicio set img_lp=1 where PKID in (383,460,489,839,909,953)

SELECT*FROM ClaseProductoServicio WHERE Descripcion='PRUEBAAAAA'

---------------------actualuizar la linea del producto
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=24289
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=24290
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=15492
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=22082
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=9946
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=16276
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=16275
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=21258
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=16578
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=17619
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=17618
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=17793
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=17142
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=17144
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=17622
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=18751
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23425
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23428
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=23429
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=9893
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=9892
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23432
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23431
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23430
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=23436
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=23437
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=16932
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=23435
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=20546
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=22285
UPDATE ProductoServicio SET IDClaseProductoServicio=498  WHERE PKID=2893
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=27675
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=27674
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=2888
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=2885
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=2887
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=2884
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=27722
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=25400
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25439
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25812
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25813
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25994
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25995
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25996
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25997
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=25825
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25440
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25441
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25803
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25821
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25442
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25444
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=25443
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25445
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25448
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25449
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25815
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25816
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25427
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25428
UPDATE ProductoServicio SET IDClaseProductoServicio=959  WHERE PKID=25401
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25818
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25426
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25819
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25402
UPDATE ProductoServicio SET IDClaseProductoServicio=961  WHERE PKID=25446







