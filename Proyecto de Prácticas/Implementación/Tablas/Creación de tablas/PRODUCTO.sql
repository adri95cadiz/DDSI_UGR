--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCTO
--------------------------------------------------------

  CREATE TABLE "X6052078"."PRODUCTO" 
   (	"IDPRODUCTO" VARCHAR2(10 CHAR), 
	"NOMBRE" VARCHAR2(20 CHAR), 
	"PUNTUACIÓN" NUMBER, 
	"DESCRIPCIÓN" VARCHAR2(200 CHAR), 
	"INAPROPIADO" VARCHAR2(1 BYTE), 
	"NOMBREUSUARIOPROD" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index PRODUCTOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."PRODUCTOS_PK" ON "X6052078"."PRODUCTO" ("IDPRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "X6052078"."PRODUCTO" ADD CONSTRAINT "PRODUCTOS_PK" PRIMARY KEY ("IDPRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."PRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "X6052078"."PRODUCTO" MODIFY ("IDPRODUCTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "X6052078"."PRODUCTO" ADD FOREIGN KEY ("NOMBREUSUARIOPROD")
	  REFERENCES "X6052078"."USUARIO" ("NOMBREUSUARIO") ENABLE;
