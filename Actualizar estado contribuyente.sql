select top 10*from Persona where PKID=10452
select top 10*from GC_Cliente where IDPersona=10452

SELECT
    CLI.PKID AS Id,
    --GCC.IDPersona,
    PER.DocIdentidad,
    --PER.Nombre,
	--DIRE.Descripcion,
	--PER.fechaCrea,
	--iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc,
	GCC.fecUlt_Vta_credito,
	GCC.fecUlt_Vta_contado,
	GCC.fecAnt_aUlt_Vta,
	GCC.fecUlt_Vta,
	GCC.Estado_Contribuyente_SUNAT,
	GCC.Score
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
--LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
left join GC_Cliente GCC on GCC.IDPersona=CLI.PKID
WHERE PER.Codigo in ( 
 '20480092555',
'20480311613',
'20513883561',
'20487743772',
'20475318961',
'20549871535',
'20539619919',
'20529163054',
'20470844150',
'20486311933',
'20101341616',
'20487227413',
'20480288701',
'20102037597',
'20454785721',
'20477839844',
'20393829894',
'20485863509',
'20498147713',
'20480206313',
'20504439144',
'20529754419',
'20489965667',
'20447394023',
'20455119449',
'20481247803',
'20481647496',
'20101770657',
'20534320770',
'20493587090',
'20487278671',
'20455715564',
'20412159501',
'20525307418',
'20477857150',
'20452332940',
'10414585405',
'10401982651',
'10430003955',
'10081910729',
'10023819274',
'10205489873',
'10409569787',
'10010239449',
'10095139529',
'10414119358',
'10294348439',
'10012210197',
'10405431799',
'10482790467',
'10474475927',
'10011515342',
'10198404824',
'10181721761',
'10204075251',
'10316287153',
'10013429672',
'10097906519',
'10040791413',
'10436260526',
'10406222751',
'10442512898',
'10408222279',
'10414134659',
'10000817487',
'10086833269',
'10210827451',
'10451872384',
'10013042867',
'10012306496',
'10040310229',
'10400241266',
'10205276373',
'10427336447',
'10070688218',
'10402604251',
'10296515171',
'10441716937',
'10211161405',
'10206426158',
'10735115311',
'10097689763',
'10311241996',
'10326448082',
'10277052968',
'10316538164',
'10077099587',
'10400900481',
'10471243952',
'10282892877',
'10210679133',
'10092838884',
'10254589905',
'10419534965',
'10097386507',
'10199201005',
'10403608993',
'10095456893',
'10162848050',
'20494221218'
 ) ORDER BY CASE PER.DocIdentidad 

when  '10444673058 ' then 1
when  '10106465890 ' then 2
when  '10470352707 ' then 3
when  '10205946034 ' then 4
when  '20539819501 ' then 5
when  '10293588371 ' then 6
when  '20532355576 ' then 7
when  '20494944759 ' then 8
when  '20508964391 ' then 9
when  '20480192428 ' then 10
when  '10419889135 ' then 11
when  '10433431982 ' then 12

-- Para manejar cualquier caso no listado explícitamente
END; 

select top 10*from GC_Cliente where IDPersona=10728
UPDATE GC_Cliente SET Score='900' where  IDPersona=2
select*from Persona where PKID=10728   20613762036



update GC_Cliente set fecAnt_aUlt_Vta='01-01-2014',fecUlt_Vta_credito='01-01-2014',fecUlt_Vta='01-01-2014',Estado_Contribuyente_SUNAT='CASTIGO / JUDICIAL' where IDPersona=812
--update GC_Cliente set Score=1 WHERE IDPersona=1
 --select * from GC_Cliente where IDPersona=2496
--Condicion_Contribuyente_SUNAT
--HABIDO
--Estado_Contribuyente_SUNAT
--ACTIVO
update GC_Cliente set Score=23 WHERE IDPersona=2
--update GC_Cliente set Condicion_Contribuyente_SUNAT='NO HABIDO',Estado_Contribuyente_SUNAT= where IDPersona=328
	--GCC.Condicion_Contribuyente_SUNAT,
	--GCC.Estado_Contribuyente_SUNAT
--update GC_Cliente set Condicion_Contribuyente_SUNAT='NO HABIDO' where IDPersona=501
--update GC_Cliente set Condicion_Contribuyente_SUNAT='PENDIENTE' where IDPersona=531
--update GC_Cliente set Condicion_Contribuyente_SUNAT='NO HABIDO' where IDPersona=3917
--update GC_Cliente set Condicion_Contribuyente_SUNAT='HABIDO' where IDPersona=6583
--update GC_Cliente set Condicion_Contribuyente_SUNAT='NO HABIDO' where IDPersona=7298
--update GC_Cliente set Condicion_Contribuyente_SUNAT='HABIDO' where IDPersona=7545
--update GC_Cliente set Condicion_Contribuyente_SUNAT='NO HALLADO' where IDPersona=8894

--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=704
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA PROV. POR OFICIO'where IDPersona=980
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=1215
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=1664
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=2536
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=3229
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA PROV. POR OFICIO'where IDPersona=5713
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=5782
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6231
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6244
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6247
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6291
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6295
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6298
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6306
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6308
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6309
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6310
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6326
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6347
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6351
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6355
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6374
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6423
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA PROV. POR OFICIO'where IDPersona=6428
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6477
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6502
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6507
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6517
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6557
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6560
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6562
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6582
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6583
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6611
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6613
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6615
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6622
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6626
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6656
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6674
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6758
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6759
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6793
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6833
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6846
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6896
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=6902
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=6927
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6954
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=6957
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6966
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=6974
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7012
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7013
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7015
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=7023
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=7028
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7083
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA PROV. POR OFICIO'where IDPersona=7103
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7120
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7158
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7218
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7220
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=7222
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=7224
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7253
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=7267
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7271
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=7297
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7298
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7301
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7310
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7328
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=7332
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DE OFICIO'where IDPersona=7335
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7353
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7357
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7361
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7414
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7416
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=7424
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=7545
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=8701
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA DEFINITIVA'where IDPersona=8731
--update GC_Cliente set Estado_Contribuyente_SUNAT='BAJA PROV. POR OFICIO'where IDPersona=8975
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=9066
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=9350
--update GC_Cliente set Estado_Contribuyente_SUNAT='ACTIVO'where IDPersona=9616
--update GC_Cliente set Estado_Contribuyente_SUNAT='SUSPENSION TEMPORAL'where IDPersona=9749

update GC_Cliente set Score=701 WHERE IDPersona=8527
update GC_Cliente set Score=716 WHERE IDPersona=8607
update GC_Cliente set Score=847 WHERE IDPersona=1158
update GC_Cliente set Score=701 WHERE IDPersona=7866
update GC_Cliente set Score=752 WHERE IDPersona=3026
update GC_Cliente set Score=419 WHERE IDPersona=442
update GC_Cliente set Score=759 WHERE IDPersona=1115
update GC_Cliente set Score=783 WHERE IDPersona=5833
update GC_Cliente set Score=472 WHERE IDPersona=6300
update GC_Cliente set Score=478 WHERE IDPersona=7698
update GC_Cliente set Score=411 WHERE IDPersona=8938
update GC_Cliente set Score=652 WHERE IDPersona=9567
update GC_Cliente set Score=931 WHERE IDPersona=5919
update GC_Cliente set Score=744 WHERE IDPersona=457
update GC_Cliente set Score=762 WHERE IDPersona=569
update GC_Cliente set Score=933 WHERE IDPersona=995
update GC_Cliente set Score=962 WHERE IDPersona=1120
update GC_Cliente set Score=506 WHERE IDPersona=1393
update GC_Cliente set Score=696 WHERE IDPersona=10324
update GC_Cliente set Score=502 WHERE IDPersona=4056
update GC_Cliente set Score=469 WHERE IDPersona=4306
update GC_Cliente set Score=825 WHERE IDPersona=4536
update GC_Cliente set Score=465 WHERE IDPersona=4826
update GC_Cliente set Score=686 WHERE IDPersona=4941
update GC_Cliente set Score=854 WHERE IDPersona=5279
update GC_Cliente set Score=786 WHERE IDPersona=5446
update GC_Cliente set Score=950 WHERE IDPersona=5631
update GC_Cliente set Score=905 WHERE IDPersona=6362
update GC_Cliente set Score=693 WHERE IDPersona=6822
update GC_Cliente set Score=257 WHERE IDPersona=7354
update GC_Cliente set Score=672 WHERE IDPersona=7416
update GC_Cliente set Score=582 WHERE IDPersona=7566
update GC_Cliente set Score=484 WHERE IDPersona=7730
update GC_Cliente set Score=854 WHERE IDPersona=8225
update GC_Cliente set Score=682 WHERE IDPersona=8813
update GC_Cliente set Score=675 WHERE IDPersona=9055
update GC_Cliente set Score=683 WHERE IDPersona=8871
update GC_Cliente set Score=976 WHERE IDPersona=9447
update GC_Cliente set Score=679 WHERE IDPersona=9518
update GC_Cliente set Score=962 WHERE IDPersona=9563
update GC_Cliente set Score=568 WHERE IDPersona=9648
update GC_Cliente set Score=933 WHERE IDPersona=10074
update GC_Cliente set Score=911 WHERE IDPersona=8418
update GC_Cliente set Score=854 WHERE IDPersona=4269
update GC_Cliente set Score=999 WHERE IDPersona=419
update GC_Cliente set Score=766 WHERE IDPersona=9351
update GC_Cliente set Score=889 WHERE IDPersona=9964
update GC_Cliente set Score=296 WHERE IDPersona=963
update GC_Cliente set Score=769 WHERE IDPersona=2855
update GC_Cliente set Score=971 WHERE IDPersona=921
update GC_Cliente set Score=797 WHERE IDPersona=5987
update GC_Cliente set Score=538 WHERE IDPersona=8233
update GC_Cliente set Score=644 WHERE IDPersona=635
update GC_Cliente set Score=818 WHERE IDPersona=7901
update GC_Cliente set Score=467 WHERE IDPersona=9081
update GC_Cliente set Score=779 WHERE IDPersona=5323
update GC_Cliente set Score=549 WHERE IDPersona=2549
update GC_Cliente set Score=534 WHERE IDPersona=7387
update GC_Cliente set Score=492 WHERE IDPersona=7023
update GC_Cliente set Score=854 WHERE IDPersona=9164
update GC_Cliente set Score=475 WHERE IDPersona=5014
update GC_Cliente set Score=575 WHERE IDPersona=8132
update GC_Cliente set Score=672 WHERE IDPersona=732
update GC_Cliente set Score=681 WHERE IDPersona=8990
update GC_Cliente set Score=688 WHERE IDPersona=9792
update GC_Cliente set Score=624 WHERE IDPersona=7016
update GC_Cliente set Score=710 WHERE IDPersona=9057
update GC_Cliente set Score=629 WHERE IDPersona=1221
update GC_Cliente set Score=917 WHERE IDPersona=6310


