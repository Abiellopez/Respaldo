USE [master]
GO
/****** Object:  Database [Tienda_Lucia]    Script Date: 05/03/2024 20:14:40 ******/
CREATE DATABASE [Tienda_Lucia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda_Lucia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.URAI\MSSQL\DATA\Tienda_Lucia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tienda_Lucia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.URAI\MSSQL\DATA\Tienda_Lucia_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tienda_Lucia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda_Lucia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda_Lucia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda_Lucia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda_Lucia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tienda_Lucia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda_Lucia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET RECOVERY FULL 
GO
ALTER DATABASE [Tienda_Lucia] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda_Lucia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda_Lucia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda_Lucia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda_Lucia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tienda_Lucia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tienda_Lucia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tienda_Lucia', N'ON'
GO
ALTER DATABASE [Tienda_Lucia] SET QUERY_STORE = OFF
GO
USE [Tienda_Lucia]
GO
/****** Object:  Table [dbo].[BODEGA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BODEGA](
	[IdBodega] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[Espacio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](40) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[IdColor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[IdColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRAS]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProveedor] [int] NULL,
	[IdBodega] [int] NULL,
	[TotalCosto] [decimal](18, 2) NULL,
	[TipoComprobante] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONFIGURACION]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONFIGURACION](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocal] [nvarchar](60) NULL,
	[NombrePropietaria] [nvarchar](60) NULL,
	[Direccion] [nvarchar](100) NULL,
	[Telefono] [int] NULL,
	[Correo] [nvarchar](70) NULL,
	[Lineafija] [int] NULL,
	[NombreFiscal] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[RUC] [nvarchar](50) NULL,
 CONSTRAINT [PK__CONFIGUR__5A1EB96B1113C66E] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitarioCompra] [decimal](18, 2) NULL,
	[PrecioUnitarioVenta] [decimal](18, 2) NULL,
	[TotalCosto] [decimal](18, 2) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnidad] [decimal](18, 2) NULL,
	[ImporteTotal] [decimal](18, 2) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devoluciones]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devoluciones](
	[IdDevolucion] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [bit] NULL,
	[Motivo] [nvarchar](500) NULL,
	[FechaRegistro] [datetime] NULL,
	[IdVenta] [int] NULL,
	[CantidadDevuelta] [int] NULL,
	[Codigo] [nvarchar](50) NULL,
	[Producto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Devoluciones] PRIMARY KEY CLUSTERED 
(
	[IdDevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estilo](
	[CodigoEstilo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_tblestilo] PRIMARY KEY CLUSTERED 
(
	[CodigoEstilo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[CodigoMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_tblmarca] PRIMARY KEY CLUSTERED 
(
	[CodigoMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Icono] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[IdPermisos] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdSubMenu] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK__PERMISOS__CE7ED38DD344BB55] PRIMARY KEY CLUSTERED 
(
	[IdPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[CodigoMarca] [int] NULL,
	[CodigoEstilo] [int] NULL,
	[IdTalla] [int] NULL,
	[IdColor] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
 CONSTRAINT [PK__PRODUCTO__09889210FF84E358] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO_BODEGA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_BODEGA](
	[IdProductoBodega] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdBodega] [int] NULL,
	[PrecioUnidadCompra] [decimal](18, 2) NULL,
	[PrecioUnidadVenta] [decimal](18, 2) NULL,
	[Stock] [bigint] NULL,
	[Activo] [bit] NULL,
	[Iniciado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](50) NULL,
	[RazonSocial] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBMENU]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMENU](
	[IdSubMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[Controlador] [varchar](60) NULL,
	[Vista] [varchar](50) NULL,
	[Icono] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talla]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Talla](
	[IdTalla] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Talla] PRIMARY KEY CLUSTERED 
(
	[IdTalla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](60) NULL,
	[Apellidos] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Clave] [varchar](100) NULL,
	[IdRol] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 05/03/2024 20:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdCliente] [int] NULL,
	[TipoDocumento] [varchar](50) NULL,
	[CantidadProducto] [int] NULL,
	[CantidadTotal] [int] NULL,
	[TotalCosto] [decimal](18, 2) NULL,
	[ImporteRecibido] [decimal](18, 2) NULL,
	[ImporteCambio] [decimal](18, 2) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[Descuento] [decimal](18, 2) NULL,
 CONSTRAINT [PK__VENTA__BC1240BDA99905EF] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BODEGA] ON 

INSERT [dbo].[BODEGA] ([IdBodega], [Nombre], [Activo], [FechaRegistro], [Espacio]) VALUES (1, N'Bodega 001', 1, CAST(N'2023-09-11T12:50:48.397' AS DateTime), 85)
INSERT [dbo].[BODEGA] ([IdBodega], [Nombre], [Activo], [FechaRegistro], [Espacio]) VALUES (9, N'Bodega 002', 1, CAST(N'2023-09-24T02:45:04.110' AS DateTime), 80)
SET IDENTITY_INSERT [dbo].[BODEGA] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'Niños', 1, CAST(N'2023-09-23T22:08:25.137' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'Niñas', 1, CAST(N'2023-09-23T22:08:31.683' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'Jovenes', 1, CAST(N'2023-09-23T22:08:38.400' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'Mujer', 1, CAST(N'2023-09-23T22:08:50.270' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (10, N'Hombre', 1, CAST(N'2023-09-23T22:08:56.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (5, N'DUI', N'409-202322-1223O', N'Lucia espinoza', N'jinotepe', N'89775655', 0, CAST(N'2023-09-11T12:50:48.397' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (11, N'DUI', N'203-565455-4444H', N'Moises Lopez aguirre', N'diriamba, carazo', N'89564544', 1, CAST(N'2023-09-11T12:50:48.397' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (18, N'DUI', N'6002-456454-1002R', N'Urai Sanchez', N'la jardinera, tercera calle', N'58215220', 1, CAST(N'2023-09-23T22:04:27.747' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (19, N'DUI', N'041-200302-1002E', N'abiel lopez sanchez', N'Bo san caralmpio , la concepcion masaya', N'81990115', 1, CAST(N'2023-10-25T18:48:48.807' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1022, N'DUI', N'67678990', N'danelia garcia', N'diriamba', N'89787146', 1, CAST(N'2024-01-30T14:30:32.333' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1023, N'DUI', N'203-565455-4444', N'moises aguirre ', N'la jardinera', N'89564544', 1, CAST(N'2024-01-30T14:30:57.033' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1024, N'DUI', N'6767899', N'fabian', N'diriamba, carazo', N'12345352', 1, CAST(N'2024-01-30T14:31:23.203' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1025, N'DUI', N'6002-456454-1002', N'Lucia espinoza', N'diriamba, carazo', N'89564544', 1, CAST(N'2024-01-30T14:31:40.393' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1027, N'DUI', N'*', N'*', N'*', N'*', 1, CAST(N'2024-02-08T16:38:14.577' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1028, N'DUI', N'67678990g', N'Fabian espinoza', N'diriamba', N'89775655', 1, CAST(N'2024-02-08T16:52:14.937' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1029, N'DUI', N'409-2023', N'Lucia espinoza', N'jinotepe', N'89775655', 1, CAST(N'2024-02-08T16:54:47.417' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1030, N'RUC', N'898943443434', N'Moises Lopez aguirre', N'la soya', N'8975456545', 1, CAST(N'2024-02-08T16:56:27.630' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1031, N'DUI', N'12312312', N'alvaro david lopez', N'jinotepe', N'89787146', 1, CAST(N'2024-02-08T17:07:25.807' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1032, N'DUI', N'409-202322-1223ll', N'Lucia espinoza', N'jinotepe', N'89775655', 1, CAST(N'2024-02-14T14:40:25.357' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1033, N'RUC', N'67678990fd', N'fdfdf', N'fdfdf', N'89787146', 1, CAST(N'2024-02-15T09:09:05.447' AS DateTime))
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1034, N'DUI', N'Generico', N'Generico', N'Generico', N'0', 1, CAST(N'2024-02-17T10:52:17.440' AS DateTime))
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([IdColor], [Nombre], [Activo], [FechaRegistro]) VALUES (1, N'Negro', 1, CAST(N'2023-10-08T20:54:36.590' AS DateTime))
INSERT [dbo].[Color] ([IdColor], [Nombre], [Activo], [FechaRegistro]) VALUES (3, N'Rojo', 1, CAST(N'2023-10-10T17:31:00.653' AS DateTime))
INSERT [dbo].[Color] ([IdColor], [Nombre], [Activo], [FechaRegistro]) VALUES (4, N'Verde', 1, CAST(N'2023-10-10T18:18:16.160' AS DateTime))
INSERT [dbo].[Color] ([IdColor], [Nombre], [Activo], [FechaRegistro]) VALUES (5, N'Azul', 1, CAST(N'2023-10-11T09:51:08.350' AS DateTime))
INSERT [dbo].[Color] ([IdColor], [Nombre], [Activo], [FechaRegistro]) VALUES (1006, N'Blanco', 1, CAST(N'2024-02-14T13:25:20.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRAS] ON 

INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1, 1, 3, 1, CAST(20.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (2, 1, 4, 9, CAST(31.50 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-09T19:26:57.940' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3, 1, 3, 1, CAST(10.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-09T22:01:53.657' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4, 1, 3, 1, CAST(2.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-09T22:07:19.540' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (5, 1, 3, 1, CAST(2400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-14T09:22:31.120' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1002, 1, 4, 1, CAST(1022.24 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-23T14:08:52.143' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1003, 1, 4, 1, CAST(2400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-11-23T16:52:20.920' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1004, 1, 3, 1, CAST(400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-09T21:25:04.063' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1005, 1, 4, 1, CAST(1500.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-09T21:25:34.977' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1006, 1, 4, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-09T21:56:19.683' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1007, 1, 3, 1, CAST(6000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-09T21:57:45.640' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (2004, 1, 3, 1, CAST(1500.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-20T17:06:26.683' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3004, 1, 3, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2023-12-20T17:11:46.073' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3005, 1, 3, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T10:27:11.063' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3006, 1, 3, 1, CAST(21000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T10:57:57.647' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3007, 1, 4, 1, CAST(4000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T11:55:10.157' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3008, 1, 3, 1, CAST(3000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T11:55:40.020' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3009, 1, 4, 1, CAST(3500.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T11:56:10.060' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3010, 1, 3, 1, CAST(6000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T12:09:08.697' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3011, 1, 4, 1, CAST(3400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-02T17:54:59.053' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3012, 1, 3, 1, CAST(1000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-22T10:26:25.577' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3013, 1, 3, 1, CAST(1200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-23T10:50:38.110' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3014, 1, 3, 1, CAST(2700.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-23T11:37:05.247' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4012, 1, 3, 1, CAST(1200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-30T11:47:56.060' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4013, 1, 3, 1, CAST(1200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-30T14:28:51.800' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4014, 1, 3, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-01-30T17:12:22.397' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4015, 1, 3, 1, CAST(1800.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-08T14:00:36.070' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4016, 1, 1004, 1, CAST(1200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-08T16:14:01.610' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4017, 1, 4, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T13:37:15.537' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4018, 1, 4, 9, CAST(900.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T13:41:46.390' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4019, 1, 3, 1, CAST(1800.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T13:43:58.253' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4020, 1, 3, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T14:32:39.590' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4021, 1, 3, 1, CAST(1200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T14:35:44.350' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4022, 1, 3, 1, CAST(6000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T15:07:17.220' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4023, 1, 4, 1, CAST(6000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T15:30:04.290' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4024, 1, 4, 1, CAST(4000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-14T15:30:54.357' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4025, 1, 4, 1, CAST(3600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:01:09.457' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4026, 1, 1004, 9, CAST(3000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:01:36.387' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4027, 1, 4, 1, CAST(4000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:03:05.663' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4028, 1, 1005, 1, CAST(3000.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:04:25.760' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4029, 1, 3, 1, CAST(400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:27:29.083' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4030, 1, 3, 1, CAST(900.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T09:30:57.550' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4031, 1, 3, 9, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-15T10:22:09.577' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4032, 1, 1004, 1, CAST(1050.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-17T12:35:12.753' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4033, 1, 1005, 9, CAST(400.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-17T12:58:55.570' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4034, 1, 4, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-23T11:41:59.483' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4035, 1, 3, 9, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-23T12:37:40.807' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4036, 1, 4, 1, CAST(600.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-25T22:29:14.267' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4037, 1, 3, 1, CAST(700.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-25T22:46:15.377' AS DateTime))
INSERT [dbo].[COMPRAS] ([IdCompra], [IdUsuario], [IdProveedor], [IdBodega], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (4038, 1, 4, 1, CAST(200.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2024-02-25T23:03:57.373' AS DateTime))
SET IDENTITY_INSERT [dbo].[COMPRAS] OFF
GO
SET IDENTITY_INSERT [dbo].[CONFIGURACION] ON 

INSERT [dbo].[CONFIGURACION] ([IdTienda], [NombreLocal], [NombrePropietaria], [Direccion], [Telefono], [Correo], [Lineafija], [NombreFiscal], [Descripcion], [RUC]) VALUES (1, N'Calzado Lucia ....', N'Lucia Espinoza', N'Diriamba,Carazo', 89787146, N'Lopea669@gmail', 39, N'******', N'***', N'89898')
SET IDENTITY_INSERT [dbo].[CONFIGURACION] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 

INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3, 1, 10, 2, CAST(10.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2023-10-17T10:46:30.663' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4, 2, 8, 3, CAST(10.50 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), CAST(31.50 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T19:26:57.963' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (5, 3, 10, 5, CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:01:53.730' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (6, 4, 10, 1, CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:07:19.600' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (7, 5, 10, 3, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:22:31.140' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (8, 5, 1009, 3, CAST(500.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:22:31.140' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1004, 1002, 10, 4, CAST(255.56 AS Decimal(18, 2)), CAST(289.36 AS Decimal(18, 2)), CAST(1022.24 AS Decimal(18, 2)), 1, CAST(N'2023-11-23T14:08:52.193' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1005, 1003, 10, 8, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-23T16:52:20.993' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1006, 1004, 1009, 2, CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-09T21:25:04.093' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1007, 1005, 1008, 5, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-09T21:25:35.007' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1008, 1006, 10, 2, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-09T21:56:19.710' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1009, 1007, 1008, 30, CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-09T21:57:45.657' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (2006, 2004, 1009, 5, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-20T17:06:26.693' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3006, 3004, 1008, 2, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-20T17:11:46.080' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3007, 3005, 1010, 2, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:27:11.070' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3008, 3006, 10, 60, CAST(350.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(21000.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:57:57.657' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3009, 3007, 10, 20, CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T11:55:10.163' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3010, 3008, 1009, 12, CAST(250.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T11:55:40.027' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3011, 3009, 1008, 10, CAST(350.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T11:56:10.067' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3012, 3010, 1010, 20, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T12:09:08.700' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3013, 3011, 1010, 3, CAST(600.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:54:59.063' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3014, 3011, 1008, 2, CAST(600.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:54:59.063' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3015, 3011, 10, 2, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:54:59.063' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3016, 3012, 1010, 2, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-22T10:26:25.610' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3017, 3012, 1063, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-22T10:26:25.610' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3018, 3013, 1051, 3, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T10:50:38.117' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3019, 3013, 1063, 3, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T10:50:38.117' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3020, 3014, 1010, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T11:37:05.253' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3021, 3014, 1050, 3, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T11:37:05.253' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3022, 3014, 8, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T11:37:05.253' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3023, 3014, 1063, 3, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T11:37:05.253' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4016, 4012, 8, 3, CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T11:47:56.070' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4017, 4013, 8, 2, CAST(600.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:28:51.823' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4018, 4014, 10, 3, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T17:12:22.413' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4019, 4015, 10, 6, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T14:00:36.083' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4020, 4016, 2113, 3, CAST(400.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:14:01.620' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4021, 4017, 1051, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T13:37:15.557' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4022, 4018, 8, 3, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T13:41:46.400' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4023, 4019, 8, 6, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T13:43:58.263' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4024, 4020, 1010, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T14:32:39.607' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4025, 4021, 1050, 3, CAST(400.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T14:35:44.357' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4026, 4022, 1010, 20, CAST(300.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T15:07:17.230' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4027, 4023, 1050, 20, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T15:30:04.300' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4028, 4024, 1008, 20, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T15:30:54.360' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4029, 4025, 1008, 12, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(3600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:01:09.480' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4030, 4026, 1051, 10, CAST(300.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:01:36.390' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4031, 4027, 10, 10, CAST(400.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:03:05.670' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4032, 4028, 2113, 10, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:04:25.767' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4033, 4029, 1063, 2, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:27:29.090' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4034, 4030, 8, 3, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:30:57.553' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4035, 4031, 1051, 2, CAST(300.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T10:22:09.590' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4036, 4032, 1008, 3, CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(1050.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T12:35:12.760' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4037, 4033, 2116, 2, CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T12:58:55.573' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4038, 4034, 1008, 2, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T11:41:59.490' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4039, 4035, 2116, 2, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T12:37:40.823' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4040, 4036, 8, 2, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:29:14.300' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4041, 4037, 10, 2, CAST(350.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:46:15.383' AS DateTime))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (4042, 4038, 1010, 1, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T23:03:57.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] ON 

INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (1, 1, 10, 1, CAST(1200.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T20:44:28.007' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2, 2, 10, 2, CAST(1200.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T20:45:57.040' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3, 3, 8, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:15:25.440' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (4, 4, 8, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:48:32.853' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (5, 5, 8, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:52:44.770' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (6, 6, 8, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:54:41.720' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (7, 7, 10, 2, CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:02:53.653' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (8, 8, 10, 2, CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:09:17.970' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (9, 9, 8, 3, CAST(1100.00 AS Decimal(18, 2)), CAST(3300.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:08:28.353' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (10, 10, 10, 4, CAST(300.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:10:07.610' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (1002, 1002, 10, 1, CAST(289.36 AS Decimal(18, 2)), CAST(289.36 AS Decimal(18, 2)), 1, CAST(N'2023-11-23T16:50:41.417' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (1003, 1003, 1008, 2, CAST(250.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-09T22:38:15.900' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (1004, 1004, 1009, 2, CAST(250.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-16T08:32:24.173' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2003, 2003, 10, 2, CAST(350.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-20T17:08:29.470' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2004, 2004, 10, 1, CAST(350.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:07:55.050' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2005, 2005, 10, 2, CAST(350.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:08:53.037' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2006, 2006, 10, 1, CAST(350.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:21:32.293' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2007, 2007, 10, 1, CAST(350.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:25:33.817' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2008, 2008, 1010, 2, CAST(350.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:01:18.700' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2009, 2008, 1008, 2, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:01:18.700' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2010, 2008, 10, 2, CAST(250.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T17:01:18.700' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2011, 2009, 1009, 8, CAST(300.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-15T09:07:14.293' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2012, 2010, 10, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-18T23:54:58.893' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2013, 2012, 10, 2, CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:14:50.180' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2014, 2013, 10, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:42:31.980' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2015, 2014, 1008, 2, CAST(700.00 AS Decimal(18, 2)), CAST(1400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:52:10.617' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2016, 2015, 1063, 2, CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:55:45.420' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2017, 2016, 10, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-24T17:56:15.113' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3013, 3012, 1008, 1, CAST(700.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T11:19:35.890' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3014, 3013, 1008, 1, CAST(700.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:24:22.407' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3015, 3014, 1008, 1, CAST(700.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:24:56.753' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3016, 3015, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:26:16.387' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3017, 3016, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T15:01:17.580' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3018, 3017, 1010, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T17:38:32.693' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3019, 3018, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-31T20:03:46.337' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3020, 3019, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:38:14.607' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3021, 3020, 8, 1, CAST(800.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:52:15.030' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3022, 3021, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:54:47.467' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3023, 3022, 8, 1, CAST(800.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:56:27.690' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3024, 3023, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:03:37.797' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3025, 3024, 2113, 1, CAST(550.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:05:19.310' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3026, 3025, 2113, 1, CAST(550.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:06:08.483' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3027, 3026, 8, 1, CAST(800.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:06:30.687' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3028, 3027, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:07:25.827' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3029, 3028, 10, 1, CAST(600.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-10T17:04:01.317' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3030, 3029, 2113, 1, CAST(550.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T14:40:25.400' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3037, 3033, 10, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:07:18.680' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3038, 3034, 1051, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:07:48.210' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3039, 3035, 1010, 1, CAST(450.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:09:05.480' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3040, 3036, 10, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:09:33.787' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3041, 3037, 1008, 2, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T10:25:27.660' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3042, 3038, 10, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2017-08-01T12:16:25.720' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3043, 3039, 1051, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2017-08-01T12:19:48.043' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3044, 3040, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2017-08-01T12:31:59.480' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3045, 3041, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T21:01:10.087' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3046, 3042, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T21:01:42.240' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3047, 3043, 2113, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:52:17.483' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3048, 3044, 1008, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:53:41.477' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3049, 3045, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:55:12.583' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3050, 3046, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:56:23.770' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3051, 3047, 1008, 2, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T12:31:47.060' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3052, 3047, 2113, 2, CAST(400.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T12:31:47.060' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3053, 3048, 2116, 1, CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T12:59:37.220' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3054, 3049, 10, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T13:01:02.293' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3055, 3050, 1050, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-20T01:37:15.690' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3056, 1, 1051, 2, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T13:44:00.520' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3057, 3051, 8, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T13:55:18.417' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3058, 3052, 2113, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T13:56:23.973' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3062, 3056, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T14:32:13.117' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3063, 3057, 2116, 1, CAST(350.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T14:56:22.737' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3064, 3058, 1051, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T16:24:12.720' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3065, 3059, 1051, 1, CAST(500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T16:25:02.283' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3066, 3060, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:28:35.820' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3067, 3061, 1008, 1, CAST(400.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:48:48.130' AS DateTime))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (3069, 3063, 1063, 1, CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T23:06:54.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] OFF
GO
SET IDENTITY_INSERT [dbo].[Devoluciones] ON 

INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (1, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-21T22:52:09.630' AS DateTime), 1, 2, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (2, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-21T23:04:01.300' AS DateTime), 3050, 3, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (3, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-21T23:54:20.130' AS DateTime), 3050, 3, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (4, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T01:21:31.233' AS DateTime), 2, 3, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (5, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T04:25:08.100' AS DateTime), 3, 2, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (6, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T04:52:11.547' AS DateTime), 4, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (7, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T04:54:02.727' AS DateTime), 5, 2, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (8, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T04:56:50.863' AS DateTime), 3, 2, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (9, 1, N'Estaba mal unos cordones de los zapatos niker air', CAST(N'2024-02-22T04:58:16.517' AS DateTime), 3013, 2, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (10, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T05:01:27.537' AS DateTime), 1004, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (11, 1, N'zapatos puma   daños en la tela trasera', CAST(N'2024-02-22T05:05:23.907' AS DateTime), 2008, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (12, 1, N'desperfectos', CAST(N'2024-02-22T05:06:07.640' AS DateTime), 2009, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (13, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T05:06:54.437' AS DateTime), 2009, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (14, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T05:12:06.050' AS DateTime), 3, 2, N'000003', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (15, 1, N'desgaste  en la plantilla', CAST(N'2024-02-22T05:15:29.340' AS DateTime), 2009, 1, N'000020', N'1063')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (16, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T05:59:51.657' AS DateTime), 3, 2, N'000003', N'1023')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (17, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T06:02:03.453' AS DateTime), 3, 2, N'000003', N'10')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (18, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T06:02:41.237' AS DateTime), 3, 2, N'000003', N'10')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (19, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-22T06:21:18.283' AS DateTime), 2009, 2, N'000020', N'10')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (20, 1, N'no tenian plantilla y cordones', CAST(N'2024-02-23T11:13:50.457' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (21, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:16:06.457' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (22, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:16:32.467' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (23, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:17:08.580' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (24, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:18:46.640' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (25, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:20:40.090' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (26, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:21:35.667' AS DateTime), 2010, 2, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (27, 1, N'zapatos nike air    daños en la tela frontal ', CAST(N'2024-02-23T11:31:53.660' AS DateTime), 2010, 1, N'000021', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (28, 1, N'dañados por el tiemppo', CAST(N'2024-02-23T14:15:20.920' AS DateTime), 3051, 1, N'000063', N'8')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (29, 1, N'dañados', CAST(N'2024-02-23T16:22:55.340' AS DateTime), 2010, 1, N'000021', N'1051')
INSERT [dbo].[Devoluciones] ([IdDevolucion], [Estado], [Motivo], [FechaRegistro], [IdVenta], [CantidadDevuelta], [Codigo], [Producto]) VALUES (30, 1, N'producto dañado', CAST(N'2024-02-25T23:08:54.527' AS DateTime), 3063, 1, N'000071', N'8')
SET IDENTITY_INSERT [dbo].[Devoluciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Estilo] ON 

INSERT [dbo].[Estilo] ([CodigoEstilo], [Nombre], [Activo], [FechaRegistro]) VALUES (1, N'Salida', 1, CAST(N'2023-10-10T18:58:04.643' AS DateTime))
INSERT [dbo].[Estilo] ([CodigoEstilo], [Nombre], [Activo], [FechaRegistro]) VALUES (3, N'Deportivos', 1, CAST(N'2023-10-10T19:10:03.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[Estilo] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([CodigoMarca], [Nombre], [Activo], [FechaRegistro]) VALUES (8, N'NIKE', 1, CAST(N'2023-10-10T17:55:43.870' AS DateTime))
INSERT [dbo].[Marca] ([CodigoMarca], [Nombre], [Activo], [FechaRegistro]) VALUES (9, N'Adidas', 1, CAST(N'2023-10-10T18:02:27.160' AS DateTime))
INSERT [dbo].[Marca] ([CodigoMarca], [Nombre], [Activo], [FechaRegistro]) VALUES (11, N'Puma', 1, CAST(N'2023-10-10T18:17:49.100' AS DateTime))
INSERT [dbo].[Marca] ([CodigoMarca], [Nombre], [Activo], [FechaRegistro]) VALUES (12, N'Convers', 1, CAST(N'2023-10-10T18:54:40.197' AS DateTime))
INSERT [dbo].[Marca] ([CodigoMarca], [Nombre], [Activo], [FechaRegistro]) VALUES (13, N'KATERPILLAR', 1, CAST(N'2023-11-14T09:19:23.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (1, N'Mantenimiento', N'fas fa-tools', 1, CAST(N'2023-09-11T12:50:47.757' AS DateTime))
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (2, N'Clientes', N'fas fa-user-friends', 1, CAST(N'2023-09-11T12:50:47.757' AS DateTime))
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (3, N'Compras', N'fas fa-cart-arrow-down', 1, CAST(N'2023-09-11T12:50:47.757' AS DateTime))
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (4, N'Ventas', N'fas fa-cash-register', 1, CAST(N'2023-09-11T12:50:47.757' AS DateTime))
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (5, N'Reportes', N'far fa-clipboard', 1, CAST(N'2023-09-11T12:50:47.757' AS DateTime))
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (6, N'Configuracion', N'far fa-clipboard', 1, CAST(N'2024-02-10T19:30:27.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] ON 

INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2, 1, 2, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (3, 1, 3, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (4, 1, 4, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (5, 1, 5, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (6, 1, 6, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (7, 1, 7, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (8, 1, 8, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (9, 1, 9, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (10, 1, 10, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (11, 1, 11, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (12, 1, 12, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (13, 1, 13, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (14, 1, 14, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (15, 1, 15, 1, CAST(N'2023-09-11T12:50:48.027' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (31, 1, 16, 1, CAST(N'2023-09-24T07:36:21.870' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (33, 1, 17, 1, CAST(N'2023-10-10T17:29:14.037' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (35, 1, 18, 1, CAST(N'2023-10-11T09:56:31.920' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (37, 1, 19, 1, CAST(N'2023-10-11T10:25:05.020' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1074, 5, 1, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1075, 5, 2, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1076, 5, 3, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1077, 5, 4, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1078, 5, 5, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1079, 5, 6, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1080, 5, 7, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1081, 5, 8, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1082, 5, 9, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1083, 5, 10, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1084, 5, 11, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1085, 5, 12, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1086, 5, 13, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1087, 5, 14, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1088, 5, 15, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1089, 5, 16, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1090, 5, 17, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1091, 5, 18, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1092, 5, 19, 0, CAST(N'2024-02-08T16:02:27.087' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1093, 1, 1018, 0, CAST(N'2024-02-10T19:46:28.630' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1154, 1, 1022, 1, CAST(N'2024-02-22T01:58:59.137' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1176, 12, 1, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1177, 12, 2, 1, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1178, 12, 3, 1, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1179, 12, 4, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1180, 12, 5, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1181, 12, 6, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1182, 12, 7, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1183, 12, 8, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1184, 12, 9, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1185, 12, 10, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1186, 12, 11, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1187, 12, 12, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1188, 12, 13, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1189, 12, 14, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1190, 12, 15, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1191, 12, 16, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1192, 12, 17, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1193, 12, 18, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1194, 12, 19, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1195, 12, 1018, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1196, 12, 1022, 0, CAST(N'2024-02-25T22:42:20.860' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1197, 13, 1, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1198, 13, 2, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1199, 13, 3, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1200, 13, 4, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1201, 13, 5, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1202, 13, 6, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1203, 13, 7, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1204, 13, 8, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1205, 13, 9, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1206, 13, 10, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1207, 13, 11, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1208, 13, 12, 1, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1209, 13, 13, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1210, 13, 14, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1211, 13, 15, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1212, 13, 16, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1213, 13, 17, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1214, 13, 18, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1215, 13, 19, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1216, 13, 1018, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1217, 13, 1022, 0, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERMISOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (8, N'000001', 1, N'Camuflaje', N'los zapatos cambian de color', 10, 1, CAST(N'2023-10-11T13:22:58.133' AS DateTime), 8, 3, 3, 1006, N'C:\Imagenes\Libros', N'8.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (10, N'000002', 2, N'Kater', N'Katerpilllar', 10, 1, CAST(N'2023-10-11T13:55:09.910' AS DateTime), 13, 3, 3, 1, N'C:\Imagenes\Libros', N'10.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1008, N'000003', 3, N'katerpillar de cuero', N'Zapato de ingeniero', 6, 1, CAST(N'2023-11-14T09:17:51.727' AS DateTime), 12, 1, 4, 4, N'C:\Imagenes\Libros', N'1008.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1009, N'000004', 4, N'Zapatillas', N'Zapatillas especiales', 10, 1, CAST(N'2023-11-14T09:18:41.197' AS DateTime), 13, 1, 3, 1, N'C:\Imagenes\Libros', N'1009.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1010, N'000005', 5, N'Katerpillar', N'zapato de trabajo pesado', 10, 1, CAST(N'2023-11-14T09:20:12.280' AS DateTime), 13, 1, 1002, 1, N'C:\Imagenes\Libros', N'1010.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1050, N'000006', 6, N'Katerpiillar', N'Buen calzado', 9, 1, CAST(N'2024-01-19T07:18:53.567' AS DateTime), 13, 1, 4, 1006, N'C:\Imagenes\Libros', N'1050.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1051, N'000007', 7, N'cuero', N'zapato de cuero', 6, 1, CAST(N'2024-01-19T07:23:31.733' AS DateTime), 9, 1, 2, 1, N'C:\Imagenes\Libros', N'2100.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (1063, N'000011', 11, N'zapatillas de salida', N'zapatillas de cuero', 6, 1, CAST(N'2024-01-19T10:07:25.273' AS DateTime), 9, 1, 2, 1, N'C:\Imagenes\Libros', N'1063.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (2113, N'000026', 26, N'sperry', N'zapatos hechos de cuero', 6, 1, CAST(N'2024-02-08T16:07:30.877' AS DateTime), 13, 1, 3, 1, N'C:\Imagenes\Libros', N'2113.jpeg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (2116, N'000027', 27, N'polo', N'si', 6, 1, CAST(N'2024-02-17T12:55:42.820' AS DateTime), 8, 1, 2, 1, N'C:\Imagenes\Libros', N'2116.jpg')
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro], [CodigoMarca], [CodigoEstilo], [IdTalla], [IdColor], [RutaImagen], [NombreImagen]) VALUES (2117, N'000028', 28, N'fashion', N'zapatos comodos', 6, 1, CAST(N'2024-02-25T22:31:09.600' AS DateTime), 8, 1, 2, 1, N'C:\Imagenes\Libros', N'2117.jpeg')
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_BODEGA] ON 

INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (15, 10, 1, CAST(350.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 9, 1, 1, CAST(N'2023-10-11T15:54:30.663' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (1019, 1008, 1, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 31, 1, 1, CAST(N'2023-11-14T09:20:37.613' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3016, 1010, 1, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 15, 1, 1, CAST(N'2024-01-22T10:25:27.253' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3017, 1063, 1, CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 3, 1, 1, CAST(N'2024-01-22T10:25:37.873' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3021, 1050, 1, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 11, 1, 1, CAST(N'2024-01-23T11:35:09.827' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3022, 8, 1, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 5, 1, 1, CAST(N'2024-01-23T11:35:17.657' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (4016, 2113, 1, CAST(300.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 6, 1, 1, CAST(N'2024-02-08T16:09:29.217' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (4023, 1051, 9, CAST(300.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 7, 1, 1, CAST(N'2024-02-14T14:13:00.967' AS DateTime))
INSERT [dbo].[PRODUCTO_BODEGA] ([IdProductoBodega], [IdProducto], [IdBodega], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (4035, 2116, 9, CAST(300.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)), 2, 1, 1, CAST(N'2024-02-17T12:58:09.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO_BODEGA] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON 

INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (3, N'123546848468', N' NIKE', N'89787146', N'Lopea669@gmail.com', N'Diriamba,Carazo', 1, CAST(N'2023-09-11T14:33:18.653' AS DateTime))
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (4, N'45623412312', N' Adidas', N'85663212', N'Lopeaabiel669@gmail.com', N'la virtusd', 1, CAST(N'2023-11-01T12:58:25.230' AS DateTime))
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1004, N'8978745465', N'jordan', N'89755645', N'moises@gmail.com', N'masachapa', 1, CAST(N'2024-02-08T16:11:33.960' AS DateTime))
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1005, N'2332121564618', N'puma', N'89744456', N'Alvar@gmail.com', N'san juan del sur', 1, CAST(N'2024-02-08T16:12:18.340' AS DateTime))
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1006, N'54321', N'puma', N'99999', N'moises@gmail.com', N'unan', 1, CAST(N'2024-02-25T23:02:34.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 

INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'ADMINISTRADOR', 1, CAST(N'2023-09-11T12:50:47.710' AS DateTime))
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'EMPLEADO', 1, CAST(N'2024-02-08T16:02:27.083' AS DateTime))
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (12, N'Asistente', 1, CAST(N'2024-02-25T22:42:20.857' AS DateTime))
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (13, N'caja', 1, CAST(N'2024-02-25T22:59:37.947' AS DateTime))
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] ON 

INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (1, 1, N'Rol', N'Rol', N'Crear', N'fas fa-user-tag', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (2, 1, N'Asignar Permisos', N'Permisos', N'Crear', N'fas fa-user-lock', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (3, 1, N'Usuarios', N'Usuario', N'Crear', N'fas fa-users-cog', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (4, 1, N'Categorias', N'Categoria', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (5, 1, N'Productos', N'Producto', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (6, 2, N'Clientes', N'Cliente', N'Crear', N'fas fa-user-shield', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (7, 3, N'Proveedores', N'Proveedor', N'Crear', N'fas fa-shipping-fast', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (8, 3, N'Asignar producto a Bodegas', N'Producto', N'Asignar', N'fas fa-dolly', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (9, 3, N'Registrar Compra', N'Compra', N'Crear', N'fas fa-cart-arrow-down', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (10, 3, N'Consultar Compra', N'Compra', N'Consultar', N'far fa-list-alt', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (11, 4, N'Bodegas', N'Tienda', N'Crear', N'fas fa-store-alt', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (12, 4, N'Registrar Venta', N'Venta', N'Crear', N'fas fa-cash-register', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (13, 4, N'Consultar Ventas', N'Venta', N'Consultar', N'far fa-clipboard', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (14, 5, N'Productos por Bodega', N'Reporte', N'Producto', N'fas fa-boxes', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (15, 5, N'Ventas', N'Reporte', N'Ventas', N'fas fa-shopping-basket', 1, CAST(N'2023-09-11T12:50:47.927' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (16, 1, N'Marca', N'Marca', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-09-24T07:26:48.063' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (17, 1, N'Colores', N'Color', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-10-10T17:25:48.190' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (18, 1, N'Estilo', N'Estilo', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-10-11T09:55:41.447' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (19, 1, N'Talla', N'Talla', N'Crear', N'far fa-clipboard', 1, CAST(N'2023-10-11T10:24:46.190' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (1018, 6, N'Configuracion', N'Configuracion', N'Index', N'far fa-clipboard', 1, CAST(N'2024-02-10T19:31:51.670' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (1022, 4, N'Devoluciones', N'Devolucion', N'Devoluciones', N'far fa-clipboard', 1, CAST(N'2024-02-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SUBMENU] OFF
GO
SET IDENTITY_INSERT [dbo].[Talla] ON 

INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (2, N'28', 1, CAST(N'2023-10-11T10:23:14.783' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (3, N'40', 1, CAST(N'2023-10-11T10:23:44.537' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (4, N'35', 1, CAST(N'2023-10-11T13:56:46.570' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (1002, N'41', 1, CAST(N'2023-12-20T16:55:20.410' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (2002, N'true', 1, CAST(N'2024-02-22T04:03:59.460' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (2003, N'false', 1, CAST(N'2024-02-22T04:05:14.427' AS DateTime))
INSERT [dbo].[Talla] ([IdTalla], [Nombre], [Activo], [FechaRegistro]) VALUES (2004, N'29', 1, CAST(N'2024-02-22T04:06:21.060' AS DateTime))
SET IDENTITY_INSERT [dbo].[Talla] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdRol], [Activo], [FechaRegistro]) VALUES (1, N'Abiel Urai', N'Lopez Sanchez', N'admin@gmail.com', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, 1, CAST(N'2023-09-11T12:57:00.040' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdRol], [Activo], [FechaRegistro]) VALUES (2, N'Moises', N'Lopez', N'tienda@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 5, 1, CAST(N'2023-09-11T12:57:10.867' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdRol], [Activo], [FechaRegistro]) VALUES (1006, N' Fabian', N'Garcia', N'Alvaro@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 5, 1, CAST(N'2024-01-02T12:43:45.513' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdRol], [Activo], [FechaRegistro]) VALUES (1008, N'Alvaro Fabian', N'Lope', N'Alva@gmail.com', N'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 5, 1, CAST(N'2024-02-17T13:10:44.130' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdRol], [Activo], [FechaRegistro]) VALUES (1009, N'Moise', N'Lope', N'moises@gmail.com', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 13, 1, CAST(N'2024-02-25T22:43:49.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VENTA] ON 

INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (1, N'000001', 1, 1, 11, N'Factura', 1, 1, CAST(1200.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 0, CAST(N'2023-11-09T20:44:27.977' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2, N'000002', 2, 1, 18, N'Factura', 1, 2, CAST(2400.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, CAST(N'2023-11-09T20:45:57.020' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3, N'000003', 3, 2, 11, N'Factura', 1, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(1125.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 0, CAST(N'2023-11-09T21:15:25.410' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (4, N'000004', 4, 1, 19, N'Factura', 1, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:48:32.830' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (5, N'000005', 5, 1, 11, N'Factura', 1, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:52:44.750' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (6, N'000006', 6, 1, 18, N'Factura', 1, 1, CAST(1100.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T21:54:41.690' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (7, N'000007', 7, 1, 18, N'Factura', 1, 2, CAST(600.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:02:53.630' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (8, N'000008', 8, 1, 18, N'Factura', 1, 2, CAST(600.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-09T22:09:17.950' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (9, N'000009', 9, 1, 18, N'Factura', 1, 3, CAST(3300.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(1700.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:08:28.330' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (10, N'000010', 10, 1, 5, N'Factura', 1, 4, CAST(1200.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 1, CAST(N'2023-11-14T09:10:07.590' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (1002, N'000011', 11, 1, 18, N'Factura', 1, 1, CAST(289.36 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(210.64 AS Decimal(18, 2)), 1, CAST(N'2023-11-23T16:50:41.393' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (1003, N'000012', 12, 1, 19, N'Factura', 1, 2, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, CAST(N'2023-12-09T22:38:15.877' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (1004, N'000013', 13, 1, 5, N'Factura', 1, 2, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, CAST(N'2023-12-16T08:32:24.123' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2003, N'000014', 14, 1, 18, N'Factura', 1, 2, CAST(700.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2023-12-20T17:08:29.457' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2004, N'000015', 15, 1, 11, N'Factura', 1, 1, CAST(350.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1650.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:07:55.040' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2005, N'000016', 16, 1, 19, N'Factura', 1, 2, CAST(700.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:08:53.030' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2006, N'000017', 17, 1, 11, N'Factura', 1, 1, CAST(350.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(2650.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:21:32.287' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2007, N'000018', 18, 1, 5, N'Factura', 1, 1, CAST(350.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(2650.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-02T10:25:33.810' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2008, N'000019', 19, 2, 19, N'Factura', 3, 6, CAST(2000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 0, CAST(N'2024-01-02T17:01:18.690' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2009, N'000020', 20, 1, 19, N'Factura', 1, 8, CAST(2400.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, CAST(N'2024-01-15T09:07:14.280' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2010, N'000021', 21, 1, 18, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(2700.00 AS Decimal(18, 2)), 0, CAST(N'2024-01-18T23:54:58.883' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2012, N'000022', 22, 1, 5, N'Factura', 1, 2, CAST(600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:14:50.170' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2013, N'000023', 23, 1, 5, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:42:31.943' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2014, N'000024', 24, 1, 5, N'Factura', 1, 2, CAST(1400.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:52:10.567' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2015, N'000025', 25, 1, 5, N'Factura', 1, 2, CAST(600.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-23T15:55:45.367' AS DateTime), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (2016, N'000026', 26, 1, 5, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(715.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-24T17:56:15.103' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3012, N'000027', 27, 1, 5, N'Factura', 1, 1, CAST(700.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(335.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T11:19:35.877' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3013, N'000028', 28, 2, 5, N'Factura', 1, 1, CAST(700.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(335.00 AS Decimal(18, 2)), 0, CAST(N'2024-01-30T14:24:22.357' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3014, N'000029', 29, 2, 18, N'Factura', 1, 1, CAST(700.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:24:56.723' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3015, N'000030', 30, 2, 5, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(1700.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T14:26:16.357' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3016, N'000031', 31, 1, 5, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(730.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T15:01:17.573' AS DateTime), CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3017, N'000032', 32, 1, 5, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(9620.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-30T17:38:32.687' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3018, N'000033', 33, 1, 1022, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(620.00 AS Decimal(18, 2)), 1, CAST(N'2024-01-31T20:03:46.287' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3019, N'000034', 34, 1, 1027, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(715.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-08T16:38:14.593' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3020, N'000035', 35, 1, 1028, N'Factura', 1, 1, CAST(800.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:52:14.990' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3021, N'000036', 36, 1, 1029, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:54:47.430' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3022, N'000037', 37, 1, 1030, N'Factura', 1, 1, CAST(800.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T16:56:27.650' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3023, N'000038', 38, 1, 1028, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:03:37.747' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3024, N'000039', 39, 1, 1028, N'Factura', 1, 1, CAST(550.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:05:19.273' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3025, N'000040', 40, 1, 1028, N'Factura', 1, 1, CAST(550.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-08T17:06:08.477' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3026, N'000041', 41, 1, 5, N'Factura', 1, 1, CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-12T17:06:30.680' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3027, N'000042', 42, 1, 1031, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-13T17:07:25.820' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3028, N'000043', 43, 1, 1028, N'Factura', 1, 1, CAST(600.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-13T17:04:01.310' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3029, N'000044', 44, 1, 1032, N'Factura', 1, 1, CAST(550.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-14T14:40:25.387' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3033, N'000045', 45, 1, 11, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-15T09:07:18.647' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3034, N'000046', 46, 1, 1032, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(525.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:07:48.197' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3035, N'000047', 47, 1, 1033, N'Factura', 1, 1, CAST(450.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:09:05.467' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3036, N'000048', 48, 1, 1033, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T09:09:33.780' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3037, N'000049', 49, 1, 1033, N'Factura', 1, 2, CAST(800.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-15T10:25:27.653' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3038, N'000050', 50, 1, 1033, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(525.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T12:16:25.700' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3039, N'000051', 51, 1, 18, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(525.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T12:19:48.037' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3040, N'000052', 52, 1, 19, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(899.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T12:31:59.470' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3041, N'000053', 53, 1, 1033, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T21:01:10.017' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3042, N'000054', 54, 1, 1033, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-16T21:01:42.200' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3043, N'000055', 55, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(620.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:52:17.473' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3044, N'000056', 56, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-17T10:53:41.470' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3045, N'000057', 57, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-20T10:55:12.577' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3046, N'000058', 58, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-21T10:56:23.767' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3047, N'000059', 59, 1, 1034, N'Factura', 2, 4, CAST(1600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-21T12:31:47.057' AS DateTime), CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3048, N'000060', 60, 1, 1028, N'Factura', 1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-21T12:59:37.213' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3049, N'000061', 61, 1, 1034, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(175.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-22T13:01:02.287' AS DateTime), CAST(0.15 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3050, N'000062', 62, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-22T01:37:15.657' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3051, N'000063', 63, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-23T13:55:18.410' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3052, N'000064', 64, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-24T13:56:23.967' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3056, N'000065', 65, 1, 1034, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-24T14:32:13.060' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3057, N'000066', 66, 1, 1034, N'Factura', 1, 1, CAST(350.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-24T14:56:22.727' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3058, N'000067', 67, 1, 1034, N'Factura', 1, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T16:24:12.710' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3059, N'000068', 68, 1, 1034, N'Factura', 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-23T16:25:02.277' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3060, N'000069', 69, 1, 1034, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:28:35.787' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3061, N'000070', 70, 1, 1034, N'Factura', 1, 1, CAST(400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), 1, CAST(N'2024-02-25T22:48:48.087' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro], [Descuento]) VALUES (3063, N'000071', 71, 1, 1034, N'Factura', 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2024-02-25T23:06:54.003' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[VENTA] OFF
GO
ALTER TABLE [dbo].[BODEGA] ADD  CONSTRAINT [DF_BODEGA_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[BODEGA] ADD  CONSTRAINT [DF_BODEGA_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Color] ADD  CONSTRAINT [DF_Color_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Color] ADD  CONSTRAINT [DF_Color_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRAS] ADD  CONSTRAINT [DF_COMPRAS_TotalCosto]  DEFAULT ((0)) FOR [TotalCosto]
GO
ALTER TABLE [dbo].[COMPRAS] ADD  CONSTRAINT [DF_COMPRAS_TipoComprobante]  DEFAULT ('Boleta') FOR [TipoComprobante]
GO
ALTER TABLE [dbo].[COMPRAS] ADD  CONSTRAINT [DF_COMPRAS_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[COMPRAS] ADD  CONSTRAINT [DF_COMPRAS_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Devoluciones] ADD  CONSTRAINT [DF_Devoluciones_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Devoluciones] ADD  CONSTRAINT [DF_Devoluciones_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Estilo] ADD  CONSTRAINT [DF_Estilo_Estado]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Estilo] ADD  CONSTRAINT [DF_Estilo_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Marca] ADD  CONSTRAINT [DF_Marca_Estado]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Marca] ADD  CONSTRAINT [DF_Marca_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  CONSTRAINT [DF_PERMISOS_IdSubMenu]  DEFAULT ((4)) FOR [IdSubMenu]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  CONSTRAINT [DF_PERMISOS_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  CONSTRAINT [DF__PERMISOS__FechaR__5535A963]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  CONSTRAINT [DF__PRODUCTO__Activo__5629CD9C]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  CONSTRAINT [DF__PRODUCTO__FechaR__571DF1D5]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  CONSTRAINT [DF_PRODUCTO_NombreImagen]  DEFAULT ('((oee.jpg))') FOR [NombreImagen]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_PrecioUnidadCompra]  DEFAULT ((0)) FOR [PrecioUnidadCompra]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_PrecioUnidadVenta]  DEFAULT ((0)) FOR [PrecioUnidadVenta]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_Iniciado]  DEFAULT ((0)) FOR [Iniciado]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] ADD  CONSTRAINT [DF_PRODUCTO_BODEGA_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Talla] ADD  CONSTRAINT [DF_Talla_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Talla] ADD  CONSTRAINT [DF_Talla_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  CONSTRAINT [DF__VENTA__Activo__6754599E]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[VENTA] ADD  CONSTRAINT [DF__VENTA__FechaRegi__68487DD7]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  CONSTRAINT [DF_VENTA_Descuento]  DEFAULT ((0)) FOR [Descuento]
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_COMPRAS_BODEGA] FOREIGN KEY([IdBodega])
REFERENCES [dbo].[BODEGA] ([IdBodega])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_COMPRAS_BODEGA]
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_COMPRAS_PROVEEDOR] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[PROVEEDOR] ([IdProveedor])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_COMPRAS_PROVEEDOR]
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_COMPRAS_USUARIO] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_COMPRAS_USUARIO]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK__DETALLE_C__IdPro__6E01572D] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] CHECK CONSTRAINT [FK__DETALLE_C__IdPro__6E01572D]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_COMPRA_COMPRAS] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRAS] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] CHECK CONSTRAINT [FK_DETALLE_COMPRA_COMPRAS]
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK__DETALLE_V__IdPro__6EF57B66] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK__DETALLE_V__IdPro__6EF57B66]
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_VENTA] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_VENTA]
GO
ALTER TABLE [dbo].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK_Devoluciones_VENTA] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[Devoluciones] CHECK CONSTRAINT [FK_Devoluciones_VENTA]
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK__PERMISOS__IdRol__70DDC3D8] FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[PERMISOS] CHECK CONSTRAINT [FK__PERMISOS__IdRol__70DDC3D8]
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK__PERMISOS__IdSubM__71D1E811] FOREIGN KEY([IdSubMenu])
REFERENCES [dbo].[SUBMENU] ([IdSubMenu])
GO
ALTER TABLE [dbo].[PERMISOS] CHECK CONSTRAINT [FK__PERMISOS__IdSubM__71D1E811]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK__PRODUCTO__IdCate__72C60C4A] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK__PRODUCTO__IdCate__72C60C4A]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_Color] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Color] ([IdColor])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_Color]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_Estilo] FOREIGN KEY([CodigoEstilo])
REFERENCES [dbo].[Estilo] ([CodigoEstilo])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_Estilo]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_Marca] FOREIGN KEY([CodigoMarca])
REFERENCES [dbo].[Marca] ([CodigoMarca])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_Marca]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_Talla] FOREIGN KEY([IdTalla])
REFERENCES [dbo].[Talla] ([IdTalla])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_PRODUCTO_Talla]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_BODEGA_BODEGA] FOREIGN KEY([IdBodega])
REFERENCES [dbo].[BODEGA] ([IdBodega])
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] CHECK CONSTRAINT [FK_PRODUCTO_BODEGA_BODEGA]
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_BODEGA_PRODUCTO] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO_BODEGA] CHECK CONSTRAINT [FK_PRODUCTO_BODEGA_PRODUCTO]
GO
ALTER TABLE [dbo].[SUBMENU]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([IdMenu])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_CLIENTE] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_CLIENTE]
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_USUARIO] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[VENTA] CHECK CONSTRAINT [FK_VENTA_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarRutaImagen]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizarRutaImagen](
@IdProducto int,
@NombreImagen varchar(500)
)
as
begin
	update PRODUCTO set NombreImagen = @NombreImagen where IdProducto = @IdProducto
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RetornarProductos]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SP_RetornarProductos]
 as
 begin

  declare @fecha_maxima datetime;
  declare @fecha_minimo datetime;

  set @fecha_maxima = ( select MAX(FechaRegistro) from DETALLE_VENTA);

  set @fecha_minimo =  DATEADD(MONTH,-2,@fecha_maxima);
  --vamos a restarle dias a nuestra fecha minima
  set @fecha_minimo =  DATEADD(DAY,- ( day(@fecha_minimo) - 1  )  ,@fecha_minimo);


 --agregamos solo el top 4 y nombre de columnas
  select top 4 p.Nombre[producto],count(p.IdProducto)[cantidad] from DETALLE_VENTA v
 inner join DETALLE_VENTA d on d.IdVenta = v.IdVenta
 inner join producto p on d.IdProducto = p.IdProducto
 where v.FechaRegistro between @fecha_minimo and @fecha_maxima
 group by p.Nombre
 order by count(p.IdProducto) desc
end

GO
/****** Object:  StoredProcedure [dbo].[SP_RetornarVentas]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_RetornarVentas]
 as
 begin
 select convert (date, FechaRegistro) as Dia, COUNT(*) as CantidadTotal from VENTA
  where FechaRegistro >=  DATEADD(day, -5, GETDATE())
  group by convert (date, FechaRegistro)
  order by Dia asc;
 end





GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermisos]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR PERMISOS
create procedure [dbo].[usp_ActualizarPermisos](
@Detalle xml,
@Resultado bit output
)
as
begin
begin try

	BEGIN TRANSACTION
	declare @permisos table(idpermisos int,activo bit)

	insert into @permisos(idpermisos,activo)
	select 
	idpermisos = Node.Data.value('(IdPermisos)[1]','int'),
	activo = Node.Data.value('(Activo)[1]','bit')
	FROM @Detalle.nodes('/DETALLE/PERMISO') Node(Data)

	select * from @permisos

	update p set p.Activo = pe.activo from PERMISOS p
	inner join @permisos pe on pe.idpermisos = p.IdPermisos

	COMMIT
	set @Resultado = 1

end try
begin catch
	ROLLBACK
	set @Resultado = 0
end catch
end


GO
/****** Object:  StoredProcedure [dbo].[usp_CantidadBodegas]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_CantidadBodegas]
as
begin

select  b.Nombre as Bodega, b.Espacio as Capacidad, SUM(pb.Stock) as total from PRODUCTO_BODEGA pb
  
  join Bodega B on b.IdBodega = pb.IdBodega
  group by b.Nombre, b.Espacio;
 
end


select * from BODEGA

  
 
GO
/****** Object:  StoredProcedure [dbo].[usp_Controlardevoluciones]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_Controlardevoluciones](
@IdProducto int,
@Cantidad int,
@Restar bit,
@Resultado bit output)
as
begin
	set @Resultado = 1
	begin try
		if(@Restar = 1)
			update PRODUCTO_BODEGA set Stock = Stock - @Cantidad where IdProducto = @IdProducto and Iniciado = 0
		else
			update PRODUCTO_BODEGA set Stock = Stock + @Cantidad where IdProducto = @IdProducto and Iniciado = 0
	end try
	begin catch
		set @Resultado = 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ControlarStock]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA STOCK PRODUCTO_TIENDA

CREATE PROCEDURE [dbo].[usp_ControlarStock](
@IdProducto int,
@Cantidad int,
@Restar bit,
@Resultado bit output)
as
begin
	set @Resultado = 1
	begin try
		if(@Restar = 1)
			update PRODUCTO_BODEGA set Stock = Stock - @Cantidad where IdProducto = @IdProducto and Iniciado = 1
		else
			update PRODUCTO_BODEGA set Stock = Stock + @Cantidad where IdProducto = @IdProducto and Iniciado = 1
	end try
	begin catch
		set @Resultado = 0
	end catch
end



GO
/****** Object:  StoredProcedure [dbo].[usp_De]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_De](

@Codigo varchar(50),
@Motivo varchar(500),
@Cantidad int,
@Co varchar(50),
@Resultado bit output
)
as
BEGIN
SET @Resultado = 1
   
	DECLARE @IdVenta int;
	select @IdVenta = IdVenta from VENTA where Codigo = @Codigo;

	if @IdVenta is not null 
	begin
	begin transaction;
	insert into Devoluciones(IdVenta,Motivo,CantidadDevuelta,Codigo,Producto)
	values(@IdVenta,@Motivo,@Cantidad,@Codigo,@Co)



	update Venta set 
	Activo = 0
	where IdVenta = @IdVenta;



	update PRODUCTO_BODEGA set Stock = Stock + @Cantidad where IdProducto = @Co;

	commit;
    end 
	else 
	begin 
		SET @Resultado = 0
	end
	end;
GO
/****** Object:  StoredProcedure [dbo].[usp_Dev]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_Dev](
@IdVenta int,
@Motivo varchar(500),
@Cantidad int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	
	 IF EXISTS (SELECT * FROM VENTA WHERE IdVenta = @IdVenta)

		insert into Devoluciones(IdVenta,Motivo,CantidadDevuelta)
		values(@IdVenta,@Motivo,@Cantidad)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_devolucion]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_devolucion](
@IdVenta int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF EXISTS (SELECT * FROM VENTA WHERE IdVenta != @IdVenta)
		
		update VENTA set 
		Activo = @Activo
		where IdVenta = @IdVenta
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCategoria]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA
create procedure [dbo].[usp_EliminarCategoria](
@IdCategoria int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from CATEGORIA c
	inner join PRODUCTO p on c.IdCategoria  = p.IdCategoria
	where c.IdCategoria = @IdCategoria)

		delete from CATEGORIA where IdCategoria = @IdCategoria

	ELSE
		SET @Resultado = 0

end




GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCliente]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CLIENTE
create procedure [dbo].[usp_EliminarCliente](
@IdCliente int,
@Resultado bit output
)
as
begin
	set @Resultado = 1
	begin try
		delete from CLIENTE where IdCliente = @IdCliente

	end try
	begin catch
		set @Resultado = 0
	end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Eliminarcolor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Eliminarcolor](
@IdColor int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from Color a
	inner join PRODUCTO p on a.IdColor  = p.IdColor
	where a.IdColor = @IdColor)

		delete from Color where IdColor = @IdColor

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarEstilo]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_EliminarEstilo](
@CodigoEstilo int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from Estilo e
	inner join PRODUCTO p on e.CodigoEstilo  = p.CodigoEstilo
	where e.CodigoEstilo = @CodigoEstilo)

		delete from Estilo where CodigoEstilo = @CodigoEstilo

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarMarca]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_EliminarMarca](
@IdMarca int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from Marca m
	inner join PRODUCTO p on m.CodigoMarca  = p.CodigoMarca
	where m.CodigoMarca = @IdMarca)

		delete from Marca where CodigoMarca = @IdMarca

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProducto]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO
CREATE procedure [dbo].[usp_EliminarProducto](
@IdProducto int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun producto se encuentre relacionado a una Bodega
	IF not EXISTS (select top 1 * from PRODUCTO_BODEGA PB
INNER JOIN PRODUCTO P ON P.IdProducto = PB.IdProducto
WHERE P.IdProducto = @IdProducto)
		delete from PRODUCTO where IdProducto = @IdProducto

	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProductoTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO_TIENDA
CREATE procedure [dbo].[usp_EliminarProductoTienda](
@IdProductoBodega int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	IF NOT EXISTS (SELECT * FROM PRODUCTO_BODEGA WHERE IdProductoBodega = @IdProductoBodega and Iniciado = 1 )

		delete from PRODUCTO_BODEGA where IdProductoBodega = @IdProductoBodega

	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProveedor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PROVEEDOR
CREATE procedure [dbo].[usp_EliminarProveedor](
@IdProveedor int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	--validamos que ningun proveedor se encuentre asignado a una compra
	IF not EXISTS (select top 1 * from COMPRAS c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
where p.IdProveedor = @IdProveedor)

		delete from PROVEEDOR where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR ROL
create procedure [dbo].[usp_EliminarRol](
@IdRol int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que el rol no se encuentre asignado a algun usuario
	IF not EXISTS (select * from USUARIO u
	inner join ROL r on r.IdRol  = u.IdRol
	where r.IdRol = @IdRol)
	begin	
		delete from PERMISOS where IdRol = @IdRol
		delete from ROL where IdRol = @IdRol
	end
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTalla]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_EliminarTalla](
@IdTalla int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from Talla t
	inner join PRODUCTO p on t.IdTalla  = p.IdTalla
	where t.IdTalla = @IdTalla)

		delete from talla where Idtalla = @Idtalla

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_EliminarTienda](
@IdBodega int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que la tienda no se encuentre asignada a un usuario y una venta
	IF not EXISTS (select * from PRODUCTO_BODEGA p
	inner join BODEGA b on b.IdBodega = p.IdBodega
	where b.IdBodega = @IdBodega)

		delete from BODEGA where IdBodega = @IdBodega

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
CREATE procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun usuario se encuentre relacionado a una tienda
	IF (not EXISTS (select c.* from COMPRAS c 
		inner join USUARIO u on u.IdUsuario = c.IdUsuario 
		where u.IdUsuario = @IdUsuario
		) and 
		not EXISTS (select v.* from VENTA v 
		inner join USUARIO u on u.IdUsuario = v.IdUsuario 
		where u.IdUsuario = @IdUsuario
		)
	)
		delete from USUARIO where IdUsuario = @IdUsuario
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_grafica]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_grafica] 
as
begin

declare @fecha_maxima datetime;
  declare @fecha_minimo datetime;

  set @fecha_maxima = ( select MAX(FechaRegistro) from VENTA);

  set @fecha_minimo =  DATEADD(MONTH,-2,@fecha_maxima);
  --vamos a restarle dias a nuestra fecha minima
  set @fecha_minimo =  DATEADD(DAY,- ( day(@fecha_minimo) - 1  )  ,@fecha_minimo);

  -- select @fecha_maxima;
  -- select @fecha_minimo;
  --agregamos el nombre de mes y los nombres de columnas
select year(FechaRegistro)[Fecha], DATENAME(MONTH,FechaRegistro)[Fecha mes],COUNT(*)[CantidaTotal] 
  from VENTA 
  where FechaRegistro between @fecha_minimo and @fecha_maxima
  group by year(FechaRegistro), MONTH(FechaRegistro),DATENAME(MONTH,FechaRegistro)
  order by year(FechaRegistro), MONTH(FechaRegistro) asc
end


GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

create procedure [dbo].[usp_LoginUsuario](
@Correo varchar(60),
@Clave varchar(100),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where Correo COLLATE Latin1_General_CS_AS = @Correo and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where Correo  COLLATE Latin1_General_CS_AS = @Correo and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCategoria]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[usp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCliente]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR CLIENTE
CREATE PROC [dbo].[usp_ModificarCliente](
@IdCliente int,
@TipoDocumento varchar(100),
@NumeroDocumento varchar(100),
@Nombre varchar(100),
@Direccion varchar(100),
@Telefono varchar(100),
@Activo bit,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE NumeroDocumento = @NumeroDocumento and IdCliente != @IdCliente)
	begin
		update CLIENTE set 
		TipoDocumento = @TipoDocumento,
		NumeroDocumento = @NumeroDocumento,
		Nombre = @Nombre,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdCliente = @IdCliente
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarColor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarColor](
@IdColor int,
@Nombre varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Color WHERE Nombre =@Nombre and IdColor != @IdColor)
		
		update Color set 
		Nombre = @Nombre,
		Activo = @Activo
		where IdColor = @IdColor
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarConfiguracion]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarConfiguracion](
@IdTienda int,
@NombreLocal varchar(60),
@Nombre varchar(60),
@Direccion varchar(60),
@Telefono int,
@Correo varchar(60),
@Linea int,
@Fiscal varchar(60),
@Descripcion varchar(60),
@Ruc varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CONFIGURACION WHERE  IdTienda != @IdTienda)
		
		update CONFIGURACION set 
		NombreLocal = @NombreLocal,
		NombrePropietaria = @Nombre,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Correo = @Correo,
		Lineafija = @Linea,
		NombreFiscal = @Fiscal,
		Descripcion = @Descripcion,
		RUC = @Ruc
		where IdTienda = @IdTienda
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarEstilo]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarEstilo](
@CodigoEstilo int,
@Nombre varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Estilo WHERE Nombre =@Nombre and CodigoEstilo != @CodigoEstilo)
		
		update Estilo set 
		Nombre = @Nombre,
		Activo = @Activo
		where CodigoEstilo = @CodigoEstilo
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarMarca]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarMarca](
@IdMarca int,
@Nombre varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Marca WHERE Nombre =@Nombre and CodigoMarca != @IdMarca)
		
		update Marca set 
		Nombre = @Nombre,
		Activo = @Activo
		where CodigoMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarPrecio]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarPrecio](
@IdProduct int,
@Precio int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF EXISTS (SELECT * FROM PRODUCTO_BODEGA)
		
		update PRODUCTO_BODEGA set 
		PrecioUnidadVenta = @Precio
		where IdProductoBodega = @IdProduct

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProducto]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO
CREATE procedure [dbo].[usp_ModificarProducto](
@IdProducto int,
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@IdMarca int,
@IdEstilo int,
@IdTalla int,
@IdColor int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)) and IdProducto != @IdProducto)
		
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdCategoria = @IdCategoria,
		CodigoMarca = @IdMarca,
		CodigoEstilo = @IdEstilo,
		IdTalla = @IdTalla,
		IdColor = @IdColor,
		Activo = @Activo
		where IdProducto = @IdProducto
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_TIENDA
CREATE procedure [dbo].[usp_ModificarProductoTienda](
@IdProductoBodega int,
@IdProducto varchar(60),
@IdBodega varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_BODEGA WHERE @IdProductoBodega = @IdProductoBodega and Iniciado = 1 )
		
		update PRODUCTO_BODEGA set 
		IdProducto = @IdProducto,
		IdBodega = @IdBodega
		where IdProductoBodega = @IdProductoBodega
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProveedor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PROVEEDOR
create procedure [dbo].[usp_ModificarProveedor](
@IdProveedor int,
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc and IdProveedor != @IdProveedor)
		
		update PROVEEDOR set 
		RUC = @Ruc,
		RazonSocial = @RazonSocial,
		Telefono = @Telefono,
		Correo = @Correo,
		Direccion = @Direccion,
		Activo = @Activo
		where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarRol]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR ROLES
create procedure [dbo].[usp_ModificarRol](
@IdRol int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion =@Descripcion and IdRol != @IdRol)
		
		update ROL set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdRol = @IdRol
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarTalla]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarTalla](
@IdTalla int,
@Nombre varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Talla WHERE Nombre =@Nombre and IdTalla != @IdTalla)
		
		update Talla set 
		Nombre = @Nombre,
		Activo = @Activo
		where IdTalla = @IdTalla
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR TIENDA
CREATE procedure [dbo].[usp_ModificarTienda](
@IdBodega int,
@Nombre varchar(60),
@Capacidad int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM BODEGA WHERE Nombre =@Nombre and IdBodega != @IdBodega)
		
		update BODEGA set 
		nombre = @Nombre,
		espacio = @Capacidad,
		Activo = @Activo
		where IdBodega = @IdBodega

	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR USUARIO
CREATE procedure [dbo].[usp_ModificarUsuario](
@IdUsuario int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Clave varchar(100),
@IdRol int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
		
		update USUARIO set 
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Clave = @Clave,
		IdRol = @IdRol,
		Activo = @Activo
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCategorias]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER CATEGORIA
CREATE PROC [dbo].[usp_ObtenerCategorias]
as
begin
 select IdCategoria,Descripcion,Activo from CATEGORIA
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCliente]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerCliente]
as
begin
  select IdCliente,TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono,Activo from CLIENTE
end



GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerColor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerColor]
as
begin
 select IdColor,Nombre,Activo from Color
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerConfiguracion]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerConfiguracion]
as
begin
 select IdTienda,RUC,NombreLocal,NombrePropietaria,Direccion,Telefono,Correo,Lineafija,NombreFiscal,Descripcion from CONFIGURACION
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleCompra]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE COMPRA
CREATE proc [dbo].[usp_ObtenerDetalleCompra](
@IdCompra int
)
as
begin


select  RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[Codigo],
CONVERT(char(10),c.FechaRegistro,103)[FechaCompra],
CONVERT(decimal(10,2), c.TotalCosto)[TotalCosto],

(select p.RUC,p.RazonSocial from PROVEEDOR P
 where p.IdProveedor = c.IdProveedor
FOR XML PATH (''),TYPE) AS 'DETALLE_PROVEEDOR',

(select B.Nombre from BODEGA B
 where B.IdBodega = c.IdBodega
FOR XML PATH (''),TYPE) AS 'DETALLE_BODEGA',

(select convert(int, dc.Cantidad)[Cantidad],concat(p.Nombre,' - ',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dc.PrecioUnitarioCompra)PrecioUnitarioCompra,
CONVERT(decimal(10,2),dc.TotalCosto)[TotalCosto] 
from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from COMPRAS c
where c.IdCompra =@IdCompra
FOR XML PATH(''), ROOT('DETALLE_COMPRA') 
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE USUARIO
CREATE proc [dbo].[usp_ObtenerDetalleUsuario](
@IdUsuario int
)
as
begin

 select 
*,
(select * from ROL r
 where r.IdRol = up.IdRol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
 (
 select t.NombreMenu,t.Icono,
 (select sm.Nombre[NombreSubMenu],sm.Controlador,sm.Vista,sm.Icono,p.Activo
	 from PERMISOS p
	 inner join ROL r on r.IdRol = p.IdRol
	 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
	 inner join MENU m on m.IdMenu = sm.IdMenu
	 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
	where sm.IdMenu = t.IdMenu
  FOR XML PATH ('SubMenu'),TYPE) AS 'DetalleSubMenu' 

 from (
 select distinct m.Nombre[NombreMenu],m.IdMenu,m.Icono
 from PERMISOS p
 inner join ROL r on r.IdRol = p.IdRol
 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
 inner join MENU m on m.IdMenu = sm.IdMenu
 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
 where p.Activo = 1) t
 FOR XML PATH ('Menu'),TYPE) AS 'DetalleMenu'  
 from USUARIO up
 where UP.IdUsuario = @IdUsuario
 FOR XML PATH(''), ROOT('Usuario')  

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleVenta]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE VENTA
CREATE proc [dbo].[usp_ObtenerDetalleVenta](
@IdVenta int
)
as
begin


select V.TipoDocumento, V.Codigo,
CONVERT(decimal(10,2), V.TotalCosto)[TotalCosto],
CONVERT(decimal(10,2),V.ImporteRecibido)[ImporteRecibido],
CONVERT(decimal(10,2), V.ImporteCambio)[ImporteCambio],
CONVERT(decimal(10,2), V.Descuento)[Descuento],
convert(char(10),v.fechaRegistro,103)[FechaRegistro],
(select u.Nombres,u.Apellidos from USUARIO U
 where U.IdUsuario = v.IdUsuario
FOR XML PATH (''),TYPE) AS 'DETALLE_USUARIO',

(select C.Nombre,C.Direccion,C.NumeroDocumento,C.Telefono from CLIENTE c
 where c.IdCliente = V.IdCliente
FOR XML PATH (''),TYPE) AS 'DETALLE_CLIENTE',

(select dv.Cantidad,concat(p.Nombre,'-',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dv.PrecioUnidad)[PrecioUnidad],
CONVERT(decimal(10,2),dv.ImporteTotal)[ImporteTotal] 
from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
where dv.IdVenta = v.IdVenta
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from VENTA v
where v.IdVenta = @IdVenta
FOR XML PATH(''), ROOT('DETALLE_VENTA') 

end


GO
/****** Object:  StoredProcedure [dbo].[usp_obtenerDev]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE procedure [dbo].[usp_obtenerDev] (
@FechaInicio date,
@FechaFin date
)
as
begin

select convert(char(10),D.FechaRegistro ,103)[FechaDevolucion],Motivo,CantidadDevuelta,D.Codigo,p.Nombre
from Devoluciones D
inner join PRODUCTO p on p.IdProducto = D.Producto
 where 
 CONVERT(date,D.FechaRegistro) between @FechaInicio and @FechaFin 
 
end
 
 --select * from Devoluciones
 --select * from PRODUCTO_BODEGA
 --select * from PRODUCTO
GO
/****** Object:  StoredProcedure [dbo].[usp_Obtenerestilo]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Obtenerestilo]
as
begin
 select CodigoEstilo,Nombre,Activo from Estilo
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaCompra]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER LISTA COMPRA
CREATE procedure [dbo].[usp_ObtenerListaCompra](
@FechaInicio date,
@FechaFin date,
@IdProveedor int = 0 ,
@IdBodega int = 0
)
as
begin
SET DATEFORMAT dmy;
select c.IdCompra,RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[NumeroCompra], p.RazonSocial,b.Nombre,
convert(char(10),c.FechaRegistro,103)[FechaCompra],c.TotalCosto from COMPRAS c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
inner join BODEGA b on b.IdBodega = c.IdBodega
where 
CONVERT(date,c.FechaRegistro) between @FechaInicio and @FechaFin and
p.IdProveedor = iif(@IdProveedor = 0,p.IdProveedor,@IdProveedor) and
b.IdBodega =iif(@IdBodega = 0,b.IdBodega,@IdBodega) 

end





GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaVenta]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

CREATE procedure [dbo].[usp_ObtenerListaVenta](
@Codigo varchar(50) = '',
@FechaInicio date,
@FechaFin date,
@NumeroDocumento varchar(50) = '',
@Nombre varchar(100) = ''
)
as
begin
SET DATEFORMAT dmy;
select v.IdVenta, v.TipoDocumento,v.Codigo,v.FechaRegistro,c.NumeroDocumento,c.Nombre,v.TotalCosto,v.Activo from VENTA v 
inner join CLIENTE c on c.IdCliente = v.IdCliente
where 
v.Codigo = iif(@Codigo='',v.Codigo,@Codigo) and
CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin and
c.NumeroDocumento like CONCAT('%',@NumeroDocumento,'%') and
c.Nombre like CONCAT('%',@Nombre,'%')

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerMarca]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerMarca]
as
begin
 select CodigoMarca,Nombre,Activo from Marca
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPermisos]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER PERMISOS
create procedure [dbo].[usp_ObtenerPermisos](
@IdRol int)
as
begin
select p.IdPermisos,m.Nombre[Menu],sm.Nombre[SubMenu],p.Activo from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
inner join MENU m on m.IdMenu = sm.IdMenu
where p.IdRol = @IdRol
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductos]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEMIENTO PARA OBTENER PRODUCTO
CREATE PROC [dbo].[usp_ObtenerProductos]
as
begin
 select IdProducto,Codigo,ValorCodigo,p.Nombre,p.RutaImagen,p.NombreImagen,p.Descripcion[DescripcionProducto],
 p.IdCategoria,p.Activo,c.Descripcion[DescripcionCategoria],
 p.CodigoMarca,p.Activo,m.Nombre[DescripcionMarca],
 p.CodigoEstilo,p.Activo,e.Nombre[NombreEstilo],
 p.IdTalla,p.Activo,t.Nombre[DescripcionTalla],
  p.IdColor,p.Activo,a.Nombre[DescripcionColor]

 from PRODUCTO p
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
 inner join Marca m on m.CodigoMarca = p.CodigoMarca
 inner join Estilo e on e.CodigoEstilo = p.CodigoEstilo
 inner join Talla t on t.IdTalla = p.IdTalla
 inner join Color a on a.IdColor = p.IdColor
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductoTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************* PRODUCTO_TIENDA **************************/


--PROCEDMIENTO PARA OBTENER PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_ObtenerProductoTienda]
as
begin
 select pb.IdProductoBodega,p.IdProducto,p.Codigo[CodigoProducto], p.Nombre[NombreProducto],p.Descripcion[DescripcionProducto],p.RutaImagen[RutaImage],p.NombreImagen[NombreImage],
 c.Descripcion[DescripcionCategoria],m.nombre[DescripcionMarca],e.Nombre[NombreEstilo],t.Nombre[DescripcionTalla],a.Nombre[DescripcionColor],
 b.IdBodega,b.Nombre[NombreTienda],pb.PrecioUnidadCompra,pb.PrecioUnidadVenta,pb.Stock,pb.Iniciado
 
 from PRODUCTO_BODEGA pb
 inner join PRODUCTO p on p.IdProducto = pb.IdProducto
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
 inner join Marca m on m.CodigoMarca = p.CodigoMarca
 inner join Estilo e on e.CodigoEstilo = p.CodigoEstilo
 inner join Talla t on t.IdTalla = p.IdTalla
 inner join Color a on a.IdColor = p.IdColor
 inner join BODEGA b on b.IdBodega = pb.IdBodega
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProveedores]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER PROVEEDORES
CREATE PROC [dbo].[usp_ObtenerProveedores]
as
begin
 select IdProveedor,RUC,RazonSocial,Telefono,Correo,Direccion,Activo from PROVEEDOR
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRoles]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER ROLES
CREATE PROC [dbo].[usp_ObtenerRoles]
as
begin
 select IdRol, Descripcion,Activo from ROL
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerTalla]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerTalla]
as
begin
 select IdTalla,Nombre,Activo from Talla
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER TIENDAS
CREATE PROC [dbo].[usp_ObtenerTienda]
as
begin
 select IdBodega,Nombre,espacio,Activo from BODEGA
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerUsuario]
as
begin
 select u.IdUsuario,u.Nombres,u.Apellidos,u.Correo,u.Clave,u.IdRol,u.Activo,u.FechaRegistro,r.Descripcion[DescripcionRol],u.Activo from USUARIO u
 inner join ROL r on r.IdRol = u.IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ProductosDañados]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from PRODUCTO_BODEGA

create procedure [dbo].[usp_ProductosDañados](
@IdProductoBodega int,
@stock int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_BODEGA WHERE IdProductoBodega = @IdProductoBodega and Iniciado = 0 )
		
		update PRODUCTO_BODEGA set 
		Stock = @stock
		where IdProductoBodega = @IdProductoBodega
	ELSE
		SET @Resultado = 0

end

	IF not  EXISTS (SELECT * FROM PRODUCTO_BODEGA WHERE IdProductoBodega = 4026 and Iniciado = 0 )
		
		update PRODUCTO_BODEGA set 
		Stock = 2
		where IdProductoBodega = 4026
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCategoria]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[usp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCliente]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CLIENTE
CREATE PROC [dbo].[usp_RegistrarCliente](
@TipoDocumento varchar(100),
@NumeroDocumento varchar(100),
@Nombre varchar(100),
@Direccion varchar(100),
@Telefono varchar(100),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE NumeroDocumento = @NumeroDocumento)
	begin
		insert into cliente(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono) values
		(@TipoDocumento,@NumeroDocumento,@Nombre,@Direccion,@Telefono)
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarColor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RegistrarColor](
@Nombre varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Color WHERE Nombre = @Nombre)

		insert into Color(Nombre) values (
		@Nombre
		)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCompra]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* COMPRA **************************/

--PROCEDIMIENTO PARA REGITRAR COMPRA
CREATE procedure [dbo].[usp_RegistrarCompra](
@Detalle xml,
@Resultado bit output
)
as
begin


begin try

	BEGIN TRANSACTION

	declare @compra table(idusuario int,idproveedor int,idbodega int,totalcosto decimal(18,2))
	declare @detallecompra table(idcompra int,idproducto int,cantidad int,preciounidadcompra decimal(18,2),preciounidadventa decimal(18,2),totalcosto decimal(18,2))
	declare @tiendaproducto table(idbodega int,idproducto int,cantidad int,preciounidadcompra decimal(18,2),preciounidadventa decimal(18,2),totalcosto decimal(18,2))

	 insert into @compra(idusuario,idproveedor,idbodega,totalcosto)
	 select 
	 IdUsuario = Node.Data.value('(IdUsuario)[1]','int'),
	 IdProveedor = Node.Data.value('(IdProveedor)[1]','int'),
	 IdBodega = Node.Data.value('(IdBodega)[1]','int'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)')
	 FROM @Detalle.nodes('/DETALLE/COMPRA') Node(Data)
 
	 insert into @detallecompra(idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select 
	 IdCompra = Node.Data.value('(IdCompra)[1]','int'),
	 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
	 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
	 PrecioUnidadCompra = Node.Data.value('(PrecioUnidadCompra)[1]','decimal(18,2)'),
	 PrecioUnidadVenta = Node.Data.value('(PrecioUnidadVenta)[1]','decimal(18,2)'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)')
	 FROM @Detalle.nodes('/DETALLE/DETALLE_COMPRA/DETALLE') Node(Data)

	 insert into @tiendaproducto(idbodega,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select
	 (select top 1 idbodega from @compra),
	 idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto
	 from @detallecompra


	 --******************* AREA DE TRABAJO *************************
	 declare @IdCompra int = 0

	 insert into COMPRAS(IdUsuario,IdProveedor,IdBodega,TotalCosto)
	 select idusuario,idproveedor,idbodega,totalcosto from @compra

	 set @IdCompra = Scope_identity()
	 update @detallecompra set idcompra = @IdCompra

	 insert into DETALLE_COMPRA(IdCompra,IdProducto,Cantidad,PrecioUnitarioCompra,PrecioUnitarioVenta,TotalCosto)
	 select idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto from @detallecompra

	 update pt set 
	 pt.PrecioUnidadCompra = tp.preciounidadcompra, 
	 pt.PrecioUnidadVenta = tp.preciounidadventa,
	 pt.Stock = pt.Stock + tp.cantidad,
	 pt.Iniciado = 1
	 from PRODUCTO_BODEGA pt
	 inner join @tiendaproducto tp on tp.idbodega = pt.IdBodega and tp.idproducto = pt.IdProducto

	 COMMIT
	 set @Resultado = 1

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end




GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEstilo]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[usp_RegistrarEstilo](
@Nombre varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Estilo WHERE Nombre = @Nombre)

		insert into Estilo(Nombre) values (
		@Nombre
		)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarMarca]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[usp_RegistrarMarca](
@Nombre varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Marca WHERE Nombre = @Nombre)

		insert into Marca(Nombre) values (
		@Nombre
		)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProducto]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR PRODUCTO
CREATE PROC [dbo].[usp_RegistrarProducto](
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@IdMarca int,
@IdEstilo int,
@IdTalla int,
@IdColor int,
@ruta varchar(300),
@imagen varchar(300),
@Resultado int output
)as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)))
	begin
		insert into PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria,CodigoMarca,CodigoEstilo,IdTalla,IdColor,RutaImagen,NombreImagen) values (
		RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),@Nombre,@Descripcion,@IdCategoria,
		@IdMarca,@IdEstilo,@IdTalla,@IdColor,@ruta,@imagen
		)
	
		SET @Resultado = scope_identity()
	
end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProductoTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_RegistrarProductoTienda](
@IdProducto int,
@IdBodega int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_BODEGA WHERE IdProducto = @IdProducto)

		insert into PRODUCTO_BODEGA(IdProducto,IdBodega) values (
		@IdProducto,@IdBodega
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProveedor]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PROVEEDOR
CREATE PROC [dbo].[usp_RegistrarProveedor](
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc)

		insert into PROVEEDOR(RUC,RazonSocial,Telefono,Correo,Direccion)
		values(@Ruc,@RazonSocial,@Telefono,@Correo,@Direccion)

	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTalla]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RegistrarTalla](
@Nombre varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM Talla WHERE Nombre = @Nombre)

		insert into Talla(Nombre) values (
		@Nombre
		)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR TIENDA
CREATE PROC [dbo].[usp_RegistrarTienda]
(
@Nombre varchar(50),
@Capacidad int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM BODEGA WHERE Nombre = @Nombre)

		insert into BODEGA(Nombre,Espacio) values (
		@Nombre,@Capacidad
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Clave varchar(100),
@IdRol int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)

		insert into USUARIO(Nombres,Apellidos,Correo,Clave,IdRol) values (
		@Nombres,@Apellidos,@Correo,@Clave,@IdRol
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVenta]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* VENTA **************************/

--PROCEDIMIENTO PARA REGITRAR VENTA
CREATE procedure [dbo].[usp_RegistrarVenta](
@Detalle xml,
@Resultado int output
)
as
begin


begin try

	BEGIN TRANSACTION
	
	declare @cliente table (tipodocumento varchar(50),numerodocumento varchar(50),nombre varchar(100),direccion varchar(100),telefono varchar(50))
	declare @venta table (idusuario int,idcliente int default 0,tipodocumento varchar(50),cantidadproducto int,cantidadtotal int,totalcosto decimal(18,2),importerecibido decimal(18,2),importecambio decimal(18,2),Descuento decimal(18,2))
	declare @detalleventa table (idventa int,idproducto int,cantidad int,preciounidad decimal(18,2),importetotal decimal(18,2))

	insert into @cliente(tipodocumento,numerodocumento,nombre,direccion,telefono)
		 select 
		 tipodocumento = Node.Data.value('(TipoDocumento)[1]','varchar(50)'),
		 numerodocumento = Node.Data.value('(NumeroDocumento)[1]','varchar(50)'),
		 nombre = Node.Data.value('(Nombre)[1]','varchar(100)'),
		 direccion = Node.Data.value('(Direccion)[1]','varchar(100)'),
		 telefono = Node.Data.value('(Telefono)[1]','varchar(50)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_CLIENTE/DATOS') Node(Data)

	insert into @venta(idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,Descuento)
	select 
		 IdUsuario = Node.Data.value('(IdUsuario)[1]','varchar(50)'),
		 IdCliente = Node.Data.value('(IdCliente)[1]','varchar(100)'),
		 TipoDocumento = Node.Data.value('(TipoDocumento)[1]','varchar(100)'),
		 CantidadProducto = Node.Data.value('(CantidadProducto)[1]','varchar(50)'),
		 CantidadTotal = Node.Data.value('(CantidadTotal)[1]','varchar(50)'),
		 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)'),
		 ImporteRecibido = Node.Data.value('(ImporteRecibido)[1]','decimal(18,2)'),
		 ImporteCambio = Node.Data.value('(ImporteCambio)[1]','decimal(18,2)'),
		 Descuento = Node.Data.value('(Descuento)[1]','decimal(18,2)')
		 FROM @Detalle.nodes('/DETALLE/VENTA') Node(Data)

	insert into @detalleventa(idventa,idproducto,cantidad,preciounidad,importetotal)
		 select 
		 IdVenta = Node.Data.value('(IdVenta)[1]','int'),
		 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
		 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
		 PrecioUnidad = Node.Data.value('(PrecioUnidad)[1]','decimal(18,2)'),
		 ImporteTotal = Node.Data.value('(ImporteTotal)[1]','decimal(18,2)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_VENTA/DATOS') Node(Data)

	--******************* AREA DE TRABAJO *************************
	declare @identity as table(ID int)

	if not exists(select * from CLIENTE where numeroDocumento = (select numerodocumento from @cliente))
	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente
	else 
	 insert into @identity(ID)
	 select IdCliente from CLIENTE where numeroDocumento = (select numerodocumento from @cliente)

	update @venta set idcliente = (select ID from @identity)
	delete from @identity

	insert into VENTA(Codigo,ValorCodigo,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal,TotalCosto,ImporteRecibido,ImporteCambio,Descuento)
	output inserted.IdVenta into @identity
	select 
	RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTA) ),6),
	(select isnull(max(ValorCodigo),0) + 1 from VENTA),
	idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,Descuento
	from @venta

	update @detalleventa set idventa = (select ID from @identity)

	insert into DETALLE_VENTA(IdVenta,IdProducto,Cantidad,PrecioUnidad,ImporteTotal)
	select idventa,idproducto,cantidad,preciounidad,importetotal from @detalleventa


	 COMMIT
	 set @Resultado = (select ID from @identity)

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end


--exec usp_RegistrarVenta
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVentas]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_RegistrarVentas](
@Detalle xml,
@Resultado int output
)
as
begin


begin try

	BEGIN TRANSACTION
	
	declare @cliente table (tipodocumento varchar(50),numerodocumento varchar(50),nombre varchar(100),direccion varchar(100),telefono varchar(50))
	declare @venta table (idusuario int,idcliente int default 0,tipodocumento varchar(50),cantidadproducto int,cantidadtotal int,totalcosto decimal(18,2),importerecibido decimal(18,2),importecambio decimal(18,2),Descuento decimal(18,2))
	declare @detalleventa table (idventa int,idproducto int,cantidad int,preciounidad decimal(18,2),importetotal decimal(18,2))

	insert into @cliente(tipodocumento,numerodocumento,nombre,direccion,telefono)
		 select 
		 tipodocumento = Node.Data.value('(TipoDocumento)[1]','varchar(50)'),
		 numerodocumento = Node.Data.value('(NumeroDocumento)[1]','varchar(50)'),
		 nombre = Node.Data.value('(Nombre)[1]','varchar(100)'),
		 direccion = Node.Data.value('(Direccion)[1]','varchar(100)'),
		 telefono = Node.Data.value('(Telefono)[1]','varchar(50)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_CLIENTE/DATOS') Node(Data)

	insert into @venta(idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,Descuento)
	select 
		 IdUsuario = Node.Data.value('(IdUsuario)[1]','varchar(50)'),
		 IdCliente = Node.Data.value('(IdCliente)[1]','varchar(100)'),
		 TipoDocumento = Node.Data.value('(TipoDocumento)[1]','varchar(100)'),
		 CantidadProducto = Node.Data.value('(CantidadProducto)[1]','varchar(50)'),
		 CantidadTotal = Node.Data.value('(CantidadTotal)[1]','varchar(50)'),
		 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)'),
		 ImporteRecibido = Node.Data.value('(ImporteRecibido)[1]','decimal(18,2)'),
		 ImporteCambio = Node.Data.value('(ImporteCambio)[1]','decimal(18,2)'),
		 Descuento = Node.Data.value('(Descuento)[1]','decimal(18,2)')
		 FROM @Detalle.nodes('/DETALLE/VENTA') Node(Data)

	insert into @detalleventa(idventa,idproducto,cantidad,preciounidad,importetotal)
		 select 
		 IdVenta = Node.Data.value('(IdVenta)[1]','int'),
		 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
		 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
		 PrecioUnidad = Node.Data.value('(PrecioUnidad)[1]','decimal(18,2)'),
		 ImporteTotal = Node.Data.value('(ImporteTotal)[1]','decimal(18,2)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_VENTA/DATOS') Node(Data)

	--******************* AREA DE TRABAJO *************************
	declare @identity as table(ID int)

	if not exists(select * from CLIENTE where numeroDocumento = (select numerodocumento from @cliente))
	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente
	else 
	 insert into @identity(ID)
	 select IdCliente from CLIENTE where numeroDocumento = (select numerodocumento from @cliente)

	update @venta set idcliente = (select ID from @identity)
	delete from @identity

	insert into VENTAS(Codigo,ValorCodigo,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal,TotalCosto,ImporteRecibido,ImporteCambio,Descuento)
	output inserted.IdVenta into @identity
	select 
	RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTAS) ),6),
	(select isnull(max(ValorCodigo),0) + 1 from VENTAS),
	idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,Descuento
	from @venta

	update @detalleventa set idventa = (select ID from @identity)

	insert into DETALLE_VENTA(IdVenta,IdProducto,Cantidad,PrecioUnidad,ImporteTotal)
	select idventa,idproducto,cantidad,preciounidad,importetotal from @detalleventa


	 COMMIT
	 set @Resultado = (select ID from @identity)

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptProductoTienda]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA REPORTE TIENDA PRODUCTO

 CREATE procedure [dbo].[usp_rptProductoTienda](
  @IdBodega int = 0,
 @Codigo varchar(50)
 )
 as
 begin
 select  pb.IdProductoBodega[Id],
 b.Nombre[Nombre Tienda],
 p.Codigo[Codigo Producto],p.Nombre[Nombre Producto],p.Descripcion[Descripcion Producto],c.Descripcion[DescripcionCategoria],m.nombre[DescripcionMarca],e.Nombre[NombreEstilo],t.Nombre[DescripcionTalla],
 a.Nombre[DescripcionColor],
 pb.Stock[Stock en tienda],convert(decimal(10,2),pb.PrecioUnidadCompra)[Precio Compra],convert(decimal(10,2),pb.PrecioUnidadVenta)[PrecioVenta]

 from PRODUCTO_BODEGA pb
 inner join PRODUCTO p on p.IdProducto = pb.IdProducto
 inner join BODEGA b on b.IdBodega = pb.IdBodega
  inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
 inner join Marca m on m.CodigoMarca = p.CodigoMarca
 inner join Estilo e on e.CodigoEstilo = p.CodigoEstilo
 inner join Talla t on t.IdTalla = p.IdTalla
 inner join Color a on a.IdColor = p.IdColor
  where pb.IdBodega = iif(@IdBodega = 0,pb.IdBodega,@IdBodega) and
 p.Codigo like '%' + @Codigo + '%'

 end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptVenta]    Script Date: 05/03/2024 20:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --PROCEDMIENTO PARA REPORTE VENTA

CREATE procedure [dbo].[usp_rptVenta] (
@FechaInicio date,
@FechaFin date
)
as
begin

 select convert(char(10), v.FechaRegistro ,103)[Fecha Venta],v.Codigo[Numero Documento],v.TipoDocumento[Tipo Documento],
 concat(u.Nombres,' ', u.apellidos)[Nombre Empleado],
 v.CantidadTotal[Cantidad Unidades Vendidas],v.CantidadProducto[Cantidad Productos],v.TotalCosto[Total Venta] 
 from VENTA v
 inner join USUARIO u on u.IdUsuario = v.IdUsuario
 where 
 CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin 
 
end




GO
USE [master]
GO
ALTER DATABASE [Tienda_Lucia] SET  READ_WRITE 
GO
