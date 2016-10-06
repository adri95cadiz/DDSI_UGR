CREATE OR REPLACE
  PROCEDURE EliminarProductoCategoria(
  idprod PERTENECE.IDPRODUCTO%TYPE,
  idcat PERTENECE.IDCATEGORIA%TYPE
  )
  IS
    PROD_NO_EXISTS EXCEPTION;
    CAT_NO_EXISTS EXCEPTION;    
    PROD_CAT_NO_REL EXCEPTION;    
    CAT_IS_TODO EXCEPTION;
    cuenta NUMBER;
  BEGIN
    SELECT COUNT(*) INTO cuenta FROM PRODUCTO
    WHERE PRODUCTO.IDPRODUCTO = idprod;
    
    IF (cuenta=0) THEN
    RAISE PROD_NO_EXISTS;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM CATEGORIA
    WHERE CATEGORIA.IDCATEGORIA = idcat;
    
    IF (cuenta=0) THEN
    RAISE CAT_NO_EXISTS;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM PERTENECE
    WHERE PERTENECE.IDPRODUCTO = idprod AND PERTENECE.IDCATEGORIA = idcat;
    
    IF (cuenta=0) THEN
    RAISE PROD_CAT_NO_REL;
    END IF;
    
    IF (idcat=000) THEN
    RAISE CAT_IS_TODO;
    END IF;
    
    DELETE FROM PERTENECE WHERE IDCATEGORIA = idcat AND IDPRODUCTO = idprod;
    
  EXCEPTION
    WHEN PROD_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1501, 'El producto que quiere eliminar en una categoria no existe.');
    WHEN CAT_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1502, 'La categoria a la que desea eliminar un producto no existe.');
    WHEN PROD_CAT_NO_REL THEN
      RAISE_APPLICATION_ERROR (-1511, 'El producto que intenta eliminar de la categoria no pertenece a esta categoria.');
    WHEN CAT_IS_TODO THEN
      RAISE_APPLICATION_ERROR (-1541, 'No se pueden eliminar productos de la categoria TODO.');
      
END EliminarProductoCategoria;

