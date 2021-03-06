--------------------------------------------------------
--  DDL for Table LOCATION
--------------------------------------------------------

  CREATE TABLE "PRMSADMIN"."LOCATION" 
   (	"LOCID" NUMBER(*,0), 
	"LOCNAME" VARCHAR2(50 BYTE), 
	"LOCCITY" VARCHAR2(50 BYTE), 
	"LOCSTATE" VARCHAR2(50 BYTE), 
	"LOCADDRESS" VARCHAR2(255 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "PRMSTABLESPACE" ;
