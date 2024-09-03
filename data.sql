CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    tipo_cliente CHAR(1) DEFAULT 'N',
    id_referido INT,
    -- Comentario sobre la siguiente línea
    CONSTRAINT FK_Cliente_Referido FOREIGN KEY (id_referido) REFERENCES Clientes(id)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY, -- Identificador único de empleado
    emp_name VARCHAR(100) NOT NULL,
    emp_email VARCHAR(100) UNIQUE,
    dept_id INT,
    salary DECIMAL(15, 2) CHECK (salary > 0),
    start_date DATE DEFAULT '2000-01-01',
    -- Relación con el departamento
    CONSTRAINT FK_Employee_Dept FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE    TABLE   Productos (
    id INT PRIMARY KEY,
    nombre_producto  VARCHAR(100)  NOT NULL,  
    descripcion     TEXT, 
    precio  DECIMAL(10, 2)   NOT NULL   CHECK (precio > 0),  
    categoria_id INT, 
    fecha_creacion  DATE DEFAULT CURRENT_DATE, 
    -- Comentario sobre la siguiente línea
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE   Categorias  (
    id  INT  PRIMARY KEY,
    nombre_categoria  VARCHAR(50) NOT NULL,   
    descripcion_categoria   TEXT  
);  

CREATE  TABLE Ventas (
    id INT PRIMARY  KEY,  
    id_cliente INT NOT NULL,   
    fecha_venta  DATE DEFAULT (CURRENT_DATE), 
    total DECIMAL(12, 2)  NOT NULL CHECK  (total >= 0), 
    -- Comentario en línea
    CONSTRAINT  FK_Venta_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id)  
);  

CREATE    TABLE    Detalles_Ventas  (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_venta  INT NOT NULL,  
    id_producto  INT NOT NULL,  
    cantidad   INT NOT NULL CHECK (cantidad > 0),   
    precio_unitario DECIMAL(10, 2) NOT NULL, 
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (id_venta) REFERENCES Ventas(id),  
    CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (id_producto) REFERENCES Productos(id)
);   

CREATE  TABLE   Usuarios (
    usuario_id INT PRIMARY KEY,  
    nombre_usuario VARCHAR(50)   NOT NULL, 
    email_usuario VARCHAR(100) NOT NULL UNIQUE,   
    contrasena_usuario VARCHAR(255) NOT NULL,  
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
    activo_usuario BOOLEAN DEFAULT TRUE   
);

CREATE  TABLE   Roles (
    rol_id  INT PRIMARY  KEY,  
    nombre_rol VARCHAR(50)  NOT NULL  
); 

CREATE TABLE  Usuarios_Roles  (
    usuario_id  INT,  
    rol_id   INT,  
    PRIMARY KEY (usuario_id, rol_id),  
    CONSTRAINT FK_UsuarioRol_Usuario FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id),   
    CONSTRAINT FK_UsuarioRol_Rol FOREIGN KEY (rol_id) REFERENCES Roles(rol_id)
); 

CREATE TABLE   Clientes_Contacto (
    id INT PRIMARY KEY,  
    id_cliente INT NOT NULL,   
    telefono VARCHAR(20),  
    email_contacto VARCHAR(100),   
    direccion_contacto VARCHAR(255),  
    CONSTRAINT  FK_Contacto_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id)   
); 

CREATE TABLE   Productos_Pedidos  (
    id_producto INT,  
    id_pedido   INT,  
    cantidad_producto INT CHECK (cantidad_producto > 0),  
    precio_unitario_producto DECIMAL(10, 2) NOT NULL,   
    PRIMARY KEY (id_producto, id_pedido),  
    CONSTRAINT FK_ProductoPedido_Producto FOREIGN KEY (id_producto) REFERENCES Productos(id),   
    CONSTRAINT FK_ProductoPedido_Pedido FOREIGN KEY (id_pedido) REFERENCES Pedidos(id)
);  

CREATE    TABLE    Proveedores_Productos (
    id_proveedor INT,   
    id_producto INT,   
    precio_proveedor DECIMAL(10, 2)  NOT NULL,   
    PRIMARY KEY (id_proveedor, id_producto),  
    CONSTRAINT FK_ProveedorProducto_Proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id),  
    CONSTRAINT FK_ProveedorProducto_Producto FOREIGN KEY (id_producto) REFERENCES Productos(id)  
);

CREATE TABLE   Compras_Proveedores (
    id_compra INT PRIMARY KEY,  
    id_proveedor INT NOT NULL,   
    fecha_compra  DATE DEFAULT (CURRENT_DATE),   
    total_compra DECIMAL(12, 2)  NOT NULL CHECK (total_compra > 0),   
    CONSTRAINT FK_CompraProveedor_Proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id)
);


CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE DEFAULT (CURRENT_DATE),
    total DECIMAL(12, 2) CHECK (total >= 0),
    estado ENUM('PENDIENTE', 'COMPLETADO', 'CANCELADO') DEFAULT 'PENDIENTE',
    comentarios TEXT,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);
