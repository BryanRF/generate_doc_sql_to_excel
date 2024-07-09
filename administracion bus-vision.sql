-- Tabla areabusvis
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
    activo            TINYINT      default 1
);

-- Tabla bonodescuento
CREATE TABLE bonodescuento
(
    idbonodescuento      VARCHAR(36) PRIMARY KEY,
    iddatabase           varchar(25) not null,
    idempresa            char(3)     not null,
    idcategoriadescuento VARCHAR(36),
    descripcion          VARCHAR(150),
    idbonodescuentotipo  VARCHAR(36),
    idtipoobjetivo       TINYINT,
    usuariocreacion      varchar(25) not null,
    fechacreacion        datetime2(0) default getdate(),
    usuarioalteracion    varchar(25)  default NULL,
    fechaalteracion      datetime2(0) default NULL,
    activo            TINYINT      default 1,
    CONSTRAINT FK_bonodescuento_categoriadescuento FOREIGN KEY (idcategoriadescuento) REFERENCES categoriadescuento (idcategoriadescuento)
);

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
    activo            TINYINT      default 1
);

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

-- Tabla proveedor
CREATE TABLE proveedor
(
    idproveedor       VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    idtipoproveedor   VARCHAR(36),
    ruc               VARCHAR(36),
    razonsocial       VARCHAR(150),
    nombrecomercial   VARCHAR(150),
    contacto          VARCHAR(150),
    telefono          VARCHAR(36),
    codigosap         VARCHAR(36),
    direccion         VARCHAR(150),
    urlfotocontrato   VARCHAR(MAX),
    listacorreos      VARCHAR(150),
    usuariocreacion   varchar(25) not null,
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

-- Tabla correobusvis
CREATE TABLE correo
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    idcorreo          VARCHAR(36) PRIMARY KEY,
    idtipocorreo      VARCHAR(36),
    idcultivo         VARCHAR(36),
    correo            VARCHAR(150),
    idmodo            VARCHAR(36),
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
   activo            TINYINT      default 1
);

-- Tabla garitasbusvis
CREATE TABLE garitasbusvis
(
    iddatabase        varchar(25)  not null,
    idempresa         char(3)      not null,
    idgaritasbusvis   VARCHAR(36) PRIMARY KEY,
    idfundo           VARCHAR(36)  not null,
    descripcion       VARCHAR(150) not null,
    idcultivo         VARCHAR(36)  not null,
    latitud           VARCHAR(36)  not null,
    longitud          VARCHAR(36)  not null,
    usuariocreacion   varchar(25)  not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    activo            TINYINT      default 1,
);

-- Tabla kilometraje
CREATE TABLE kilometraje
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idkilometraje     VARCHAR(36) PRIMARY KEY,
    idtipokilometraje VARCHAR(36),
    km                INT         not null,
    costokm           FLOAT       not null,

    activo            TINYINT      default 1
);

-- Tabla kminternos
CREATE TABLE kminternos
(
    idkminternos      VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    ubicacion         VARCHAR(150),
    km                INT,
   activo            TINYINT      default 1
);

-- Tabla motivobusvis
CREATE TABLE motivobusvis
(
    idmotivobusvis    VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    descripcion       VARCHAR(150),
    idtipobus         VARCHAR(36),
    monto             FLOAT,
   activo            TINYINT      default 1
);

-- Tabla paraderosexternos
CREATE TABLE paraderosexternos
(
    iddatabase          varchar(25) not null,
    idempresa           char(3)     not null,
    usuariocreacion     varchar(25) not null,
    fechacreacion       datetime2(0) default getdate(),
    usuarioalteracion   varchar(25)  default NULL,
    fechaalteracion     datetime2(0) default NULL,
    idparaderosexternos VARCHAR(36) PRIMARY KEY,
    paredero            VARCHAR(150),
    centropoblado       VARCHAR(150),
    iddistrito          VARCHAR(36),
    latitud             VARCHAR(36),
    longitud            VARCHAR(36),
    activo            TINYINT      default 1
);

-- Tabla paraderosinternos
CREATE TABLE paraderosinternos
(
    iddatabase          varchar(25) not null,
    idempresa           char(3)     not null,
    usuariocreacion     varchar(25) not null,
    fechacreacion       datetime2(0) default getdate(),
    usuarioalteracion   varchar(25)  default NULL,
    fechaalteracion     datetime2(0) default NULL,
    idparaderosinternos VARCHAR(36) PRIMARY KEY,
    idfundo             VARCHAR(36),
    idetapa             VARCHAR(36),
    idcampo             VARCHAR(36),
    paradero            VARCHAR(150),
    comedor             VARCHAR(150),
    activo            TINYINT      default 1
);

-- Tabla rutasaccesobusvis
CREATE TABLE rutasacceso
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idrutasacceso     VARCHAR(36) PRIMARY KEY,
    descripcion       VARCHAR(150),
    latitud           VARCHAR(36),
    longitud          VARCHAR(36),
    activo            TINYINT      default 1
);
-- Tabla semanasbusvis
CREATE TABLE semanas
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idsemanas         VARCHAR(36) PRIMARY KEY,
    anio              INT,
    mes               VARCHAR(150),
    semana            INT,
    fechainicio       DATE,
    fechafin          DATE,
    activo            TINYINT      default 1
);

-- Tabla tarifabusvis
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
    origen            VARCHAR(150),
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
    activo            TINYINT      default 1
);

-- Tabla tipoviajebusvis
CREATE TABLE tipoviaje
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idtipoviaje       VARCHAR(36) PRIMARY KEY,
    descripcion       VARCHAR(150),
    activo            TINYINT      default 1
);

-- Tabla turnobusvis
CREATE TABLE turno
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idturno           VARCHAR(36) PRIMARY KEY,
    idtipo            VARCHAR(36),
    horaingreso       TIME,
    horasalida        TIME,
    activo            TINYINT      default 1
);

-- Tabla ubicacion
CREATE TABLE ubicacion
(
    idubicacion       VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    descripcion       VARCHAR(150),
    referencia        VARCHAR(150),
    latitud           VARCHAR(150),
    longitud          VARCHAR(150),
    iddistrito        VARCHAR(36),
    zona              VARCHAR(150),
    subzona           VARCHAR(150),
    activo            TINYINT      default 1
);

-- Tabla ubigeobusvis
CREATE TABLE ubigeobusvis
(
    idubigeobusvis    VARCHAR(36) PRIMARY KEY,
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    codigo            VARCHAR(150),
    descripcion       VARCHAR(150),
    activo            TINYINT      default 1
);

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

-- Tabla soat
CREATE TABLE soat
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idsoat            VARCHAR(36) PRIMARY KEY,
    fechavencimiento  DATE,
    urlfotosoat       VARCHAR(MAX),
    activo            TINYINT
);

-- Tabla revisiontecnica
CREATE TABLE revisiontecnica
(
    iddatabase                  varchar(25) not null,
    idempresa                   char(3)     not null,
    usuariocreacion             varchar(25) not null,
    fechacreacion               datetime2(0) default getdate(),
    usuarioalteracion           varchar(25)  default NULL,
    fechaalteracion             datetime2(0) default NULL,
    idrevisiontecnica           VARCHAR(36) PRIMARY KEY,
    fechavencimientoinsptaller  DATE,
    fechavencimientorevisiontec DATE,
    urlfotorevisiontecnica      VARCHAR(MAX),
    activo                      TINYINT
);

-- Tabla tarjetacirculacion
CREATE TABLE tarjetacirculacion
(
    iddatabase           varchar(25) not null,
    idempresa            char(3)     not null,
    usuariocreacion      varchar(25) not null,
    fechacreacion        datetime2(0) default getdate(),
    usuarioalteracion    varchar(25)  default NULL,
    fechaalteracion      datetime2(0) default NULL,
    idtarjetacirculacion VARCHAR(36) PRIMARY KEY,
    fecha                DATE,
    urlfoto              VARCHAR(MAX),
    activo               TINYINT
);

-- Tabla propietariovehiculo
CREATE TABLE propietariovehiculo
(
    iddatabase                varchar(25) not null,
    idempresa                 char(3)     not null,
    usuariocreacion           varchar(25) not null,
    fechacreacion             datetime2(0) default getdate(),
    usuarioalteracion         varchar(25)  default NULL,
    fechaalteracion           datetime2(0) default NULL,
    idpropietariovehiculo     VARCHAR(36) PRIMARY KEY,
    propietario               VARCHAR(150),
    dniruc                    VARCHAR(150),
    propietarioadicional      VARCHAR(150),
    dnirucadicional           VARCHAR(150),
    urlfotoboletininformativo VARCHAR(MAX),
    activo                    TINYINT
);

-- Tabla croquisvehiculo
CREATE TABLE croquisvehiculo
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idcroquisvehiculo VARCHAR(36) PRIMARY KEY,
    descripcion       VARCHAR(150),
    numpisos          VARCHAR(150),
    idtiponumeracion  VARCHAR(36),
    activo            TINYINT
);

-- Tabla pisovehiculo
CREATE TABLE pisovehiculo
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idpisovehiculo    VARCHAR(36) PRIMARY KEY,
    idcroquisvehiculo VARCHAR(36),
    columnas          INT,
    filas             INT,
    poslibres         VARCHAR(150),
    posbloqueados     VARCHAR(150),
    conductores       VARCHAR(150),
    asientos          INT,
   activo            TINYINT      default 1
    CONSTRAINT FK_pisovehiculo_croquisvehiculo FOREIGN KEY (idcroquisvehiculo) REFERENCES croquisvehiculo (idcroquisvehiculo)
);

-- Tabla vehiculobusvis
CREATE TABLE vehiculobusvis
(
    iddatabase              varchar(25) not null,
    idempresa               char(3)     not null,
    usuariocreacion         varchar(25) not null,
    fechacreacion           datetime2(0) default getdate(),
    usuarioalteracion       varchar(25)  default NULL,
    fechaalteracion         datetime2(0) default NULL,
    idvehiculobusvis        VARCHAR(36) PRIMARY KEY,
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
    idsoat                  VARCHAR(36),
    idtarjetacirculacion    VARCHAR(36),
    idrevisiontecnica       VARCHAR(36),
    idpropietariovehiculo   VARCHAR(36),
    activo                  TINYINT,
    CONSTRAINT FK_vehiculobusvis_tipovehiculo FOREIGN KEY (idtipovehiculo) REFERENCES tipovehiculo (idtipovehiculo),
    CONSTRAINT FK_vehiculobusvis_soat FOREIGN KEY (idsoat) REFERENCES soat (idsoat),
    CONSTRAINT FK_vehiculobusvis_tarjetacirculacion FOREIGN KEY (idtarjetacirculacion) REFERENCES tarjetacirculacion (idtarjetacirculacion),
    CONSTRAINT FK_vehiculobusvis_revisiontecnica FOREIGN KEY (idrevisiontecnica) REFERENCES revisiontecnica (idrevisiontecnica),
    CONSTRAINT FK_vehiculobusvis_propietariovehiculo FOREIGN KEY (idpropietariovehiculo) REFERENCES propietariovehiculo (idpropietariovehiculo)
);

CREATE TABLE ruta
(
    iddatabase        varchar(25) not null,
    idempresa         char(3)     not null,
    usuariocreacion   varchar(25) not null,
    fechacreacion     datetime2(0) default getdate(),
    usuarioalteracion varchar(25)  default NULL,
    fechaalteracion   datetime2(0) default NULL,
    idruta            VARCHAR(36) PRIMARY KEY,
    idzonapreferencia VARCHAR(36),
    idorigen          VARCHAR(36),
    iddestino         VARCHAR(36),
    coordenadas       VARCHAR(max),
    recorridokm       float,
    duracion          int,
    pesovariable      float,
   activo            TINYINT      default 1
);