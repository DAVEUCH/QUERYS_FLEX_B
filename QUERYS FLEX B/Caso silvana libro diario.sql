select top(100)*from CuentaContable
order by PKID desc
--where Cuenta=1041208

SELECT * FROM dbo.fFB_LibroMayorPorFecha2014_NESS_NEW( '2024-01-01', '2024-31-01', 1041101, 1041208, 6)

SELECT * 
FROM CuentaContable
WHERE descripcion LIKE '%?%'
   OR descripcion LIKE '%/%'
   OR descripcion LIKE '%\%'  -- En SQL Server, debes usar un doble backslash ('\\') si quieres buscar el backslash ('\')
   OR descripcion LIKE '%=%'
   OR descripcion LIKE '%[[]%'  -- En SQL Server y MySQL, los corchetes deben escaparse con corchetes adicionales
   OR descripcion LIKE '%]%'
   
   