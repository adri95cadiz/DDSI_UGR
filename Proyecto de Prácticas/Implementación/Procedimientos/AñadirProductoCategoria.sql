CREATE OR REPLACE
  PROCEDURE AñadirProductoCategoria(
  idprod PERTENECE.IDPRODUCTO%TYPE,
  idcat PERTENECE.IDCATEGORIA%TYPE
  )
  IS
    PROD_NO_EXISTS EXCEPTION;
    CAT_NO_EXISTS EXCEPTION;    
    PROD_CAT_REL EXCEPTION;    
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
    
    IF (cuenta=1) THEN
    RAISE PROD_CAT_REL;
    END IF;
    
    INSERT INTO PERTENECE(IDCATEGORIA, IDPRODUCTO)
    VALUES (idcat, idprod);
    
  EXCEPTION
    WHEN PROD_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1501, 'El producto que quiere insertar en una categoria no existe.');
    WHEN CAT_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1502, 'La categoria a la que desea insertar un producto no existe.');
    WHEN PROD_CAT_REL THEN
      RAISE_APPLICATION_ERROR (-1512, 'El producto ya pertenece a esta categoria.');
      
END AñadirProductoCategoria;

