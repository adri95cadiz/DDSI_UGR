--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PERTENECE
--------------------------------------------------------

  CREATE TABLE "X6052078"."PERTENECE" 
   (	"IDCATEGORIA" VARCHAR2(10 BYTE), 
	"IDPRODUCTO" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index PERTENECE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."PERTENECE_PK" ON "X6052078"."PERTENECE" ("IDCATEGORIA", "IDPRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table PERTENECE
--------------------------------------------------------

  ALTER TABLE "X6052078"."PERTENECE" ADD CONSTRAINT "PERTENECE_PK" PRIMARY KEY ("IDCATEGORIA", "IDPRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."PERTENECE" MODIFY ("IDPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "X6052078"."PERTENECE" MODIFY ("IDCATEGORIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PERTENECE
--------------------------------------------------------

  ALTER TABLE "X6052078"."PERTENECE" ADD FOREIGN KEY ("IDCATEGORIA")
	  REFERENCES "X6052078"."CATEGORIA" ("IDCATEGORIA") ENABLE;
  ALTER TABLE "X6052078"."PERTENECE" ADD FOREIGN KEY ("IDPRODUCTO")
	  REFERENCES "X6052078"."PRODUCTO" ("IDPRODUCTO") ENABLE;
