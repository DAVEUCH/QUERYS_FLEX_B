------update en la tabla GC_Cliente en el campo Score, también piden Condicion_Contribuyente_SUNAT, Estado_Contribuyente_SUNAT

--select  *from GC_Cliente  
----select*from Persona where DocIdentidad='10106761596'
----10106761596

--update GC_Cliente set  Condicion_Contribuyente_SUNAT= 'HABIDO ', Estado_Contribuyente_SUNAT= 'ACTIVO ' where IDPersona=22



select DocIdentidad, Nombre,PKID from Persona where DocIdentidad in (   
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
 
)
order by case Codigo
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


end

--update GC_Cliente set  Score= '587 'where IDPersona=423
--update GC_Cliente set  Score= '840 'where IDPersona=4518
--update GC_Cliente set  Score= '591 'where IDPersona=7016
--update GC_Cliente set  Score= '917 'where IDPersona=7799
--update GC_Cliente set  Score= '929 'where IDPersona=860
--update GC_Cliente set  Score= '24 'where IDPersona=3002
--update GC_Cliente set  Score= '124 'where IDPersona=6011
--update GC_Cliente set  Score= '967 'where IDPersona=285
--update GC_Cliente set  Score= '676 'where IDPersona=7912
--update GC_Cliente set  Score= '629 'where IDPersona=5389
--update GC_Cliente set  Score= '597 'where IDPersona=8219
--update GC_Cliente set  Score= '889 'where IDPersona=1010
--update GC_Cliente set  Score= '883 'where IDPersona=388
--update GC_Cliente set  Score= '693 'where IDPersona=8422
--update GC_Cliente set  Score= '686 'where IDPersona=8990
--update GC_Cliente set  Score= '653 'where IDPersona=3642
--update GC_Cliente set  Score= '696 'where IDPersona=1863
--update GC_Cliente set  Score= '965 'where IDPersona=2235
--update GC_Cliente set  Score= '970 'where IDPersona=2930
--update GC_Cliente set  Score= '954 'where IDPersona=1061
--update GC_Cliente set  Score= '130 'where IDPersona=1062
--update GC_Cliente set  Score= '966 'where IDPersona=1078
--update GC_Cliente set  Score= '885 'where IDPersona=1095
--update GC_Cliente set  Score= '825 'where IDPersona=1130
--update GC_Cliente set  Score= '847 'where IDPersona=1158
--update GC_Cliente set  Score= '818 'where IDPersona=1179
--update GC_Cliente set  Score= '768 'where IDPersona=1218
--update GC_Cliente set  Score= '914 'where IDPersona=1286
--update GC_Cliente set  Score= '929 'where IDPersona=1357
--update GC_Cliente set  Score= '803 'where IDPersona=1369
--update GC_Cliente set  Score= '896 'where IDPersona=1404
--update GC_Cliente set  Score= '633 'where IDPersona=1415
--update GC_Cliente set  Score= '951 'where IDPersona=3424
--update GC_Cliente set  Score= '615 'where IDPersona=3467
--update GC_Cliente set  Score= '534 'where IDPersona=3569
--update GC_Cliente set  Score= '629 'where IDPersona=3777
--update GC_Cliente set  Score= '614 'where IDPersona=3927
--update GC_Cliente set  Score= '99 'where IDPersona=3958
--update GC_Cliente set  Score= '150 'where IDPersona=3994







