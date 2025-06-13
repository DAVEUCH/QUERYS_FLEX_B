----update en la tabla GC_Cliente en el campo Score, también piden Condicion_Contribuyente_SUNAT, Estado_Contribuyente_SUNAT

select  *from GC_Cliente  
--select*from Persona where DocIdentidad='10106761596'
--10106761596

--update GC_Cliente set  Score='' where IDPersona=22


select DocIdentidad, Nombre,PKID from Persona where DocIdentidad in (   
 '20552627645 ',
 '10727887941 ',
 '20555688475 ',
 '10462959066 ',
 '10004073423 ',
 '10081340311 ',
 '20602700951 ',
 '20526419341 ',
 '20606372974 ',
 '20600873840 ',
 '20606891424 ',
 '10437660692 ',
 '20452726051 ',
 '20606698365 ',
 '20609325969 ',
 '20559848167 ',
 '20372444810 ',
 '20547868839 ',
 '20533694218 ',
 '10239577887          ',
 '10239673177          ',
 '10214199870          ',
 '10067583189          ',
 '10293818814 ',
 '10097106733          ',
 '10316337185          ',
 '10072143367          ',
 '10154327113          ',
 '10293841328          ',
 '10233760906          ',
 '10199126194          ',
 '10205314607          ',
 '20557758420          ',
 '20564426939          ',
 '20549083189          ',
 '20600067533          ',
 '20393923483          ',
 '10427086785          ',
 '20600300955          '
)
order by case Codigo
when '20552627645 ' then 1
when '10727887941 ' then 2
when '20555688475 ' then 3
when '10462959066 ' then 4
when '10004073423 ' then 5
when '10081340311 ' then 6
when '20602700951 ' then 7
when '20526419341 ' then 8
when '20606372974 ' then 9
when '20600873840 ' then 10
when '20606891424 ' then 11
when '10437660692 ' then 12
when '20452726051 ' then 13
when '20606698365 ' then 14
when '20609325969 ' then 15
when '20559848167 ' then 16
when '20372444810 ' then 17
when '20547868839 ' then 18
when '20533694218 ' then 19
when '10239577887          ' then 20
when '10239673177          ' then 21
when '10214199870          ' then 22
when '10067583189          ' then 23
when '10293818814 ' then 24
when '10097106733          ' then 25
when '10316337185          ' then 26
when '10072143367          ' then 27
when '10154327113          ' then 28
when '10293841328          ' then 29
when '10233760906          ' then 30
when '10199126194          ' then 31
when '10205314607          ' then 32
when '20557758420          ' then 33
when '20564426939          ' then 34
when '20549083189          ' then 35
when '20600067533          ' then 36
when '20393923483          ' then 37
when '10427086785          ' then 38
when '20600300955          ' then 39
end

update GC_Cliente set  Score= '587 'where IDPersona=423
update GC_Cliente set  Score= '840 'where IDPersona=4518
update GC_Cliente set  Score= '591 'where IDPersona=7016
update GC_Cliente set  Score= '917 'where IDPersona=7799
update GC_Cliente set  Score= '929 'where IDPersona=860
update GC_Cliente set  Score= '24 'where IDPersona=3002
update GC_Cliente set  Score= '124 'where IDPersona=6011
update GC_Cliente set  Score= '967 'where IDPersona=285
update GC_Cliente set  Score= '676 'where IDPersona=7912
update GC_Cliente set  Score= '629 'where IDPersona=5389
update GC_Cliente set  Score= '597 'where IDPersona=8219
update GC_Cliente set  Score= '889 'where IDPersona=1010
update GC_Cliente set  Score= '883 'where IDPersona=388
update GC_Cliente set  Score= '693 'where IDPersona=8422
update GC_Cliente set  Score= '686 'where IDPersona=8990
update GC_Cliente set  Score= '653 'where IDPersona=3642
update GC_Cliente set  Score= '696 'where IDPersona=1863
update GC_Cliente set  Score= '965 'where IDPersona=2235
update GC_Cliente set  Score= '970 'where IDPersona=2930
update GC_Cliente set  Score= '954 'where IDPersona=1061
update GC_Cliente set  Score= '130 'where IDPersona=1062
update GC_Cliente set  Score= '966 'where IDPersona=1078
update GC_Cliente set  Score= '885 'where IDPersona=1095
update GC_Cliente set  Score= '825 'where IDPersona=1130
update GC_Cliente set  Score= '847 'where IDPersona=1158
update GC_Cliente set  Score= '818 'where IDPersona=1179
update GC_Cliente set  Score= '768 'where IDPersona=1218
update GC_Cliente set  Score= '914 'where IDPersona=1286
update GC_Cliente set  Score= '929 'where IDPersona=1357
update GC_Cliente set  Score= '803 'where IDPersona=1369
update GC_Cliente set  Score= '896 'where IDPersona=1404
update GC_Cliente set  Score= '633 'where IDPersona=1415
update GC_Cliente set  Score= '951 'where IDPersona=3424
update GC_Cliente set  Score= '615 'where IDPersona=3467
update GC_Cliente set  Score= '534 'where IDPersona=3569
update GC_Cliente set  Score= '629 'where IDPersona=3777
update GC_Cliente set  Score= '614 'where IDPersona=3927
update GC_Cliente set  Score= '99 'where IDPersona=3958
update GC_Cliente set  Score= '150 'where IDPersona=3994







