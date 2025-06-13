if @opcion=1
 Select LineaPadre, LineaProducto, MarcaProducto, CodigoProducto, AplicaProducto, 
 OEM, UnidMed as Medida, Precio, 
 case when isnull(Stock_Fijo,0) > 0 then case when Stock > Stock_Fijo  then Stock_Fijo else Stock end else Stock end as Stock,
 RutaImagenProducto, ImagenProducto
 from usv_ProductoListaImagenes_General 
 Where Grupodeimpresion = @Grupodeimpresion
 order by MarcaProducto, LineaProducto, AplicaProducto, CodigoProducto
elseif @opcion=2

select *from usv_ProductoListaImagenes_General where codigoproducto in( 'SV.445006005F','SV.D09763')

 Select LineaPadre, LineaProducto, MarcaProducto, CodigoProducto, AplicaProducto, 
 OEM, UnidMed as Medida, Precio, 
 case when isnull(Stock_Fijo,0) > 0 then case when Stock > Stock_Fijo  then Stock_Fijo else Stock end else Stock end as Stock,
 RutaImagenProducto, ImagenProducto
 from usv_ProductoListaImagenes_ConStock 
 Where Grupodeimpresion = @Grupodeimpresion
 order by MarcaProducto, LineaProducto, AplicaProducto, CodigoProdu

 --Opcion (1- LP General / 2- LP con Stock)