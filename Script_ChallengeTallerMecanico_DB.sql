USE [master]
GO
/****** Object:  Database [ChallengeTallerMecanico]    Script Date: 7/7/2023 01:09:24 ******/
CREATE DATABASE [ChallengeTallerMecanico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChallengeTallerMecanico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ChallengeTallerMecanico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChallengeTallerMecanico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ChallengeTallerMecanico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ChallengeTallerMecanico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChallengeTallerMecanico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET  MULTI_USER 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChallengeTallerMecanico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChallengeTallerMecanico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ChallengeTallerMecanico] SET QUERY_STORE = ON
GO
ALTER DATABASE [ChallengeTallerMecanico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ChallengeTallerMecanico]
GO
/****** Object:  Table [dbo].[Automovil]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automovil](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [bigint] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[CantidadPuertas] [int] NOT NULL,
 CONSTRAINT [PK_Automovil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Patente] [varchar](15) NOT NULL,
	[Tipo] [varchar](10) NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [bigint] NOT NULL,
	[Cilindrada] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Moto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VehiculosView]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VehiculosView]
AS
SELECT        TOP (10) dbo.Vehiculo.Marca, dbo.Vehiculo.Modelo, dbo.Vehiculo.Patente, dbo.Automovil.Tipo AS TipoAutomovil, dbo.Automovil.CantidadPuertas, dbo.Moto.Cilindrada, dbo.Vehiculo.Tipo, dbo.Vehiculo.Id
FROM            dbo.Vehiculo LEFT OUTER JOIN
                         dbo.Automovil ON dbo.Vehiculo.Id = dbo.Automovil.IdVehiculo LEFT OUTER JOIN
                         dbo.Moto ON dbo.Vehiculo.Id = dbo.Moto.IdVehiculo
ORDER BY dbo.Vehiculo.Id DESC
GO
/****** Object:  Table [dbo].[RepuestoDesperfecto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepuestoDesperfecto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdDesperfecto] [bigint] NOT NULL,
	[IdRepuesto] [bigint] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desperfecto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desperfecto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPresupuesto] [bigint] NULL,
	[Descripcion] [varchar](250) NULL,
	[ManoDeObra] [decimal](18, 0) NOT NULL,
	[Tiempo] [int] NOT NULL,
 CONSTRAINT [PK_Desperfecto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Repuestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DesperfectoView]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[DesperfectoView]
AS
SELECT        dbo.Desperfecto.Id, dbo.RepuestoDesperfecto.IdDesperfecto IdDesperfecto, dbo.Desperfecto.Descripcion, dbo.Desperfecto.ManoDeObra, dbo.Desperfecto.Tiempo, dbo.Repuesto.Nombre, dbo.Repuesto.Precio, 
                         dbo.RepuestoDesperfecto.IdRepuesto, ISNULL(dbo.Desperfecto.IdPresupuesto, 0) IdPresupuesto
FROM            dbo.Desperfecto INNER JOIN
                         dbo.RepuestoDesperfecto ON dbo.RepuestoDesperfecto.IdDesperfecto = dbo.Desperfecto.Id INNER JOIN
                         dbo.Repuesto ON dbo.RepuestoDesperfecto.IdRepuesto = dbo.Repuesto.Id
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[IdVehiculo] [bigint] NOT NULL,
 CONSTRAINT [PK_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Email] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PresupuestoView]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PresupuestoView]
AS
SELECT        dbo.Presupuesto.Id, dbo.Presupuesto.IdCliente, dbo.Cliente.Nombre, dbo.Cliente.Apellido, dbo.Cliente.Email, dbo.Presupuesto.Total, dbo.Presupuesto.IdVehiculo, dbo.Desperfecto.Id AS IdDesperfecto, 
                         dbo.Desperfecto.Descripcion, dbo.Desperfecto.ManoDeObra, dbo.Desperfecto.Tiempo, dbo.Vehiculo.Marca, dbo.Vehiculo.Modelo, dbo.Vehiculo.Patente, dbo.Vehiculo.Tipo, dbo.Moto.Cilindrada, dbo.Automovil.Tipo AS TipoAuto, 
                         dbo.Automovil.CantidadPuertas, dbo.Automovil.Id AS IdAuto
FROM            dbo.Presupuesto LEFT OUTER JOIN
                         dbo.Desperfecto ON dbo.Presupuesto.Id = dbo.Desperfecto.IdPresupuesto LEFT OUTER JOIN
                         dbo.Cliente ON dbo.Presupuesto.IdCliente = dbo.Cliente.Id LEFT OUTER JOIN
                         dbo.Vehiculo ON dbo.Presupuesto.IdVehiculo = dbo.Vehiculo.Id LEFT OUTER JOIN
                         dbo.Automovil ON dbo.Vehiculo.Id = dbo.Automovil.IdVehiculo LEFT OUTER JOIN
                         dbo.Moto ON dbo.Vehiculo.Id = dbo.Moto.IdVehiculo
GO
ALTER TABLE [dbo].[Automovil]  WITH CHECK ADD  CONSTRAINT [FK_Automovil_Vehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[Automovil] CHECK CONSTRAINT [FK_Automovil_Vehiculo]
GO
ALTER TABLE [dbo].[Desperfecto]  WITH CHECK ADD  CONSTRAINT [FK_Desperfecto_Presupuesto] FOREIGN KEY([IdPresupuesto])
REFERENCES [dbo].[Presupuesto] ([Id])
GO
ALTER TABLE [dbo].[Desperfecto] CHECK CONSTRAINT [FK_Desperfecto_Presupuesto]
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD  CONSTRAINT [FK_Moto_Vehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[Moto] CHECK CONSTRAINT [FK_Moto_Vehiculo]
GO
ALTER TABLE [dbo].[Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Presupuesto_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Presupuesto] CHECK CONSTRAINT [FK_Presupuesto_Cliente]
GO
ALTER TABLE [dbo].[RepuestoDesperfecto]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Table_1] FOREIGN KEY([Id])
REFERENCES [dbo].[RepuestoDesperfecto] ([Id])
GO
ALTER TABLE [dbo].[RepuestoDesperfecto] CHECK CONSTRAINT [FK_Table_1_Table_1]
GO
/****** Object:  StoredProcedure [dbo].[CreateAutomovil]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 3-7-2023
-- Description:	SP para crear Automoviles
-- =============================================
CREATE PROCEDURE [dbo].[CreateAutomovil] 
	-- Add the parameters for the stored procedure here
	@IdVehiculo bigint, 
	@Tipo varchar(50),
	@CantidadPuertas int
AS
BEGIN

INSERT INTO Automovil (IdVehiculo, Tipo, CantidadPuertas) values (@IdVehiculo, @Tipo, @CantidadPuertas)
    
END
GO
/****** Object:  StoredProcedure [dbo].[CreateCliente]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 5-7-2023
-- Description:	SP para crear Clientes
-- =============================================
CREATE PROCEDURE [dbo].[CreateCliente] 
	-- Add the parameters for the stored procedure here
	@Nombre varchar(250), 
	@Apellido varchar(250),
	@Email varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Cliente(Nombre, Apellido, Email) values(@Nombre, @Apellido, @Email)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateDesperfecto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 4-7-2023
-- Description:	SP para crear Desperfectos
-- =============================================
CREATE PROCEDURE [dbo].[CreateDesperfecto] 
	-- Add the parameters for the stored procedure here
	@Descripcion varchar(250), 
	@ManoDeObra decimal(18,2),
	@Tiempo int, --medido en horas
	@IdDesperfecto bigint output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Desperfecto(Descripcion, ManoDeObra, Tiempo) values (@Descripcion, @ManoDeObra, @Tiempo)
	SET @IdDesperfecto = SCOPE_IDENTITY()
	SELECT @IdDesperfecto AS ID
END
GO
/****** Object:  StoredProcedure [dbo].[CreateMoto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 3-7-2023
-- Description:	SP para crear Motos
-- =============================================
CREATE PROCEDURE [dbo].[CreateMoto] 
	-- Add the parameters for the stored procedure here
	@IdVehiculo bigint, 
	@Cilindrada varchar(50)
AS
BEGIN
	INSERT INTO Moto (IdVehiculo, Cilindrada) VALUES (@IdVehiculo, @Cilindrada)
END
GO
/****** Object:  StoredProcedure [dbo].[CreatePresupuesto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 5-7-2023
-- Description:	SP para crear Presupuesto
-- =============================================
CREATE PROCEDURE [dbo].[CreatePresupuesto] 
	-- Add the parameters for the stored procedure here
	@IdCliente bigint, 
	@IdVehiculo bigint,
	@MontoTotal decimal(18,6),
	@IdPresupuesto bigint output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Presupuesto (IdCliente, IdVehiculo, Total) VALUES (@IdCliente, @IdVehiculo, @MontoTotal)
	SET @IdPresupuesto = SCOPE_IDENTITY()
	SELECT @IdPresupuesto AS ID
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRepuestoDesperfecto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 4-7-2023
-- Description:	SP para crear DesperfectosRepuestos
-- =============================================
CREATE PROCEDURE [dbo].[CreateRepuestoDesperfecto] 
	-- Add the parameters for the stored procedure here
	@Nombre varchar(250),
	@IdDesperfecto bigint
AS
BEGIN
	DECLARE @IdRepuesto bigint
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT @IdRepuesto = Id FROM Repuesto WHERE Nombre = @Nombre 
	
	INSERT INTO RepuestoDesperfecto (IdDesperfecto, IdRepuesto) values(@IdDesperfecto, @IdRepuesto)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateVehiculo]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Nahuel
-- Create date: 3-7-2023
-- Description:	SP para crear vehiculos
-- =============================================
CREATE PROCEDURE [dbo].[CreateVehiculo]	-- Add the parameters for the stored procedure here
	@Marca varchar(250),
	@Modelo varchar(250),
	@Patente varchar(16),
	@Tipo varchar(10),
	@IdVehiculo bigint output
AS
	INSERT INTO Vehiculo (Marca, Modelo, Patente, Tipo) values (@Marca, @Modelo, @Patente, @Tipo)

	SET @IdVehiculo = SCOPE_IDENTITY()
	SELECT @IdVehiculo as ID
GO
/****** Object:  StoredProcedure [dbo].[DeleteDesperfecto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 5-7-2023
-- Description:	SP para eliminar Desperfecto
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDesperfecto] 
	-- Add the parameters for the stored procedure here
	@Id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM RepuestoDesperfecto WHERE IdDesperfecto = @Id
	DELETE FROM Desperfecto WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePresupuesto]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 6-7-2023
-- Description:	SP para eliminar Presupuestos
-- =============================================
CREATE PROCEDURE [dbo].[DeletePresupuesto] 
	-- Add the parameters for the stored procedure here
	@IdPresupuesto bigint = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Desperfecto SET IdPresupuesto = null WHERE IdPresupuesto = @IdPresupuesto
	DELETE FROM Presupuesto WHERE Id = @IdPresupuesto
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteVehiculo]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nahuel Nievas
-- Create date: 4-7-2023
-- Description:	SP para eliminar Vehiculos y sus referencias
-- =============================================
CREATE PROCEDURE [dbo].[DeleteVehiculo] 
	-- Add the parameters for the stored procedure here
	@IdVehiculo bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Automovil WHERE IdVehiculo = @IdVehiculo
	DELETE FROM Moto WHERE IdVehiculo = @IdVehiculo
	DELETE FROM Vehiculo WHERE Id = @IdVehiculo
END
GO
/****** Object:  StoredProcedure [dbo].[MassiveCharge]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MassiveCharge] AS
BEGIN

/*+ Creación de la tabla Temporal que contendrá los Repuestos con sus precios*/

    CREATE TABLE #TMP_RESPUESTO (Nombre VARCHAR(100),
                                 Precio DECIMAL(18,6))

/*+ Se generan los registros en la tabla temporal que posteriormente se evaluarán para ver si procede su carga en la tabla definitiva de Repuestos*/

    BEGIN /*+ BEGIN INSERT EN LA TEMPORAL DE RESPUESTOS*/
        INSERT INTO #TMP_RESPUESTO VALUES ('B356963821', 17.61)
        INSERT INTO #TMP_RESPUESTO VALUES ('B881468337', 40.88)
        INSERT INTO #TMP_RESPUESTO VALUES ('B867719836', 87.76)
        INSERT INTO #TMP_RESPUESTO VALUES ('B397571688', 13.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B852883143', 47.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B461882670', 22.68)
        INSERT INTO #TMP_RESPUESTO VALUES ('B333520964', 82.28)
        INSERT INTO #TMP_RESPUESTO VALUES ('B388445039', 50.71)
        INSERT INTO #TMP_RESPUESTO VALUES ('B648201513', 21.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B436759416', 35.39)
        INSERT INTO #TMP_RESPUESTO VALUES ('B317533243', 22.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B666592414', 58.67)
        INSERT INTO #TMP_RESPUESTO VALUES ('B443568817', 53.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B316416378', 17.74)
        INSERT INTO #TMP_RESPUESTO VALUES ('B252543362', 16.98)
        INSERT INTO #TMP_RESPUESTO VALUES ('B453148609', 14.23)
        INSERT INTO #TMP_RESPUESTO VALUES ('B254958806', 41.19)
        INSERT INTO #TMP_RESPUESTO VALUES ('B356963821', 62.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B846487171', 92.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B397571688', 1.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B535169105', 90.14)
        INSERT INTO #TMP_RESPUESTO VALUES ('B628263302', 78.64)
        INSERT INTO #TMP_RESPUESTO VALUES ('B608816685', 93.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B660755442', 43.62)
        INSERT INTO #TMP_RESPUESTO VALUES ('B659053715', 90.59)
        INSERT INTO #TMP_RESPUESTO VALUES ('B556344166', 71.62)
        INSERT INTO #TMP_RESPUESTO VALUES ('B216140665', 93.15)
        INSERT INTO #TMP_RESPUESTO VALUES ('B843858581', 66.52)
        INSERT INTO #TMP_RESPUESTO VALUES ('B790077756', 8.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B916071768', 85.46)
        INSERT INTO #TMP_RESPUESTO VALUES ('B317533243', 7.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B343454513', 22.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B986574036', 65.10)
        INSERT INTO #TMP_RESPUESTO VALUES ('B662139869', 3.50)
        INSERT INTO #TMP_RESPUESTO VALUES ('B618792223', 6.87)
        INSERT INTO #TMP_RESPUESTO VALUES ('B578485476', 49.70)
        INSERT INTO #TMP_RESPUESTO VALUES ('B132813434', 32.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B776163235', 73.64)
        INSERT INTO #TMP_RESPUESTO VALUES ('B215908676', 92.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B871139440', 31.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B564893705', 18.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B634131771', 70.35)
        INSERT INTO #TMP_RESPUESTO VALUES ('B321187273', 91.96)
        INSERT INTO #TMP_RESPUESTO VALUES ('B444737823', 78.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B413525993', 9.93)
        INSERT INTO #TMP_RESPUESTO VALUES ('B229547877', 97.08)
        INSERT INTO #TMP_RESPUESTO VALUES ('B545788950', 11.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B658514562', 8.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B736313138', 78.47)
        INSERT INTO #TMP_RESPUESTO VALUES ('B840888802', 93.85)
        INSERT INTO #TMP_RESPUESTO VALUES ('B883572821', 21.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B493478663', 76.98)
        INSERT INTO #TMP_RESPUESTO VALUES ('B718838840', 7.41)
        INSERT INTO #TMP_RESPUESTO VALUES ('B183671709', 45.53)
        INSERT INTO #TMP_RESPUESTO VALUES ('B908384721', 14.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B566417680', 44.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B633833113', 33.28)
        INSERT INTO #TMP_RESPUESTO VALUES ('B829258206', 41.74)
        INSERT INTO #TMP_RESPUESTO VALUES ('B350041352', 85.13)
        INSERT INTO #TMP_RESPUESTO VALUES ('B548168477', 7.44)
        INSERT INTO #TMP_RESPUESTO VALUES ('B765657146', 89.79)
        INSERT INTO #TMP_RESPUESTO VALUES ('B830231322', 81.42)
        INSERT INTO #TMP_RESPUESTO VALUES ('B816385774', 9.30)
        INSERT INTO #TMP_RESPUESTO VALUES ('B857448796', 77.36)
        INSERT INTO #TMP_RESPUESTO VALUES ('B302875266', 54.89)
        INSERT INTO #TMP_RESPUESTO VALUES ('B790507487', 50.41)
        INSERT INTO #TMP_RESPUESTO VALUES ('B723629401', 65.36)
        INSERT INTO #TMP_RESPUESTO VALUES ('B595728629', 19.94)
        INSERT INTO #TMP_RESPUESTO VALUES ('B472436824', 65.69)
        INSERT INTO #TMP_RESPUESTO VALUES ('B235859870', 66.44)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874178252', 42.38)
        INSERT INTO #TMP_RESPUESTO VALUES ('B777713850', 40.26)
        INSERT INTO #TMP_RESPUESTO VALUES ('B550221285', 8.72)
        INSERT INTO #TMP_RESPUESTO VALUES ('B816043247', 73.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B607313788', 15.95)
        INSERT INTO #TMP_RESPUESTO VALUES ('B396482694', 45.17)
        INSERT INTO #TMP_RESPUESTO VALUES ('B504021331', 24.52)
        INSERT INTO #TMP_RESPUESTO VALUES ('B651475349', 86.77)
        INSERT INTO #TMP_RESPUESTO VALUES ('B470409863', 11.81)
        INSERT INTO #TMP_RESPUESTO VALUES ('B264135435', 62.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B755636151', 33.88)
        INSERT INTO #TMP_RESPUESTO VALUES ('B382183955', 0.92)
        INSERT INTO #TMP_RESPUESTO VALUES ('B667316286', 0.29)
        INSERT INTO #TMP_RESPUESTO VALUES ('B783117048', 41.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B812952354', 86.25)
        INSERT INTO #TMP_RESPUESTO VALUES ('B621838237', 80.54)
        INSERT INTO #TMP_RESPUESTO VALUES ('B665465223', 53.69)
        INSERT INTO #TMP_RESPUESTO VALUES ('B881682635', 64.78)
        INSERT INTO #TMP_RESPUESTO VALUES ('B646289861', 72.01)
        INSERT INTO #TMP_RESPUESTO VALUES ('B852115667', 48.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B144635415', 34.23)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874863828', 24.70)
        INSERT INTO #TMP_RESPUESTO VALUES ('B333841476', 41.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B587386017', 45.27)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874270576', 42.38)
        INSERT INTO #TMP_RESPUESTO VALUES ('B300733136', 25.55)
        INSERT INTO #TMP_RESPUESTO VALUES ('B611446656', 60.12)
        INSERT INTO #TMP_RESPUESTO VALUES ('B801300387', 61.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B845153562', 60.09)
        INSERT INTO #TMP_RESPUESTO VALUES ('B943846621', 37.05)
    END /*+ END INSERT EN LA TEMPORAL DE RESPUESTOS*/
	
CREATE TABLE #RepuestosNoInsertados (
    Nombre VARCHAR(100),
	Precio DECIMAL(18,6))

DECLARE @Nombre varchar(100), @Precio DECIMAL(18, 6);

DECLARE RepuestosCursor CURSOR FOR
SELECT Nombre, Precio
FROM #TMP_RESPUESTO;

OPEN RepuestosCursor;

FETCH NEXT FROM RepuestosCursor INTO @Nombre, @Precio;

-- Variables para acumular el valor de los repuestos duplicados
DECLARE @NombreAnterior varchar(100), @PrecioAcumulado DECIMAL(18, 6);

SET @NombreAnterior = null;
SET @PrecioAcumulado = 0;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Reviso si ya existe el respuesto en la tabla de repuestos
    IF EXISTS (
        SELECT 1
        FROM Repuesto
        WHERE Nombre = @Nombre
    )
    BEGIN
        SET @PrecioAcumulado = @PrecioAcumulado + @Precio;
    END
    ELSE
    BEGIN
        IF @Precio < 20
        BEGIN
            INSERT INTO Repuesto(Nombre, Precio)
            VALUES (@Nombre, @Precio);
        END
        ELSE
        BEGIN
            INSERT INTO #RepuestosNoInsertados (Nombre, Precio)
            VALUES (@Nombre, @Precio);
        END
    END

    -- Obtener el siguiente registro del cursor
    FETCH NEXT FROM RepuestosCursor INTO @Nombre, @Precio;
END

-- Cerrar el cursor
CLOSE RepuestosCursor;

-- Liberar los recursos del cursor
DEALLOCATE RepuestosCursor;

-- Mostrar los repuestos que no se insertaron/actualizaron
SELECT Nombre, Precio
FROM #RepuestosNoInsertados;

-- Eliminar las tablas temporales
DROP TABLE #TMP_RESPUESTO;
DROP TABLE #RepuestosNoInsertados;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPromedioMontoTotalPresupuestosPorMarcaModelo]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPromedioMontoTotalPresupuestosPorMarcaModelo]
    @Marca NVARCHAR(50),
    @Modelo NVARCHAR(50)
AS
BEGIN
    SELECT AVG(P.Total) AS Promedio
    FROM Presupuesto P
    INNER JOIN Vehiculo V ON P.IdVehiculo = V.Id
    WHERE V.Marca = @Marca AND V.Modelo = @Modelo
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerRepuestoMasUtilizadoPorMarcaModelo]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerRepuestoMasUtilizadoPorMarcaModelo]
    @Marca varchar(50),
    @Modelo varchar(50)
AS
BEGIN
    SELECT TOP 1 R.Nombre AS Repuesto, COUNT(*) AS Cantidad
    FROM Desperfecto D
    INNER JOIN RepuestoDesperfecto DR ON D.Id = DR.IdDesperfecto
    INNER JOIN Repuesto R ON DR.IdRepuesto = R.Id
	INNER JOIN Presupuesto P ON P.Id = D.IdPresupuesto
	INNER JOIN Vehiculo V ON P.IdVehiculo = V.Id
    WHERE V.Marca = @Marca AND V.Modelo = @Modelo
    GROUP BY R.Nombre
    ORDER BY COUNT(*) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSumatoriaMontoTotalPresupuestosAutosMotos]    Script Date: 7/7/2023 01:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSumatoriaMontoTotalPresupuestosAutosMotos]
AS
BEGIN
    SELECT
        SUM(CASE WHEN V.Tipo = 'Automovil' THEN P.Total ELSE 0 END) AS MontoTotalAutos,
        SUM(CASE WHEN V.Tipo = 'Moto' THEN P.Total ELSE 0 END) AS MontoTotalMotos
    FROM Presupuesto P
    INNER JOIN Vehiculo V ON P.IdVehiculo = V.Id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Desperfecto"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RepuestoDesperfecto"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Repuesto"
            Begin Extent = 
               Top = 148
               Left = 246
               Bottom = 261
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DesperfectoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DesperfectoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Presupuesto"
            Begin Extent = 
               Top = 111
               Left = 22
               Bottom = 241
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Desperfecto"
            Begin Extent = 
               Top = 0
               Left = 465
               Bottom = 130
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cliente"
            Begin Extent = 
               Top = 284
               Left = 96
               Bottom = 414
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vehiculo"
            Begin Extent = 
               Top = 215
               Left = 678
               Bottom = 345
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Automovil"
            Begin Extent = 
               Top = 201
               Left = 907
               Bottom = 331
               Right = 1083
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Moto"
            Begin Extent = 
               Top = 295
               Left = 471
               Bottom = 408
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PresupuestoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PresupuestoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PresupuestoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehiculo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Automovil"
            Begin Extent = 
               Top = 0
               Left = 445
               Bottom = 130
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Moto"
            Begin Extent = 
               Top = 126
               Left = 442
               Bottom = 239
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VehiculosView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VehiculosView'
GO
USE [master]
GO
ALTER DATABASE [ChallengeTallerMecanico] SET  READ_WRITE 
GO
