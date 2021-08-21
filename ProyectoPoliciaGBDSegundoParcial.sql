/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     02/08/2021 14:15:56                          */
/*==============================================================*/


drop index ARMA_PK;

drop table ARMA;

drop index POLICIA_ASCENSO_FK;

drop index ASCENSO_PK;

drop table ASCENSO;

drop index MISIONES_BAJAS_FK;

drop index BAJA_PK;

drop table BAJA;

drop index SANCIONES_ENTRENAMIENTO_FK;

drop index POLICIA_ENTRENAMIENTO_FK;

drop index ENTRENAMIENTO_PK;

drop table ENTRENAMIENTO;

drop index POLICIA_MISIONES_FK;

drop index MISION_PK;

drop table MISION;

drop index RANGO_POLICIA_FK;

drop index POLICIA_PK;

drop table POLICIA;

drop index POLICIA_ARMA_FK;

drop index POLICIA_ARMA2_FK;

drop index POLICIA_ARMA_PK;

drop table POLICIA_ARMA;

drop index RANGO_PK;

drop table RANGO;

drop index ASCENSO_SANCIONES_FK;

drop index POLICIA_SANCIONES_FK;

drop index SANCION_PK;

drop table SANCION;

drop index POLICIA_SERVICIO_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

drop index UNIDAD_PK;

drop table UNIDAD;

drop index UNIDAD_POLICIA_FK;

drop index UNIDAD_POLICIA2_FK;

drop index UNIDAD_POLICIA_PK;

drop table UNIDAD_POLICIA;

/*==============================================================*/
/* Table: ARMA                                                  */
/*==============================================================*/
create table ARMA (
   ID_ARMA              INT                 not null,
   CODIGO               VARCHAR(30)          not null,
   CLASE_ARMA           VARCHAR(30)          not null,
   NOMBRE_ARMA          VARCHAR(30)          not null,
   constraint PK_ARMA primary key (ID_ARMA)
);

/*Datos Insertados de la tabla ARMA*/
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 1,'0010','Rifles','Ametralladora');
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 2,'0100','Escopeta','Combate');
insert into ARMA(ID_ARMA,CODIGO,CLASE_ARMA,NOMBRE_ARMA) values( 3,'0200','Pistola','Walther');

/*==============================================================*/
/* Index: ARMA_PK                                               */
/*==============================================================*/
create unique index ARMA_PK on ARMA (
ID_ARMA
);

/*==============================================================*/
/* Table: ASCENSO                                               */
/*==============================================================*/
create table ASCENSO (
   ID_ASCENSO           INT                not null,
   ID_POLICIA           INT                 null,
   NOTA_FISICAS         NUMERIC(6,2)         not null,
   NOTA_TEORICAS        NUMERIC(6,2)         not null,
   NUMERO_VECES         VARCHAR(30)          not null,
   PROMEDIO             VARCHAR(10)          not null,
   CALIFICACION         VARCHAR(10)          not null,
   NUMERO_ASCENSO       VARCHAR(10)          not null,
   FECHA_PRUEBA         DATE                 not null,
   constraint PK_ASCENSO primary key (ID_ASCENSO)
);

/*Datos Insertados de la tabla ASCENSO*/

insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(1,1,9,9,'12/06/2017','3','','B','4');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(2,2,8,5,'10/05/2019','4','','B','2');
insert into ASCENSO(ID_ASCENSO,ID_POLICIA,NOTA_FISICAS,NOTA_TEORICAS,FECHA_PRUEBA,NUMERO_VECES,PROMEDIO,CALIFICACION,NUMERO_ASCENSO)
            values(3,3,8,9,'8/09/2018','3','','B','6');

/*==============================================================*/
/* Index: ASCENSO_PK                                            */
/*==============================================================*/
create unique index ASCENSO_PK on ASCENSO (
ID_ASCENSO
);

/*==============================================================*/
/* Index: POLICIA_ASCENSO_FK                                    */
/*==============================================================*/
create  index POLICIA_ASCENSO_FK on ASCENSO (
ID_POLICIA
);

/*==============================================================*/
/* Table: BAJA                                                  */
/*==============================================================*/
create table BAJA (
   ID_BAJAS             INT                 not null,
   ID_MISIONES          INT                 null,
   NUMERO_BAJAS_P       VARCHAR(10)          not null,
   NUMERO_BAJAS_D       VARCHAR(10)          not null,
   constraint PK_BAJA primary key (ID_BAJAS)
);

/*Datos Insertados de la tabla BAJAS*/
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (1,1,'3','6');
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (2,2,'0','1');
insert into BAJA(ID_BAJAS,ID_MISIONES,NUMERO_BAJAS_P,NUMERO_BAJAS_D) values (3,3,'0','0');

/*==============================================================*/
/* Index: BAJA_PK                                               */
/*==============================================================*/
create unique index BAJA_PK on BAJA (
ID_BAJAS
);

/*==============================================================*/
/* Index: MISIONES_BAJAS_FK                                     */
/*==============================================================*/
create  index MISIONES_BAJAS_FK on BAJA (
ID_MISIONES
);

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
create table ENTRENAMIENTO (
   ID_ENTRENAMIENTO     INT                 not null,
   ID_POLICIA           INT                 null,
   ID_SANCIONES         INT                 null,
   DIA_ENTRENAMIENTO    VARCHAR(10)          null,
   HORA_INICIO          TIME                 null,
   HORA_FIN             TIME                 null,
   FECHA_INICIO         DATE                 null,
   FECHA_FIN            DATE                 null,
   constraint PK_ENTRENAMIENTO primary key (ID_ENTRENAMIENTO)
);

/*Datos Insertados de la tabla ENTRENAMIENTO*/

insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (1, 1, 1, 'LUNES', '7:00 a.m', '9:00 a.m', '04/02/2014','03/05/2014');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (2, 2, 2, 'MARTES', '7:00 a.m', '9:00 a.m', '11/01/2013','10/04/2013');
insert into ENTRENAMIENTO(ID_ENTRENAMIENTO, ID_POLICIA, ID_SANCIONES, DIA_ENTRENAMIENTO, HORA_INICIO, HORA_FIN, FECHA_INICIO,FECHA_FIN) 
            values (3, 3, 3, 'JUEVES', '7:00 a.m', '9:00 a.m', '09-07-2012','11/10/2012');

/*==============================================================*/
/* Index: ENTRENAMIENTO_PK                                      */
/*==============================================================*/
create unique index ENTRENAMIENTO_PK on ENTRENAMIENTO (
ID_ENTRENAMIENTO
);

/*==============================================================*/
/* Index: POLICIA_ENTRENAMIENTO_FK                              */
/*==============================================================*/
create  index POLICIA_ENTRENAMIENTO_FK on ENTRENAMIENTO (
ID_POLICIA
);

/*==============================================================*/
/* Index: SANCIONES_ENTRENAMIENTO_FK                            */
/*==============================================================*/
create  index SANCIONES_ENTRENAMIENTO_FK on ENTRENAMIENTO (
ID_SANCIONES
);

/*==============================================================*/
/* Table: MISION                                                */
/*==============================================================*/
create table MISION (
   ID_MISIONES          INT                 not null,
   ID_POLICIA           INT                 null,
   NOVEDADES            VARCHAR(50)          not null,
   BAJAS_POLICIA        VARCHAR(30)          not null,
   BAJAS_DELINCUENTES   VARCHAR(30)          not null,
   NUMERO_BAJAS_P       VARCHAR(10)          not null,
   NUMERO_BAJAS_D       VARCHAR(10)          not null,
   FECHA_MISION         DATE                 not null,
   NUMERO_NOVEDADES     VARCHAR(10)          not null,
   constraint PK_MISION primary key (ID_MISIONES)
);

/*Datos Insertados de la tabla MISIONES*/

insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(1,1,'Asalto','si','si',6,8,'10-08-2019',3);
insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(2,2,'Manuntencion','no','si',0,3,'09/10/2019',5);
insert into MISION(ID_MISIONES,ID_POLICIA,NOVEDADES,BAJAS_POLICIA,BAJAS_DELINCUENTES,NUMERO_BAJAS_D,NUMERO_BAJAS_P,FECHA_MISION,NUMERO_NOVEDADES) 
            values(3,3,'Retencion Motos','no','no',0,0,'05/04/2020',2);

/*==============================================================*/
/* Index: MISION_PK                                             */
/*==============================================================*/
create unique index MISION_PK on MISION (
ID_MISIONES
);

/*==============================================================*/
/* Index: POLICIA_MISIONES_FK                                   */
/*==============================================================*/
create  index POLICIA_MISIONES_FK on MISION (
ID_POLICIA
);

/*==============================================================*/
/* Table: POLICIA                                               */
/*==============================================================*/
create table POLICIA (
   ID_POLICIA           INT                 not null,
   ID_RANGO             INT                 null,
   NOMBRES              VARCHAR(50)          not null,
   APELLIDOS            VARCHAR(50)          not null,
   FECHA_NACIMIENTO     DATE                 not null,
   FECHA_INGRESO        DATE                 not null,
   TIPO_CARGO           VARCHAR(50)          not null,
   constraint PK_POLICIA primary key (ID_POLICIA)
);

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
/* Index: POLICIA_PK                                            */
/*==============================================================*/
create unique index POLICIA_PK on POLICIA (
ID_POLICIA
);

/*==============================================================*/
/* Index: RANGO_POLICIA_FK                                      */
/*==============================================================*/
create  index RANGO_POLICIA_FK on POLICIA (
ID_RANGO
);

/*==============================================================*/
/* Table: POLICIA_ARMA                                          */
/*==============================================================*/
create table POLICIA_ARMA (
   ID_ARMA              INT                 not null,
   ID_POLICIA           INT                not null,
   constraint PK_POLICIA_ARMA primary key (ID_ARMA, ID_POLICIA)
);

insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(1,1);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(2,2);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(3,3);
insert into POLICIA_ARMA(ID_ARMA,ID_POLICIA)values(1,4);


/*==============================================================*/
/* Index: POLICIA_ARMA_PK                                       */
/*==============================================================*/
create unique index POLICIA_ARMA_PK on POLICIA_ARMA (
ID_ARMA,
ID_POLICIA
);

/*==============================================================*/
/* Index: POLICIA_ARMA2_FK                                      */
/*==============================================================*/
create  index POLICIA_ARMA2_FK on POLICIA_ARMA (
ID_POLICIA
);

/*==============================================================*/
/* Index: POLICIA_ARMA_FK                                       */
/*==============================================================*/
create  index POLICIA_ARMA_FK on POLICIA_ARMA (
ID_ARMA
);

/*==============================================================*/
/* Table: RANGO                                                 */
/*==============================================================*/
create table RANGO (
   ID_RANGO             INT                 not null,
   ANTECEDE             VARCHAR(50)          not null,
   ANO_NECESITA         DATE                 not null,
   constraint PK_RANGO primary key (ID_RANGO)
);

/*Datos Insertados de la tabla RANGO*/

insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (1,'General Superior','6 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (2,'Teniente','4 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (3,'Capitan Policia','2 Años');
insert into RANGO(ID_RANGO,ANTECEDE,ANO_NECESITA)values (4,'General Inspector','5 Años');

/*==============================================================*/
/* Index: RANGO_PK                                              */
/*==============================================================*/
create unique index RANGO_PK on RANGO (
ID_RANGO
);

/*==============================================================*/
/* Table: SANCION                                               */
/*==============================================================*/
create table SANCION (
   ID_SANCIONES         INT                 not null,
   ID_POLICIA           INT                 null,
   ID_ASCENSO           INT                 null,
   TIPO_SANCION         VARCHAR(20)          not null,
   FECHA_SANCION        DATE                 not null,
   NUMERO_SANCIONES     NUMERIC(4,2)         not null,
   ANO_SANCION          DATE                 not null,
   constraint PK_SANCION primary key (ID_SANCIONES)
);

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
/* Index: SANCION_PK                                            */
/*==============================================================*/
create unique index SANCION_PK on SANCION (
ID_SANCIONES
);

/*==============================================================*/
/* Index: POLICIA_SANCIONES_FK                                  */
/*==============================================================*/
create  index POLICIA_SANCIONES_FK on SANCION (
ID_POLICIA
);

/*==============================================================*/
/* Index: ASCENSO_SANCIONES_FK                                  */
/*==============================================================*/
create  index ASCENSO_SANCIONES_FK on SANCION (
ID_ASCENSO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT                 not null,
   ID_POLICIA           INT                 null,
   ACTIVO               VARCHAR(50)          not null,
   PUNTAJE_MINIMO       VARCHAR(50)          not null,
   ANO_PERMANENCIA      VARCHAR(50)          not null,
   COMPONENTE           VARCHAR(50)          not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*Datos Insertados de la tabla SERVICIO*/

insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (1,1,'si','18','4 años','');
insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (2,2,'no','19','4 años','');
insert into SERVICIO(ID_SERVICIO,ID_POLICIA,ACTIVO,PUNTAJE_MINIMO,ANO_PERMANENCIA,COMPONENTE) values (3,3,'si','20','5 años','');

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: POLICIA_SERVICIO_FK                                   */
/*==============================================================*/
create  index POLICIA_SERVICIO_FK on SERVICIO (
ID_POLICIA
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD (
   ID_UNIDADES          INT                 not null,
   UNIDAD_ASIGNADA      VARCHAR(50)          not null,
   FECHA_ASIGNADO       DATE                 not null,
   constraint PK_UNIDAD primary key (ID_UNIDADES)
);

/*Datos Insertados de la tabla UNIDADES*/

insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (1,'los olivos','12/05/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (2,'los esteros','07/08/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (3,'las orquideas','02/12/2018');
insert into UNIDAD(ID_UNIDADES,UNIDAD_ASIGNADA,FECHA_ASIGNADO) values (4,'los ferretos','09/12/2018');

/*==============================================================*/
/* Index: UNIDAD_PK                                             */
/*==============================================================*/
create unique index UNIDAD_PK on UNIDAD (
ID_UNIDADES
);

/*==============================================================*/
/* Table: UNIDAD_POLICIA                                        */
/*==============================================================*/
create table UNIDAD_POLICIA (
   ID_POLICIA           INT                 not null,
   ID_UNIDADES          INT                 not null,
   constraint PK_UNIDAD_POLICIA primary key (ID_POLICIA, ID_UNIDADES)
);

insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(1,1);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(2,2);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(3,3);
insert into UNIDAD_POLICIA(ID_POLICIA,ID_UNIDADES)values(4,4);

/*==============================================================*/
/* Index: UNIDAD_POLICIA_PK                                     */
/*==============================================================*/
create unique index UNIDAD_POLICIA_PK on UNIDAD_POLICIA (
ID_POLICIA,
ID_UNIDADES
);

/*==============================================================*/
/* Index: UNIDAD_POLICIA2_FK                                    */
/*==============================================================*/
create  index UNIDAD_POLICIA2_FK on UNIDAD_POLICIA (
ID_UNIDADES
);

/*==============================================================*/
/* Index: UNIDAD_POLICIA_FK                                     */
/*==============================================================*/
create  index UNIDAD_POLICIA_FK on UNIDAD_POLICIA (
ID_POLICIA
);

alter table ASCENSO
   add constraint FK_ASCENSO_POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table BAJA
   add constraint FK_BAJA_MISIONES__MISION foreign key (ID_MISIONES)
      references MISION (ID_MISIONES)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_POLICIA_E_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_SANCIONES_SANCION foreign key (ID_SANCIONES)
      references SANCION (ID_SANCIONES)
      on delete restrict on update restrict;

alter table MISION
   add constraint FK_MISION_POLICIA_M_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table POLICIA
   add constraint FK_POLICIA_RANGO_POL_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
      on delete restrict on update restrict;

alter table POLICIA_ARMA
   add constraint FK_POLICIA__POLICIA_A_ARMA foreign key (ID_ARMA)
      references ARMA (ID_ARMA)
      on delete restrict on update restrict;

alter table POLICIA_ARMA
   add constraint FK_POLICIA__POLICIA_A_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table SANCION
   add constraint FK_SANCION_ASCENSO_S_ASCENSO foreign key (ID_ASCENSO)
      references ASCENSO (ID_ASCENSO)
      on delete restrict on update restrict;

alter table SANCION
   add constraint FK_SANCION_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_POLICIA_S_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table UNIDAD_POLICIA
   add constraint FK_UNIDAD_P_UNIDAD_PO_POLICIA foreign key (ID_POLICIA)
      references POLICIA (ID_POLICIA)
      on delete restrict on update restrict;

alter table UNIDAD_POLICIA
   add constraint FK_UNIDAD_P_UNIDAD_PO_UNIDAD foreign key (ID_UNIDADES)
      references UNIDAD (ID_UNIDADES)
      on delete restrict on update restrict;



--trigger para evitar el ascenso de un oficial que a tenido mas de 3 sanciones--
create or replace function tr_sancioninsert()
returns trigger as $tr_sancioninsert$
declare
numero_sanciones int;
nsancion int;
begin
select count (*) into numero_sanciones  from sancion where id_policia=new.id_policia;
		 select id_ascenso into nsancion from ascenso ;  select id_policia into nsancion from policia ; 
		 select id_rango into nsancion from rango ;
if(numero_sanciones >= 3) then
   raise exception SQLSTATE 'E0002' using
        message = 'Hey..Este oficial  esta sancionado mas de 3 veces no puede ser ascendido..';
	return false;
end if;
return new;
end;
$tr_sancioninsert$ language plpgsql;
create trigger tr_sancioninsert
before insert or update on policia
for each row
execute procedure tr_sancioninsert();

insert into POLICIA(ID_POLICIA,ID_RANGO,NOMBRES,APELLIDOS,FECHA_NACIMIENTO,FECHA_INGRESO,TIPO_CARGO)
            values(1,1,'Jose Antonio','Lucas Delgado','05/05/1992','10/06/2014','Generales');



-- Cursor que me indique el número de veces que han dado prueba cada policía que muestre todos los policías, el promedio, y el número de ascensos que ha tenido cada policía--
do $$
declare
 ndatos Record;
 promedio int =0;
 /*c_nprueba cursor for select * from "ascenso", "policia" order by "nombres";*/
 c_nprueba cursor for select * from ascenso,policia where 
ascenso.id_ascenso = ascenso.id_policia order by promedio desc;	
begin
for ndatos in c_nprueba loop
fetch c_nprueba into ndatos;
promedio= promedio +  count (ndatos.id_ascenso );
raise notice 'NOMBRES: % , APELLIDOS: % , FECHA_PRUEBA: % , NUMERO_VECES: % , NUMERO_ASCENSO: % , PROMEDIO: %', ndatos.nombres,
ndatos.apellidos,ndatos.fecha_prueba, ndatos.numero_veces, ndatos.numero_ascenso, ndatos.promedio;
end loop;
end $$
language 'plpgsql';


--Procedimiento almacenado que me retorne el sistema un policia y que indique de que unidades ha sido jefe y en qué fecha--
create or replace function unidadpertenece(int)
returns  varchar
as $$
	DECLARE 
		datoingre alias for $1;
		datos RECORD;
		cur_datos  cursor for SELECT 
			unidad.unidad_asignada as unidades, 
		  	unidad_policia.id_policia as id,
			policia.nombres as nombre,
 		    unidad.fecha_asignado as fecha
			FROM unidad 
		  	inner join unidad_policia on unidad_policia.id_unidades = unidad.id_unidades
			inner join policia on policia.id_policia = unidad_policia.id_policia
			WHERE unidad_policia.id_policia=$1
			group by
			unidad.unidad_asignada , 
		  	unidad_policia.id_policia ,
			policia.nombres,
			unidad.fecha_asignado;
begin
	OPEN cur_datos;
		FETCh cur_datos INTO datos;
		RAISE NOTICE 
			'
			POLICIA: % 
			
        ESTE POLICIA HA SIDO JEFE DE LAS SIGUIENTES UNIDADES:
			',
			datos.nombre;
		while (found) loop 
			RAISE NOTICE 
			'
			UNIDAD: %
			FECHA: %
			
			',
			datos.unidades, datos.fecha;
			FETCh cur_datos INTO datos;
		end loop;
END;
$$ LANGUAGE plpgsql;
SELECT unidadpertenece(1)



--Reporte que muestre el número de misiones por cada unidad--
SELECT 
  unidad.unidad_asignada as unidad_asgnada, 
  count(unidad.unidad_asignada) as totalmision
FROM 
  public.unidad, 
  public.unidad_policia, 
  public.policia, 
  public.mision
WHERE 
  unidad_policia.id_unidades = unidad.id_unidades AND
  policia.id_policia = unidad_policia.id_policia AND
  mision.id_policia = policia.id_policia
GROUP BY
 unidad.unidad_asignada
