-- Tabla areabusvis
--drop table areabusvis
go
--
CREATE TABLE areabusvis
(
    idareabusvis      VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    descripcion       VARCHAR(150) not null,
    codigo            VARCHAR(36)  not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);
--drop table categoriadescuento
go
-- Tabla categoriadescuento
CREATE TABLE categoriadescuento
(
    idcategoriadescuento VARCHAR(36) PRIMARY KEY,
    iddatabase           varchar(25) not null,
    idempresa            char(3)     not null,
    descripcion          VARCHAR(150),
    usuariocreacion      varchar(25) not null,
    fechacreacion        datetime2(0) default getdate(),
    usuarioalteracion    varchar(25)  default NULL,
    fechaalteracion      datetime2(0) default NULL,
    activo               TINYINT      default 1
);
--drop table bonodescuento
go
-- Tabla bonodescuento
CREATE TABLE bonodescuento
(
    idbonodescuento      VARCHAR(36) PRIMARY KEY,
    iddatabase           varchar(25)  not null,
    idempresa            char(3)      not null,
    idcategoriadescuento VARCHAR(36)  not null,
    descripcion          VARCHAR(150) not null,
    bonodescuentotipo    VARCHAR(250) not null,
    idtipoobjetivo       TINYINT      not null,
    usuariocreacion      varchar(25)  not null,
    fechacreacion        datetime2(0) default getdate(),
    usuarioalteracion    varchar(25)  default NULL,
    fechaalteracion      datetime2(0) default NULL,
    activo               TINYINT      default 1,
    CONSTRAINT FK_bonodescuento_categoriadescuento FOREIGN KEY (idcategoriadescuento) REFERENCES categoriadescuento (idcategoriadescuento)
);
--drop table motivobonoproveedor
go
-- Tabla motivobonoproveedor
CREATE TABLE motivobonoproveedor
(
    idmotivobonoproveedor VARCHAR(36) PRIMARY KEY,
    iddatabase            varchar(25) not null,
    idempresa             char(3)     not null,
    descripcion           VARCHAR(150),
    usuariocreacion       varchar(25) not null,
    fechacreacion         datetime2(0) default getdate(),
    usuarioalteracion     varchar(25)  default NULL,
    fechaalteracion       datetime2(0) default NULL,
    activo                TINYINT      default 1
);
--drop table categoriabusvis
go
-- Tabla categoriabusvis
CREATE TABLE categoriabusvis
(
    idcategoriabusvis VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    codigo            VARCHAR(36),
    descripcion       VARCHAR(150),
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);

-- Tabla coscenterbusvis
-- CREATE TABLE coscenterbusvis (
--     idcoscenterbusvis VARCHAR(36) PRIMARY KEY,
--     idempresa VARCHAR(36),
--     codigo VARCHAR(36),
--     descripcion VARCHAR(150),
--     activo TINYINT
-- );
--drop table proveedor
go
-- Tabla proveedor
CREATE TABLE proveedor
(
    idproveedor       VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    idtipoproveedor   VARCHAR(36)  not null,
    ruc               VARCHAR(36)  not null,
    razonsocial       VARCHAR(150) not null,
    nombrecomercial   VARCHAR(150) not null,
    contacto          VARCHAR(150),
    telefono          VARCHAR(36),
    codigosap         VARCHAR(36),
    direccion         VARCHAR(150),
    urlfotocontrato   VARCHAR(MAX) not null,
    listacorreos      VARCHAR(150),
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);

-- Tabla conductorbusvis
-- CREATE TABLE conductorbusvis (
--     idconductorbusvis VARCHAR(36) PRIMARY KEY,
--     idproveedor VARCHAR(36),
--     idtrabajador VARCHAR(36),
--     appaterno VARCHAR(150),
--     apmaterno VARCHAR(150),
--     nombres VARCHAR(150),
--     nombresall VARCHAR(150),
--     idcategorialicencia VARCHAR(36),
--     nrolicencia VARCHAR(36),
--     fecharevalidacionlicencia DATE,
--     fechavalicacioninduccionsigma DATE,
--     fechasctr DATE,
--     telefono VARCHAR(36),
--     idcondiccion VARCHAR(36),
--     urlfotolicencia VARCHAR(MAX),
--     urlfotosctr VARCHAR(MAX),
--     activo TINYINT,
--     CONSTRAINT FK_conductorbusvis_proveedor FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor)
-- );
--drop table correo
go
-- Tabla correobusvis
CREATE TABLE correo
(
    idcorreo          VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    idtipocorreo      VARCHAR(36)  not null,
    idcultivo         VARCHAR(36)  default null,
    correo            VARCHAR(250) not null,
    idmodo            VARCHAR(36)  not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);
--drop table garitasbusvis
go
-- Tabla garitasbusvis
CREATE TABLE garitasbusvis
(
    idgaritasbusvis   VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    idfundo           VARCHAR(36)  not null,
    descripcion       VARCHAR(150) not null,
    idcultivo         VARCHAR(36)  not null,
    latitud           FLOAT        not null,
    longitud          FLOAT        not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1,
);