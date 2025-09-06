------update en la tabla GC_Cliente en el campo Score, también piden Condicion_Contribuyente_SUNAT, Estado_Contribuyente_SUNAT

--select  *from GC_Cliente  
----select*from Persona where DocIdentidad='10106761596'
----10106761596

--update GC_Cliente set  Condicion_Contribuyente_SUNAT= 'HABIDO ', Estado_Contribuyente_SUNAT= 'ACTIVO ' where IDPersona=22



select DocIdentidad, Nombre,PKID from Persona where DocIdentidad in (   
 '20605952748 '
 
)
order by case Codigo
when  '10482095629 ' then 1



end

--update GC_Cliente set  Condicion_Contribuyente_SUNAT='',Estado_Contribuyente_SUNAT='' where IDPersona=423
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







