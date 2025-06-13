select top 10*from cp order by PKID desc


USE GCI;
ALTER DATABASE GCI SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Poner en modo de un solo usuario
ALTER DATABASE GCI MODIFY NAME = GCI_prueba;               -- Cambiar nombre de la base de datos
ALTER DATABASE GCI_prueba SET MULTI_USER;                           -- Devolver a modo multiusuario
