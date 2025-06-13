select*from GC_M_Usuario

insert into GC_M_Usuario (ch_codUsuario,ch_tipUsuario,vc_NomUsuario,vc_Usuario,vc_Password,in_EsVende,id_Vendedor,nullUsuario)
values ('078','02','STEPHANIE PORTILLO ALCANTARA','SPORTILLOA','42846552',0,0,0)

update GC_M_Usuario set vc_NomUsuario='JHONATAN PAREDES GALLARDA' where ch_codUsuario='063'