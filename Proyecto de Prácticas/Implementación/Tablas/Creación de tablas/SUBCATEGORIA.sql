--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SUBCATEGORIA
--------------------------------------------------------

  CREATE TABLE "X6052078"."SUBCATEGORIA" 
   (	"IDCATEGORIA1" VARCHAR2(10 BYTE), 
	"IDCATEGORIA2" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index SUBCATEGORIA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."SUBCATEGORIA_PK" ON "X6052078"."SUBCATEGORIA" ("IDCATEGORIA1", "IDCATEGORIA2") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table SUBCATEGORIA
--------------------------------------------------------

  ALTER TABLE "X6052078"."SUBCATEGORIA" ADD CONSTRAINT "SUBCATEGORIA_PK" PRIMARY KEY ("IDCATEGORIA1", "IDCATEGORIA2")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."SUBCATEGORIA" MODIFY ("IDCATEGORIA2" NOT NULL ENABLE);
  ALTER TABLE "X6052078"."SUBCATEGORIA" MODIFY ("IDCATEGORIA1" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SUBCATEGORIA
--------------------------------------------------------

  ALTER TABLE "X6052078"."SUBCATEGORIA" ADD FOREIGN KEY ("IDCATEGORIA1")
	  REFERENCES "X6052078"."CATEGORIA" ("IDCATEGORIA") ENABLE;
  ALTER TABLE "X6052078"."SUBCATEGORIA" ADD FOREIGN KEY ("IDCATEGORIA2")
	  REFERENCES "X6052078"."CATEGORIA" ("IDCATEGORIA") ENABLE;
