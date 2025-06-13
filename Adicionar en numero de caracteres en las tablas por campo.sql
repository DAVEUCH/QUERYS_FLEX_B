ALTER TABLE Producto
ALTER COLUMN Observacion VARCHAR(1000);

ALTER TABLE Producto
ALTER COLUMN Observacion VARCHAR(1500) NOT NULL;

SELECT TOP (100)*FROM Producto WHERE CodigoFabrica='ERT90'

UPDATE Producto SET Observacion='Ww' WHERE CodigoFabrica='ERT90'


