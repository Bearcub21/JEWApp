/****** Object:  Database [jewdb]    Script Date: 16/12/2017 1:45:19 a. m. ******/
CREATE DATABASE [jewdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jewdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\jewdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jewdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\jewdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [jewdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jewdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jewdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jewdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jewdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jewdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jewdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jewdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jewdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jewdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jewdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jewdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jewdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jewdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jewdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jewdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jewdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jewdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jewdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jewdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jewdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jewdb] SET  MULTI_USER 
GO
ALTER DATABASE [jewdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jewdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jewdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jewdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jewdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jewdb] SET QUERY_STORE = OFF
GO
USE [jewdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Table [dbo].[alerta]    Script Date: 16/12/2017 1:45:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alerta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[completado] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 16/12/2017 1:45:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo] [int] NOT NULL,
	[id_tipo_docid] [int] NOT NULL,
	[docid] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](100) NULL,
	[telefono] [nchar](10) NULL,
	[correo] [nvarchar](50) NULL,
	[nac_dia] [tinyint] NULL,
	[nac_mes] [tinyint] NULL,
	[nac_ano] [int] NULL,
 CONSTRAINT [cliente_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente_tipo]    Script Date: 16/12/2017 1:45:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente_tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [cliente_tipo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 16/12/2017 1:45:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_tipo_docid] [int] NOT NULL,
	[docid] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[telefono] [nchar](10) NULL,
	[correo] [nvarchar](50) NOT NULL,
	[password] [binary](64) NOT NULL,
	[salt] [uniqueidentifier] NOT NULL,
 CONSTRAINT [empleado_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
	[fecha_despacho] [datetime] NULL,
 CONSTRAINT [factura_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_detalle]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_detalle](
	[id_factura] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_empleado] [int] NOT NULL,
	[cantidad] [decimal](11, 2) NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[neto] [decimal](11, 2) NOT NULL,
 CONSTRAINT [factura_detalle_pk] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_estado]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [factura_estado_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario](
	[id_producto] [int] NOT NULL,
	[cantidad_disponible] [decimal](11, 2) NOT NULL,
	[cantidad_minima] [decimal](11, 2) NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
 CONSTRAINT [inventario_pk] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id_rol] [int] NOT NULL,
	[id_tarea] [int] NOT NULL,
	[permitido] [tinyint] NOT NULL,
 CONSTRAINT [permiso_pk] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC,
	[id_tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_medida] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_categoria]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_categoria_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_medida]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_medida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [producto_medida_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [rol_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarea]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [tarea_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_docid]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_docid](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [tipo_docid_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_modelo] [int] NOT NULL,
	[ano] [int] NOT NULL,
	[matricula] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculo_marca]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculo_marca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_marca_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculo_modelo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculo_modelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
 CONSTRAINT [vehiculo_modelo_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id], [id_tipo], [id_tipo_docid], [docid], [nombre], [apellido], [direccion], [telefono], [correo], [nac_dia], [nac_mes], [nac_ano]) VALUES (4, 1, 1, N'03100000000', N'Jonathan', N'Estrella', N'Mountain VIew', N'3056307960', N'jestrella04@gmail.com', 4, 12, NULL)
INSERT [dbo].[cliente] ([id], [id_tipo], [id_tipo_docid], [docid], [nombre], [apellido], [direccion], [telefono], [correo], [nac_dia], [nac_mes], [nac_ano]) VALUES (5, 1, 1, N'30100000000', N'Divina', N'Estrella', N'Palo Alto', N'7863056390', N'divina@estre.lla', 12, 9, NULL)
INSERT [dbo].[cliente] ([id], [id_tipo], [id_tipo_docid], [docid], [nombre], [apellido], [direccion], [telefono], [correo], [nac_dia], [nac_mes], [nac_ano]) VALUES (6, 2, 2, N'120000000', N'Bicochito Shop', N'Inc', N'San Francisco', N'3330000000', N'info@tubicochito.com', 30, 12, 1970)
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[cliente_tipo] ON 

INSERT [dbo].[cliente_tipo] ([id], [nombre], [descripcion]) VALUES (1, N'Persona', N'Persona física.')
INSERT [dbo].[cliente_tipo] ([id], [nombre], [descripcion]) VALUES (2, N'Empresa', N'Persona jurídica o comercial.')
SET IDENTITY_INSERT [dbo].[cliente_tipo] OFF
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([id], [id_rol], [id_tipo_docid], [docid], [nombre], [apellido], [telefono], [correo], [password], [salt]) VALUES (1, 1, 1, N'03100000000', N'Jon', N'Estrella', N'8099843907', N'jestrella04@gmail.com', 0xB27BF25F711F0E6B0E1A46B98E2B264267A4A09BABB560C5AE50E10132E3881FD6BE137738AC6F6A832E3B30885AB3F63ABC93F8B2F822229B8C78DBEC023B6B, N'82c13558-c176-44d7-8023-08dda5caf49e')
INSERT [dbo].[empleado] ([id], [id_rol], [id_tipo_docid], [docid], [nombre], [apellido], [telefono], [correo], [password], [salt]) VALUES (2, 1, 1, N'03100000000', N'Ema', N'Simón', N'8090000000', N'emanuelstorres@outlook.com', 0x70471CB613E3B2DA19C7F25632DA5F989F7DC2EE5CE7AEFD593D4940A3EC1A31FE147206DD549BC4D5E5A46C20294741DA2A7AB7EC5D23D155A5D8E065EFBE80, N'888d30bc-ed6d-43b1-bfdc-3b09f0de7553')
INSERT [dbo].[empleado] ([id], [id_rol], [id_tipo_docid], [docid], [nombre], [apellido], [telefono], [correo], [password], [salt]) VALUES (3, 1, 1, N'03100000000', N'Will', N'Gallardo', N'8090000000', N'caretaylali@gmail.com', 0x88B1948973ACFF4583390ED070A6F1F0A0C7CB7C3403F2A7C6947459CF1C1DD9BF982BC2C0E921C1576AE17B1D5409D4D953C668CF4075EA7767589CEDCE6ADE, N'afea85ce-596b-44f1-b531-1ef8cd6c2a39')
INSERT [dbo].[empleado] ([id], [id_rol], [id_tipo_docid], [docid], [nombre], [apellido], [telefono], [correo], [password], [salt]) VALUES (4, 1, 1, N'03100000000', N'Fran', N'Nova', N'8090000000', N'franchescanova2210@gmail.com', 0xC5D7989887F1BE5D41977DDF982837D8A11FA6E352679DB26EDC62456E31498899F0414E413C4C28FA5F94D170B6DDBC2FCCDB928914FF8DC94D83923860DE1D, N'04f41ef4-174f-4108-86b0-e8a3a668df54')
SET IDENTITY_INSERT [dbo].[empleado] OFF
SET IDENTITY_INSERT [dbo].[factura] ON 

INSERT [dbo].[factura] ([id], [id_cliente], [id_estado], [descripcion], [fecha_creacion], [fecha_actualizacion], [fecha_despacho]) VALUES (4, 6, 1, N'Venta de luces.', CAST(N'2017-12-16T00:12:46.860' AS DateTime), NULL, NULL)
INSERT [dbo].[factura] ([id], [id_cliente], [id_estado], [descripcion], [fecha_creacion], [fecha_actualizacion], [fecha_despacho]) VALUES (5, 4, 1, N'Cambio de luces.', CAST(N'2017-12-16T01:05:17.500' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[factura] OFF
INSERT [dbo].[factura_detalle] ([id_factura], [id_producto], [id_vehiculo], [id_empleado], [cantidad], [precio], [neto]) VALUES (4, 4, NULL, 1, CAST(10.00 AS Decimal(11, 2)), CAST(450.00 AS Decimal(11, 2)), CAST(4500.00 AS Decimal(11, 2)))
INSERT [dbo].[factura_detalle] ([id_factura], [id_producto], [id_vehiculo], [id_empleado], [cantidad], [precio], [neto]) VALUES (4, 5, NULL, 1, CAST(5.00 AS Decimal(11, 2)), CAST(670.00 AS Decimal(11, 2)), CAST(3350.00 AS Decimal(11, 2)))
INSERT [dbo].[factura_detalle] ([id_factura], [id_producto], [id_vehiculo], [id_empleado], [cantidad], [precio], [neto]) VALUES (5, 6, NULL, 1, CAST(1.00 AS Decimal(11, 2)), CAST(1000.00 AS Decimal(11, 2)), CAST(1000.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[factura_estado] ON 

INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (1, N'Abierta', N'Factura en proceso.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (2, N'Cancelado', N'Factura cancelada por el cliente o taller.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (3, N'Despachado', N'Productos despachados, pago pendiente.')
INSERT [dbo].[factura_estado] ([id], [nombre], [descripcion]) VALUES (4, N'Completado', N'Factura pagada en su totalidad.')
SET IDENTITY_INSERT [dbo].[factura_estado] OFF
INSERT [dbo].[inventario] ([id_producto], [cantidad_disponible], [cantidad_minima], [precio]) VALUES (4, CAST(35.00 AS Decimal(11, 2)), CAST(1.00 AS Decimal(11, 2)), CAST(450.00 AS Decimal(11, 2)))
INSERT [dbo].[inventario] ([id_producto], [cantidad_disponible], [cantidad_minima], [precio]) VALUES (5, CAST(95.00 AS Decimal(11, 2)), CAST(1.00 AS Decimal(11, 2)), CAST(670.00 AS Decimal(11, 2)))
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 4, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 5, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 6, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 7, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 8, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 9, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 10, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 11, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 12, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 13, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 14, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 15, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 16, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 17, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 18, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 19, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (1, 20, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (2, 4, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 1, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 2, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 3, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (3, 4, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 1, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 2, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 3, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 4, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 5, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 6, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 7, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 8, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 9, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 10, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 11, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 12, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 13, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 14, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 15, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 16, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 17, 0)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 18, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 19, 1)
INSERT [dbo].[permiso] ([id_rol], [id_tarea], [permitido]) VALUES (5, 20, 1)
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([id], [id_categoria], [id_medida], [nombre], [descripcion]) VALUES (4, 2, 1, N'Luces Delanteras (Honda)', N'Luces delanteras para vehículos Honda.')
INSERT [dbo].[producto] ([id], [id_categoria], [id_medida], [nombre], [descripcion]) VALUES (5, 1, 1, N'Luces Delanteras (Toyota)', N'Luces delanteras para Toyota.')
INSERT [dbo].[producto] ([id], [id_categoria], [id_medida], [nombre], [descripcion]) VALUES (6, 1, 1, N'Cambio de Luces (Honda)', N'Servicio de cambio de luces.')
INSERT [dbo].[producto] ([id], [id_categoria], [id_medida], [nombre], [descripcion]) VALUES (7, 1, 1, N'Cambio de Luces (Toyota)', N'Servicio de cambio de luces.')
SET IDENTITY_INSERT [dbo].[producto] OFF
SET IDENTITY_INSERT [dbo].[producto_categoria] ON 

INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (1, N'Servicios', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (2, N'Electricidad', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (3, N'Herramientas Neumáticas', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (4, N'Herramientas para Chapería', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (5, N'Herramientas para Frenos', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (6, N'Herramientas para Lubricentro', NULL)
INSERT [dbo].[producto_categoria] ([id], [nombre], [descripcion]) VALUES (7, N'Instrumental y Medición', NULL)
SET IDENTITY_INSERT [dbo].[producto_categoria] OFF
SET IDENTITY_INSERT [dbo].[producto_medida] ON 

INSERT [dbo].[producto_medida] ([id], [nombre], [descripcion]) VALUES (1, N'Unidad', NULL)
SET IDENTITY_INSERT [dbo].[producto_medida] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (1, N'Administrador', N'Acceso a todas las funciones del sistema.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (2, N'Recepción', N'Acceso a administrar facturas y clientes.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (3, N'Mecánico', N'Acceso a admiinistrar facturas.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (4, N'Intendente', N'Acceso a administrar productos e inventario.')
INSERT [dbo].[rol] ([id], [nombre], [descripcion]) VALUES (5, N'Reportería', N'Reportería y nada más.')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[tarea] ON 

INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (1, N'Ver Factura', N'Ver facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (2, N'Crear Factura', N'Crear facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (3, N'Actualizar Factura', N'Actualizar facturas.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (4, N'Ver Cliente', N'Ver clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (5, N'Crear Cliente', N'Crear clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (6, N'Actualizar Cliente', N'Actualizar clientes.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (7, N'Ver Empleado', N'Ver empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (8, N'Crear Empleado', N'Crear empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (9, N'Actualizar empleado', N'Actualizar empleados.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (10, N'Inventario', N'Administrar inventario de productos')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (11, N'Ver Producto', N'Ver productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (12, N'Crear Producto', N'Crear productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (13, N'Actualizar Producto', N'Actualizar productos.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (14, N'Ver Rol', N'Ver roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (15, N'Crear Rol', N'Crear roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (16, N'Actualizar Rol', N'Actualizar roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (17, N'Eliminar Rol', N'Eliminar roles.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (18, N'Reporte de comisiones', N'Ver reporte de comisiones.')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (19, N'Reporte de cumpleaños', N'Ver reporte de cumpleaños')
INSERT [dbo].[tarea] ([id], [nombre], [descripcion]) VALUES (20, N'Reporte de servicios', N'Ver reporte de comisiones')
SET IDENTITY_INSERT [dbo].[tarea] OFF
SET IDENTITY_INSERT [dbo].[tipo_docid] ON 

INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (1, N'Cédula', N'Cédula de identidad.')
INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (2, N'RNC', N'RNC.')
INSERT [dbo].[tipo_docid] ([id], [nombre], [descripcion]) VALUES (3, N'Pasaporte', N'Pasaporte.')
SET IDENTITY_INSERT [dbo].[tipo_docid] OFF
SET IDENTITY_INSERT [dbo].[vehiculo] ON 

INSERT [dbo].[vehiculo] ([id], [id_cliente], [id_marca], [id_modelo], [ano], [matricula], [descripcion]) VALUES (1, 4, 1, 1, 2006, N'M000000001', N'Honda Civic 2006.')
SET IDENTITY_INSERT [dbo].[vehiculo] OFF
SET IDENTITY_INSERT [dbo].[vehiculo_marca] ON 

INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (1, N'Honda', NULL)
INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (2, N'Toyota', NULL)
INSERT [dbo].[vehiculo_marca] ([id], [nombre], [descripcion]) VALUES (3, N'Hyundai', NULL)
SET IDENTITY_INSERT [dbo].[vehiculo_marca] OFF
SET IDENTITY_INSERT [dbo].[vehiculo_modelo] ON 

INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (1, 1, N'Civic', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (2, 1, N'Accord', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (3, 1, N'CR-V', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (4, 1, N'Logo', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (5, 2, N'Corolla', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (6, 2, N'Camry', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (7, 2, N'Corona', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (8, 2, N'RAV4', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (9, 3, N'Sonata', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (10, 3, N'Santa Fe', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (11, 3, N'Accent', NULL)
INSERT [dbo].[vehiculo_modelo] ([id], [id_marca], [nombre], [descripcion]) VALUES (12, 3, N'Elantra', NULL)
SET IDENTITY_INSERT [dbo].[vehiculo_modelo] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [empleado_correo_uq]    Script Date: 16/12/2017 1:45:20 a. m. ******/
ALTER TABLE [dbo].[empleado] ADD  CONSTRAINT [empleado_correo_uq] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [vehiculo_maricula_uq]    Script Date: 16/12/2017 1:45:20 a. m. ******/
ALTER TABLE [dbo].[vehiculo] ADD  CONSTRAINT [vehiculo_maricula_uq] UNIQUE NONCLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alerta] ADD  CONSTRAINT [DF_alerta_completado]  DEFAULT ((0)) FOR [completado]
GO
ALTER TABLE [dbo].[factura] ADD  CONSTRAINT [df_fecha_creacion]  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[factura_detalle] ADD  DEFAULT ((0)) FOR [neto]
GO
ALTER TABLE [dbo].[alerta]  WITH CHECK ADD  CONSTRAINT [FK_alerta_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[alerta] CHECK CONSTRAINT [FK_alerta_cliente]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_cliente_tipo] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[cliente_tipo] ([id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_cliente_tipo]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_tipo_docid] FOREIGN KEY([id_tipo_docid])
REFERENCES [dbo].[tipo_docid] ([id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_tipo_docid]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_rol]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_tipo_docid] FOREIGN KEY([id_tipo_docid])
REFERENCES [dbo].[tipo_docid] ([id])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_tipo_docid]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_factura_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[factura_estado] ([id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_factura_estado]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_empleado]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_factura] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_factura]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_producto]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_vehiculo] FOREIGN KEY([id_vehiculo])
REFERENCES [dbo].[vehiculo] ([id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_vehiculo]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_producto]
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_permiso_rol]
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_tarea] FOREIGN KEY([id_tarea])
REFERENCES [dbo].[tarea] ([id])
GO
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_permiso_tarea]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_producto_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[producto_categoria] ([id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_producto_categoria]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_producto_medida] FOREIGN KEY([id_medida])
REFERENCES [dbo].[producto_medida] ([id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_producto_medida]
GO
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_cliente]
GO
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_vehiculo_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[vehiculo_marca] ([id])
GO
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_vehiculo_marca]
GO
ALTER TABLE [dbo].[vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_vehiculo_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[vehiculo_modelo] ([id])
GO
ALTER TABLE [dbo].[vehiculo] CHECK CONSTRAINT [FK_vehiculo_vehiculo_modelo]
GO
ALTER TABLE [dbo].[vehiculo_modelo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_modelo_vehiculo_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[vehiculo_marca] ([id])
GO
ALTER TABLE [dbo].[vehiculo_modelo] CHECK CONSTRAINT [FK_vehiculo_modelo_vehiculo_marca]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_factura_detalle]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_delete_factura_detalle]
	@FacturaId [int],
	@ProductoId [int]
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM
		[dbo].[factura_detalle]
	WHERE 
		[id_factura] = @FacturaId AND [id_producto] = @ProductoId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_cliente]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_cliente]
	@TipoId [int],
	@TipoDocId [int],
	@DocId [nvarchar](50),
	@NombreCliente [nvarchar](50),
	@ApellidoCliente [nvarchar](50),
	@DireccionCliente [nvarchar](100),
	@TelefonoCliente [nchar](10),
	@CorreoCliente [nvarchar](50),
	@FechaNacDia [tinyint] = NULL,
	@FechaNacMes [tinyint] = NULL,
	@FechaNacAno [int] = NULL
AS
BEGIN
	INSERT INTO
		[dbo].[cliente]
	(
		[id_tipo],
		[id_tipo_docid],
		[docid],
		[nombre],
		[apellido],
		[direccion],
		[telefono],
		[correo],
		[nac_dia],
		[nac_mes],
		[nac_ano]
	)
	VALUES
	(
		@TipoId,
		@TipoDocId,
		@DocId,
		@NombreCliente,
		@ApellidoCliente,
		@DireccionCliente,
		@TelefonoCliente,
		@CorreoCliente,
		@FechaNacDia,
		@FechaNacMes,
		@FechaNacAno
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_empleado]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_empleado]
	@RolId [int],
	@TipoDocId [int],
	@DocId [nvarchar](50),
	@NombreEmpleado [nvarchar](50),
	@ApellidoEmpleado [nvarchar](50),
	@TelefonoEmpleado [nchar](10),
	@CorreoEmpleado [nvarchar](50),
	@PasswordEmpleado [nvarchar](255)
AS
BEGIN
	DECLARE @Salt UNIQUEIDENTIFIER = NEWID()

	INSERT INTO
		[dbo].[empleado]
	(
		[id_rol],
		[id_tipo_docid],
		[docid],
		[nombre],
		[apellido],
		[telefono],
		[correo],
		[password],
		[salt]
	)
	VALUES
	(
		@RolId,
		@TipoDocId,
		@DocId,
		@NombreEmpleado,
		@ApellidoEmpleado,
		@TelefonoEmpleado,
		@CorreoEmpleado,
		HASHBYTES('SHA2_512', @PasswordEmpleado + CAST(@Salt AS nvarchar(36))),
		@Salt
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_factura]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_factura]
	@ClienteId [int],
	@EstadoId [int],
	@DescrFactura [nvarchar](255),
	@InsertedFacturaId [int] = NULL OUTPUT
AS
BEGIN
	INSERT INTO
		[dbo].[factura]
	(
		[id_cliente],
		[id_estado],
		[descripcion]
	)
	VALUES
	(
		@ClienteId,
		@EstadoId,
		@DescrFactura
	)

	SET @InsertedFacturaId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_factura_detalle]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_factura_detalle]
	@FacturaId [int],
	@ProductoId [int],
	@VehiculoId [int] = NULL,
	@EmpleadoId [int],
	@Cantidad [decimal](11,2),
	@Precio [decimal](11,2)
AS
BEGIN
	INSERT INTO
		[dbo].[factura_detalle]
	(
		[id_factura],
		[id_producto],
		[id_vehiculo],
		[id_empleado],
		[cantidad],
		[precio]
	)
	VALUES
	(
		@FacturaId,
		@ProductoId,
		@VehiculoId,
		@EmpleadoId,
		@Cantidad,
		@Precio
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_permiso]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_permiso]
	@RolId[int],
	@TareaId[int],
	@Permitido [tinyint]
AS
BEGIN
	IF EXISTS(SELECT [id_rol] FROM [dbo].[permiso] WHERE [id_rol] = @RolId AND [id_tarea] = @TareaId)
	BEGIN
		UPDATE
			[dbo].[permiso]
		SET
			[permitido] = @Permitido
		WHERE
			[id_rol] = @RolId AND [id_tarea] = @TareaId
	END

	ELSE
	BEGIN
		INSERT INTO
			[dbo].[permiso]
		(
			[id_rol],
			[id_tarea],
			[permitido]
		)
		VALUES
		(
			@RolId,
			@TareaId,
			@Permitido
		)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_producto]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_producto]
	@CategoriaId [int],
	@MedidaId [int],
	@NombreProducto [nvarchar](50),
	@DescrProducto [nvarchar](255)
AS
BEGIN
	INSERT INTO
		[dbo].[producto]
	(
		[id_categoria],
		[id_medida],
		[nombre],
		[descripcion]
	)
	VALUES
	(
		@CategoriaId,
		@MedidaId,
		@NombreProducto,
		@DescrProducto
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_producto_inventario]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_producto_inventario]
	@ProductoId[int] = NULL,
	@CantidadDisponible[decimal](11,2),
	@CantidadMinima[decimal](11,2),
	@Precio[decimal](11,2)
AS
BEGIN
	IF EXISTS(SELECT [id_producto] FROM [dbo].[inventario] WHERE [id_producto] = @ProductoId)
	BEGIN
		UPDATE
			[dbo].[inventario]
		SET
			[cantidad_disponible] = @CantidadDisponible,
			[cantidad_minima] = @CantidadMinima,
			[precio] = @Precio
		WHERE
			[id_producto] = @ProductoId
	END

	ELSE
	BEGIN
		INSERT INTO
			[dbo].[inventario]
		(
			[id_producto],
			[cantidad_disponible],
			[cantidad_minima],
			[precio]
		)
		VALUES
		(
			@ProductoId,
			@CantidadDisponible,
			@CantidadMinima,
			@Precio
		)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_rol]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_rol]
	@RolNombre [nvarchar](50),
	@RolDescr [nvarchar](255),
	@InsertedRolId [int] = NULL OUTPUT
AS
BEGIN
	INSERT INTO
		[dbo].[rol]
	(
		[nombre],
		[descripcion]
	)
	VALUES
	(
		@RolNombre,
		@RolDescr
	)

	SET @InsertedRolId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_vehiculo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insert_vehiculo]
	@ClienteId [int],
	@MarcaId [int],
	@ModeloId[int],
	@AnoVehiculo [int],
	@MatriculaVehiculo [nvarchar](50),
	@DescrVehiculo [nvarchar](255)
AS
BEGIN
	INSERT INTO
		[dbo].[vehiculo]
	(
		[id_cliente],
		[id_marca],
		[id_modelo],
		[ano],
		[matricula],
		[descripcion]
	)
	VALUES
	(
		@ClienteId,
		@MarcaId,
		@ModeloId,
		@AnoVehiculo,
		@MatriculaVehiculo,
		@DescrVehiculo
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_cliente]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_cliente]
	@ClienteId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_tipo],
		(SELECT [nombre] FROM [dbo].[cliente_tipo] WHERE [cliente_tipo].[id] = [cliente].[id_tipo]) AS nombre_tipo,
		[id_tipo_docid],
		(SELECT [nombre] FROM [dbo].[tipo_docid] WHERE [tipo_docid].[id] = [cliente].[id_tipo_docid]) AS nombre_docid,
		[docid],
		[nombre],
		[apellido],
		CONCAT_WS(' ', [nombre], [apellido]) AS nombre_completo,
		[direccion],
		[telefono],
		[correo],
		[nac_dia],
		[nac_mes],
		[nac_ano]
	FROM
		[dbo].[cliente]
	WHERE
	(
		@ClienteId is NULL OR [id] = @ClienteId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_cliente_tipo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_cliente_tipo]
	@ClienteId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[cliente_tipo]
	WHERE
	(
		@ClienteId is NULL OR [id] = @ClienteId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_empleado]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_empleado]
	@EmpleadoId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_rol],
		(SELECT [nombre] FROM [dbo].[rol] WHERE [rol].[id] = [empleado].[id_rol]) AS nombre_rol,
		[id_tipo_docid],
		(SELECT [nombre] FROM [dbo].[tipo_docid] WHERE [tipo_docid].[id] = [empleado].[id_tipo_docid]) AS nombre_docid,
		[docid],
		[nombre],
		[apellido],
		CONCAT_WS(' ', [nombre], [apellido]) AS nombre_completo,
		[telefono],
		[correo],
		[password]
	FROM
		[dbo].[empleado]
	WHERE
	(
		@EmpleadoId is NULL OR [id] = @EmpleadoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_factura]
	@FacturaId[int] = NULL
	--@FechaIni [datetime],
	--@FechaFin [datetime]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_cliente],
		(SELECT CONCAT_WS( ' ', [nombre], [apellido]) FROM [dbo].[cliente] WHERE [cliente].[id] = [factura].[id_cliente]) AS nombre_cliente,
		[id_estado],
		(SELECT [nombre] FROM [dbo].[cliente_tipo] WHERE [cliente_tipo].[id] = [factura].[id_estado]) AS nombre_estado,
		[descripcion],
		[fecha_creacion],
		[fecha_actualizacion],
		[fecha_despacho],
		(SELECT SUM([cantidad]) FROM [dbo].[factura_detalle] WHERE [factura_detalle].[id_factura] = [factura].[id]) AS items,
		(SELECT SUM([neto]) FROM [dbo].[factura_detalle] WHERE [factura_detalle].[id_factura] = [factura].[id]) AS neto
	FROM
		[dbo].[factura]
	WHERE
	(
		--[factura].[fecha_creacion] >= @FechaIni AND [factura].[fecha_creacion] <= @FechaFin
		@FacturaId is NULL OR [id] = @FacturaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura_detalle]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_factura_detalle]
	@FacturaId [int]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_factura],
		[id_producto],
		(SELECT [nombre] FROM [dbo].[producto] WHERE [producto].[id] = [factura_detalle].[id_producto]) AS nombre_producto,
		[id_vehiculo],
		[id_empleado],
		(SELECT CONCAT_WS(' ', [empleado].[nombre], [empleado].[apellido]) FROM [dbo].[empleado] WHERE [empleado].[id] = [id_empleado]) AS nombre_empleado,
		[cantidad],
		[precio],
		[neto]
	FROM
		[dbo].[factura_detalle]
	WHERE
		[id_factura] = @FacturaId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_factura_estado]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_factura_estado]
	@EstadoId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[factura_estado]
	WHERE
	(
		@EstadoId is NULL OR [id] = @EstadoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_inventario]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_inventario]
	@ProductoId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_producto],
		(SELECT [nombre] FROM [dbo].[producto] WHERE [producto].[id] = [inventario].[id_producto]) AS nombre_producto,
		[cantidad_disponible],
		[cantidad_minima],
		[precio]
	FROM
		[dbo].[inventario]
	WHERE
	(
		@ProductoId is NULL OR [id_producto] = @ProductoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_permiso]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_permiso]
	@RolId [int],
	@SelectAll [int] = NULL 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id_tarea],
		(SELECT LOWER([nombre]) FROM [dbo].[tarea] WHERE [tarea].[id] = [permiso].[id_tarea]) AS nombre_tarea,
		[permitido]
    FROM
		[dbo].[permiso]
    WHERE
		(@SelectAll IS NOT NULL OR [permitido] > 0)
	AND
		[id_rol] = @RolId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_producto]
	@ProductoId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_categoria],
		(SELECT [nombre] FROM [dbo].[producto_categoria] WHERE [producto_categoria].[id] = [producto].[id_categoria]) AS nombre_categoria,
		[id_medida],
		(SELECT [nombre] FROM [dbo].[producto_medida] WHERE [producto_medida].[id] = [producto].[id_medida]) AS nombre_medida,
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto]
	WHERE
	(
		@ProductoId is NULL OR [id] = @ProductoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto_categoria]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_producto_categoria]
	@CategoriaId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto_categoria]
	WHERE
	(
		@CategoriaId is NULL OR [id] = @CategoriaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_producto_medida]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_producto_medida]
	@MedidaId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[producto_medida]
	WHERE
	(
		@MedidaId is NULL OR [id] = @MedidaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_reporte_comisiones]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_reporte_comisiones]
	@FechaIni[date],
	@FechaFin[date]
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT [id] FROM [dbo].[factura] WHERE [fecha_creacion] BETWEEN @FechaIni AND @FechaFin)
	BEGIN
		SELECT
			[id_empleado],
			(SELECT CONCAT_WS(' ', [nombre], [apellido]) FROM [dbo].[empleado] WHERE [empleado].[id] = [factura_detalle].[id_empleado]) AS nombre_empleado,
			SUM([neto]) AS neto,
			(SUM([neto]) * 0.20) AS comision
		FROM
			[dbo].[factura_detalle]
		GROUP BY
			[id_empleado]
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_reporte_cumpleanos]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_reporte_cumpleanos]
	@FechaIni[date],
	@FechaFin[date]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_tipo],
		(SELECT [nombre] FROM [dbo].[cliente_tipo] WHERE [cliente_tipo].[id] = [cliente].[id_tipo]) AS nombre_tipo,
		[nombre],
		[apellido],
		CONCAT_WS(' ', [nombre], [apellido]) AS nombre_completo,
		[correo],
		(DATENAME(month, DATEADD(month, [nac_mes], CAST('1970-12-01' AS DATETIME)))) AS mes,
		[nac_dia]
	FROM
		[dbo].[cliente]
	WHERE
		[nac_mes] IS NOT NULL
		AND [nac_dia] iS NOT NULL
		AND [nac_dia] BETWEEN DATEPART(DAY, @FechaIni)
		AND DATEPART(DAY, @FechaFin)
		AND [nac_mes] BETWEEN datepart(MONTH, @FechaIni)
		AND DATEPART(MONTH, @FechaFin)
	ORDER BY
		[nac_mes] ASC, [nac_dia] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_reporte_servicios]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_reporte_servicios]
	@FechaIni[date],
	@FechaFin[date]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[factura].[id] AS id_factura,
		[factura].[id_cliente] AS id_cliente,
		(SELECT CONCAT_WS(' ', [nombre], [apellido]) FROM [dbo].[cliente] WHERE [cliente].[id] = [factura].[id]) AS nombre_cliente,
		[factura_detalle].[id_producto] AS id_producto,
		(SELECT [nombre] FROM [dbo].[producto] WHERE [producto].[id] = [factura_detalle].[id_producto]) AS servicio,
		(SELECT [descripcion] FROM [dbo].[vehiculo] WHERE [vehiculo].[id] = [factura_detalle].[id_vehiculo]) AS nombre_vehiculo,
		[factura_detalle].[id_empleado] AS id_empleado,
		(SELECT CONCAT_WS(' ', [nombre], [apellido]) FROM [dbo].[empleado] WHERE [empleado].[id] = [factura_detalle].[id_empleado]) AS nombre_empleado,
		[factura_detalle].[cantidad] AS cantidad,
		[factura_detalle].[neto] AS neto
	FROM
		[dbo].[factura_detalle]
	LEFT JOIN
		[dbo].[factura]
	ON
		[factura_detalle].[id_factura] = [factura].[id]
	LEFT JOIN
		[dbo].[producto]
	ON
		[factura_detalle].[id_producto] = [producto].[id]
	WHERE
		[producto].[id_categoria] = 1
		AND [factura].[fecha_creacion] BETWEEN @FechaIni AND @FechaFin
		AND [factura].[id] IS NOT NULL
		AND [factura_detalle].[id_producto] IS NOT NULL
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_rol]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_rol]
	@RolId[int] = NULL
AS
BEGIN  
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[rol]
	WHERE
	(
		@RolId is NULL OR [id] = @RolId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tarea]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_tarea]
	@TareaId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[tarea]
	WHERE
	(
		@TareaId is NULL OR [id] = @TareaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tipo_docid]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_tipo_docid]
	@DocId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[tipo_docid]
	WHERE
	(
		@DocId is NULL OR [id] = @DocId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_vehiculo]
	@VehiculoId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[descripcion] AS nombre,
		[id_cliente],
		(SELECT CONCAT_WS( ' ', [nombre], [apellido]) FROM [dbo].[cliente] WHERE [cliente].[id] = [vehiculo].[id_cliente]) AS nombre_cliente,
		[id_marca],
		(SELECT [nombre] FROM [dbo].[vehiculo_marca] WHERE [vehiculo_marca].[id] = [vehiculo].[id_marca]) AS nombre_marca,
		[id_modelo],
		(SELECT [nombre] FROM [dbo].[vehiculo_modelo] WHERE [vehiculo_modelo].[id] = [vehiculo].[id_modelo]) AS nombre_modelo,
		[ano],
		[matricula],
		[descripcion]
	FROM
		[dbo].[vehiculo]
	WHERE
	(
		@VehiculoId is NULL OR [id] = @VehiculoId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo_marca]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_vehiculo_marca]
	@MarcaId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[nombre],
		[descripcion]
	FROM
		[dbo].[vehiculo_marca]
	WHERE
	(
		@MarcaId is NULL OR [id] = @MarcaId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_vehiculo_modelo]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_select_vehiculo_modelo]
	@ModeloId[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[id],
		[id_marca],
		(SELECT [nombre] FROM [dbo].[vehiculo_marca] WHERE [vehiculo_marca].[id] = [vehiculo_modelo].[id]) AS nombre_marca,
		[nombre],
		[descripcion]
	FROM
		[dbo].[vehiculo_modelo]
	WHERE
	(
		@ModeloId is NULL OR [id] = @ModeloId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_verify_empleado_login]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_verify_empleado_login] 
	@LoginEmail nvarchar(50),
	@LoginPassword nvarchar(50),
	@ResponseMessage NVARCHAR(255) = '' OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @userId int

    IF EXISTS (SELECT TOP 1 [id] FROM [dbo].[empleado] WHERE [correo] = @LoginEmail)
    BEGIN
		SET @userId = (SELECT id FROM [dbo].[empleado] WHERE [correo] = @LoginEmail AND [password] = HASHBYTES('SHA2_512', @LoginPassword + CAST([salt] AS nvarchar(36))))

		IF(@userId IS NULL)
			SET @ResponseMessage = 'La contraseña es inválida.'
		ELSE 
			SET @ResponseMessage = 'Credenciales válidas.'
	END
	ELSE
		SET @ResponseMessage = 'Credenciales incorrectas.'
END
GO
/****** Object:  Trigger [dbo].[trg_after_update_factura]    Script Date: 16/12/2017 1:45:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_after_update_factura]
ON [dbo].[factura]
AFTER UPDATE
AS
BEGIN
	UPDATE [dbo].[factura]
	SET [fecha_actualizacion] = GETDATE()
	FROM inserted
	WHERE [factura].[id] = inserted.id;
END
GO
ALTER TABLE [dbo].[factura] ENABLE TRIGGER [trg_after_update_factura]
GO
/****** Object:  Trigger [dbo].[trg_after_insert_factura_detalle]    Script Date: 16/12/2017 1:45:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trg_after_insert_factura_detalle]
   ON  [dbo].[factura_detalle]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [dbo].[factura_detalle]
	SET [neto] = inserted.cantidad * inserted.precio
	FROM inserted
	WHERE [factura_detalle].[id_factura] = inserted.id_factura AND [factura_detalle].[id_producto] = inserted.id_producto;
END
GO
ALTER TABLE [dbo].[factura_detalle] ENABLE TRIGGER [trg_after_insert_factura_detalle]
GO
ALTER DATABASE [jewdb] SET  READ_WRITE 
GO
