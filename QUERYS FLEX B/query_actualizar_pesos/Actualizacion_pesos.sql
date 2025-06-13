select PKID,Codigo,Descripcion from ProductoServicio where Codigo in ( 
  'DA.DW059 ',
 'DA.DW112 ',
 'DA.DW149 ',
 'DA.DW153 ',
 'DA.DW407 ',
 'DA.DW495 ',
 'DO.11115-82000 ',
 'DO.11122-20020 ',
 'DO.EMZ-5307AN ',
 'DO.ENS-5500AN ',
 'DO.ENS-5510AN ',
 'DO.ENS-5517AN ',
 'DO.ETY-5519AN ',
 'DO.ETY-5569AN ',
 'DO.ETY-5612AN ',
 'DO.ETY-5643AN ',
 'DO.IMZ-0307AN ',
 'DO.INS-0500AN ',
 'DO.INS-0517AN ',
 'DO.ITY-0519AN ',
 'DO.ITY-0643AN ',
 'GB.GHAT-104 ',
 'GB.GHAT-139 ',
 'GB.GHAT-196 ',
 'GB.GT40990 ',
 'GB.GT90370 ',
 'GB.GTB0020 ',
 'GB.GTB0050 ',
 'GB.GUT-32 ',
 'GB.GWAM-04A ',
 'GB.GWHO-63A ',
 'GB.GWHY-85A ',
 'GB.GWN-65AF ',
 'GB.GWS-36A ',
 'GB.GWT-131A ',
 'HA.25181813 ',
 'HA.25186687 ',
 'HA.25195107 ',
 'HA.25360-37100 ',
 'HA.27300-39700 ',
 'HA.27301-04000 ',
 'HA.27301-23700 ',
 'HA.27301-2B100 ',
 'HA.39180-03000 ',
 'HA.39180-22090 ',
 'HA.39180-2B000 ',
 'HA.39220-38010 ',
 'HA.39220-42700 ',
 'HA.39300-27000 ',
 'HA.39350-23910 ',
 'HA.93810-3K000 ',
 'HA.93860-4A010 ',
 'HA.95216947 ',
 'HA.95224-29850 ',
 'HA.95550-2G000 ',
 'HA.96190708 ',
 'HA.96325867 ',
 'HA.96420-4A000 ',
 'HA.96420-4A600 ',
 'KO.0K756-15-171C ',
 'KO.25195788 ',
 'KO.26740-03000 ',
 'KO.27301-2B100 ',
 'KO.28164-27800 ',
 'KO.35150-33010 ',
 'KO.35170-02000 ',
 'KO.35170-22600 ',
 'KO.35170-37100 ',
 'KO.35301-25000 ',
 'KO.35301-38300 ',
 'KO.35310-37150 ',
 'KO.39180-22090 ',
 'KO.39300-2B000 ',
 'KO.42342265 ',
 'KO.93490-2E001 ',
 'KO.93490-3X030 ',
 'KO.93810-38000 ',
 'KO.93810-3S000 ',
 'KO.93810-3S700 ',
 'KO.94580175 ',
 'KO.94750-21030 ',
 'KO.96192077 ',
 'KO.96984104 ',
 'MO.1885510060 ',
 'MO.23124-24010 ',
 'MO.23124-32700 ',
 'MO.25500-2B000 ',
 'MO.26740-03000 ',
 'MO.26740-26700 ',
 'MO.27300-3F100 ',
 'MO.27301-03200 ',
 'MO.27301-03AA0 ',
 'MO.27301-2B100 ',
 'MO.27301-3E400 ',
 'MO.28910-22040 ',
 'MO.35100-2B060 ',
 'MO.35100-4A800 ',
 'MO.35301-25000 ',
 'MO.35310-37150 ',
 'MO.36100-3C150 ',
 'MO.36120-2B100 ',
 'MO.37370-4A700 ',
 'MO.39180-03000 ',
 'MO.39180-25300 ',
 'MO.39180-2B000 ',
 'MO.39220-38020 ',
 'MO.39350-22600 ',
 'MO.39350-23910 ',
 'MO.93110-2D000 ',
 'MO.93410-0X050 ',
 'MO.93410-1R011 ',
 'MO.93410-1U110 ',
 'MO.93410-4F000 ',
 'MO.93490-1Y010 ',
 'MO.93490-2P110 ',
 'MO.93490-2W110 ',
 'MO.93490-2W310 ',
 'MO.93490-3X030 ',
 'MO.93490-A4010 ',
 'MO.93790-4F000 ',
 'MO.93810-G8100 ',
 'MO.93860-39012 ',
 'MO.95224-29000 ',
 'MO.95224-29850 ',
 'MO.95550-2G000 ',
 'MO.95680-2S300 ',
 'MO.95680-2W000 ',
 'MO.95681-2W000 ',
 'MO.96420-0X000 ',
 'SY.1610943448 ',
 'SY.1611533228 ',
 'SY.6062030275 ',
 'SY.6675420017 ',
 'TB.L331-0039A '



)
order by case Codigo
when  'DA.DW059 'then 1
when  'DA.DW112 'then 2
when  'DA.DW149 'then 3
when  'DA.DW153 'then 4
when  'DA.DW407 'then 5
when  'DA.DW495 'then 6
when  'DO.11115-82000 'then 7
when  'DO.11122-20020 'then 8
when  'DO.EMZ-5307AN 'then 9
when  'DO.ENS-5500AN 'then 10
when  'DO.ENS-5510AN 'then 11
when  'DO.ENS-5517AN 'then 12
when  'DO.ETY-5519AN 'then 13
when  'DO.ETY-5569AN 'then 14
when  'DO.ETY-5612AN 'then 15
when  'DO.ETY-5643AN 'then 16
when  'DO.IMZ-0307AN 'then 17
when  'DO.INS-0500AN 'then 18
when  'DO.INS-0517AN 'then 19
when  'DO.ITY-0519AN 'then 20
when  'DO.ITY-0643AN 'then 21
when  'GB.GHAT-104 'then 22
when  'GB.GHAT-139 'then 23
when  'GB.GHAT-196 'then 24
when  'GB.GT40990 'then 25
when  'GB.GT90370 'then 26
when  'GB.GTB0020 'then 27
when  'GB.GTB0050 'then 28
when  'GB.GUT-32 'then 29
when  'GB.GWAM-04A 'then 30
when  'GB.GWHO-63A 'then 31
when  'GB.GWHY-85A 'then 32
when  'GB.GWN-65AF 'then 33
when  'GB.GWS-36A 'then 34
when  'GB.GWT-131A 'then 35
when  'HA.25181813 'then 36
when  'HA.25186687 'then 37
when  'HA.25195107 'then 38
when  'HA.25360-37100 'then 39
when  'HA.27300-39700 'then 40
when  'HA.27301-04000 'then 41
when  'HA.27301-23700 'then 42
when  'HA.27301-2B100 'then 43
when  'HA.39180-03000 'then 44
when  'HA.39180-22090 'then 45
when  'HA.39180-2B000 'then 46
when  'HA.39220-38010 'then 47
when  'HA.39220-42700 'then 48
when  'HA.39300-27000 'then 49
when  'HA.39350-23910 'then 50
when  'HA.93810-3K000 'then 51
when  'HA.93860-4A010 'then 52
when  'HA.95216947 'then 53
when  'HA.95224-29850 'then 54
when  'HA.95550-2G000 'then 55
when  'HA.96190708 'then 56
when  'HA.96325867 'then 57
when  'HA.96420-4A000 'then 58
when  'HA.96420-4A600 'then 59
when  'KO.0K756-15-171C 'then 60
when  'KO.25195788 'then 61
when  'KO.26740-03000 'then 62
when  'KO.27301-2B100 'then 63
when  'KO.28164-27800 'then 64
when  'KO.35150-33010 'then 65
when  'KO.35170-02000 'then 66
when  'KO.35170-22600 'then 67
when  'KO.35170-37100 'then 68
when  'KO.35301-25000 'then 69
when  'KO.35301-38300 'then 70
when  'KO.35310-37150 'then 71
when  'KO.39180-22090 'then 72
when  'KO.39300-2B000 'then 73
when  'KO.42342265 'then 74
when  'KO.93490-2E001 'then 75
when  'KO.93490-3X030 'then 76
when  'KO.93810-38000 'then 77
when  'KO.93810-3S000 'then 78
when  'KO.93810-3S700 'then 79
when  'KO.94580175 'then 80
when  'KO.94750-21030 'then 81
when  'KO.96192077 'then 82
when  'KO.96984104 'then 83
when  'MO.1885510060 'then 84
when  'MO.23124-24010 'then 85
when  'MO.23124-32700 'then 86
when  'MO.25500-2B000 'then 87
when  'MO.26740-03000 'then 88
when  'MO.26740-26700 'then 89
when  'MO.27300-3F100 'then 90
when  'MO.27301-03200 'then 91
when  'MO.27301-03AA0 'then 92
when  'MO.27301-2B100 'then 93
when  'MO.27301-3E400 'then 94
when  'MO.28910-22040 'then 95
when  'MO.35100-2B060 'then 96
when  'MO.35100-4A800 'then 97
when  'MO.35301-25000 'then 98
when  'MO.35310-37150 'then 99
when  'MO.36100-3C150 'then 100
when  'MO.36120-2B100 'then 101
when  'MO.37370-4A700 'then 102
when  'MO.39180-03000 'then 103
when  'MO.39180-25300 'then 104
when  'MO.39180-2B000 'then 105
when  'MO.39220-38020 'then 106
when  'MO.39350-22600 'then 107
when  'MO.39350-23910 'then 108
when  'MO.93110-2D000 'then 109
when  'MO.93410-0X050 'then 110
when  'MO.93410-1R011 'then 111
when  'MO.93410-1U110 'then 112
when  'MO.93410-4F000 'then 113
when  'MO.93490-1Y010 'then 114
when  'MO.93490-2P110 'then 115
when  'MO.93490-2W110 'then 116
when  'MO.93490-2W310 'then 117
when  'MO.93490-3X030 'then 118
when  'MO.93490-A4010 'then 119
when  'MO.93790-4F000 'then 120
when  'MO.93810-G8100 'then 121
when  'MO.93860-39012 'then 122
when  'MO.95224-29000 'then 123
when  'MO.95224-29850 'then 124
when  'MO.95550-2G000 'then 125
when  'MO.95680-2S300 'then 126
when  'MO.95680-2W000 'then 127
when  'MO.95681-2W000 'then 128
when  'MO.96420-0X000 'then 129
when  'SY.1610943448 'then 130
when  'SY.1611533228 'then 131
when  'SY.6062030275 'then 132
when  'SY.6675420017 'then 133
when  'TB.L331-0039A 'then 134
end

select top 1*from Unidad

----------------------------
update Unidad set Peso= '0.532' WHERE IDProductoServicio=25387
update Unidad set Peso= '0.87' WHERE IDProductoServicio=14304
update Unidad set Peso= '3.52' WHERE IDProductoServicio=23777
update Unidad set Peso= '3.53' WHERE IDProductoServicio=23778
update Unidad set Peso= '2.802' WHERE IDProductoServicio=20516
update Unidad set Peso= '2.996' WHERE IDProductoServicio=26963
update Unidad set Peso= '2.994' WHERE IDProductoServicio=26966
update Unidad set Peso= '3.424' WHERE IDProductoServicio=25310
update Unidad set Peso= '3.406' WHERE IDProductoServicio=25312
update Unidad set Peso= '3.908' WHERE IDProductoServicio=25319
update Unidad set Peso= '0.07' WHERE IDProductoServicio=27164
update Unidad set Peso= '5.944' WHERE IDProductoServicio=27748
update Unidad set Peso= '5.934' WHERE IDProductoServicio=27749


----------------------

update Unidad set Peso= '0.532 'WHERE IDProductoServicio=13734
update Unidad set Peso= '0.538 'WHERE IDProductoServicio=14909
update Unidad set Peso= '0.47 'WHERE IDProductoServicio=14912
update Unidad set Peso= '0.358 'WHERE IDProductoServicio=18578
update Unidad set Peso= '0.41 'WHERE IDProductoServicio=14913
update Unidad set Peso= '0.364 'WHERE IDProductoServicio=15931
update Unidad set Peso= '0.212 'WHERE IDProductoServicio=16673
update Unidad set Peso= '0.124 'WHERE IDProductoServicio=12262
update Unidad set Peso= '0.264 'WHERE IDProductoServicio=14030
update Unidad set Peso= '0.41 'WHERE IDProductoServicio=26787
update Unidad set Peso= '0.456 'WHERE IDProductoServicio=23498
update Unidad set Peso= '0.518 'WHERE IDProductoServicio=14315
update Unidad set Peso= '0.334 'WHERE IDProductoServicio=26790
update Unidad set Peso= '0.172 'WHERE IDProductoServicio=8230
update Unidad set Peso= '0.258 'WHERE IDProductoServicio=8242
update Unidad set Peso= '0.392 'WHERE IDProductoServicio=26002
update Unidad set Peso= '0.286 'WHERE IDProductoServicio=8494
update Unidad set Peso= '0.48 'WHERE IDProductoServicio=26788
update Unidad set Peso= '0.532 'WHERE IDProductoServicio=14317
update Unidad set Peso= '0.38 'WHERE IDProductoServicio=26789
update Unidad set Peso= '0.402 'WHERE IDProductoServicio=26001
update Unidad set Peso= '0.434 'WHERE IDProductoServicio=24728
update Unidad set Peso= '0.248 'WHERE IDProductoServicio=25633
update Unidad set Peso= '1.01 'WHERE IDProductoServicio=25971
update Unidad set Peso= '0.154 'WHERE IDProductoServicio=24706
update Unidad set Peso= '0.24 'WHERE IDProductoServicio=1227
update Unidad set Peso= '0.324 'WHERE IDProductoServicio=20673
update Unidad set Peso= '0.34 'WHERE IDProductoServicio=20675
update Unidad set Peso= '0.704 'WHERE IDProductoServicio=27739
update Unidad set Peso= '2.378 'WHERE IDProductoServicio=27738
update Unidad set Peso= '0.834 'WHERE IDProductoServicio=22546
update Unidad set Peso= '0.792 'WHERE IDProductoServicio=21352
update Unidad set Peso= '4.032 'WHERE IDProductoServicio=18672
update Unidad set Peso= '1.022 'WHERE IDProductoServicio=19179
update Unidad set Peso= '1.564 'WHERE IDProductoServicio=22560
update Unidad set Peso= '0.216 'WHERE IDProductoServicio=27616
update Unidad set Peso= '1.484 'WHERE IDProductoServicio=24839
update Unidad set Peso= '1.224 'WHERE IDProductoServicio=27619
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=24064
update Unidad set Peso= '0.294 'WHERE IDProductoServicio=24004
update Unidad set Peso= '0.23 'WHERE IDProductoServicio=24951
update Unidad set Peso= '1.164 'WHERE IDProductoServicio=24844
update Unidad set Peso= '0.224 'WHERE IDProductoServicio=25671
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=25679
update Unidad set Peso= '0.056 'WHERE IDProductoServicio=24957
update Unidad set Peso= '0.064 'WHERE IDProductoServicio=27535
update Unidad set Peso= '0.04 'WHERE IDProductoServicio=24031
update Unidad set Peso= '0.038 'WHERE IDProductoServicio=24034
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=27617
update Unidad set Peso= '0.028 'WHERE IDProductoServicio=27618
update Unidad set Peso= '0.036 'WHERE IDProductoServicio=24045
update Unidad set Peso= '0.066 'WHERE IDProductoServicio=24054
update Unidad set Peso= '0.058 'WHERE IDProductoServicio=25488
update Unidad set Peso= '0.016 'WHERE IDProductoServicio=24011
update Unidad set Peso= '0.036 'WHERE IDProductoServicio=27519
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=24068
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=25483
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=24069
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=24070
update Unidad set Peso= '0.104 'WHERE IDProductoServicio=24072
update Unidad set Peso= '0.016 'WHERE IDProductoServicio=27547
update Unidad set Peso= '0.012 'WHERE IDProductoServicio=27546
update Unidad set Peso= '0.222 'WHERE IDProductoServicio=22311
update Unidad set Peso= '0.296 'WHERE IDProductoServicio=27534
update Unidad set Peso= '0.212 'WHERE IDProductoServicio=17571
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=24083
update Unidad set Peso= '0.038 'WHERE IDProductoServicio=19054
update Unidad set Peso= '0.032 'WHERE IDProductoServicio=18700
update Unidad set Peso= '0.076 'WHERE IDProductoServicio=22253
update Unidad set Peso= '0.054 'WHERE IDProductoServicio=24084
update Unidad set Peso= '0.038 'WHERE IDProductoServicio=24977
update Unidad set Peso= '0.052 'WHERE IDProductoServicio=9589
update Unidad set Peso= '0.02 'WHERE IDProductoServicio=27548
update Unidad set Peso= '0.04 'WHERE IDProductoServicio=24983
update Unidad set Peso= '0.16 'WHERE IDProductoServicio=25690
update Unidad set Peso= '0.206 'WHERE IDProductoServicio=25695
update Unidad set Peso= '0.032 'WHERE IDProductoServicio=24988
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=24989
update Unidad set Peso= '0.03 'WHERE IDProductoServicio=27540
update Unidad set Peso= '0.02 'WHERE IDProductoServicio=24093
update Unidad set Peso= '0.044 'WHERE IDProductoServicio=24991
update Unidad set Peso= '0.02 'WHERE IDProductoServicio=24994
update Unidad set Peso= '0.264 'WHERE IDProductoServicio=20597
update Unidad set Peso= '0.044 'WHERE IDProductoServicio=27178
update Unidad set Peso= '1.25 'WHERE IDProductoServicio=2820
update Unidad set Peso= '2.122 'WHERE IDProductoServicio=2821
update Unidad set Peso= '0.134 'WHERE IDProductoServicio=22468
update Unidad set Peso= '0.018 'WHERE IDProductoServicio=27545
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=2839
update Unidad set Peso= '0.232 'WHERE IDProductoServicio=22480
update Unidad set Peso= '0.22 'WHERE IDProductoServicio=22834
update Unidad set Peso= '0.262 'WHERE IDProductoServicio=27516
update Unidad set Peso= '0.222 'WHERE IDProductoServicio=21551
update Unidad set Peso= '0.216 'WHERE IDProductoServicio=17565
update Unidad set Peso= '0.086 'WHERE IDProductoServicio=22845
update Unidad set Peso= '0.974 'WHERE IDProductoServicio=27520
update Unidad set Peso= '0.75 'WHERE IDProductoServicio=27521
update Unidad set Peso= '0.072 'WHERE IDProductoServicio=2861
update Unidad set Peso= '0.046 'WHERE IDProductoServicio=18002
update Unidad set Peso= '3.65 'WHERE IDProductoServicio=2866
update Unidad set Peso= '0.354 'WHERE IDProductoServicio=27536
update Unidad set Peso= '0.104 'WHERE IDProductoServicio=27530
update Unidad set Peso= '0.044 'WHERE IDProductoServicio=25680
update Unidad set Peso= '0.062 'WHERE IDProductoServicio=22413
update Unidad set Peso= '0.066 'WHERE IDProductoServicio=22841
update Unidad set Peso= '0.04 'WHERE IDProductoServicio=9645
update Unidad set Peso= '0.032 'WHERE IDProductoServicio=20368
update Unidad set Peso= '0.026 'WHERE IDProductoServicio=13324
update Unidad set Peso= '0.09 'WHERE IDProductoServicio=22836
update Unidad set Peso= '0.252 'WHERE IDProductoServicio=27180
update Unidad set Peso= '0.346 'WHERE IDProductoServicio=27181
update Unidad set Peso= '0.3 'WHERE IDProductoServicio=25686
update Unidad set Peso= '0.236 'WHERE IDProductoServicio=25097
update Unidad set Peso= '0.214 'WHERE IDProductoServicio=25689
update Unidad set Peso= '0.22 'WHERE IDProductoServicio=27183
update Unidad set Peso= '0.232 'WHERE IDProductoServicio=27184
update Unidad set Peso= '0.246 'WHERE IDProductoServicio=27517
update Unidad set Peso= '0.218 'WHERE IDProductoServicio=25696
update Unidad set Peso= '0.21 'WHERE IDProductoServicio=25698
update Unidad set Peso= '0.036 'WHERE IDProductoServicio=26016
update Unidad set Peso= '0.018 'WHERE IDProductoServicio=27541
update Unidad set Peso= '0.034 'WHERE IDProductoServicio=22830
update Unidad set Peso= '0.018 'WHERE IDProductoServicio=2903
update Unidad set Peso= '0.016 'WHERE IDProductoServicio=2904
update Unidad set Peso= '0.026 'WHERE IDProductoServicio=27518
update Unidad set Peso= '0.14 'WHERE IDProductoServicio=26032
update Unidad set Peso= '0.16 'WHERE IDProductoServicio=26024
update Unidad set Peso= '0.015 'WHERE IDProductoServicio=26023
update Unidad set Peso= '0.036 'WHERE IDProductoServicio=27185
update Unidad set Peso= '0.032 'WHERE IDProductoServicio=27532
update Unidad set Peso= '0.052 'WHERE IDProductoServicio=24104
update Unidad set Peso= '0.138 'WHERE IDProductoServicio=24110
update Unidad set Peso= '0.033 'WHERE IDProductoServicio=24112
update Unidad set Peso= '6.62 'WHERE IDProductoServicio=27102





