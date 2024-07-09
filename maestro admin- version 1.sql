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
--drop table kilometraje
go
-- Tabla kilometraje
CREATE TABLE kilometraje
(
    idkilometraje     VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)    not null,
    idempresa         char(3)        not null,
    idtipokilometraje VARCHAR(36)    not null,
    km                INT            not null,
    costokm           decimal(10, 2) not null,
    usuariocreacion   varchar(25)    not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);
--drop table kminternos
go
-- Tabla kminternos
CREATE TABLE kminternos
(
    idkminternos      VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    ubicacion         VARCHAR(150) not null,
    km                INT          default 0,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);
--drop table motivobusvis
go
-- Tabla motivobusvis
CREATE TABLE motivobusvis
(
    idmotivobusvis    VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    descripcion       VARCHAR(150) not null,
    idtipovehiculo    VARCHAR(25)  not null,
    monto             DECIMAL(10, 2) default 0,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0)   default getdate(),
    usuarioalteracion varchar(25)    default NULL,
    fechaalteracion   datetime2(0)   default NULL,
    activo            TINYINT        default 1,
    CONSTRAINT FK_motivobusvis_tipovehiculo FOREIGN KEY (idtipovehiculo) REFERENCES tipovehiculo (idtipovehiculo),
);
drop table paraderosexternos

go
-- Tabla paraderosexternos
CREATE TABLE paraderosexternos
(
    idparaderosexternos VARCHAR(36) PRIMARY KEY,
    iddatabase          varchar(25)  not null,
    idempresa           char(3)      not null,
    paredero            VARCHAR(250) not null,
    centropoblado       VARCHAR(250) not null,
    iddistrito          VARCHAR(50)  not null,
    latitud             FLOAT        not null,
    longitud            FLOAT        not null,
    usuariocreacion     varchar(25)  not null,
    fechacreacion       datetime2(0) default getdate(),
    usuarioalteracion   varchar(25)  default NULL,
    fechaalteracion     datetime2(0) default NULL,
    activo              TINYINT      default 1,
    CONSTRAINT FK_paraderosexternos_iddistrito FOREIGN KEY (iddistrito) REFERENCES distrito (iddistrito),
);
--drop table paraderosinternos
go
-- Tabla paraderosinternos
CREATE TABLE paraderosinternos
(
    idparaderosinternos VARCHAR(36) PRIMARY KEY,
    iddatabase          varchar(25)  not null,
    idempresa           char(3)      not null,
    idfundo             VARCHAR(25)  not null,
    idetapa             VARCHAR(36)  not null,
    idcampo             VARCHAR(36)  not null,
    paradero            VARCHAR(150) not null,
    comedor             VARCHAR(250) not null,
    usuariocreacion     varchar(25)  not null,
    fechacreacion       datetime2(0) default getdate(),
    usuarioalteracion   varchar(25)  default NULL,
    fechaalteracion     datetime2(0) default NULL,
    activo              TINYINT      default 1,
    CONSTRAINT FK_paraderosinternos_idfundo FOREIGN KEY (idfundo) REFERENCES fundo (idfundo),

);

CREATE TABLE ubicacion
(
    idubicacion       VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    descripcion       VARCHAR(250) not null,
    referencia        VARCHAR(250) not null,
    latitud           FLOAT        not null,
    longitud          FLOAT        not null,
    iddistrito        VARCHAR(50)  not null,
    zona              VARCHAR(250) not null,
    subzona           VARCHAR(250) not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1,
    CONSTRAINT FK_ubicacion_iddistrito FOREIGN KEY (iddistrito) REFERENCES distrito (iddistrito),
);
CREATE TABLE ruta
(
    idruta            VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    idzonapreferencia VARCHAR(36) not null,
    idorigen          VARCHAR(36) not null,
    iddestino         VARCHAR(36) not null,
    coordenadas       VARCHAR(max) default NULL,
    recorridokm       float       not null,
    duracion          int         not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1,
    CONSTRAINT FK_ubicacion_idorigen FOREIGN KEY (idorigen) REFERENCES ubicacion (idubicacion),
    CONSTRAINT FK_ubicacion_iddestino FOREIGN KEY (iddestino) REFERENCES ubicacion (idubicacion),
);
--drop table rutasacceso
go
-- Tabla rutasaccesobusvis
CREATE TABLE rutasacceso
(
    idrutasacceso     VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    descripcion       VARCHAR(150) not null,
    latitud           FLOAT        not null,
    longitud          FLOAT        not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1
);
--drop table semanas
go
-- Tabla semanasbusvis
CREATE TABLE semanas
(
    idsemanas         VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    anio              INT          not null,
    mes               VARCHAR(150) not null,
    semana            INT          not null,
    fechainicio       DATE         not null,
    fechafin          DATE         not null,
    activo            TINYINT      default 1
);
--drop table tarifa
go

--drop table tipoviaje
go
-- Tabla tipoviajebusvis
CREATE TABLE tipoviaje
(
    idtipoviaje       VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    descripcion       VARCHAR(150),
    activo            TINYINT      default 1
);
-- --drop table turno
-- go
-- -- Tabla turnobusvis
-- CREATE TABLE turno
-- (
--     iddatabase        varchar(25) not null,
--     idempresa         char(3)     not null,
--     usuariocreacion   varchar(25) not null,
--     fechacreacion     datetime2(0) default getdate(),
--     usuarioalteracion varchar(25)  default NULL,
--     fechaalteracion   datetime2(0) default NULL,
--     idturno           VARCHAR(36) PRIMARY KEY,
--     idtipo            VARCHAR(36),
--     horaingreso       TIME,
--     horasalida        TIME,
--     activo            TINYINT      default 1
-- );
--drop table ubicacion
go
-- Tabla ubicacion


-- Tabla ubigeobusvis
-- CREATE TABLE ubigeobusvis
-- (
--     idubigeobusvis    VARCHAR(36) PRIMARY KEY,
--     iddatabase        varchar(25) not null,
--     idempresa         char(3)     not null,
--     usuariocreacion   varchar(25) not null,
--     fechacreacion     datetime2(0) default getdate(),
--     usuarioalteracion varchar(25)  default NULL,
--     fechaalteracion   datetime2(0) default NULL,
--     codigo            VARCHAR(150),
--     descripcion       VARCHAR(150),
--     activo            TINYINT      default 1
-- );
--drop table tiposervicio
go
-- Tabla tiposervicio
CREATE TABLE tiposervicio
(
    idtiposervicio    VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    descripcion       VARCHAR(150),
    idtipoviaje       VARCHAR(36),
    mensaje           VARCHAR(150),
    activo            TINYINT      default 1
        CONSTRAINT FK_tiposervicio_tipoviajebusvis FOREIGN KEY (idtipoviaje) REFERENCES tipoviaje (idtipoviaje)
);

-- Tabla croquisvehiculo
CREATE TABLE croquisvehiculo
(
    idcroquisvehiculo VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    descripcion       VARCHAR(150),
    numpisos          VARCHAR(150),
    idtiponumeracion  VARCHAR(36),
    activo            TINYINT      default 1
);
--drop table pisovehiculo
go
-- Tabla pisovehiculo

CREATE TABLE pisovehiculo
(
    idpisovehiculo    VARCHAR(36) PRIMARY KEY,
    idcroquisvehiculo VARCHAR(36),
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    columnas          INT,
    filas             INT,
    poslibres         VARCHAR(150),
    posbloqueados     VARCHAR(150),
    conductores       VARCHAR(150),
    asientos          INT,
    activo            TINYINT      default 1
        CONSTRAINT FK_pisovehiculo_croquisvehiculo FOREIGN KEY (idcroquisvehiculo) REFERENCES croquisvehiculo (idcroquisvehiculo)
);
--drop table vehiculobusvis
go
-- Tabla vehiculobusvis
CREATE TABLE vehiculobusvis
(
    idvehiculobusvis        VARCHAR(36) PRIMARY KEY,
    iddatabase              varchar(25) not null,
    idempresa               char(3)     not null,
    usuariocreacion         varchar(25) not null,
    fechacreacion           datetime2(0) default getdate(),
    usuarioalteracion       varchar(25)  default NULL,
    fechaalteracion         datetime2(0) default NULL,
    placa                   VARCHAR(150),
    idtipovehiculo          VARCHAR(25),
    anio                    INT,
    capacidadtotal          INT,
    color                   VARCHAR(150),
    modelo                  VARCHAR(150),
    gps                     VARCHAR(150),
    idtipoproveedor         VARCHAR(36),
    idproveedor             VARCHAR(36),
    rc                      VARCHAR(150),
    rcfechavencimiento      VARCHAR(150),
    urlfotorc               VARCHAR(MAX),
    idcondicion             VARCHAR(36),
    utlfotounidad           VARCHAR(MAX),
    urlfototarjetapropiedad VARCHAR(MAX),
    activo                  TINYINT      default 1,
    CONSTRAINT FK_vehiculobusvis_tipovehiculo FOREIGN KEY (idtipovehiculo) REFERENCES tipovehiculo (idtipovehiculo),
);


--drop table revisiontecnica
go
-- Tabla revisiontecnica
CREATE TABLE revisiontecnica
(
    idrevisiontecnica           VARCHAR(36) PRIMARY KEY,
    iddatabase                  varchar(25) not null,
    idempresa                   char(3)     not null,
    idvehiculobusvis            VARCHAR(36) not null,
    usuariocreacion             varchar(25) not null,
    fechacreacion               datetime2(0) default getdate(),
    usuarioalteracion           varchar(25)  default NULL,
    fechaalteracion             datetime2(0) default NULL,
    fechavencimientoinsptaller  DATE,
    fechavencimientorevisiontec DATE,
    urlfotorevisiontecnica      VARCHAR(MAX),
    activo                      TINYINT      default 1,
    CONSTRAINT FK_revisiontecnica_idvehiculobusvis FOREIGN KEY (idvehiculobusvis) REFERENCES vehiculobusvis (idvehiculobusvis),
);
--drop table tarjetacirculacion
go
-- Tabla tarjetacirculacion
CREATE TABLE tarjetacirculacion
(
    idtarjetacirculacion VARCHAR(36) PRIMARY KEY,
    iddatabase           varchar(25) not null,
    idempresa            char(3)     not null,
    idvehiculobusvis     VARCHAR(36) not null,
    usuariocreacion      varchar(25) not null,
    fechacreacion        datetime2(0) default getdate(),
    usuarioalteracion    varchar(25)  default NULL,
    fechaalteracion      datetime2(0) default NULL,
    fecha                DATE,
    urlfoto              VARCHAR(MAX),
    activo               TINYINT      default 1,
    CONSTRAINT FK_tarjetacirculacion_idvehiculobusvis FOREIGN KEY (idvehiculobusvis) REFERENCES vehiculobusvis (idvehiculobusvis),

);
--drop table propietariovehiculo
go
-- Tabla propietariovehiculo
CREATE TABLE propietariovehiculo
(
    idpropietariovehiculo     VARCHAR(36) PRIMARY KEY,
    iddatabase                varchar(25) not null,
    idempresa                 char(3)     not null,
    idvehiculobusvis     VARCHAR(36) not null,
    usuariocreacion           varchar(25) not null,
    fechacreacion             datetime2(0) default getdate(),
    usuarioalteracion         varchar(25)  default NULL,
    fechaalteracion           datetime2(0) default NULL,
    propietario               VARCHAR(150),
    dniruc                    VARCHAR(150),
    propietarioadicional      VARCHAR(150),
    dnirucadicional           VARCHAR(150),
    urlfotoboletininformativo VARCHAR(MAX),
    activo                    TINYINT      default 1,
    CONSTRAINT FK_propietariovehiculo_idvehiculobusvis FOREIGN KEY (idvehiculobusvis) REFERENCES vehiculobusvis (idvehiculobusvis),

);
--drop table croquisvehiculo
go
--drop table soat
go
-- Tabla soat
CREATE TABLE soat
(
    idsoat            VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    idvehiculobusvis     VARCHAR(36) not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    fechavencimiento  DATE,
    urlfotosoat       VARCHAR(MAX),
    activo            TINYINT,
    CONSTRAINT FK_soat_idvehiculobusvis FOREIGN KEY (idvehiculobusvis) REFERENCES vehiculobusvis (idvehiculobusvis),

);
--drop table ruta
go


-- Tabla tarifabusvis NO ESTA CREADA !!!!!!!!!!!!!
CREATE TABLE tarifa
(

    idtarifa          VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idtipotarifa      VARCHAR(36),
    idtipovehiculo    VARCHAR(36),
    alias             VARCHAR(150),
    idorigen          VARCHAR(36),
    idorigenadicional VARCHAR(36),
    destino           VARCHAR(150),
    paradero          VARCHAR(150),
    idrutaacceso      VARCHAR(36),
    garitaingreso     VARCHAR(150),
    kminterno         VARCHAR(150),
    kmexterno         VARCHAR(150),
    kmtotal           VARCHAR(150),
    motivo            VARCHAR(150),
    motivomonto       VARCHAR(150),
    motivoruta        VARCHAR(150),
    motivototal       VARCHAR(150),
    comentarios       VARCHAR(150),
    capacidad         INT,
    idavuelta         TINYINT,
    automatico        TINYINT,
    activo            TINYINT      default 1,
    CONSTRAINT FK_tarifa_idorigen FOREIGN KEY (idorigen) REFERENCES ubicacion (idubicacion),
);