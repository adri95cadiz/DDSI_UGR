INSERT INTO CATEGORIA(IDCATEGORIA, NOMBRE, DESCRIPCION)
VALUES (0000000000, 'TODO', 'Categoria todo, que incluye todos los productos del sistema.');

INSERT INTO USUARIO (NOMBREUSUARIO, CORREO, CONTRASE�A, BANEADO)
VALUES ('Pedro', 'pedro@ugr.es', '123456',0);

INSERT INTO PRODUCTO (IDPRODUCTO, NOMBRE, PUNTUACION, DESCRIPCION, INAPROPIADO, NOMBREUSUARIOPROD )
VALUES (001,'Star Wars', 9, 'pelicula sobre la guerra de las galaxia ...',0, 'Pedro');
--Cada vez que insertas un producto, se lanzar�a un disparador que a�ade el producto a la categoria TODO.

INSERT INTO CRITICA (IDCRITICA, PUNTUACION, VOTACION, ANALISIS, INAPROPIADA, IDPRODUCTOCRIT, IDUSUARIOCRIT )
VALUES (001, 9, 2, 'DARTH VADER ERA SU PADRE', 0, 001, 'Pedro');
--Cada vez que insertas una critica, se lanzaria un disparador que actualiza la puntuacion del producto, 
--haciendo la media con la nueva critica.

INSERT INTO CATEGORIA(IDCATEGORIA, NOMBRE, DESCRIPCION, INAPROPIADA,TAMA�O, IDUSUARIOCAT)
VALUES (001, 'CIENCIA FICCION', 'Conjunto de peliculas basadas en el g�nero de ciencia ficci�n',0,0,'Pedro');
--Cada vez que insertas una categoria, se lanzar�a un disparador que a�ade la categoria a la categoria TODO.

INSERT INTO SUBCATEGORIA(IDCATEGORIA1,IDCATEGORIA2)
VALUES (000, 001);
--Cada vez que pones una categoria como subcategoria se lanzaria un disparador que actualiza el tama�o sumando
--el de la nueva subcategoria.

INSERT INTO PERTENECE(IDCATEGORIA,IDPRODUCTO)
VALUES (001, 001);
--Cada vez que insertas un producto en una categoria se lanzaria un disparador que aumenta el tama�o de la 
--categoria en 1.

--Cada vez que insertas un producto, critica o categoria se lanzaria un disparador que busca el ultimo valor
--de IdProducto/IdCategoria/IdCritica (el mas alto) y le suma 1, a�adiendo el elemento con ese valor obtenido como Id.
