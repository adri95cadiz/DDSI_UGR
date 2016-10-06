--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CRITICA
--------------------------------------------------------

  CREATE TABLE "X6052078"."CRITICA" 
   (	"IDCRITICA" VARCHAR2(10 CHAR), 
	"PUNTUACION" NUMBER, 
	"VOTACION" NUMBER, 
	"ANALISIS" VARCHAR2(200 CHAR), 
	"INAPROPIADA" VARCHAR2(1 BYTE), 
	"IDPRODUCTOCRIT" VARCHAR2(10 CHAR), 
	"IDUSUARIOCRIT" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index CRITICAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."CRITICAS_PK" ON "X6052078"."CRITICA" ("IDCRITICA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table CRITICA
--------------------------------------------------------

  ALTER TABLE "X6052078"."CRITICA" ADD CONSTRAINT "CRITICAS_PK" PRIMARY KEY ("IDCRITICA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."CRITICA" MODIFY ("IDCRITICA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CRITICA
--------------------------------------------------------

  ALTER TABLE "X6052078"."CRITICA" ADD FOREIGN KEY ("IDPRODUCTOCRIT")
	  REFERENCES "X6052078"."PRODUCTO" ("IDPRODUCTO") ENABLE;
  ALTER TABLE "X6052078"."CRITICA" ADD FOREIGN KEY ("IDUSUARIOCRIT")
	  REFERENCES "X6052078"."USUARIO" ("NOMBREUSUARIO") ENABLE;
