  --USE GCI
  select*from Cp where NumCp like 'FC03-3742260'
  select*from CptoOperacion where PKID=1960
  select*from Periodo  where  PKID=100000495

  select*from CptoOperacion where Codigo='CG022'
  --gci
  select  Fecha,FechaEmision,IDCptoOperacion,NumCpContable,NumCp,IDLibroAuxiliar from cp where
  IDCptoOperacion=1974 and
   IDPeriodo=100000487 
  and IDLibroAuxiliar=0
  	select*from Periodo where PKID=100000486
  SELECT*FROM LibroAuxiliar

     -- se ha puesto un trigger para GCI----
CREATE TRIGGER TR_Update_IDLibroAuxiliar
ON CP
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CP
    SET IDLibroAuxiliar = 3
    FROM CP
    INNER JOIN inserted i ON CP.PKID = i.PKID
    WHERE i.IDCptoOperacion = 1974;
END;
----------------------------------------------------------------------------

  --freddy
    select  Fecha,IDCptoOperacion,NumCp,IDLibroAuxiliar from cp where IDCptoOperacion=1960 and IDPeriodo=100000496
	select*from Periodo where PKID=100000496
   -- se ha puesto un trigger para FREDDY----
CREATE TRIGGER TR_Update_IDLibroAuxiliar
ON CP
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CP
    SET IDLibroAuxiliar = 3
    FROM CP
    INNER JOIN inserted i ON CP.PKID = i.PKID
    WHERE i.IDCptoOperacion = 1960;
END;

---------------------



	--and NumCp='FN01-30166708'
	select*from Periodo

    update cp set IDLibroAuxiliar=3 where    IDCptoOperacion=1974 and
   IDPeriodo=100000487 

	select*from Cp where NumCp in('FL00-0582964','FL00-0582965')

	select*from TipoComprobantePago

	-------------------------------------------------------------------------------------------------------