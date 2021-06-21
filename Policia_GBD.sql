/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     21/05/2021 13:28:29                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('ARMA')
            and   type = 'U')
   drop table ARMA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ENTRENAMIENTO')
            and   type = 'U')
   drop table ENTRENAMIENTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASCENSO')
            and   type = 'U')
   drop table ASCENSO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CASTIGO')
            and   type = 'U')
   drop table CASTIGO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MISION')
            and   type = 'U')
   drop table MISION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POLICIA')
            and   type = 'U')
   drop table POLICIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RANGO')
            and   type = 'U')
   drop table RANGO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAJA')
            and   type = 'U')
   drop table BAJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANCION')
            and   type = 'U')
   drop table SANCION
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
   NOTA_FISICAS      numeric(6,2)          not null,
   NOTA_TEORICAS     numeric(6,2)          not null,
   NUMERO_VECES         varchar(30)          not null,
   PROMEDIO             varchar(10)         not null,
   CALIFICACION         varchar(10)         not null,
   NUMERO_ASCENSO       varchar(10)          not null,
   FECHA_PRUEBA         date                 not null,
   constraint PK_ASCENSO primary key nonclustered (ID_ASCENSO)
)
go

/*Datos Insertados de la tabla ASCENSO*/
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO,FECHA_PRUEBA)
            values(1,1,10,8,'2','','A','3','17/10/2015');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO,FECHA_PRUEBA)
            values(2,2,10,0,'1','','B','2','25/12/2016');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO,FECHA_PRUEBA)
            values(3,3,0,10,'1','','B','1','30/8/2018');

/*==============================================================*/
/* Table: CASTIGO                                               */
/*==============================================================*/
create table CASTIGO (
   ID_CASTIGO           int                  not null,
   ID_RANGO             int                  null,
   NUMERO_CASTIGOS      varchar(10)         not null,
   FECHA_CASTIGO        date            not null,
   AÑO_CASTIGO          varchar(10)         not null,
   constraint PK_CASTIGO primary key nonclustered (ID_CASTIGO)
)
go

/*Datos Insertados de la tabla CASTIGO*/
insert into CASTIGO( ID_CASTIGO,ID_RANGO,NUMERO_CASTIGOS,FECHA_CASTIGO,AÑO_CASTIGO) values (1,1,'2','17/08/2014','2014');
insert into CASTIGO( ID_CASTIGO,ID_RANGO,NUMERO_CASTIGOS,FECHA_CASTIGO,AÑO_CASTIGO) values (2,2,'1','06/06/2017','2017');
insert into CASTIGO( ID_CASTIGO,ID_RANGO,NUMERO_CASTIGOS,FECHA_CASTIGO,AÑO_CASTIGO) values (3,3,'3','20/05/2018','2018');
insert into CASTIGO( ID_CASTIGO,ID_RANGO,NUMERO_CASTIGOS,FECHA_CASTIGO,AÑO_CASTIGO) values (4,4,'3','17/11/2016','2016');
insert into CASTIGO( ID_CASTIGO,ID_RANGO,NUMERO_CASTIGOS,FECHA_CASTIGO,AÑO_CASTIGO) values (5,2,'5','06/08/2017','2017');



/*==============================================================*/
/* Table: MISIONES                                              */
/*==============================================================*/
create table MISION (
   ID_MISION          int                  not null,
   ID_POLICIA           int                  null,
   NOVEDADES            varchar(50)          not null,
   BAJAS_POLICIA        varchar(30)          not null,
   BAJAS_DELINCUENTES   varchar(30)          not null,
   FECHA_MISION         date             not null,
   NUMEROS_NOVEDADES    varchar(10)      not null,
   constraint PK_MISIONES primary key nonclustered (ID_MISION)
)
go

/*Datos Insertados de la tabla MISIONES*/

insert into MISION(ID_MISION,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(1,1,'Asalto','si','si','17/08/2019','3');
insert into MISION(ID_MISION,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(2,2,'Manuntencion','no','si','25/10/2019','5');
insert into MISION(ID_MISION,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(3,3,'Retencion Motos','no','no','10/04/2020','2');

/*==============================================================*/
/* Table: Bajas                                             */
/*==============================================================*/
create table BAJA (
   ID_BAJA          int                  not null,
   ID_MISION          int                  null,
   NUMERO_BAJAS_P       varchar(10)          not null,
   NUMERO_BAJAS_D       varchar(10)          not null,
   constraint PK_BAJAS primary key nonclustered (ID_BAJA)
)
go

/*Datos Insertados de la tabla BAJAS*/
insert into BAJA(ID_BAJA,ID_MISION,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (1,1,'3','6');
insert into BAJA(ID_BAJA,ID_MISION,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (2,2,'0','1');
insert into BAJA(ID_BAJA,ID_MISION,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (3,3,'0','0');



/*==============================================================*/
/* Table: POLICIA                                               */
/*==============================================================*/
create table POLICIA (
   ID_POLICIA           int                  not null,
   ID_RANGO             int                  null,
   ID_UNIDAD          int                  null,
   ID_ARMA              int                  null,
   NOMBRES              varchar(50)          not null,
   APELLIDOS            varchar(50)          not null,
   FECHA_NACIMIENTO     varchar(30)          not null,
   FECHA_INGRESO        varchar(30)          not null,
   TIPO_CARGO           varchar(50)          not null,
   constraint PK_POLICIA primary key nonclustered (ID_POLICIA)
)
go

/*Datos Insertados de la tabla POLICIA*/

insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDAD,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(1,1,1,1,'Jose Antonio','Lucas Delgado','05/05/1992','10/06/2014','Generales');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDAD,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(2,2,2,2,'Luis Franco','Mero Anchundia','15/08/1989','20/04/2013','Superiores');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDAD,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(3,3,3,3,'Pedro Luis','Mero Mero','30/12/1985','20/10/2012','Subalternos');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDAD,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(4,4,4,3,'Jose Luis','Mero Mero','10/18/1990','20/10/2016','Superiores');
/*==============================================================*/
/* Table: RANGO                                                 */
/*==============================================================*/
create table RANGO (
   ID_RANGO             int                  not null,
   ANTECEDE             varchar(50)          not null,
   ANO_NECESITA         varchar(30)          not null,
   constraint PK_RANGO primary key nonclustered (ID_RANGO)
)
go

/*Datos Insertados de la tabla RANGO*/

insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (1,'General Superior','6 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (2,'Teniente','4 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (3,'Capitan Policia','2 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (4,'General Inspector','5 Años');


/*==============================================================*/
/* Table: SANCIONES                                             */
/*==============================================================*/
create table SANCION (
   ID_SANCION         int                  not null,
   ID_POLICIA           int                  null,
   TIPO_SANCION         varchar(20)          not null,
   FECHA_SANCION        date             not null,
   constraint PK_SANCIONES primary key nonclustered (ID_SANCION)
)
go

/*Datos Insertados de la tabla SANCIONES*/

insert into SANCION(ID_SANCION,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(1,1,'leve','17/10/2018');
insert into SANCION(ID_SANCION,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(2,2,'muy grave','05/08/2019');
insert into SANCION(ID_SANCION,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(3,3,'grave','05/10/2020');

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
/* Table: UNIDADES                                              */
/*==============================================================*/
create table UNIDAD (
   ID_UNIDAD          int                  not null,
   UNIDAD_ASIGNADA      varchar(50)          not null,
   FECHA_ASIGNADO       date             not null,
   constraint PK_UNIDADES primary key nonclustered (ID_UNIDAD)
)
go

/*Datos Insertados de la tabla UNIDADES*/

insert into UNIDAD(ID_UNIDAD,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (1,'los olivos','17/05/2018');
insert into UNIDAD(ID_UNIDAD,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (2,'los esteros','07/08/2018');
insert into UNIDAD(ID_UNIDAD,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (3,'las orquideas','20/12/2018');
insert into UNIDAD(ID_UNIDAD,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (4,'los ferretos','20/12/2018');

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
create table ENTRENAMIENTO (
    ID_ENTRENAMIENTO     int          not null,
	ID_POLICIA           int          null,
	ID_SANCION           int          null,
	DIA_ENTRENAMIENTO    varchar(10)  not null,
	HORA_INICIO          varchar(10)         not null,  
	HORA_FIN             varchar(10)         not null,
	FECHA_INICIO         varchar(10)  not null,
	FECHA_FIN            date         not null,
	constraint PK_ENTRENAMIENTO primary key nonclustered (ID_ENTRENAMIENTO)
)
go

/*Datos Insertados de la tabla ENTRENAMIENTO*/

insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCION, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO, FECHA_FIN) 
            values (1, 1, 1, 'LUNES', '7:00 a.m', '9:00 a.m', '20/02/2014', '24/05/2014');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCION, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO, FECHA_FIN) 
            values (2, 2, 2, 'MARTES', '7:00 a.m', '9:00 a.m', '11/01/2013', '15/03/2013');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCION, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO, FECHA_FIN) 
            values (3, 3, 3, 'JUEVES', '7:00 a.m', '9:00 a.m', '25/07/2012', '29/09/2012');



alter table ASCENSO
   add constraint FK_ASCENSO_POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table BAJA
   add constraint FK_BAJA_MISION__MISION foreign key (ID_MISION)
      references MISION (ID_MISION)
go

alter table CASTIGO
   add constraint FK_CASTIGO_RANGO_CAS_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
go

alter table MISION
   add constraint FK_MISION_POLICIA_M_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table POLICIA
   add constraint FK_POLICIA_ARMA_POLI_ARMA foreign key (ID_ARMA)
      references ARMA (ID_ARMA)
go

alter table POLICIA
   add constraint FK_POLICIA_RANGO_POL_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
go

alter table POLICIA
   add constraint FK_POLICIA_UNIDAD__UNIDAD foreign key (ID_UNIDAD)
      references UNIDAD (ID_UNIDAD)
go


alter table SANCION
   add constraint FK_SANCION_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

/*1: Indique los hermanos que hay en la base de datos */

select
      POLICIA.NOMBRES,
	  POLICIA.APELLIDOS,
	  RANGO.ANTECEDE
	  from POLICIA INNER JOIN RANGO
	  ON POLICIA.ID_POLICIA = RANGO.ID_RANGO
	  WHERE POLICIA.APELLIDOS='Mero Mero'
	  
	  order by NOMBRES;
	  
	  
/*2: Por cada uno de los rangos policiales que me indique un promedio castigo emitido al año*/

select 
      RANGO.ANTECEDE,
      CASTIGO.FECHA_CASTIGO, 
	  NUMERO_CASTIGOS,
	  AÑO_CASTIGO
	  from CASTIGO,RANGO
	  
	  where RANGO.ANTECEDE= 'Teniente' and AÑO_CASTIGO= '2017'
	        or ANTECEDE = 'General Superior' and AÑO_CASTIGO ='2018'
	        or ANTECEDE = 'Capitan Policia'and AÑO_CASTIGO= '2014'
	        or ANTECEDE = 'General Inspector' and AÑO_CASTIGO = '2016'
	  group by ANTECEDE,NUMERO_CASTIGOS,
	           FECHA_CASTIGO,
			   ID_CASTIGO,
			   AÑO_CASTIGO		   
	  order by FECHA_CASTIGO;

/*3: Que muestre las novedades que se hallan en las misiones*/
 
select 
       POLICIA.NOMBRES,
	   POLICIA.APELLIDOS,
	   MISION.NOVEDADES,
	   MISION.FECHA_MISION,
	   MISION.NUMEROS_NOVEDADES
	   from MISION inner join POLICIA
	   on MISION.ID_MISION = POLICIA.ID_POLICIA
	   order by NOVEDADES,
	            NOMBRES,
				FECHA_MISION,
				NUMEROS_NOVEDADES,
				APELLIDOS;
			
/*4: Mostrar el numero de bajas que se dan en cada mision*/

select 
      MISION.NOVEDADES,
      MISION.BAJAS_POLICIA,
	  MISION.BAJAS_DELINCUENTES,
	  MISION.FECHA_MISION,
	  BAJA.NUMERO_BAJAS_P,
	  BAJA.NUMERO_BAJAS_D,
	  MISION.NUMEROS_NOVEDADES
from MISION inner join BAJA
on MISION.ID_MISION = BAJA.ID_BAJA
where  NOVEDADES = MISION.NOVEDADES
order by BAJAS_POLICIA,
         BAJAS_DELINCUENTES,
		 NUMERO_BAJAS_D,
		 NUMERO_BAJAS_P,
		 FECHA_MISION,
		 MISION.NOVEDADES,
		 NUMEROS_NOVEDADES;
		 
      


