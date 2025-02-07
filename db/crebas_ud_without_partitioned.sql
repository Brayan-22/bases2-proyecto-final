/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2/02/2025 2:07:06 a. m.                      */
/*==============================================================*/


drop index pregrado_asignatura_FK;

drop index Asignatura_PK;

drop table Asignatura;

drop index Clasificacion_PK;

drop table Clasificacion;

drop index pregrado_estudiante_FK;

drop index Estudiante_PK;

drop table Estudiante;

drop index asignatura_grupo_FK;

drop index Grupo_PK;

drop table Grupo;

drop index sede_profesor_FK;

drop index Pregrado_PK;

drop table Pregrado;

drop index profesor_clasificacion_FK;

drop index Profesor_PK;

drop table Profesor;

drop index estudiante_grupo_FK;

drop index estudiante_grupo2_FK;

drop index calificacion_PK;

drop table calificacion;

drop index grupo_profesor_FK;

drop index grupo_profesor2_FK;

drop index dictar_PK;

drop table dictar;

drop index nomina_PK;

drop table nomina;

drop index nomina_profesor_FK;

drop index nomina_profesor2_FK;

drop index nomina_detalle_PK;

drop table nomina_detalle;

drop index sede_PK;

drop table sede;

/*==============================================================*/
/* Table: Asignatura                                            */
/*==============================================================*/
create table Asignatura (
   cod_asignatura       INT8                 not null,
   cod_pregrado         INT4                 not null,
   nombre_asignatura    VARCHAR(32)          not null,
   horas_sem:asignatura INT2                 not null,
   estud_max_asignatura INT2                 not null,
   semestre_asignatura  INT2                 not null,
   constraint PK_ASIGNATURA primary key (cod_asignatura)
);

/*==============================================================*/
/* Index: Asignatura_PK                                         */
/*==============================================================*/
create unique index Asignatura_PK on Asignatura (
cod_asignatura
);

/*==============================================================*/
/* Index: pregrado_asignatura_FK                                */
/*==============================================================*/
create  index pregrado_asignatura_FK on Asignatura (
cod_pregrado
);

/*==============================================================*/
/* Table: Clasificacion                                         */
/*==============================================================*/
create table Clasificacion (
   nom_clasificacion    VARCHAR(32)          not null,
   max_horas_clas       INT2                 not null,
   sueldo_clasificacion NUMERIC(10,2)        not null,
   constraint PK_CLASIFICACION primary key (nom_clasificacion)
);

/*==============================================================*/
/* Index: Clasificacion_PK                                      */
/*==============================================================*/
create unique index Clasificacion_PK on Clasificacion (
nom_clasificacion
);

/*==============================================================*/
/* Table: Estudiante                                            */
/*==============================================================*/
create table Estudiante (
   cod_estudiante       VARCHAR(10)          not null,
   cod_pregrado         INT4                 not null,
   num_document         VARCHAR(10)          not null,
   nombres_estudiante   VARCHAR(32)          not null,
   apellidos_estudiante VARCHAR(32)          not null,
   telefono_estudiante  VARCHAR(10)          not null,
   correo_estudianti    VARCHAR(64)          not null,
   correo_personal_estudiante VARCHAR(64)          not null,
   constraint PK_ESTUDIANTE primary key (cod_estudiante)
);

/*==============================================================*/
/* Index: Estudiante_PK                                         */
/*==============================================================*/
create unique index Estudiante_PK on Estudiante (
cod_estudiante
);

/*==============================================================*/
/* Index: pregrado_estudiante_FK                                */
/*==============================================================*/
create  index pregrado_estudiante_FK on Estudiante (
cod_pregrado
);

/*==============================================================*/
/* Table: Grupo                                                 */
/*==============================================================*/
create table Grupo (
   cod_grupo            VARCHAR(10)          not null,
   periodo_grupo        VARCHAR(10)          not null,
   cod_asignatura       INT8                 not null,
   constraint PK_GRUPO primary key (cod_grupo, periodo_grupo)
);

/*==============================================================*/
/* Index: Grupo_PK                                              */
/*==============================================================*/
create unique index Grupo_PK on Grupo (
cod_grupo,
periodo_grupo
);

/*==============================================================*/
/* Index: asignatura_grupo_FK                                   */
/*==============================================================*/
create  index asignatura_grupo_FK on Grupo (
cod_asignatura
);

/*==============================================================*/
/* Table: Pregrado                                              */
/*==============================================================*/
create table Pregrado (
   cod_pregrado         INT4                 not null,
   nom_sede             VARCHAR(24)          not null,
   nombre_pregrado      VARCHAR(32)          not null,
   creditos_pregrado    INT2                 not null,
   nota_minima          NUMERIC(3,2)         not null,
   correo_pregrado      VARCHAR(64)          not null,
   constraint PK_PREGRADO primary key (cod_pregrado)
);

/*==============================================================*/
/* Index: Pregrado_PK                                           */
/*==============================================================*/
create unique index Pregrado_PK on Pregrado (
cod_pregrado
);

/*==============================================================*/
/* Index: sede_profesor_FK                                      */
/*==============================================================*/
create  index sede_profesor_FK on Pregrado (
nom_sede
);

/*==============================================================*/
/* Table: Profesor                                              */
/*==============================================================*/
create table Profesor (
   doc_profesor         VARCHAR(10)          not null,
   nom_clasificacion    VARCHAR(32)          not null,
   nombre_profesor      VARCHAR(32)          not null,
   apellido_profesor    VARCHAR(32)          not null,
   direccion_profesor   VARCHAR(32)          not null,
   telefono_profesor    VARCHAR(10)          not null,
   correo_profesor      VARCHAR(64)          not null,
   correo_personal      VARCHAR(64)          not null,
   constraint PK_PROFESOR primary key (doc_profesor)
);

/*==============================================================*/
/* Index: Profesor_PK                                           */
/*==============================================================*/
create unique index Profesor_PK on Profesor (
doc_profesor
);

/*==============================================================*/
/* Index: profesor_clasificacion_FK                             */
/*==============================================================*/
create  index profesor_clasificacion_FK on Profesor (
nom_clasificacion
);

/*==============================================================*/
/* Table: calificacion                                          */
/*==============================================================*/
create table calificacion (
   cod_grupo            VARCHAR(10)          not null,
   periodo_grupo        VARCHAR(10)          not null,
   cod_estudiante       VARCHAR(10)          not null,
   nota                 NUMERIC(3,2)         not null,
   constraint PK_CALIFICACION primary key (cod_grupo, periodo_grupo, cod_estudiante)
);

/*==============================================================*/
/* Index: calificacion_PK                                       */
/*==============================================================*/
create unique index calificacion_PK on calificacion (
cod_grupo,
periodo_grupo,
cod_estudiante
);

/*==============================================================*/
/* Index: estudiante_grupo2_FK                                  */
/*==============================================================*/
create  index estudiante_grupo2_FK on calificacion (
cod_estudiante
);

/*==============================================================*/
/* Index: estudiante_grupo_FK                                   */
/*==============================================================*/
create  index estudiante_grupo_FK on calificacion (
cod_grupo,
periodo_grupo
);

/*==============================================================*/
/* Table: dictar                                                */
/*==============================================================*/
create table dictar (
   doc_profesor         VARCHAR(10)          not null,
   cod_grupo            VARCHAR(10)          not null,
   periodo_grupo        VARCHAR(10)          not null,
   horas_sem_dictar     INT2                 not null,
   constraint PK_DICTAR primary key (doc_profesor, cod_grupo, periodo_grupo)
);

/*==============================================================*/
/* Index: dictar_PK                                             */
/*==============================================================*/
create unique index dictar_PK on dictar (
doc_profesor,
cod_grupo,
periodo_grupo
);

/*==============================================================*/
/* Index: grupo_profesor2_FK                                    */
/*==============================================================*/
create  index grupo_profesor2_FK on dictar (
cod_grupo,
periodo_grupo
);

/*==============================================================*/
/* Index: grupo_profesor_FK                                     */
/*==============================================================*/
create  index grupo_profesor_FK on dictar (
doc_profesor
);

/*==============================================================*/
/* Table: nomina                                                */
/*==============================================================*/
create table nomina (
   id_nomina            VARCHAR(32)          not null,
   fecha_inicio         DATE                 not null,
   fecha_fin            DATE                 not null,
   estado               VARCHAR(32)          not null,
   constraint PK_NOMINA primary key (id_nomina)
);

/*==============================================================*/
/* Index: nomina_PK                                             */
/*==============================================================*/
create unique index nomina_PK on nomina (
id_nomina
);

/*==============================================================*/
/* Table: nomina_detalle                                        */
/*==============================================================*/
create table nomina_detalle (
   doc_profesor         VARCHAR(10)          not null,
   id_nomina            VARCHAR(32)          not null,
   pago                 NUMERIC(10,2)        not null,
   constraint PK_NOMINA_DETALLE primary key (doc_profesor, id_nomina)
);

/*==============================================================*/
/* Index: nomina_detalle_PK                                     */
/*==============================================================*/
create unique index nomina_detalle_PK on nomina_detalle (
doc_profesor,
id_nomina
);

/*==============================================================*/
/* Index: nomina_profesor2_FK                                   */
/*==============================================================*/
create  index nomina_profesor2_FK on nomina_detalle (
id_nomina
);

/*==============================================================*/
/* Index: nomina_profesor_FK                                    */
/*==============================================================*/
create  index nomina_profesor_FK on nomina_detalle (
doc_profesor
);

/*==============================================================*/
/* Table: sede                                                  */
/*==============================================================*/
create table sede (
   nom_sede             VARCHAR(24)          not null,
   direccion_sede       VARCHAR(32)          not null,
   correo_sede          VARCHAR(64)          not null,
   constraint PK_SEDE primary key (nom_sede)
);

/*==============================================================*/
/* Index: sede_PK                                               */
/*==============================================================*/
create unique index sede_PK on sede (
nom_sede
);

alter table Asignatura
   add constraint FK_ASIGNATU_PREGRADO__PREGRADO foreign key (cod_pregrado)
      references Pregrado (cod_pregrado)
      on delete restrict on update restrict;

alter table Estudiante
   add constraint FK_ESTUDIAN_PREGRADO__PREGRADO foreign key (cod_pregrado)
      references Pregrado (cod_pregrado)
      on delete restrict on update restrict;

alter table Grupo
   add constraint FK_GRUPO_ASIGNATUR_ASIGNATU foreign key (cod_asignatura)
      references Asignatura (cod_asignatura)
      on delete restrict on update restrict;

alter table Pregrado
   add constraint FK_PREGRADO_SEDE_PROF_SEDE foreign key (nom_sede)
      references sede (nom_sede)
      on delete restrict on update restrict;

alter table Profesor
   add constraint FK_PROFESOR_PROFESOR__CLASIFIC foreign key (nom_clasificacion)
      references Clasificacion (nom_clasificacion)
      on delete restrict on update restrict;

alter table calificacion
   add constraint FK_CALIFICA_ESTUDIANT_GRUPO foreign key (cod_grupo, periodo_grupo)
      references Grupo (cod_grupo, periodo_grupo)
      on delete restrict on update restrict;

alter table calificacion
   add constraint FK_CALIFICA_ESTUDIANT_ESTUDIAN foreign key (cod_estudiante)
      references Estudiante (cod_estudiante)
      on delete restrict on update restrict;

alter table dictar
   add constraint FK_DICTAR_GRUPO_PRO_PROFESOR foreign key (doc_profesor)
      references Profesor (doc_profesor)
      on delete restrict on update restrict;

alter table dictar
   add constraint FK_DICTAR_GRUPO_PRO_GRUPO foreign key (cod_grupo, periodo_grupo)
      references Grupo (cod_grupo, periodo_grupo)
      on delete restrict on update restrict;

alter table nomina_detalle
   add constraint FK_NOMINA_D_NOMINA_PR_PROFESOR foreign key (doc_profesor)
      references Profesor (doc_profesor)
      on delete restrict on update restrict;

alter table nomina_detalle
   add constraint FK_NOMINA_D_NOMINA_PR_NOMINA foreign key (id_nomina)
      references nomina (id_nomina)
      on delete restrict on update restrict;

