CREATE OR REPLACE
  PROCEDURE CategoriaComoSubcategoria(
  idsupercat SUBCATEGORIA.IDCATEGORIA1%TYPE,
  idsubcat SUBCATEGORIA.IDCATEGORIA2%TYPE
  )
  IS
    CAT_NO_EXISTS EXCEPTION;    
    SUBCAT_REL EXCEPTION;     
    SUBCAT_REL2 EXCEPTION;     
    SUBCAT_EQUAL EXCEPTION;     
    SUBCAT_TODO EXCEPTION;    
    cuenta NUMBER;
  BEGIN
    SELECT COUNT(*) INTO cuenta FROM CATEGORIA
    WHERE CATEGORIA.IDCATEGORIA = idsupercat OR CATEGORIA.IDCATEGORIA = idsubcat;
    
    IF (cuenta=0) THEN
    RAISE CAT_NO_EXISTS;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM SUBCATEGORIA
    WHERE SUBCATEGORIA.IDCATEGORIA1 = idsupercat AND SUBCATEGORIA.IDCATEGORIA2 = idsubcat;
    
    IF (cuenta=1) THEN
    RAISE SUBCAT_REL;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM SUBCATEGORIA
    WHERE SUBCATEGORIA.IDCATEGORIA1 = idsubcat AND SUBCATEGORIA.IDCATEGORIA2 = idsupercat;
    
    IF (cuenta=1) THEN
    RAISE SUBCAT_REL2;
    END IF;
    
    IF (idsubcat = idsupercat) THEN
    RAISE SUBCAT_EQUAL;
    END IF;
    
    IF (idsubcat = 000) THEN
    RAISE SUBCAT_TODO;
    END IF;
    
    INSERT INTO SUBCATEGORIA(IDCATEGORIA1, IDCATEGORIA2)
    VALUES (idsupercat, idsubcat);
    
  EXCEPTION
    WHEN CAT_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1502, 'Una de las dos categorias introducidas no existe.');
    WHEN SUBCAT_REL THEN
      RAISE_APPLICATION_ERROR (-1531, 'La categoria ya es subcategoria de la categoria dada.');
    WHEN SUBCAT_REL2 THEN
      RAISE_APPLICATION_ERROR (-1532, 'No se puede establecer como subcategoria una categoria que es supercategoria de la categoria dada.');
    WHEN SUBCAT_EQUAL THEN
      RAISE_APPLICATION_ERROR (-1533, 'No se puede establecer a una categoria como subcategoria de si misma.');
    WHEN SUBCAT_TODO THEN
      RAISE_APPLICATION_ERROR (-1534, 'No se puede establecer la categoria TODO como subcategoria.');
      
END CategoriaComoSubcategoria;
