SELECT
    CLI.PKID AS Id,
    --PER.Codigo,
    PER.DocIdentidad,
    PER.Nombre,
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
 '10482095629 ',
 '20606918781 ',
 '10097106733 ',
 '10408216848 ',
 '10415344258 ',
 '20456296271 ',
 '10101579692 ',
 '20601352801 ',
 '20601784387 ',
 '20603182261 ',
 '20609594251 ',
 '20610721070 ',
 '20602023789 ',
 '20454079699 ',
 '20220963463 ',
 '10005116452 ',
 '10293807162 ',
 '17124835119 ',
 '20612526517 ',
 '20533288651 ',
 '20600756312 ',
 '10013389476 ',
 '20601113890 ',
 '20519604834 ',
 '10304202772 ',
 '10444259413 ',
 '10044294554 ',
 '10448252588 ',
 '20371595571 ',
 '20602249256 ',
 '20604611335 ',
 '20605421068 ',
 '20605462139 ',
 '20607174491 ',
 '20603674317 ',
 '20608636065 ',
 '20609267306 ',
 '20455968268 ',
 '20610766669 ',
 '10414035707 ',
 '10737644249 ',
 '10004458171 ',
 '10293020294 ',
 '10437299507 ',
 '20121048559 ',
 '20609191954 ',
 '20539785762 ',
 '10089127985 ',
 '10214465618 ',
 '10100491813 ',
 '20600792149 ',
 '20606898135 ',
 '20498291598 ',
 '10094769707 ',
 '20609090511 ',
 '10101288698 ',
 '20534265060 ',
 '20604813477 ',
 '20603597827 ',
 '10015500676 ',
 '20601551145 ',
 '10429502794 ',
 '20494942896 ',
 '20609325969 ',
 '20611435801 ',
 '20555688475 ',
 '20609897598 ',
 '10256886648 ',
 '10247117461 '

 ) ORDER BY CASE PER.DocIdentidad 
when  '10482095629 ' then 1
when  '20606918781 ' then 2
when  '10097106733 ' then 3
when  '10408216848 ' then 4
when  '10415344258 ' then 5
when  '20456296271 ' then 6
when  '10101579692 ' then 7
when  '20601352801 ' then 8
when  '20601784387 ' then 9
when  '20603182261 ' then 10
when  '20609594251 ' then 11
when  '20610721070 ' then 12
when  '20602023789 ' then 13
when  '20454079699 ' then 14
when  '20220963463 ' then 15
when  '10005116452 ' then 16
when  '10293807162 ' then 17
when  '17124835119 ' then 18
when  '20612526517 ' then 19
when  '20533288651 ' then 20
when  '20600756312 ' then 21
when  '10013389476 ' then 22
when  '20601113890 ' then 23
when  '20519604834 ' then 24
when  '10304202772 ' then 25
when  '10444259413 ' then 26
when  '10044294554 ' then 27
when  '10448252588 ' then 28
when  '20371595571 ' then 29
when  '20602249256 ' then 30
when  '20604611335 ' then 31
when  '20605421068 ' then 32
when  '20605462139 ' then 33
when  '20607174491 ' then 34
when  '20603674317 ' then 35
when  '20608636065 ' then 36
when  '20609267306 ' then 37
when  '20455968268 ' then 38
when  '20610766669 ' then 39
when  '10414035707 ' then 40
when  '10737644249 ' then 41
when  '10004458171 ' then 42
when  '10293020294 ' then 43
when  '10437299507 ' then 44
when  '20121048559 ' then 45
when  '20609191954 ' then 46
when  '20539785762 ' then 47
when  '10089127985 ' then 48
when  '10214465618 ' then 49
when  '10100491813 ' then 50
when  '20600792149 ' then 51
when  '20606898135 ' then 52
when  '20498291598 ' then 53
when  '10094769707 ' then 54
when  '20609090511 ' then 55
when  '10101288698 ' then 56
when  '20534265060 ' then 57
when  '20604813477 ' then 58
when  '20603597827 ' then 59
when  '10015500676 ' then 60
when  '20601551145 ' then 61
when  '10429502794 ' then 62
when  '20494942896 ' then 63
when  '20609325969 ' then 64
when  '20611435801 ' then 65
when  '20555688475 ' then 66
when  '20609897598 ' then 67
when  '10256886648 ' then 68
when  '10247117461 ' then 69

-- Para manejar cualquier caso no listado explícitamente
END;

--update GC_Cliente set Score=1 WHERE IDPersona=1
 --select * from GC_Cliente where IDPersona=2496
--Condicion_Contribuyente_SUNAT
--HABIDO
--Estado_Contribuyente_SUNAT
--ACTIVO

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


