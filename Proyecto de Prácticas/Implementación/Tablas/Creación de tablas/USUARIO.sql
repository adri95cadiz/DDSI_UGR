--------------------------------------------------------
-- Archivo creado  - jueves-febrero-11-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "X6052078"."USUARIO" 
   (	"NOMBREUSUARIO" VARCHAR2(40 CHAR), 
	"CORREO" VARCHAR2(30 CHAR), 
	"CONTRASEÑA" VARCHAR2(16 CHAR), 
	"BANEADO" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  DDL for Index USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "X6052078"."USUARIO_PK" ON "X6052078"."USUARIO" ("NOMBREUSUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA" ;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "X6052078"."USUARIO" ADD CONSTRAINT "USUARIO_PK" PRIMARY KEY ("NOMBREUSUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "BDCCIA"  ENABLE;
  ALTER TABLE "X6052078"."USUARIO" MODIFY ("CORREO" NOT NULL ENABLE);
  ALTER TABLE "X6052078"."USUARIO" MODIFY ("NOMBREUSUARIO" NOT NULL ENABLE);

