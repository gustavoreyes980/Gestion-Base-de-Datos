/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     06/07/2021 11:03:37                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASCENSO') and o.name = 'FK_ASCENSO_POLICIA_A_POLICIA')
alter table ASCENSO
   drop constraint FK_ASCENSO_POLICIA_A_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BAJA') and o.name = 'FK_BAJA_MISIONES__MISION')
alter table BAJA
   drop constraint FK_BAJA_MISIONES__MISION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ENTRENAMIENTO') and o.name = 'FK_ENTRENAM_POLICIA_E_POLICIA')
alter table ENTRENAMIENTO
   drop constraint FK_ENTRENAM_POLICIA_E_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ENTRENAMIENTO') and o.name = 'FK_ENTRENAM_SANCIONES_SANCION')
alter table ENTRENAMIENTO
   drop constraint FK_ENTRENAM_SANCIONES_SANCION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MISION') and o.name = 'FK_MISION_POLICIA_M_POLICIA')
alter table MISION
   drop constraint FK_MISION_POLICIA_M_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('POLICIA') and o.name = 'FK_POLICIA_RANGO_POL_RANGO')
alter table POLICIA
   drop constraint FK_POLICIA_RANGO_POL_RANGO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('POLICIA_ARMA') and o.name = 'FK_POLICIA__POLICIA_A_ARMA')
alter table POLICIA_ARMA
   drop constraint FK_POLICIA__POLICIA_A_ARMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('POLICIA_ARMA') and o.name = 'FK_POLICIA__POLICIA_A_POLICIA')
alter table POLICIA_ARMA
   drop constraint FK_POLICIA__POLICIA_A_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANCION') and o.name = 'FK_SANCION_ASCENSO_S_ASCENSO')
alter table SANCION
   drop constraint FK_SANCION_ASCENSO_S_ASCENSO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANCION') and o.name = 'FK_SANCION_POLICIA_S_POLICIA')
alter table SANCION
   drop constraint FK_SANCION_POLICIA_S_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_POLICIA_S_POLICIA')
alter table SERVICIO
   drop constraint FK_SERVICIO_POLICIA_S_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UNIDAD_POLICIA') and o.name = 'FK_UNIDAD_P_UNIDAD_PO_POLICIA')
alter table UNIDAD_POLICIA
   drop constraint FK_UNIDAD_P_UNIDAD_PO_POLICIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UNIDAD_POLICIA') and o.name = 'FK_UNIDAD_P_UNIDAD_PO_UNIDAD')
alter table UNIDAD_POLICIA
   drop constraint FK_UNIDAD_P_UNIDAD_PO_UNIDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ARMA')
            and   type = 'U')
   drop table ARMA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASCENSO')
            and   name  = 'POLICIA_ASCENSO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASCENSO.POLICIA_ASCENSO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASCENSO')
            and   type = 'U')
   drop table ASCENSO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BAJA')
            and   name  = 'MISIONES_BAJAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index BAJA.MISIONES_BAJAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAJA')
            and   type = 'U')
   drop table BAJA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ENTRENAMIENTO')
            and   name  = 'SANCIONES_ENTRENAMIENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ENTRENAMIENTO.SANCIONES_ENTRENAMIENTO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ENTRENAMIENTO')
            and   name  = 'POLICIA_ENTRENAMIENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ENTRENAMIENTO.POLICIA_ENTRENAMIENTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ENTRENAMIENTO')
            and   type = 'U')
   drop table ENTRENAMIENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MISION')
            and   name  = 'POLICIA_MISIONES_FK'
            and   indid > 0
            and   indid < 255)
   drop index MISION.POLICIA_MISIONES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MISION')
            and   type = 'U')
   drop table MISION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('POLICIA')
            and   name  = 'RANGO_POLICIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index POLICIA.RANGO_POLICIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POLICIA')
            and   type = 'U')
   drop table POLICIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('POLICIA_ARMA')
            and   name  = 'POLICIA_ARMA_FK'
            and   indid > 0
            and   indid < 255)
   drop index POLICIA_ARMA.POLICIA_ARMA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('POLICIA_ARMA')
            and   name  = 'POLICIA_ARMA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index POLICIA_ARMA.POLICIA_ARMA2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POLICIA_ARMA')
            and   type = 'U')
   drop table POLICIA_ARMA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RANGO')
            and   type = 'U')
   drop table RANGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANCION')
            and   name  = 'ASCENSO_SANCIONES_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANCION.ASCENSO_SANCIONES_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANCION')
            and   name  = 'POLICIA_SANCIONES_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANCION.POLICIA_SANCIONES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANCION')
            and   type = 'U')
   drop table SANCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'POLICIA_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.POLICIA_SERVICIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UNIDAD')
            and   type = 'U')
   drop table UNIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UNIDAD_POLICIA')
            and   name  = 'UNIDAD_POLICIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index UNIDAD_POLICIA.UNIDAD_POLICIA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UNIDAD_POLICIA')
            and   name  = 'UNIDAD_POLICIA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index UNIDAD_POLICIA.UNIDAD_POLICIA2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UNIDAD_POLICIA')
            and   type = 'U')
   drop table UNIDAD_POLICIA
go

/*==============================================================*/
/* Table: ARMA                                                  */
/*==============================================================*/
create table ARMA (
   ID_ARMA              int                  not null,
   CODIGO               varchar(30)          not null,
   CLASE_ARMA           varchar(30)          not null,
   NOMBRE_ARMA          varchar(30)          not null,
   constraint PK_ARMA primary key nonclustered (ID_ARMA)
)
go

/*Datos Insertados de la tabla ARMA*/
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 1,'0010','Rifles','Ametralladora');
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 2,'0100','Escopeta','Combate');
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 3,'0200','Pistola','Walther');

/*==============================================================*/
/* Table: ASCENSO                                               */
/*==============================================================*/
create table ASCENSO (
   ID_ASCENSO           int                  not null,
   ID_POLICIA           int                  null,
   NOTA_FISICAS         numeric(6,2)         not null,
   NOTA_TEORICAS        numeric(6,2)         not null,
   NUMERO_VECES         varchar(30)          not null,
   PROMEDIO             varchar(10)          not null,
   CALIFICACION         varchar(10)          not null,
   NUMERO_ASCENSO       varchar(10)          not null,
   FECHA_PRUEBA         datetime             not null,
   constraint PK_ASCENSO primary key nonclustered (ID_ASCENSO)
)
go

/*Datos Insertados de la tabla ASCENSO*/

insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(1,1,9,9,'12/06/2017','3','','B','4');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(2,2,8,5,'10/05/2019','4','','B','2');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(3,3,8,9,'8/09/2018','3','','B','6');

/*==============================================================*/
/* Index: POLICIA_ASCENSO_FK                                    */
/*==============================================================*/
create index POLICIA_ASCENSO_FK on ASCENSO (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Table: BAJA                                                  */
/*==============================================================*/
create table BAJA (
   ID_BAJAS             int                  not null,
   ID_MISIONES          int                  null,
   NUMERO_BAJAS_P       varchar(10)          not null,
   NUMERO_BAJAS_D       varchar(10)          not null,
   constraint PK_BAJA primary key nonclustered (ID_BAJAS)
)
go

/*Datos Insertados de la tabla BAJAS*/
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (1,1,'3','6');
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (2,2,'0','1');
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (3,3,'0','0');

/*==============================================================*/
/* Index: MISIONES_BAJAS_FK                                     */
/*==============================================================*/
create index MISIONES_BAJAS_FK on BAJA (
ID_MISIONES ASC
)
go

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
create table ENTRENAMIENTO (
   ID_ENTRENAMIENTO     int                  not null,
   ID_POLICIA           int                  null,
   ID_SANCIONES         int                  null,
   DIA_ENTRENAMIENTO    varchar(10)          null,
   HORA_INICIO          varchar(10)             null,
   HORA_FIN             varchar(10)             null,
   FECHA_INICIO         date             null,
   FECHA_FIN            date             null,
   constraint PK_ENTRENAMIENTO primary key nonclustered (ID_ENTRENAMIENTO)
)
go

/*Datos Insertados de la tabla ENTRENAMIENTO*/

insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (1, 1, 1, 'LUNES', '7:00 a.m', '9:00 a.m', '04/02/2014','03/05/2014');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (2, 2, 2, 'MARTES', '7:00 a.m', '9:00 a.m', '11/01/2013','10/04/2013');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (3, 3, 3, 'JUEVES', '7:00 a.m', '9:00 a.m', '09-07-2012','11/10/2012');

/*==============================================================*/
/* Index: POLICIA_ENTRENAMIENTO_FK                              */
/*==============================================================*/
create index POLICIA_ENTRENAMIENTO_FK on ENTRENAMIENTO (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Index: SANCIONES_ENTRENAMIENTO_FK                            */
/*==============================================================*/
create index SANCIONES_ENTRENAMIENTO_FK on ENTRENAMIENTO (
ID_SANCIONES ASC
)
go

/*==============================================================*/
/* Table: MISION                                                */
/*==============================================================*/
create table MISION (
   ID_MISIONES          int                  not null,
   ID_POLICIA           int                  null,
   NOVEDADES            varchar(50)          not null,
   BAJAS_POLICIA        varchar(30)          not null,
   BAJAS_DELINCUENTES   varchar(30)          not null,
   NUMERO_BAJAS_P       numeric(4,2)          not null,
   NUMERO_BAJAS_D       numeric(4,2)          not null,
   FECHA_MISION         date             not null,
   NUMERO_NOVEDADES     numeric(4,2)          not null,
   constraint PK_MISION primary key nonclustered (ID_MISIONES)
)
go

/*Datos Insertados de la tabla MISIONES*/

insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(1,1,'Asalto','si','si',6,8,'10-08-2019',3);
insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(2,2,'Manuntencion','no','si',0,3,'09/10/2019',5);
insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(3,3,'Retencion Motos','no','no',0,0,'05/04/2020',2);


/*==============================================================*/
/* Index: POLICIA_MISIONES_FK                                   */
/*==============================================================*/
create index POLICIA_MISIONES_FK on MISION (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Table: POLICIA                                               */
/*==============================================================*/
create table POLICIA (
   ID_POLICIA           int                  not null,
   ID_RANGO             int                  null,
   NOMBRES              varchar(50)          not null,
   APELLIDOS            varchar(50)          not null,
   FECHA_NACIMIENTO     date             not null,
   FECHA_INGRESO        date                 not null,  
   TIPO_CARGO           varchar(50)          not null,
   constraint PK_POLICIA primary key nonclustered (ID_POLICIA)
)
go

/*Datos Insertados de la tabla POLICIA*/

insert into POLICIA(ID_POLICIA,ID_RANGO,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(1,1,'Jose Antonio','Lucas Delgado','05/05/1992','10/06/2014','Generales');
insert into POLICIA(ID_POLICIA,ID_RANGO,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(2,2,'Luis Franco','Mero Anchundia','12/08/1989','10/04/2013','Superiores');
insert into POLICIA(ID_POLICIA,ID_RANGO,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(3,3,'Pedro Luis','Mero Mero','04/12/1985','09/10/2012','Subalternos');
insert into POLICIA(ID_POLICIA,ID_RANGO,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(4,4,'Jose Luis','Mero Mero','10/11/1990','06/10/2016','Superiores');

/*==============================================================*/
/* Index: RANGO_POLICIA_FK                                      */
/*==============================================================*/
create index RANGO_POLICIA_FK on POLICIA (
ID_RANGO ASC
)
go

/*==============================================================*/
/* Table: POLICIA_ARMA                                          */
/*==============================================================*/
create table POLICIA_ARMA (
   ID_ARMA              int                  not null,
   ID_POLICIA           int                  not null,
   constraint PK_POLICIA_ARMA primary key nonclustered (ID_ARMA, ID_POLICIA)
)
go

insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(1,1);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(2,2);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(3,3);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(1,4);

/*==============================================================*/
/* Index: POLICIA_ARMA2_FK                                      */
/*==============================================================*/
create index POLICIA_ARMA2_FK on POLICIA_ARMA (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Index: POLICIA_ARMA_FK                                       */
/*==============================================================*/
create index POLICIA_ARMA_FK on POLICIA_ARMA (
ID_ARMA ASC
)
go

/*==============================================================*/
/* Table: RANGO                                                 */
/*==============================================================*/
create table RANGO (
   ID_RANGO             int                  not null,
   ANTECEDE             varchar(50)          not null,
   ANO_NECESITA         varchar(50)             not null,
   constraint PK_RANGO primary key nonclustered (ID_RANGO)
)
go

/*Datos Insertados de la tabla RANGO*/

insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (1,'General Superior','6 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (2,'Teniente','4 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (3,'Capitan Policia','2 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (4,'General Inspector','5 Años');

/*==============================================================*/
/* Table: SANCION                                               */
/*==============================================================*/
create table SANCION (
   ID_SANCIONES         int                  not null,
   ID_POLICIA           int                  null,
   ID_ASCENSO           int                  null,
   TIPO_SANCION         varchar(20)          not null,
   FECHA_SANCION        date             not null,
   NUMERO_SANCIONES     numeric(4,2)      not null,
   AÑO_SANCION          varchar (10)         not null,
   
   constraint PK_SANCION primary key nonclustered (ID_SANCIONES)
)
go

/*Datos Insertados de la tabla SANCIONES*/

insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES)
          values(1,1,1,'leve','02/03/2018','2018',5);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
          values(2,2,2,'muy grave','05/08/2019','2019',3);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
          values(3,3,3,'grave','09/04/2020','2020',5);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
          values(4,4,1,'leve','11/07/2018','2018',2);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
          values(5,1,2,'leve','03/06/2018','2018',3);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
         values(6,2,3,'muy grave','10/07/2019','2019',4);
insert into SANCION(ID_SANCIONES,ID_POLICIA,ID_ASCENSO,TIPO_SANCION,FECHA_SANCION,AÑO_SANCION,NUMERO_SANCIONES) 
         values(7,3,1,'muy grave','02/02/2019','2019',2);

/*==============================================================*/
/* Index: POLICIA_SANCIONES_FK                                  */
/*==============================================================*/
create index POLICIA_SANCIONES_FK on SANCION (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Index: ASCENSO_SANCIONES_FK                                  */
/*==============================================================*/
create index ASCENSO_SANCIONES_FK on SANCION (
ID_ASCENSO ASC
)
go

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          int                  not null,
   ID_POLICIA           int                  null,
   ACTIVO               varchar(50)          not null,
   PUNTAJE_MINIMO       varchar(50)          not null,
   ANO_PERMANENCIA      varchar(50)          not null,
   COMPONENTE           varchar(50)          not null,
   constraint PK_SERVICIO primary key nonclustered (ID_SERVICIO)
)
go

/*Datos Insertados de la tabla SERVICIO*/

insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (1,1,'si','18','4 años','');
insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (2,2,'no','19','4 años','');
insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (3,3,'si','20','5 años','');

/*==============================================================*/
/* Index: POLICIA_SERVICIO_FK                                   */
/*==============================================================*/
create index POLICIA_SERVICIO_FK on SERVICIO (
ID_POLICIA ASC
)
go

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD (
   ID_UNIDADES          int                  not null,
   UNIDAD_ASIGNADA      varchar(50)          not null,
   FECHA_ASIGNADO       date             not null,
   constraint PK_UNIDAD primary key nonclustered (ID_UNIDADES)
)
go

/*Datos Insertados de la tabla UNIDADES*/

insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (1,'los olivos','12/05/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (2,'los esteros','07/08/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (3,'las orquideas','02/12/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (4,'los ferretos','09/12/2018');

/*==============================================================*/
/* Table: UNIDAD_POLICIA                                        */
/*==============================================================*/
create table UNIDAD_POLICIA (
   ID_POLICIA           int                  not null,
   ID_UNIDADES          int                  not null,
   constraint PK_UNIDAD_POLICIA primary key nonclustered (ID_POLICIA, ID_UNIDADES)
)
go

insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(1,1);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(2,2);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(3,3);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(4,4);

/*==============================================================*/
/* Index: UNIDAD_POLICIA2_FK                                    */
/*==============================================================*/
create index UNIDAD_POLICIA2_FK on UNIDAD_POLICIA (
ID_UNIDADES ASC
)
go

/*==============================================================*/
/* Index: UNIDAD_POLICIA_FK                                     */
/*==============================================================*/
create index UNIDAD_POLICIA_FK on UNIDAD_POLICIA (
ID_POLICIA ASC
)
go

alter table ASCENSO
   add constraint FK_ASCENSO_POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table BAJA
   add constraint FK_BAJA_MISIONES__MISION foreign key (ID_MISIONES)
      references MISION (ID_MISIONES)
go

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_POLICIA_E_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_SANCIONES_SANCION foreign key (ID_SANCIONES)
      references SANCION (ID_SANCIONES)
go

alter table MISION
   add constraint FK_MISION_POLICIA_M_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table POLICIA
   add constraint FK_POLICIA_RANGO_POL_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
go

alter table POLICIA_ARMA
   add constraint FK_POLICIA__POLICIA_A_ARMA foreign key (ID_ARMA)
      references ARMA (ID_ARMA)
go

alter table POLICIA_ARMA
   add constraint FK_POLICIA__POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table SANCION
   add constraint FK_SANCION_ASCENSO_S_ASCENSO foreign key (ID_ASCENSO)
      references ASCENSO (ID_ASCENSO)
go

alter table SANCION
   add constraint FK_SANCION_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table SERVICIO
   add constraint FK_SERVICIO_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table UNIDAD_POLICIA
   add constraint FK_UNIDAD_P_UNIDAD_PO_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table UNIDAD_POLICIA
   add constraint FK_UNIDAD_P_UNIDAD_PO_UNIDAD foreign key (ID_UNIDADES)
      references UNIDAD (ID_UNIDADES)
go

/*1: Indique los hermanos que hay en la base de datos */

select
      POLICIA.NOMBRES,
	  POLICIA.APELLIDOS,
	  RANGO.ANTECEDE
	  from POLICIA INNER JOIN RANGO
	  ON POLICIA.ID_POLICIA = RANGO.ID_RANGO
	  WHERE POLICIA.APELLIDOS='Mero Mero'
	  GROUP BY NOMBRES, APELLIDOS,ANTECEDE
	  order by APELLIDOS;
	  

/*2: Por cada uno de los rangos policiales que me indique un promedio de castigos emitidos al año*/

    select 
t1.AÑO_SANCION, 
 t3.ANTECEDE, count(t1.ID_POLICIA) as Numero_Castigos
   
from sancion as t1
inner join policia as t2 on t1.id_policia = t2.id_policia
inner join rango as t3 on t2.id_rango = t3.id_rango


group by t3.ANTECEDE , t1.AÑO_SANCION

order by t1.AÑO_SANCION desc
			

	
			   
			   
			   	   	   		   
	 


/*3: Que muestre las novedades que se hallan en las misiones*/
 
select 
       POLICIA.NOMBRES,
	   POLICIA.APELLIDOS,
	   MISION.NOVEDADES as NOVEDADES,
	   MISION.FECHA_MISION, MISION.NUMERO_NOVEDADES
	   from MISION inner join POLICIA
	   on MISION.ID_MISIONES = POLICIA.ID_POLICIA
	   order by NOVEDADES,
	            NOMBRES,
				FECHA_MISION,
				NUMERO_NOVEDADES,
				APELLIDOS;

/*4: Mostrar el numero de bajas que se dan en cada mision*/

select 
      MISION.NOVEDADES as MISIONES,
      MISION.BAJAS_POLICIA,
	  MISION.BAJAS_DELINCUENTES,
	  MISION.FECHA_MISION,
	  BAJA.NUMERO_BAJAS_P,
	  BAJA.NUMERO_BAJAS_D,
	  MISION.NUMERO_NOVEDADES
from MISION inner join BAJA
on MISION.ID_MISIONES = BAJA.ID_BAJAS
where  NOVEDADES = MISION.NOVEDADES
order by BAJAS_POLICIA,
         BAJAS_DELINCUENTES,
		 NUMERO_BAJAS_D,
		 NUMERO_BAJAS_P,
		 FECHA_MISION,
		 MISION.NOVEDADES,
		 NUMERO_NOVEDADES;