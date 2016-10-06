--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CATEGORIA
--------------------------------------------------------

  CREATE TABLE "X6052078"."CATEGORIA" 
   (	"IDCATEGORIA" VARCHAR2(10 CHAR), 
	"NOMBRE" VARCHAR2(20 CHAR), 
	"DESCRIPCIÓN" VARCHAR2(200 CHAR), 
	"TAMAÑO" NUMBER, 
	"INAPROPIADA" VARCHAR2(1 BYTE), 
	"IDUSUARIOCAT" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index CATEGORIAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."CATEGORIAS_PK" ON "X6052078"."CATEGORIA" ("IDCATEGORIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table CATEGORIA
--------------------------------------------------------

  ALTER TABLE "X6052078"."CATEGORIA" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "X6052078"."CATEGORIA" ADD CONSTRAINT "CATEGORIAS_PK" PRIMARY KEY ("IDCATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."CATEGORIA" MODIFY ("IDCATEGORIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CATEGORIA
--------------------------------------------------------

  ALTER TABLE "X6052078"."CATEGORIA" ADD FOREIGN KEY ("IDUSUARIOCAT")
	  REFERENCES "X6052078"."USUARIO" ("NOMBREUSUARIO") ENABLE;
