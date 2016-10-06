CREATE OR REPLACE
  PROCEDURE RegistrarCritica(
  puntuacion CRITICA.PUNTUACION%TYPE,
  votacion CRITICA.VOTACION%TYPE,
  analisis CRITICA.ANALISIS%TYPE,
  idprod CRITICA.IDPRODUCTOCRIT%TYPE,
  iduser CRITICA.IDUSUARIOCRIT%TYPE
  )
  IS
    PROD_NO_EXISTS EXCEPTION;
    USER_NO_EXISTS EXCEPTION;    
    CRIT_EXISTS EXCEPTION;    
    newid CRITICA.IDCRITICA%TYPE;
    cuenta NUMBER;
  BEGIN
    SELECT COUNT(*) INTO cuenta FROM PRODUCTO
    WHERE PRODUCTO.IDPRODUCTO = idprod;
    
    IF (cuenta=0) THEN
    RAISE PROD_NO_EXISTS;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM USUARIO
    WHERE USUARIO.NOMBREUSUARIO = iduser;
    
    IF (cuenta=0) THEN
    RAISE USER_NO_EXISTS;
    END IF;
    
    SELECT COUNT(*) INTO cuenta FROM CRITICA
    WHERE CRITICA.IDUSUARIOCRIT = iduser AND CRITICA.IDPRODUCTOCRIT = idprod;
    
    IF (cuenta=1) THEN
    RAISE CRIT_EXISTS;
    END IF;
    
    SELECT MAX(CRITICA.IDCRITICA) INTO newid FROM CRITICA;    
    newid := newid + 1;   
    INSERT INTO CRITICA (IDCRITICA, PUNTUACION, VOTACION, ANALISIS, INAPROPIADA, IDPRODUCTOCRIT, IDUSUARIOCRIT )
    VALUES (newid, puntuacion, votacion, analisis, 0, idprod, iduser);
    
  EXCEPTION
    WHEN PROD_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1501, 'El producto al que quieres insertar una critica no existe.');
    WHEN USER_NO_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1504, 'El usuario que desea insertar una critica no existe.');
    WHEN CRIT_EXISTS THEN
      RAISE_APPLICATION_ERROR (-1523, 'El usuario ya ha insertado una critica sobre este producto.');
      
END RegistrarCritica;

