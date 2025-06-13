select top 10*from Persona where PKID=10452
select top 10*from GC_Cliente where IDPersona=10452
SELECT
    CLI.PKID AS Id,
    --PER.Codigo,1643
    PER.DocIdentidad,
    --PER.Nombre,
	--DIRE.Descripcion,
	--PER.fechaCrea,
	--iif(DIRE.DireccionPrincipal=1,'Principal','Secundario') as Tipo_Direc,
	--GCC.IDPersona as idscore,
	--GCC.idVendedor,
	--GCC.Condicion_Contribuyente_SUNAT,
	--GCC.Estado_Contribuyente_SUNAT
	GCC.Score
FROM Cliente CLI
LEFT JOIN Persona PER ON PER.PKID = CLI.PKID
--LEFT JOIN Direccion DIRE ON DIRE.IDPersona=PER.PKID
left join GC_Cliente GCC on GCC.IDPersona=CLI.PKID
WHERE PER.DocIdentidad in ( 
  '20611435801 ',
 '20610295283 ',
 '20609743329 ',
 '10422771994 ',
 '20606698365 ',
 '20606727799 ',
 '20514789160 ',
 '10462959066 ',
 '10214199870 ',
 '10707617158 ',
 '20449272766 ',
 '20603034857 ',
 '20602955894 ',
 '20612642649 ',
 '20601941181 ',
 '20603674317 ',
 '20601449022 ',
 '20455967539 ',
 '20602224083 ',
 '10441009777 ',
 '10415344258 ',
 '10438776261 ',
 '20605095705 ',
 '20608636065 ',
 '10239944111 ',
 '10423140637 ',
 '10439273335 ',
 '20395179901 ',
 '20600792149 ',
 '20113233835 ',
 '20494942896 ',
 '20454902972 ',
 '20477241558 ',
 '20600263359 ',
 '10154327113 ',
 '20441608463 ',
 '10286052059 ',
 '10233760906 ',
 '10482095629 ',
 '20613170945 ',
 '10073136097 ',
 '20539619919 ',
 '20610453105 ',
 '20447718295 ',
 '20602249256 ',
 '20606410116 ',
 '20602132511 ',
 '20372444810 ',
 '10256886648 ',
 '20604813477 ',
 '20558210894 ',
 '20612911186 ',
 '20491865505 ',
 '20552648723 ',
 '10437299507 ',
 '10469971932 ',
 '20602933998 ',
 '20612147087 ',
 '20602700951 ',
 '20609265222 ',
 '20609096056 ',
 '10412281051 ',
 '20508443669 ',
 '10458026888 ',
 '20606372974 ',
 '20611705396 ',
 '10474018828 ',
 '20545110947 ',
 '20607073911 ',
 '20606698365 ',
 '20609325969 ',
 '20549083189 ',
 '20518019113 ',
 '10427246162 ',
 '20610060839 ',
 '20609507129 ',
 '20539785762 ',
 '20610330038 ',
 '20498038426 ',
 '10464480434 ',
 '10406735953 ',
 '20490075667 ',
 '10712324096 ',
 '10086833269 ',
 '10757370579 ',
 '10439273335 ',
 '20556574678 ',
 '20611684101 ',
 '20602429971 ',
 '10482095629 '
 ) ORDER BY CASE PER.DocIdentidad 

when  '20611435801 ' then 1
when  '20610295283 ' then 2
when  '20609743329 ' then 3
when  '10422771994 ' then 4
when  '20606698365 ' then 5
when  '20606727799 ' then 6
when  '20514789160 ' then 7
when  '10462959066 ' then 8
when  '10214199870 ' then 9
when  '10707617158 ' then 10
when  '20449272766 ' then 11
when  '20603034857 ' then 12
when  '20602955894 ' then 13
when  '20612642649 ' then 14
when  '20601941181 ' then 15
when  '20603674317 ' then 16
when  '20601449022 ' then 17
when  '20455967539 ' then 18
when  '20602224083 ' then 19
when  '10441009777 ' then 20
when  '10415344258 ' then 21
when  '10438776261 ' then 22
when  '20605095705 ' then 23
when  '20608636065 ' then 24
when  '10239944111 ' then 25
when  '10423140637 ' then 26
when  '10439273335 ' then 27
when  '20395179901 ' then 28
when  '20600792149 ' then 29
when  '20113233835 ' then 30
when  '20494942896 ' then 31
when  '20454902972 ' then 32
when  '20477241558 ' then 33
when  '20600263359 ' then 34
when  '10154327113 ' then 35
when  '20441608463 ' then 36
when  '10286052059 ' then 37
when  '10233760906 ' then 38
when  '10482095629 ' then 39
when  '20613170945 ' then 40
when  '10073136097 ' then 41
when  '20539619919 ' then 42
when  '20610453105 ' then 43
when  '20447718295 ' then 44
when  '20602249256 ' then 45
when  '20606410116 ' then 46
when  '20602132511 ' then 47
when  '20372444810 ' then 48
when  '10256886648 ' then 49
when  '20604813477 ' then 50
when  '20558210894 ' then 51
when  '20612911186 ' then 52
when  '20491865505 ' then 53
when  '20552648723 ' then 54
when  '10437299507 ' then 55
when  '10469971932 ' then 56
when  '20602933998 ' then 57
when  '20612147087 ' then 58
when  '20602700951 ' then 59
when  '20609265222 ' then 60
when  '20609096056 ' then 61
when  '10412281051 ' then 62
when  '20508443669 ' then 63
when  '10458026888 ' then 64
when  '20606372974 ' then 65
when  '20611705396 ' then 66
when  '10474018828 ' then 67
when  '20545110947 ' then 68
when  '20607073911 ' then 69
when  '20606698365 ' then 70
when  '20609325969 ' then 71
when  '20549083189 ' then 72
when  '20518019113 ' then 73
when  '10427246162 ' then 74
when  '20610060839 ' then 75
when  '20609507129 ' then 76
when  '20539785762 ' then 77
when  '20610330038 ' then 78
when  '20498038426 ' then 79
when  '10464480434 ' then 80
when  '10406735953 ' then 81
when  '20490075667 ' then 82
when  '10712324096 ' then 83
when  '10086833269 ' then 84
when  '10757370579 ' then 85
when  '10439273335 ' then 86
when  '20556574678 ' then 87
when  '20611684101 ' then 88
when  '20602429971 ' then 89
when  '10482095629 ' then 90
-- Para manejar cualquier caso no listado explícitamente
END;

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


