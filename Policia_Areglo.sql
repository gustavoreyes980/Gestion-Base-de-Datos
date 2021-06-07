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
           where  id = object_id('MISIONES')
            and   type = 'U')
   drop table MISIONES
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
           where  id = object_id('BAJAS')
            and   type = 'U')
   drop table BAJAS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANCIONES')
            and   type = 'U')
   drop table SANCIONES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UNIDADES')
            and   type = 'U')
   drop table UNIDADES
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
create table MISIONES (
   ID_MISIONES          int                  not null,
   ID_POLICIA           int                  null,
   NOVEDADES            varchar(50)          not null,
   BAJAS_POLICIA        varchar(30)          not null,
   BAJAS_DELINCUENTES   varchar(30)          not null,
   NUMERO_BAJAS_P       varchar(10)          not null,
   NUMERO_BAJAS_D       varchar(10)          not null,
   FECHA_MISION         date             not null,
   NUMEROS_NOVEDADES    varchar(10)      not null,
   constraint PK_MISIONES primary key nonclustered (ID_MISIONES)
)
go

/*Datos Insertados de la tabla MISIONES*/

insert into MISIONES(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_P,NUMERO_BAJAS_D,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(1,1,'Asalto','si','si','3','8','17/08/2019','3');
insert into MISIONES(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_P,NUMERO_BAJAS_D,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(2,2,'Manuntencion','no','si','0','2','25/10/2019','5');
insert into MISIONES(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_P,NUMERO_BAJAS_D,FECHA_MISION,NUMEROS_NOVEDADES) 
            values(3,3,'Retencion Motos','no','no','0','0','10/04/2020','2');

/*==============================================================*/
/* Table: Bajas                                             */
/*==============================================================*/
create table BAJAS (
   ID_BAJAS          int                  not null,
   ID_MISIONES          int                  null,
   NUMERO_BAJAS_P       varchar(10)          not null,
   NUMERO_BAJAS_D       varchar(10)          not null,
   constraint PK_BAJAS primary key nonclustered (ID_BAJAS)
)
go

insert into BAJAS(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (1,1,'3','6');
insert into BAJAS(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (2,2,'3','1');
insert into BAJAS(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (3,3,'0','0');



/*==============================================================*/
/* Table: POLICIA                                               */
/*==============================================================*/
create table POLICIA (
   ID_POLICIA           int                  not null,
   ID_RANGO             int                  null,
   ID_UNIDADES          int                  null,
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

insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDADES,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(1,1,1,1,'Jose Antonio','Lucas Delgado','05/05/1992','10/06/2014','Generales');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDADES,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(2,2,2,2,'Luis Franco','Mero Anchundia','15/08/1989','20/04/2013','Superiores');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDADES,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(3,3,3,3,'Pedro Luis','Mero Mero','30/12/1985','20/10/2012','Subalternos');
insert into POLICIA(ID_POLICIA,ID_RANGO,ID_UNIDADES,ID_ARMA,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
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
create table SANCIONES (
   ID_SANCIONES         int                  not null,
   ID_POLICIA           int                  null,
   TIPO_SANCION         varchar(20)          not null,
   FECHA_SANCION        date             not null,
   constraint PK_SANCIONES primary key nonclustered (ID_SANCIONES)
)
go

/*Datos Insertados de la tabla SANCIONES*/

insert into SANCIONES(ID_SANCIONES,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(1,1,'leve','17/10/2018');
insert into SANCIONES(ID_SANCIONES,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(2,2,'muy grvae','05/08/2019');
insert into SANCIONES(ID_SANCIONES,ID_POLICIA,TIPO_SANCION,FECHA_SANCION) values(3,3,'grave','05/10/2020');

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
create table UNIDADES (
   ID_UNIDADES          int                  not null,
   UNIDAD_ASIGNADA      varchar(50)          not null,
   FECHA_ASIGNADO       date             not null,
   constraint PK_UNIDADES primary key nonclustered (ID_UNIDADES)
)
go

/*Datos Insertados de la tabla UNIDADES*/

insert into UNIDADES(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (1,'los olivos','17/05/2018');
insert into UNIDADES(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (2,'los esteros','07/08/2018');
insert into UNIDADES(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (3,'las orquideas','20/12/2018');
insert into UNIDADES(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (4,'los ferretos','20/12/2018');


alter table ASCENSO
   add constraint FK_ASCENSO_POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

alter table BAJAS
   add constraint FK_BAJAS_MISIONES__MISIONES foreign key (ID_MISIONES)
      references MISIONES (ID_MISIONES)
go

alter table CASTIGO
   add constraint FK_CASTIGO_RANGO_CAS_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
go

alter table MISIONES
   add constraint FK_MISIONES_POLICIA_M_POLICIA foreign key (ID_POLICIA)
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
   add constraint FK_POLICIA_UNIDADES__UNIDADES foreign key (ID_UNIDADES)
      references UNIDADES (ID_UNIDADES)
go

alter table SANCIONES
   add constraint FK_SANCIONE_ASCENSO_S_ASCENSO foreign key (ID_ASCENSO)
      references ASCENSO (ID_ASCENSO)
go

alter table SANCIONES
   add constraint FK_SANCIONE_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
go

/*1: Indique el numero de hermanos que hay en la base de datos */

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
	   MISIONES.NOVEDADES,
	   MISIONES.FECHA_MISION,
	   MISIONES.NUMEROS_NOVEDADES
	   from MISIONES inner join POLICIA
	   on MISIONES.ID_MISIONES = POLICIA.ID_POLICIA
	   order by NOVEDADES,
	            NOMBRES,
				FECHA_MISION,
				NUMEROS_NOVEDADES,
				APELLIDOS;
			
/*El numero de bajas en cada mision ejemplo: Asalto*/

select 
      MISIONES.NOVEDADES,
      MISIONES.BAJAS_POLICIA,
	  MISIONES.BAJAS_DELINCUENTES,
	  MISIONES.FECHA_MISION,
	  BAJAS.NUMERO_BAJAS_P,
	  BAJAS.NUMERO_BAJAS_D
from MISIONES inner join BAJAS
on MISIONES.ID_MISIONES = BAJAS.ID_BAJAS
where  NOVEDADES = 'Asalto'
order by BAJAS_POLICIA,
         BAJAS_DELINCUENTES,
		 NUMERO_BAJAS_D,
		 NUMERO_BAJAS_P,
		 FECHA_MISION;
		 
	
