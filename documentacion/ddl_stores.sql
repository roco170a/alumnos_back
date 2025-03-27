USE [master]
GO
/****** Object:  Database [db_alumnos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE DATABASE [db_alumnos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_alumnos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_alumnos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_alumnos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_alumnos_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_alumnos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_alumnos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_alumnos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_alumnos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_alumnos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_alumnos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_alumnos] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_alumnos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_alumnos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_alumnos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_alumnos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_alumnos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_alumnos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_alumnos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_alumnos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_alumnos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_alumnos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_alumnos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_alumnos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_alumnos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_alumnos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_alumnos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_alumnos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_alumnos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_alumnos] SET RECOVERY FULL 
GO
ALTER DATABASE [db_alumnos] SET  MULTI_USER 
GO
ALTER DATABASE [db_alumnos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_alumnos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_alumnos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_alumnos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_alumnos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_alumnos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_alumnos', N'ON'
GO
ALTER DATABASE [db_alumnos] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_alumnos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_alumnos]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[ApellidoPaterno] [nvarchar](100) NOT NULL,
	[ApellidoMaterno] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Activo] [bit] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnoExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoExamen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlumnoId] [int] NOT NULL,
	[ExamenId] [int] NOT NULL,
	[InscripcionId] [int] NOT NULL,
	[Nota] [decimal](4, 2) NOT NULL,
	[ComentariosAlumno] [nvarchar](max) NULL,
	[ComentariosProfesor] [nvarchar](max) NULL,
	[FechaPresentacion] [date] NOT NULL,
	[Estado] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_AlumnoExamen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProgramacionId] [int] NOT NULL,
	[TipoExamenId] [int] NOT NULL,
	[FechaRealizacion] [date] NOT NULL,
	[Observaciones] [nvarchar](max) NULL,
	[Estado] [nvarchar](20) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Examen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlumnoId] [int] NOT NULL,
	[MateriaId] [int] NOT NULL,
	[FechaInscripcion] [date] NOT NULL,
	[PeriodoAcademico] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](20) NULL,
	[NotaFinal] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Codigo] [nvarchar](20) NOT NULL,
	[Profesor] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Creditos] [int] NOT NULL,
	[Activa] [bit] NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramacionExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramacionExamen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MateriaId] [int] NOT NULL,
	[FechaProgramada] [datetime] NOT NULL,
	[DuracionMinutos] [int] NOT NULL,
	[Aula] [nvarchar](50) NOT NULL,
	[Instrucciones] [nvarchar](max) NULL,
	[MaterialRequerido] [nvarchar](255) NULL,
	[Estado] [nvarchar](20) NOT NULL,
	[ExamenId] [int] NULL,
	[Activo] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_ProgramacionExamen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoExamen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Ponderacion] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_TipoExamen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (1, N'Ana María', N'García', N'Hernández', N'alumno1@escuela.edu', N'5554567890', CAST(N'1998-05-15' AS Date), N'Calle Principal 123', 1, N'5E033E5F-6861-4F6C-832D-FA4EAC40398E')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (2, N'Luis', N'Rodríguez', N'López', N'alumno2@escuela.edu', N'5555678901', CAST(N'1999-08-22' AS Date), N'Avenida Central 456', 1, N'0D7BD538-FCC7-471D-9457-CF9B6372519D')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (3, N'Carlos', N'Martínez', N'Sánchez', N'alumno3@escuela.edu', N'5556789012', CAST(N'1997-11-10' AS Date), N'Boulevard Norte 789', 1, N'11092FBB-FB2D-4521-BEC2-CB4E38E5D8EB')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (4, N'Patricia', N'González', N'Ramírez', N'alumno4@escuela.edu', N'5557890123', CAST(N'2000-03-27' AS Date), N'Calle Secundaria 321', 1, N'72AC3C47-88D4-4043-802A-F1971C9D6B63')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (5, N'Miguel', N'Torres', N'Flores', N'alumno5@escuela.edu', N'5558901234', CAST(N'1998-12-05' AS Date), N'Avenida Sur 654', 1, N'A19CA849-78C5-4017-8E5F-92CB106A5438')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (8, N'string', N'string', N'string', N'string', N'string', CAST(N'2025-03-26' AS Date), N'string', 0, N'string')
GO
INSERT [dbo].[Alumno] ([Id], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Telefono], [FechaNacimiento], [Direccion], [Activo], [UserId]) VALUES (9, N'Roberto', N'Corona', N'Corona', N'roco170@gmail.com', N'5632706835', CAST(N'1978-12-13' AS Date), N'Rancho Alborada 4 Int 36a Rancho San Blas', 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[AlumnoExamen] ON 
GO
INSERT [dbo].[AlumnoExamen] ([Id], [AlumnoId], [ExamenId], [InscripcionId], [Nota], [ComentariosAlumno], [ComentariosProfesor], [FechaPresentacion], [Estado]) VALUES (1, 1, 1, 1, CAST(8.50 AS Decimal(4, 2)), N'El examen me pareció bien estructurado', N'Buen manejo de conceptos, falta profundizar en aplicaciones', CAST(N'2024-03-15' AS Date), N'Completado')
GO
INSERT [dbo].[AlumnoExamen] ([Id], [AlumnoId], [ExamenId], [InscripcionId], [Nota], [ComentariosAlumno], [ComentariosProfesor], [FechaPresentacion], [Estado]) VALUES (2, 2, 1, 3, CAST(7.80 AS Decimal(4, 2)), N'Algunas preguntas fueron confusas', N'Necesita repasar los conceptos de derivación', CAST(N'2024-03-15' AS Date), N'Completado')
GO
INSERT [dbo].[AlumnoExamen] ([Id], [AlumnoId], [ExamenId], [InscripcionId], [Nota], [ComentariosAlumno], [ComentariosProfesor], [FechaPresentacion], [Estado]) VALUES (3, 1, 2, 2, CAST(9.20 AS Decimal(4, 2)), N'Me sentí muy cómodo con las preguntas', N'Excelente comprensión de los principios físicos', CAST(N'2024-03-17' AS Date), N'Completado')
GO
INSERT [dbo].[AlumnoExamen] ([Id], [AlumnoId], [ExamenId], [InscripcionId], [Nota], [ComentariosAlumno], [ComentariosProfesor], [FechaPresentacion], [Estado]) VALUES (4, 3, 3, 5, CAST(0.00 AS Decimal(4, 2)), NULL, NULL, CAST(N'2024-03-18' AS Date), N'Pendiente')
GO
SET IDENTITY_INSERT [dbo].[AlumnoExamen] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'368F9FFE-547E-4AD2-BE32-6860FDA904DB', NULL, N'Administrador', N'ADMINISTRADOR')
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'A4538B35-164B-42F6-916C-5434F0461A83', NULL, N'Profesor', N'PROFESOR')
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'D44B81B0-EE08-476D-A7C4-010DB27E4214', NULL, N'Alumno', N'ALUMNO')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0D7BD538-FCC7-471D-9457-CF9B6372519D', N'D44B81B0-EE08-476D-A7C4-010DB27E4214')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'11092FBB-FB2D-4521-BEC2-CB4E38E5D8EB', N'D44B81B0-EE08-476D-A7C4-010DB27E4214')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2987C4C8-146E-44C0-B419-F6C2775F1A34', N'A4538B35-164B-42F6-916C-5434F0461A83')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5AEF102A-F238-4315-A4B8-5713C1D7E5DD', N'A4538B35-164B-42F6-916C-5434F0461A83')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5E033E5F-6861-4F6C-832D-FA4EAC40398E', N'D44B81B0-EE08-476D-A7C4-010DB27E4214')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6EB1A27A-D8E8-4BBD-9155-3D9B25904315', N'368F9FFE-547E-4AD2-BE32-6860FDA904DB')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'72AC3C47-88D4-4043-802A-F1971C9D6B63', N'D44B81B0-EE08-476D-A7C4-010DB27E4214')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'A19CA849-78C5-4017-8E5F-92CB106A5438', N'D44B81B0-EE08-476D-A7C4-010DB27E4214')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'0D7BD538-FCC7-471D-9457-CF9B6372519D', 0, NULL, N'alumno2@escuela.edu', 1, 0, NULL, NULL, N'ALUMNO2@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5555678901', 0, NULL, 0, N'alumno2@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'11092FBB-FB2D-4521-BEC2-CB4E38E5D8EB', 0, NULL, N'alumno3@escuela.edu', 1, 0, NULL, NULL, N'ALUMNO3@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5556789012', 0, NULL, 0, N'alumno3@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'2987C4C8-146E-44C0-B419-F6C2775F1A34', 0, NULL, N'profesor2@escuela.edu', 1, 0, NULL, NULL, N'PROFESOR2@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5553456789', 0, NULL, 0, N'profesor2@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'5AEF102A-F238-4315-A4B8-5713C1D7E5DD', 0, NULL, N'profesor1@escuela.edu', 1, 0, NULL, NULL, N'PROFESOR1@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5552345678', 0, NULL, 0, N'profesor1@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'5E033E5F-6861-4F6C-832D-FA4EAC40398E', 0, NULL, N'alumno1@escuela.edu', 1, 0, NULL, NULL, N'ALUMNO1@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5554567890', 0, NULL, 0, N'alumno1@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'6EB1A27A-D8E8-4BBD-9155-3D9B25904315', 0, NULL, N'admin@escuela.edu', 1, 0, NULL, NULL, N'ADMIN@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5551234567', 0, NULL, 0, N'admin@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'72AC3C47-88D4-4043-802A-F1971C9D6B63', 0, NULL, N'alumno4@escuela.edu', 1, 0, NULL, NULL, N'ALUMNO4@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5557890123', 0, NULL, 0, N'alumno4@escuela.edu')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'A19CA849-78C5-4017-8E5F-92CB106A5438', 0, NULL, N'alumno5@escuela.edu', 1, 0, NULL, NULL, N'ALUMNO5@ESCUELA.EDU', N'AQAAAAEAACcQAAAAEHxnLpZs2GbBIuQGxNYj0P4P0gE9KFZ6z0JKKkIEVqCWPEQgAqSPfNefG1ITMA1jjw==', N'5558901234', 0, NULL, 0, N'alumno5@escuela.edu')
GO
SET IDENTITY_INSERT [dbo].[Examen] ON 
GO
INSERT [dbo].[Examen] ([Id], [ProgramacionId], [TipoExamenId], [FechaRealizacion], [Observaciones], [Estado], [Activo]) VALUES (1, 1, 1, CAST(N'2024-03-15' AS Date), N'Examen sobre límites y derivadas', N'Activo', NULL)
GO
INSERT [dbo].[Examen] ([Id], [ProgramacionId], [TipoExamenId], [FechaRealizacion], [Observaciones], [Estado], [Activo]) VALUES (2, 2, 1, CAST(N'2024-03-17' AS Date), N'Examen sobre mecánica clásica', N'Activo', NULL)
GO
INSERT [dbo].[Examen] ([Id], [ProgramacionId], [TipoExamenId], [FechaRealizacion], [Observaciones], [Estado], [Activo]) VALUES (3, 3, 1, CAST(N'2024-03-18' AS Date), N'Examen sobre estructuras de datos', N'Activo', NULL)
GO
SET IDENTITY_INSERT [dbo].[Examen] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] ON 
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (1, 1, 1, CAST(N'2024-01-15' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (2, 1, 2, CAST(N'2024-01-15' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (3, 2, 1, CAST(N'2024-01-16' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (4, 2, 3, CAST(N'2024-01-16' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (5, 3, 3, CAST(N'2024-01-17' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (6, 3, 4, CAST(N'2024-01-17' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (7, 4, 2, CAST(N'2024-01-18' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (8, 4, 5, CAST(N'2024-01-18' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (9, 5, 4, CAST(N'2024-01-19' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (10, 5, 5, CAST(N'2024-01-19' AS Date), N'2024-01', N'Activa', NULL)
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (11, 1, 5, CAST(N'2023-08-10' AS Date), N'2023-02', N'Completada', CAST(8.50 AS Decimal(4, 2)))
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (12, 2, 2, CAST(N'2023-08-11' AS Date), N'2023-02', N'Completada', CAST(7.80 AS Decimal(4, 2)))
GO
INSERT [dbo].[Inscripcion] ([Id], [AlumnoId], [MateriaId], [FechaInscripcion], [PeriodoAcademico], [Estado], [NotaFinal]) VALUES (13, 3, 1, CAST(N'2023-08-12' AS Date), N'2023-02', N'Completada', CAST(9.20 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (1, N'Matemáticas I', N'MAT101', N'Dr. Roberto Álvarez', N'Introducción al cálculo diferencial e integral', 5, 1)
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (2, N'Física General', N'FIS201', N'Dra. Carmen Jiménez', N'Principios fundamentales de física mecánica y termodinámica', 4, 1)
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (3, N'Programación Avanzada', N'PROG302', N'Ing. Javier Mendoza', N'Algoritmos avanzados y estructura de datos', 6, 1)
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (4, N'Bases de Datos', N'BD403', N'Mtra. Laura Vega', N'Diseño y administración de bases de datos relacionales', 5, 1)
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (5, N'Estadística', N'EST102', N'Dr. Manuel Ortiz', N'Principios de estadística descriptiva e inferencial', 4, 1)
GO
INSERT [dbo].[Materia] ([Id], [Nombre], [Codigo], [Profesor], [Descripcion], [Creditos], [Activa]) VALUES (6, N'Arquitectura de sistemas 2', N'1111', N'Roberto', N'Descr', 3, 0)
GO
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramacionExamen] ON 
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (1, 1, CAST(N'2024-03-15T09:00:00.000' AS DateTime), 120, N'A101', N'Primer examen parcial de Matemáticas I', N'Calculadora científica, lápiz y papel', N'Programado', 1, 1, NULL, NULL)
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (2, 2, CAST(N'2024-03-17T10:00:00.000' AS DateTime), 90, N'B202', N'Primer examen parcial de Física General', N'Calculadora científica, formulario', N'Programado', 2, 1, NULL, NULL)
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (3, 3, CAST(N'2024-03-18T15:00:00.000' AS DateTime), 180, N'LAB-C', N'Examen práctico de Programación Avanzada', N'Computadora con IDE instalado', N'Programado', 3, 1, NULL, NULL)
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (4, 4, CAST(N'2024-03-20T13:00:00.000' AS DateTime), 120, N'LAB-D', N'Examen teórico-práctico de Bases de Datos', N'Ninguno', N'Programado', 1, 1, NULL, NULL)
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (5, 5, CAST(N'2024-03-22T11:00:00.000' AS DateTime), 100, N'C303', N'Primer examen parcial de Estadística', N'Calculadora, tablas estadísticas', N'Programado', 2, 1, NULL, NULL)
GO
INSERT [dbo].[ProgramacionExamen] ([Id], [MateriaId], [FechaProgramada], [DuracionMinutos], [Aula], [Instrucciones], [MaterialRequerido], [Estado], [ExamenId], [Activo], [FechaCreacion], [FechaModificacion]) VALUES (6, 1, CAST(N'2024-05-10T09:00:00.000' AS DateTime), 120, N'A101', N'Segundo examen parcial de Matemáticas I', N'Calculadora científica, lápiz y papel', N'Programado', 3, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProgramacionExamen] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoExamen] ON 
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre], [Descripcion], [Ponderacion]) VALUES (1, N'Parcial 1', N'Primer examen parcial del curso', CAST(25.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre], [Descripcion], [Ponderacion]) VALUES (2, N'Parcial 2', N'Segundo examen parcial del curso', CAST(25.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre], [Descripcion], [Ponderacion]) VALUES (3, N'Final', N'Examen final del curso', CAST(40.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre], [Descripcion], [Ponderacion]) VALUES (4, N'Recuperatorio', N'Examen de recuperación', CAST(30.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre], [Descripcion], [Ponderacion]) VALUES (5, N'Práctico', N'Evaluación práctica de laboratorio', CAST(10.00 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[TipoExamen] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Alumno_Email]    Script Date: 27/03/2025 05:26:51 a. m. ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [UQ_Alumno_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Alumno_UserId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [UQ_Alumno_UserId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Alumno_UserId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Alumno_UserId] ON [dbo].[Alumno]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlumnoExamen_AlumnoExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AlumnoExamen_AlumnoExamen] ON [dbo].[AlumnoExamen]
(
	[AlumnoId] ASC,
	[ExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlumnoExamen_AlumnoId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AlumnoExamen_AlumnoId] ON [dbo].[AlumnoExamen]
(
	[AlumnoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlumnoExamen_ExamenId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AlumnoExamen_ExamenId] ON [dbo].[AlumnoExamen]
(
	[ExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlumnoExamen_InscripcionId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AlumnoExamen_InscripcionId] ON [dbo].[AlumnoExamen]
(
	[InscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Examen_ProgramacionId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Examen_ProgramacionId] ON [dbo].[Examen]
(
	[ProgramacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Examen_TipoExamenId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Examen_TipoExamenId] ON [dbo].[Examen]
(
	[TipoExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Inscripcion_AlumnoMateriaPeriodo]    Script Date: 27/03/2025 05:26:51 a. m. ******/
ALTER TABLE [dbo].[Inscripcion] ADD  CONSTRAINT [UQ_Inscripcion_AlumnoMateriaPeriodo] UNIQUE NONCLUSTERED 
(
	[AlumnoId] ASC,
	[MateriaId] ASC,
	[PeriodoAcademico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inscripcion_AlumnoId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Inscripcion_AlumnoId] ON [dbo].[Inscripcion]
(
	[AlumnoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inscripcion_MateriaId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Inscripcion_MateriaId] ON [dbo].[Inscripcion]
(
	[MateriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Materia_Codigo]    Script Date: 27/03/2025 05:26:51 a. m. ******/
ALTER TABLE [dbo].[Materia] ADD  CONSTRAINT [UQ_Materia_Codigo] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramacionExamen_FechaProgramada]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProgramacionExamen_FechaProgramada] ON [dbo].[ProgramacionExamen]
(
	[FechaProgramada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProgramacionExamen_MateriaId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ProgramacionExamen_MateriaId] ON [dbo].[ProgramacionExamen]
(
	[MateriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_TipoExamen_Nombre]    Script Date: 27/03/2025 05:26:51 a. m. ******/
ALTER TABLE [dbo].[TipoExamen] ADD  CONSTRAINT [UQ_TipoExamen_Nombre] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [DF__Alumno__Activo__27F8EE98]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[AlumnoExamen] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Examen] ADD  DEFAULT ('Activo') FOR [Estado]
GO
ALTER TABLE [dbo].[Inscripcion] ADD  DEFAULT (getdate()) FOR [FechaInscripcion]
GO
ALTER TABLE [dbo].[Inscripcion] ADD  DEFAULT ('Activa') FOR [Estado]
GO
ALTER TABLE [dbo].[Materia] ADD  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[ProgramacionExamen] ADD  DEFAULT ('Programado') FOR [Estado]
GO
ALTER TABLE [dbo].[AlumnoExamen]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoExamen_Alumno] FOREIGN KEY([AlumnoId])
REFERENCES [dbo].[Alumno] ([Id])
GO
ALTER TABLE [dbo].[AlumnoExamen] CHECK CONSTRAINT [FK_AlumnoExamen_Alumno]
GO
ALTER TABLE [dbo].[AlumnoExamen]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoExamen_Examen] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[Examen] ([Id])
GO
ALTER TABLE [dbo].[AlumnoExamen] CHECK CONSTRAINT [FK_AlumnoExamen_Examen]
GO
ALTER TABLE [dbo].[AlumnoExamen]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoExamen_Inscripcion] FOREIGN KEY([InscripcionId])
REFERENCES [dbo].[Inscripcion] ([Id])
GO
ALTER TABLE [dbo].[AlumnoExamen] CHECK CONSTRAINT [FK_AlumnoExamen_Inscripcion]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_ProgramacionExamen] FOREIGN KEY([ProgramacionId])
REFERENCES [dbo].[ProgramacionExamen] ([Id])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_ProgramacionExamen]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_TipoExamen] FOREIGN KEY([TipoExamenId])
REFERENCES [dbo].[TipoExamen] ([Id])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_TipoExamen]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Alumno] FOREIGN KEY([AlumnoId])
REFERENCES [dbo].[Alumno] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Alumno]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Materia] FOREIGN KEY([MateriaId])
REFERENCES [dbo].[Materia] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Materia]
GO
ALTER TABLE [dbo].[ProgramacionExamen]  WITH CHECK ADD  CONSTRAINT [FK_ProgramacionExamen_Materia] FOREIGN KEY([MateriaId])
REFERENCES [dbo].[Materia] ([Id])
GO
ALTER TABLE [dbo].[ProgramacionExamen] CHECK CONSTRAINT [FK_ProgramacionExamen_Materia]
GO
ALTER TABLE [dbo].[AlumnoExamen]  WITH CHECK ADD  CONSTRAINT [CK_AlumnoExamen_Nota] CHECK  (([Nota]>=(0) AND [Nota]<=(10)))
GO
ALTER TABLE [dbo].[AlumnoExamen] CHECK CONSTRAINT [CK_AlumnoExamen_Nota]
GO
ALTER TABLE [dbo].[ProgramacionExamen]  WITH CHECK ADD  CONSTRAINT [CK_ProgramacionExamen_DuracionMinutos] CHECK  (([DuracionMinutos]>(0)))
GO
ALTER TABLE [dbo].[ProgramacionExamen] CHECK CONSTRAINT [CK_ProgramacionExamen_DuracionMinutos]
GO
ALTER TABLE [dbo].[TipoExamen]  WITH CHECK ADD  CONSTRAINT [CK_TipoExamen_Ponderacion] CHECK  (([Ponderacion]>(0) AND [Ponderacion]<=(100)))
GO
ALTER TABLE [dbo].[TipoExamen] CHECK CONSTRAINT [CK_TipoExamen_Ponderacion]
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_Actualizar]
    @Id INT,
    @Nombre NVARCHAR(100),
    @ApellidoPaterno NVARCHAR(100),
    @ApellidoMaterno NVARCHAR(100),
    @FechaNacimiento DATE,
    @Email NVARCHAR(256),
    @Telefono NVARCHAR(20) = NULL,
    @Direccion NVARCHAR(255) = NULL,
    @UserId NVARCHAR(450) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el alumno existe
        IF NOT EXISTS (SELECT 1 FROM Alumno WHERE Id = @Id)
        BEGIN
            RAISERROR('El alumno no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe otro alumno con el mismo email
        IF EXISTS (SELECT 1 FROM Alumno WHERE Email = @Email AND Id != @Id)
        BEGIN
            RAISERROR('Ya existe otro alumno con el mismo email.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el UserId ya está asignado a otro alumno
        IF @UserId IS NOT NULL AND EXISTS (SELECT 1 FROM Alumno WHERE UserId = @UserId AND Id != @Id)
        BEGIN
            RAISERROR('El usuario especificado ya está asignado a otro alumno.', 16, 1);
            RETURN;
        END
        
        -- Actualizar el alumno
        UPDATE Alumno
        SET Nombre = @Nombre,
            ApellidoPaterno = @ApellidoPaterno,
            ApellidoMaterno = @ApellidoMaterno,
            FechaNacimiento = @FechaNacimiento,
            Email = @Email,
            Telefono = @Telefono,
            Direccion = @Direccion,
            UserId = @UserId
        WHERE Id = @Id;
        
        -- Retornar el alumno actualizado
        SELECT * FROM Alumno WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_Buscar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_Buscar]
    @Busqueda NVARCHAR(100),
    @SoloActivos BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @SoloActivos = 1
    BEGIN
        SELECT * FROM Alumno
        WHERE (
            Nombre LIKE '%' + @Busqueda + '%' OR
            ApellidoPaterno LIKE '%' + @Busqueda + '%' OR
            ApellidoMaterno LIKE '%' + @Busqueda + '%' OR
            Email LIKE '%' + @Busqueda + '%'
        ) AND Activo = 1
        ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
    END
    ELSE
    BEGIN
        SELECT * FROM Alumno
        WHERE (
            Nombre LIKE '%' + @Busqueda + '%' OR
            ApellidoPaterno LIKE '%' + @Busqueda + '%' OR
            ApellidoMaterno LIKE '%' + @Busqueda + '%' OR
            Email LIKE '%' + @Busqueda + '%'
        )
        ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_BuscarPorNombre]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_BuscarPorNombre]
    @Nombre NVARCHAR(100),
    @SoloActivos BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @SoloActivos = 1
    BEGIN
        SELECT * FROM Alumno
        WHERE (
            Nombre LIKE '%' + @Nombre + '%'
        ) AND Activo = 1
        ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
    END
    ELSE
    BEGIN
        SELECT * FROM Alumno
        WHERE Nombre LIKE '%' + @Nombre + '%'
        ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_Crear]
    @Nombre NVARCHAR(100),
    @ApellidoPaterno NVARCHAR(100),
    @ApellidoMaterno NVARCHAR(100),
    @FechaNacimiento DATE,
    @Email NVARCHAR(256),
    @Telefono NVARCHAR(20) = NULL,
    @Direccion NVARCHAR(255) = NULL,
    @UserId NVARCHAR(450) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si ya existe un alumno con el mismo email
        IF EXISTS (SELECT 1 FROM Alumno WHERE Email = @Email)
        BEGIN
            RAISERROR('Ya existe un alumno con el mismo email.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el UserId ya está asignado a otro alumno
        IF @UserId IS NOT NULL AND EXISTS (SELECT 1 FROM Alumno WHERE UserId = @UserId)
        BEGIN
            RAISERROR('El usuario especificado ya está asignado a otro alumno.', 16, 1);
            RETURN;
        END
        
        -- Insertar el nuevo alumno
        INSERT INTO Alumno (Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Email, Telefono, Direccion, UserId, Activo)
        VALUES (@Nombre, @ApellidoPaterno, @ApellidoMaterno, @FechaNacimiento, @Email, @Telefono, @Direccion, @UserId, 1);
        
        -- Obtener el ID del nuevo alumno
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar el alumno creado
        SELECT * FROM Alumno WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el alumno existe
        IF NOT EXISTS (SELECT 1 FROM Alumno WHERE Id = @Id)
        BEGIN
            RAISERROR('El alumno no existe.', 16, 1);
            RETURN;
        END
        
        -- Desactivar el alumno (eliminación lógica)
        UPDATE Alumno SET Activo = 0 WHERE Id = @Id;
        
        -- Retornar mensaje de éxito
        SELECT 'Alumno desactivado correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM Alumno WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_ObtenerPorUserId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_ObtenerPorUserId]
    @UserId NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM Alumno WHERE UserId = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Alumno_ObtenerTodos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Alumno_ObtenerTodos]
    @SoloActivos BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @SoloActivos = 1
        SELECT * FROM Alumno WHERE Activo = 1 ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
    ELSE
        SELECT * FROM Alumno ORDER BY ApellidoPaterno, ApellidoMaterno, Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ActualizarComentariosAlumno]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_ActualizarComentariosAlumno]
    @Id INT,
    @ComentariosAlumno NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la inscripción a examen existe
        IF NOT EXISTS (SELECT 1 FROM AlumnoExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('La inscripción a examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Actualizar comentarios del alumno
        UPDATE AlumnoExamen
        SET ComentariosAlumno = @ComentariosAlumno
        WHERE Id = @Id;
        
        -- Retornar la inscripción a examen actualizada
        SELECT * FROM AlumnoExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la inscripción a examen existe
        IF NOT EXISTS (SELECT 1 FROM AlumnoExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('La inscripción a examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si la inscripción a examen ya tiene calificación
        IF EXISTS (SELECT 1 FROM AlumnoExamen WHERE Id = @Id AND Nota IS NOT NULL)
        BEGIN
            RAISERROR('No se puede eliminar la inscripción porque ya tiene calificación registrada.', 16, 1);
            RETURN;
        END
        
        -- Eliminar la inscripción a examen
        DELETE FROM AlumnoExamen WHERE Id = @Id;
        
        -- Retornar resultado exitoso
        SELECT 'Inscripción a examen eliminada correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_Inscribir]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_Inscribir]
    @AlumnoId INT,
    @ExamenId INT,
    @InscripcionId INT,
    @FechaPresentacion DATE = NULL,
    @ComentariosAlumno NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Si no se proporciona una fecha, usar la fecha actual
        IF @FechaPresentacion IS NULL
            SET @FechaPresentacion = GETDATE();
        
        -- Verificar si el alumno existe
        IF NOT EXISTS (SELECT 1 FROM Alumno WHERE Id = @AlumnoId)
        BEGIN
            RAISERROR('El alumno especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el examen existe
        IF NOT EXISTS (SELECT 1 FROM Examen WHERE Id = @ExamenId)
        BEGIN
            RAISERROR('El examen especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si la inscripción existe
        IF NOT EXISTS (SELECT 1 FROM Inscripcion WHERE Id = @InscripcionId)
        BEGIN
            RAISERROR('La inscripción especificada no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la inscripción pertenezca al alumno
        IF NOT EXISTS (SELECT 1 FROM Inscripcion WHERE Id = @InscripcionId AND AlumnoId = @AlumnoId)
        BEGIN
            RAISERROR('La inscripción no pertenece al alumno especificado.', 16, 1);
            RETURN;
        END
        
        -- Obtener la materia relacionada con el examen
        DECLARE @MateriaExamenId INT;
        SELECT @MateriaExamenId = m.Id
        FROM Examen e
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        WHERE e.Id = @ExamenId;
        
        -- Verificar que la inscripción corresponda a la materia del examen
        IF NOT EXISTS (SELECT 1 FROM Inscripcion WHERE Id = @InscripcionId AND MateriaId = @MateriaExamenId)
        BEGIN
            RAISERROR('La inscripción no corresponde a la materia del examen.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el alumno ya está inscrito en este examen
        IF EXISTS (SELECT 1 FROM AlumnoExamen WHERE AlumnoId = @AlumnoId AND ExamenId = @ExamenId)
        BEGIN
            RAISERROR('El alumno ya está inscrito en este examen.', 16, 1);
            RETURN;
        END
        
        -- Inscribir al alumno en el examen
        INSERT INTO AlumnoExamen (AlumnoId, ExamenId, InscripcionId, FechaPresentacion, ComentariosAlumno, Estado)
        VALUES (@AlumnoId, @ExamenId, @InscripcionId, @FechaPresentacion, @ComentariosAlumno, 'Inscrito');
        
        -- Obtener el ID de la nueva inscripción a examen
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar la inscripción a examen creada
        SELECT * FROM AlumnoExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_InscribirMultiples]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_InscribirMultiples]
    @ExamenId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el examen existe
        IF NOT EXISTS (SELECT 1 FROM Examen WHERE Id = @ExamenId)
        BEGIN
            RAISERROR('El examen especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Obtener la materia relacionada con el examen
        DECLARE @MateriaId INT;
        
        SELECT @MateriaId = m.Id
        FROM Examen e
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        WHERE e.Id = @ExamenId;
        
        -- Inscribir a todos los alumnos que estén inscritos en la materia correspondiente y que aún no estén inscritos en el examen
        INSERT INTO AlumnoExamen (AlumnoId, ExamenId, InscripcionId, FechaPresentacion, Estado)
        SELECT i.AlumnoId, @ExamenId, i.Id, GETDATE(), 'Inscrito'
        FROM Inscripcion i
        WHERE i.MateriaId = @MateriaId
          AND i.Estado = 'Activa'
          AND NOT EXISTS (
              SELECT 1 
              FROM AlumnoExamen ae 
              WHERE ae.AlumnoId = i.AlumnoId 
                AND ae.ExamenId = @ExamenId
          );
        
        -- Retornar el número de alumnos inscritos
        DECLARE @NumInscritos INT = @@ROWCOUNT;
        
        SELECT CAST(@NumInscritos AS NVARCHAR) + ' alumnos inscritos correctamente en el examen.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ObtenerConDetalles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_ObtenerConDetalles]
    @ExamenId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT ae.*, 
               a.Nombre + '' '' + a.ApellidoPaterno + '' '' + a.ApellidoMaterno AS NombreAlumno,
               e.Id AS ExamenId,
               m.Nombre AS NombreMateria,
               m.Codigo AS CodigoMateria,
               t.Nombre AS NombreTipoExamen,
               pe.FechaProgramada AS FechaExamen
        FROM AlumnoExamen ae
        INNER JOIN Alumno a ON ae.AlumnoId = a.Id
        INNER JOIN Examen e ON ae.ExamenId = e.Id
        INNER JOIN Inscripcion i ON ae.InscripcionId = i.Id
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        INNER JOIN TipoExamen t ON e.TipoExamenId = t.Id
        WHERE 1=1';
    
    -- Agregar filtro por examen si se especifica
    IF @ExamenId IS NOT NULL
        SET @Query = @Query + ' AND ae.ExamenId = ' + CAST(@ExamenId AS NVARCHAR);
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ObtenerPorAlumno]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_ObtenerPorAlumno]
    @AlumnoId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT ae.*, 
               e.Id AS ExamenId,
               m.Nombre AS NombreMateria,
               m.Codigo AS CodigoMateria,
               t.Nombre AS NombreTipoExamen,
               pe.FechaProgramada AS FechaExamen,
               pe.DuracionMinutos,
               pe.Aula
        FROM AlumnoExamen ae
        INNER JOIN Examen e ON ae.ExamenId = e.Id
        INNER JOIN Inscripcion i ON ae.InscripcionId = i.Id
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        INNER JOIN TipoExamen t ON e.TipoExamenId = t.Id
        WHERE ae.AlumnoId = ' + CAST(@AlumnoId AS NVARCHAR);
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY pe.FechaProgramada';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ObtenerPorExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_AlumnoExamen_ObtenerPorExamen]
    @ExamenId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @ExamenId IS NULL
    BEGIN
        SELECT * FROM AlumnoExamen ORDER BY Id DESC;
    END
    ELSE
    BEGIN
        SELECT * FROM AlumnoExamen WHERE ExamenId = @ExamenId ORDER BY Id;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT ae.*, 
           a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno,
           e.Id AS ExamenId,
           m.Nombre AS NombreMateria,
           m.Codigo AS CodigoMateria,
           t.Nombre AS NombreTipoExamen,
           pe.FechaProgramada AS FechaExamen
    FROM AlumnoExamen ae
    INNER JOIN Alumno a ON ae.AlumnoId = a.Id
    INNER JOIN Examen e ON ae.ExamenId = e.Id
    INNER JOIN Inscripcion i ON ae.InscripcionId = i.Id
    INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
    INNER JOIN Materia m ON pe.MateriaId = m.Id
    INNER JOIN TipoExamen t ON e.TipoExamenId = t.Id
    WHERE ae.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_ObtenerTodas]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_AlumnoExamen_ObtenerTodas]
    @ExamenId INT = NULL,
    @AlumnoId INT = NULL,
    @Estado NVARCHAR(50) = NULL,
    @TerminoBusqueda NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ae.id AS Id,
        ae.alumnoid AS AlumnoId,
        ae.examenid AS ExamenId,
        ae.inscripcionid AS InscripcionId,
        ae.nota AS Calificacion,
        ae.comentariosalumno AS ComentariosAlumno,
        ae.comentariosprofesor AS Comentarios,
        ae.fechapresentacion AS FechaRealizacion,
        ae.estado AS Estado,
        a.id AS AlumnoId,
        a.nombre AS NombreAlumno, 
        a.apellidopaterno AS ApellidoPaterno,
        a.apellidomaterno AS ApellidoMaterno,
        (a.apellidopaterno + ' ' + a.apellidomaterno) AS ApellidosAlumno,
        a.email AS EmailAlumno,
        e.id AS ExamenId,
        e.fecharealizacion AS FechaExamen,
        CONVERT(VARCHAR, e.fecharealizacion, 103) AS FechaExamenFormateada,
        m.id AS MateriaId,
        m.nombre AS NombreMateria,
        m.codigo AS CodigoMateria,
        te.id AS TipoExamenId,
        te.nombre AS NombreTipoExamen,
        te.ponderacion AS PonderacionTipoExamen,
        CONVERT(VARCHAR, ae.fechapresentacion, 103) AS FechaRealizacionFormateada,
        CASE WHEN ae.nota IS NOT NULL AND te.ponderacion IS NOT NULL 
             THEN CAST((ae.nota * te.ponderacion / 100) AS DECIMAL(5,2))
             ELSE NULL 
        END AS CalificacionPonderada
    FROM AlumnoExamen ae
    INNER JOIN Alumno a ON ae.alumnoid = a.id
    INNER JOIN Examen e ON ae.examenid = e.id
    INNER JOIN ProgramacionExamen pe ON e.programacionid = pe.id
    INNER JOIN Materia m ON pe.materiaid = m.id
    INNER JOIN TipoExamen te ON e.tipoexamenid = te.id
    WHERE (@ExamenId IS NULL OR ae.examenid = @ExamenId)
    AND (@AlumnoId IS NULL OR ae.alumnoid = @AlumnoId)
    AND (@Estado IS NULL OR @Estado = '' OR ae.estado = @Estado)
    AND (@TerminoBusqueda IS NULL OR @TerminoBusqueda = ''
         OR a.nombre LIKE '%' + @TerminoBusqueda + '%' 
         OR a.apellidopaterno LIKE '%' + @TerminoBusqueda + '%'
         OR a.apellidomaterno LIKE '%' + @TerminoBusqueda + '%'
         OR m.nombre LIKE '%' + @TerminoBusqueda + '%'
         OR m.codigo LIKE '%' + @TerminoBusqueda + '%'
         OR ae.comentariosalumno LIKE '%' + @TerminoBusqueda + '%'
         OR ae.comentariosprofesor LIKE '%' + @TerminoBusqueda + '%'
         OR te.nombre LIKE '%' + @TerminoBusqueda + '%')
    ORDER BY e.fecharealizacion DESC, a.apellidopaterno, a.nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlumnoExamen_RegistrarCalificacion]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AlumnoExamen_RegistrarCalificacion]
    @Id INT,
    @Nota DECIMAL(4,2),
    @ComentariosProfesor NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la inscripción a examen existe
        IF NOT EXISTS (SELECT 1 FROM AlumnoExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('La inscripción a examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la calificación esté en el rango correcto
        IF @Nota < 0 OR @Nota > 10
        BEGIN
            RAISERROR('La calificación debe estar entre 0 y 10.', 16, 1);
            RETURN;
        END
        
        -- Actualizar la inscripción a examen
        UPDATE AlumnoExamen
        SET Nota = @Nota,
            ComentariosProfesor = @ComentariosProfesor,
            Estado = CASE 
                        WHEN @Nota >= 6 THEN 'Aprobado'
                        ELSE 'Reprobado'
                     END
        WHERE Id = @Id;
        
        -- Retornar la inscripción a examen actualizada
        SELECT * FROM AlumnoExamen WHERE Id = @Id;
        
        -- Actualizar la nota final en la inscripción si es necesario
        DECLARE @InscripcionId INT;
        SELECT @InscripcionId = InscripcionId FROM AlumnoExamen WHERE Id = @Id;
        
        -- Calcular la nota final como el promedio de los exámenes de la inscripción
        DECLARE @NotaFinal DECIMAL(4,2);
        
        SELECT @NotaFinal = AVG(ae.Nota)
        FROM AlumnoExamen ae
        WHERE ae.InscripcionId = @InscripcionId
          AND ae.Nota IS NOT NULL;
        
        -- Si se pudo calcular la nota final, actualizarla en la inscripción
        IF @NotaFinal IS NOT NULL
        BEGIN
            UPDATE Inscripcion
            SET NotaFinal = @NotaFinal
            WHERE Id = @InscripcionId;
        END
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_Actualizar]
    @Id INT,
    @FechaRealizacion DATE,
    @Observaciones NVARCHAR(255) = NULL,
    @Estado NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el examen existe
        IF NOT EXISTS (SELECT 1 FROM Examen WHERE Id = @Id)
        BEGIN
            RAISERROR('El examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Obtener el estado actual si no se proporciona uno nuevo
        IF @Estado IS NULL
        BEGIN
            SELECT @Estado = Estado FROM Examen WHERE Id = @Id;
        END
        
        -- Actualizar el examen
        UPDATE Examen
        SET FechaRealizacion = @FechaRealizacion,
            Observaciones = @Observaciones,
            Estado = @Estado
        WHERE Id = @Id;
        
        -- Retornar el examen actualizado
        SELECT * FROM Examen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_Crear]
    @ProgramacionId INT,
    @TipoExamenId INT,
    @FechaRealizacion DATE,
    @Observaciones NVARCHAR(255) = NULL,
    @Estado NVARCHAR(20) = 'Pendiente'
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la programación de examen existe
        IF NOT EXISTS (SELECT 1 FROM ProgramacionExamen WHERE Id = @ProgramacionId)
        BEGIN
            RAISERROR('La programación de examen especificada no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el tipo de examen existe
        IF NOT EXISTS (SELECT 1 FROM TipoExamen WHERE Id = @TipoExamenId)
        BEGIN
            RAISERROR('El tipo de examen especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Obtener información de la programación de examen
        DECLARE @MateriaId INT;
        
        SELECT @MateriaId = MateriaId
        FROM ProgramacionExamen
        WHERE Id = @ProgramacionId;
        
        -- Insertar el nuevo examen
        INSERT INTO Examen (ProgramacionId, TipoExamenId, FechaRealizacion, Observaciones, Estado)
        VALUES (@ProgramacionId, @TipoExamenId, @FechaRealizacion, @Observaciones, @Estado);
        
        -- Obtener el ID del nuevo examen
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar el examen creado
        SELECT * FROM Examen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el examen existe
        IF NOT EXISTS (SELECT 1 FROM Examen WHERE Id = @Id)
        BEGIN
            RAISERROR('El examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el examen está siendo utilizado en algún alumno examen
        IF EXISTS (SELECT 1 FROM AlumnoExamen WHERE ExamenId = @Id)
        BEGIN
            RAISERROR('No se puede eliminar el examen porque ya tiene alumnos inscritos.', 16, 1);
            RETURN;
        END
        
        -- Eliminar el examen
        DELETE FROM Examen WHERE Id = @Id;
        
        -- Retornar resultado exitoso
        SELECT 'Examen eliminado correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_ObtenerConDetalles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_ObtenerConDetalles]
    @MateriaId INT = NULL,
    @Estado NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT e.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria, 
               t.Nombre AS NombreTipoExamen, t.Ponderacion,
               pe.FechaProgramada, pe.DuracionMinutos, pe.Aula, pe.Instrucciones,
               (SELECT COUNT(*) FROM AlumnoExamen WHERE ExamenId = e.Id) AS CantidadAlumnos
        FROM Examen e
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        INNER JOIN TipoExamen t ON e.TipoExamenId = t.Id
        WHERE 1=1';
    
    -- Agregar filtro por materia si se especifica
    IF @MateriaId IS NOT NULL
        SET @Query = @Query + ' AND pe.MateriaId = ' + CAST(@MateriaId AS NVARCHAR);
    
    -- Agregar filtro por estado si se especifica
    IF @Estado IS NOT NULL
        SET @Query = @Query + ' AND e.Estado = ''' + @Estado + '''';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY e.FechaRealizacion DESC';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT e.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria, 
           t.Nombre AS NombreTipoExamen, t.Ponderacion,
           pe.FechaProgramada, pe.DuracionMinutos, pe.Aula, pe.Instrucciones
    FROM Examen e
    INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
    INNER JOIN Materia m ON pe.MateriaId = m.Id
    INNER JOIN TipoExamen t ON e.TipoExamenId = t.Id
    WHERE e.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_ObtenerPorMateriaEstado]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_ObtenerPorMateriaEstado]
    @MateriaId INT = NULL,
    @Estado NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT e.*, pe.MateriaId
        FROM Examen e
        INNER JOIN ProgramacionExamen pe ON e.ProgramacionId = pe.Id
        WHERE 1=1';
    
    -- Agregar filtro por materia si se especifica
    IF @MateriaId IS NOT NULL
        SET @Query = @Query + ' AND pe.MateriaId = ' + CAST(@MateriaId AS NVARCHAR);
    
    -- Agregar filtro por estado si se especifica
    IF @Estado IS NOT NULL
        SET @Query = @Query + ' AND e.Estado = ''' + @Estado + '''';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY e.FechaRealizacion DESC';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Examen_ObtenerTodos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Examen_ObtenerTodos]
    @Estado NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM Examen
    WHERE Estado = ISNULL(@Estado, Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_Actualizar]
    @Id INT,
    @Estado NVARCHAR(20) = NULL,
    @NotaFinal DECIMAL(4,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la inscripción existe
        IF NOT EXISTS (SELECT 1 FROM Inscripcion WHERE Id = @Id)
        BEGIN
            RAISERROR('La inscripción no existe.', 16, 1);
            RETURN;
        END
        
        -- Actualizar la inscripción
        UPDATE Inscripcion
        SET Estado = ISNULL(@Estado, Estado),
            NotaFinal = ISNULL(@NotaFinal, NotaFinal)
        WHERE Id = @Id;
        
        -- Retornar la inscripción actualizada
        SELECT * FROM Inscripcion WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_Crear]
    @AlumnoId INT,
    @MateriaId INT,
    @FechaInscripcion DATE = NULL,
    @PeriodoAcademico NVARCHAR(50),
    @Estado NVARCHAR(20) = 'Activa'
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Si no se proporciona una fecha, usar la fecha actual
    IF @FechaInscripcion IS NULL
        SET @FechaInscripcion = GETDATE();
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el alumno existe
        IF NOT EXISTS (SELECT 1 FROM Alumno WHERE Id = @AlumnoId)
        BEGIN
            RAISERROR('El alumno especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si la materia existe
        IF NOT EXISTS (SELECT 1 FROM Materia WHERE Id = @MateriaId)
        BEGIN
            RAISERROR('La materia especificada no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe una inscripción para el mismo alumno, materia y periodo
        IF EXISTS (SELECT 1 FROM Inscripcion WHERE AlumnoId = @AlumnoId AND MateriaId = @MateriaId AND PeriodoAcademico = @PeriodoAcademico)
        BEGIN
            RAISERROR('Ya existe una inscripción para este alumno en esta materia para el periodo especificado.', 16, 1);
            RETURN;
        END
        
        -- Insertar la nueva inscripción
        INSERT INTO Inscripcion (AlumnoId, MateriaId, FechaInscripcion, PeriodoAcademico, Estado)
        VALUES (@AlumnoId, @MateriaId, @FechaInscripcion, @PeriodoAcademico, @Estado);
        
        -- Obtener el ID de la nueva inscripción
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar la inscripción creada
        SELECT * FROM Inscripcion WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la inscripción existe
        IF NOT EXISTS (SELECT 1 FROM Inscripcion WHERE Id = @Id)
        BEGIN
            RAISERROR('La inscripción no existe.', 16, 1);
            RETURN;
        END
        
        -- Cambiar el estado de la inscripción a "Cancelada"
        UPDATE Inscripcion SET Estado = 'Cancelada' WHERE Id = @Id;
        
        -- Retornar resultado exitoso
        SELECT 'Inscripción cancelada correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_ObtenerConDetalles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_ObtenerConDetalles]
    @PeriodoAcademico NVARCHAR(50) = NULL,
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF (@PeriodoAcademico IS NULL OR @PeriodoAcademico = '' )
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno, 
                   m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.Estado = 'Activa'
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre, m.Nombre;
        ELSE
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno, 
                   m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            INNER JOIN Materia m ON i.MateriaId = m.Id
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre, m.Nombre;
    END
    ELSE
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno, 
                   m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.PeriodoAcademico = @PeriodoAcademico AND i.Estado = 'Activa'
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre, m.Nombre;
        ELSE
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno, 
                   m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.PeriodoAcademico = @PeriodoAcademico
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre, m.Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_ObtenerPorAlumno]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_ObtenerPorAlumno]
    @AlumnoId INT,
    @PeriodoAcademico NVARCHAR(50) = NULL,
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF (@PeriodoAcademico IS NULL OR @PeriodoAcademico = '' )
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.AlumnoId = @AlumnoId AND i.Estado = 'Activa'
            ORDER BY m.Nombre;
        ELSE
            SELECT i.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.AlumnoId = @AlumnoId
            ORDER BY m.Nombre;
    END
    ELSE
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.AlumnoId = @AlumnoId AND i.PeriodoAcademico = @PeriodoAcademico AND i.Estado = 'Activa'
            ORDER BY m.Nombre;
        ELSE
            SELECT i.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
            FROM Inscripcion i
            INNER JOIN Materia m ON i.MateriaId = m.Id
            WHERE i.AlumnoId = @AlumnoId AND i.PeriodoAcademico = @PeriodoAcademico
            ORDER BY m.Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno, 
           m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria
    FROM Inscripcion i
    INNER JOIN Alumno a ON i.AlumnoId = a.Id
    INNER JOIN Materia m ON i.MateriaId = m.Id
    WHERE i.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_ObtenerPorMateria]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_ObtenerPorMateria]
    @MateriaId INT,
    @PeriodoAcademico NVARCHAR(50) = NULL,
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF (@PeriodoAcademico IS NULL OR @PeriodoAcademico = '' )
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            WHERE i.MateriaId = @MateriaId AND i.Estado = 'Activa'
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre;
        ELSE
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            WHERE i.MateriaId = @MateriaId
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre;
    END
    ELSE
    BEGIN
        IF @SoloActivas = 1
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            WHERE i.MateriaId = @MateriaId AND i.PeriodoAcademico = @PeriodoAcademico AND i.Estado = 'Activa'
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre;
        ELSE
            SELECT i.*, a.Nombre + ' ' + a.ApellidoPaterno + ' ' + a.ApellidoMaterno AS NombreAlumno
            FROM Inscripcion i
            INNER JOIN Alumno a ON i.AlumnoId = a.Id
            WHERE i.MateriaId = @MateriaId AND i.PeriodoAcademico = @PeriodoAcademico
            ORDER BY a.ApellidoPaterno, a.ApellidoMaterno, a.Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inscripcion_ObtenerTodas]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inscripcion_ObtenerTodas]
    @PeriodoAcademico NVARCHAR(50) = NULL,
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF (@PeriodoAcademico IS NULL OR @PeriodoAcademico = '' )
    BEGIN
        IF @SoloActivas = 1
            SELECT * FROM Inscripcion WHERE Estado = 'Activa' ORDER BY FechaInscripcion DESC;
        ELSE
            SELECT * FROM Inscripcion ORDER BY FechaInscripcion DESC;
    END
    ELSE
    BEGIN
        IF @SoloActivas = 1
            SELECT * FROM Inscripcion WHERE PeriodoAcademico = @PeriodoAcademico AND Estado = 'Activa' ORDER BY FechaInscripcion DESC;
        ELSE
            SELECT * FROM Inscripcion WHERE PeriodoAcademico = @PeriodoAcademico ORDER BY FechaInscripcion DESC;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_Actualizar]
    @Id INT,
    @Nombre NVARCHAR(100),
    @Codigo NVARCHAR(20),
    @Profesor NVARCHAR(100),
    @Descripcion NVARCHAR(MAX) = NULL,
    @Creditos INT,
	@Activa bit
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la materia existe
        IF NOT EXISTS (SELECT 1 FROM Materia WHERE Id = @Id)
        BEGIN
            RAISERROR('La materia no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe otra materia con el mismo código
        IF EXISTS (SELECT 1 FROM Materia WHERE Codigo = @Codigo AND Id != @Id)
        BEGIN
            RAISERROR('Ya existe otra materia con el mismo código.', 16, 1);
            RETURN;
        END
        
        -- Actualizar la materia
        UPDATE Materia
        SET Nombre = @Nombre,
            Codigo = @Codigo,
            Profesor = @Profesor,
            Descripcion = @Descripcion,
            Creditos = @Creditos,
			Activa = @Activa
        WHERE Id = @Id;
        
        -- Retornar la materia actualizada
        SELECT * FROM Materia WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_Buscar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_Buscar]
    @Busqueda NVARCHAR(100),
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @SoloActivas = 1
    BEGIN
        SELECT * FROM Materia
        WHERE (
            Nombre LIKE '%' + @Busqueda + '%' OR
            Codigo LIKE '%' + @Busqueda + '%' OR
            Descripcion LIKE '%' + @Busqueda + '%' OR
            Profesor LIKE '%' + @Busqueda + '%'
        ) AND Activa = 1
        ORDER BY Nombre;
    END
    ELSE
    BEGIN
        SELECT * FROM Materia
        WHERE (
            Nombre LIKE '%' + @Busqueda + '%' OR
            Codigo LIKE '%' + @Busqueda + '%' OR
            Descripcion LIKE '%' + @Busqueda + '%' OR
            Profesor LIKE '%' + @Busqueda + '%'
        )
        ORDER BY Nombre;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_Crear]
    @Nombre NVARCHAR(100),
    @Codigo NVARCHAR(20),
    @Profesor NVARCHAR(100),
    @Descripcion NVARCHAR(MAX) = NULL,
    @Creditos INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si ya existe una materia con el mismo código
        IF EXISTS (SELECT 1 FROM Materia WHERE Codigo = @Codigo)
        BEGIN
            RAISERROR('Ya existe una materia con el mismo código.', 16, 1);
            RETURN;
        END
        
        -- Insertar la nueva materia
        INSERT INTO Materia (Nombre, Codigo, Profesor, Descripcion, Creditos, Activa)
        VALUES (@Nombre, @Codigo, @Profesor, @Descripcion, @Creditos, 1);
        
        -- Obtener el ID de la nueva materia
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar la materia creada
        SELECT * FROM Materia WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la materia existe
        IF NOT EXISTS (SELECT 1 FROM Materia WHERE Id = @Id)
        BEGIN
            RAISERROR('La materia no existe.', 16, 1);
            RETURN;
        END
        
        -- Desactivar la materia (eliminación lógica)
        UPDATE Materia SET Activa = 0 WHERE Id = @Id;
        
        -- Retornar mensaje de éxito
        SELECT 'Materia desactivada correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_ObtenerPorCodigo]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_ObtenerPorCodigo]
    @Codigo NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM Materia WHERE Codigo = @Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM Materia WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Materia_ObtenerTodas]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Materia_ObtenerTodas]
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @SoloActivas = 1
        SELECT * FROM Materia WHERE Activa = 1 ORDER BY Nombre;
    ELSE
        SELECT * FROM Materia ORDER BY Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_Actualizar]
    @Id INT,
    @MateriaId INT,
    @ExamenId INT,
    @FechaProgramada DATETIME,
    @DuracionMinutos INT,
    @Aula NVARCHAR(50),
    @Instrucciones NVARCHAR(MAX) = NULL,
    @MaterialRequerido NVARCHAR(MAX) = NULL,
    @Estado NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la programación de examen existe
        IF NOT EXISTS (SELECT 1 FROM ProgramacionExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('La programación de examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la duración sea positiva
        IF @DuracionMinutos <= 0
        BEGIN
            RAISERROR('La duración del examen debe ser un valor positivo.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la fecha sea igual o posterior a la actual
        IF @FechaProgramada < GETDATE()
        BEGIN
            RAISERROR('La fecha del examen debe ser igual o posterior a la fecha actual.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe otra programación de examen con la misma aula y fecha
        IF EXISTS (
            SELECT 1 
            FROM ProgramacionExamen 
            WHERE Aula = @Aula 
              AND FechaProgramada = @FechaProgramada
              AND Id != @Id
        )
        BEGIN
            RAISERROR('Ya existe otra programación de examen para la misma aula y fecha.', 16, 1);
            RETURN;
        END
        
        -- Obtener el estado actual si no se proporciona uno nuevo
        IF @Estado IS NULL
        BEGIN
            SELECT @Estado = Estado FROM ProgramacionExamen WHERE Id = @Id;
        END
        
        UPDATE dbo.ProgramacionExamen
		SET
			MateriaId = @MateriaId,
			ExamenId = @ExamenId,
			FechaProgramada = @FechaProgramada,
			DuracionMinutos = @DuracionMinutos,
			Aula = @Aula,
			Instrucciones = @Instrucciones,
			MaterialRequerido = @MaterialRequerido,
			Estado = @Estado,
			FechaModificacion = GETDATE()
		WHERE
			Id = @Id;
        
		--SELECT @@ROWCOUNT AS FilasAfectadas;
        
        -- Retornar la programación de examen actualizada
        SELECT * FROM ProgramacionExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_Crear]
    @MateriaId INT,
    @ExamenId INT,
    @FechaProgramada DATETIME,
    @DuracionMinutos INT,
    @Aula NVARCHAR(50),
    @Instrucciones NVARCHAR(MAX) = NULL,
    @MaterialRequerido NVARCHAR(MAX) = NULL,
    @Estado NVARCHAR(50) = 'Programado',
    @Id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la materia existe
        IF NOT EXISTS (SELECT 1 FROM Materia WHERE Id = @MateriaId)
        BEGIN
            RAISERROR('La materia especificada no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la duración sea positiva
        IF @DuracionMinutos <= 0
        BEGIN
            RAISERROR('La duración del examen debe ser un valor positivo.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la fecha sea igual o posterior a la actual
        IF @FechaProgramada < GETDATE()
        BEGIN
            RAISERROR('La fecha del examen debe ser igual o posterior a la fecha actual.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe una programación de examen con la misma aula y fecha
        IF EXISTS (
            SELECT 1 
            FROM ProgramacionExamen 
            WHERE Aula = @Aula 
              AND FechaProgramada = @FechaProgramada
        )
        BEGIN
            RAISERROR('Ya existe una programación de examen para la misma aula y fecha.', 16, 1);
            RETURN;
        END
        
        -- Insertar la nueva programación de examen
            INSERT INTO dbo.ProgramacionExamen (
				MateriaId,
				ExamenId,
				FechaProgramada,
				DuracionMinutos,
				Aula,
				Instrucciones,
				MaterialRequerido,
				Estado,
				Activo,
				FechaCreacion
			)
			VALUES (
				@MateriaId,
				@ExamenId,
				@FechaProgramada,
				@DuracionMinutos,
				@Aula,
				@Instrucciones,
				@MaterialRequerido,
				@Estado,
				1,
				GETDATE()
			);
    
		SET @Id = SCOPE_IDENTITY();
        
        -- Retornar la programación de examen creada
        SELECT * FROM ProgramacionExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si la programación de examen existe
        IF NOT EXISTS (SELECT 1 FROM ProgramacionExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('La programación de examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si la programación de examen está siendo utilizada en algún examen
        IF EXISTS (SELECT 1 FROM Examen WHERE ProgramacionId = @Id)
        BEGIN
            RAISERROR('No se puede eliminar la programación de examen porque está siendo utilizada en exámenes existentes.', 16, 1);
            RETURN;
        END
        
        -- Eliminar la programación de examen
        DELETE FROM ProgramacionExamen WHERE Id = @Id;
        
        -- Retornar resultado exitoso
        SELECT 'Programación de examen eliminada correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_EstadisticasPorMateria]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Obtener estadísticas de programaciones por materia
-- Útil para informes o dashboards
-- =============================================
CREATE   PROCEDURE [dbo].[sp_ProgramacionExamen_EstadisticasPorMateria]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        m.Id AS MateriaId,
        m.Nombre AS NombreMateria,
        m.Codigo AS CodigoMateria,
        COUNT(pe.Id) AS TotalProgramaciones,
        SUM(CASE WHEN pe.Estado = 'Programado' THEN 1 ELSE 0 END) AS ProgramacionesPendientes,
        SUM(CASE WHEN pe.Estado = 'Completado' THEN 1 ELSE 0 END) AS ProgramacionesCompletadas,
        SUM(CASE WHEN pe.Estado = 'Cancelado' THEN 1 ELSE 0 END) AS ProgramacionesCanceladas
    FROM 
        dbo.Materia m
    LEFT JOIN 
        dbo.ProgramacionExamen pe ON m.Id = pe.MateriaId AND pe.Activo = 1
    WHERE 
        m.Activa = 1
    GROUP BY 
        m.Id, m.Nombre, m.Codigo
    ORDER BY 
        TotalProgramaciones DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_ObtenerConDetalles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_ObtenerConDetalles]
    @FechaDesde DATE = NULL,
    @FechaHasta DATE = NULL,
    @Estado NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT pe.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria,
               (SELECT COUNT(*) FROM Examen WHERE ProgramacionId = pe.Id) AS CantidadExamenes
        FROM ProgramacionExamen pe
        INNER JOIN Materia m ON pe.MateriaId = m.Id
        WHERE 1=1';
    
    -- Agregar filtro por fecha desde si se especifica
    IF @FechaDesde IS NOT NULL
        SET @Query = @Query + ' AND pe.FechaProgramada >= ''' + CONVERT(NVARCHAR, @FechaDesde, 23) + '''';
    
    -- Agregar filtro por fecha hasta si se especifica
    IF @FechaHasta IS NOT NULL
        SET @Query = @Query + ' AND pe.FechaProgramada <= ''' + CONVERT(NVARCHAR, @FechaHasta, 23) + '''';
    
    -- Agregar filtro por estado si se especifica
    IF @Estado IS NOT NULL
        SET @Query = @Query + ' AND pe.Estado = ''' + @Estado + '''';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY pe.FechaProgramada';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_ObtenerPorExamen]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ProgramacionExamen_ObtenerPorExamen]
    @ExamenId INT,
    @SoloActivas BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pe.Id,
        pe.MateriaId,
        pe.ExamenId,
        m.Nombre AS NombreMateria,
        m.Codigo AS CodigoMateria,
        m.Profesor AS ProfesorMateria,
        pe.FechaProgramada,
        pe.DuracionMinutos,
        pe.Aula,
        pe.Instrucciones,
        pe.MaterialRequerido,
        pe.Estado,
        pe.Activo
    FROM 
        dbo.ProgramacionExamen pe
    INNER JOIN 
        dbo.Materia m ON pe.MateriaId = m.Id
    WHERE 
        pe.ExamenId = @ExamenId
        AND (@SoloActivas = 0 OR pe.Activo = 1)
    ORDER BY 
        pe.FechaProgramada DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT pe.*, m.Nombre AS NombreMateria, m.Codigo AS CodigoMateria, 
		(SELECT COUNT(1) FROM dbo.Examen e WHERE e.ProgramacionId = pe.Id AND e.Activo = 1) AS CantidadExamenes
    FROM ProgramacionExamen pe
    INNER JOIN Materia m ON pe.MateriaId = m.Id
    WHERE pe.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_ObtenerPorMateria]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_ObtenerPorMateria]
    @MateriaId INT,
    @Estado NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT pe.*
        FROM ProgramacionExamen pe
        WHERE pe.MateriaId = ' + CAST(@MateriaId AS NVARCHAR);
    
    -- Agregar filtro por estado si se especifica
    IF @Estado IS NOT NULL AND @Estado != ''
        SET @Query = @Query + ' AND pe.Estado = ''' + @Estado + '''';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY pe.FechaProgramada';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramacionExamen_ObtenerTodas]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProgramacionExamen_ObtenerTodas]
    @FechaDesde DATE = NULL,
    @FechaHasta DATE = NULL,
    @Estado NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = 'SELECT * FROM ProgramacionExamen WHERE 1=1';
    
    -- Agregar filtro por fecha desde si se especifica
    IF @FechaDesde IS NOT NULL
        SET @Query = @Query + ' AND FechaProgramada >= ''' + CONVERT(NVARCHAR, @FechaDesde, 23) + '''';
    
    -- Agregar filtro por fecha hasta si se especifica
    IF @FechaHasta IS NOT NULL
        SET @Query = @Query + ' AND FechaProgramada <= ''' + CONVERT(NVARCHAR, @FechaHasta, 23) + '''';
    
    -- Agregar filtro por estado si se especifica
    IF @Estado IS NOT NULL
        SET @Query = @Query + ' AND Estado = ''' + @Estado + '''';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY FechaProgramada';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Roles_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Roles_ObtenerPorId]
    @Id NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Name, NormalizedName
    FROM AspNetRoles
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Roles_ObtenerTodos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Roles_ObtenerTodos]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Name, NormalizedName
    FROM AspNetRoles
    ORDER BY Name;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Roles_ObtenerUsuarios]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Roles_ObtenerUsuarios]
    @RoleId NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        u.Id, 
        u.UserName, 
        u.Email, 
        u.PhoneNumber
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    WHERE ur.RoleId = @RoleId
    ORDER BY u.UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoExamen_Actualizar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoExamen_Actualizar]
    @Id INT,
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Ponderacion DECIMAL(4,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el tipo de examen existe
        IF NOT EXISTS (SELECT 1 FROM TipoExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('El tipo de examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si ya existe otro tipo de examen con el mismo nombre
        IF EXISTS (SELECT 1 FROM TipoExamen WHERE Nombre = @Nombre AND Id != @Id)
        BEGIN
            RAISERROR('Ya existe otro tipo de examen con el mismo nombre.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la ponderación esté en el rango correcto
        IF @Ponderacion <= 0 OR @Ponderacion > 100
        BEGIN
            RAISERROR('La ponderación debe ser mayor que 0 y no mayor que 100.', 16, 1);
            RETURN;
        END
        
        -- Actualizar el tipo de examen
        UPDATE TipoExamen
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            Ponderacion = @Ponderacion
        WHERE Id = @Id;
        
        -- Retornar el tipo de examen actualizado
        SELECT * FROM TipoExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoExamen_Crear]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoExamen_Crear]
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Ponderacion DECIMAL(4,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si ya existe un tipo de examen con el mismo nombre
        IF EXISTS (SELECT 1 FROM TipoExamen WHERE Nombre = @Nombre)
        BEGIN
            RAISERROR('Ya existe un tipo de examen con el mismo nombre.', 16, 1);
            RETURN;
        END
        
        -- Verificar que la ponderación esté en el rango correcto
        IF @Ponderacion <= 0 OR @Ponderacion > 100
        BEGIN
            RAISERROR('La ponderación debe ser mayor que 0 y no mayor que 100.', 16, 1);
            RETURN;
        END
        
        -- Insertar el nuevo tipo de examen
        INSERT INTO TipoExamen (Nombre, Descripcion, Ponderacion)
        VALUES (@Nombre, @Descripcion, @Ponderacion);
        
        -- Obtener el ID del nuevo tipo de examen
        DECLARE @Id INT = SCOPE_IDENTITY();
        
        -- Retornar el tipo de examen creado
        SELECT * FROM TipoExamen WHERE Id = @Id;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoExamen_Eliminar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoExamen_Eliminar]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el tipo de examen existe
        IF NOT EXISTS (SELECT 1 FROM TipoExamen WHERE Id = @Id)
        BEGIN
            RAISERROR('El tipo de examen no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el tipo de examen está siendo utilizado en algún examen
        IF EXISTS (SELECT 1 FROM Examen WHERE TipoExamenId = @Id)
        BEGIN
            RAISERROR('No se puede eliminar el tipo de examen porque está siendo utilizado en exámenes existentes.', 16, 1);
            RETURN;
        END
        
        -- Eliminar el tipo de examen
        DELETE FROM TipoExamen WHERE Id = @Id;
        
        -- Retornar resultado exitoso
        SELECT 'Tipo de examen eliminado correctamente.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoExamen_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoExamen_ObtenerPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM TipoExamen WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoExamen_ObtenerTodos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoExamen_ObtenerTodos]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT * FROM TipoExamen ORDER BY Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_AsignarRol]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_AsignarRol]
    @UserId NVARCHAR(450),
    @RoleId NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el usuario existe
        IF NOT EXISTS (SELECT 1 FROM AspNetUsers WHERE Id = @UserId)
        BEGIN
            RAISERROR('El usuario especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el rol existe
        IF NOT EXISTS (SELECT 1 FROM AspNetRoles WHERE Id = @RoleId)
        BEGIN
            RAISERROR('El rol especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el usuario ya tiene el rol
        IF EXISTS (SELECT 1 FROM AspNetUserRoles WHERE UserId = @UserId AND RoleId = @RoleId)
        BEGIN
            RAISERROR('El usuario ya tiene el rol especificado.', 16, 1);
            RETURN;
        END
        
        -- Asignar el rol al usuario
        INSERT INTO AspNetUserRoles (UserId, RoleId)
        VALUES (@UserId, @RoleId);
        
        -- Retornar resultado exitoso
        SELECT 'Rol asignado correctamente al usuario.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_Buscar]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_Buscar]
    @Busqueda NVARCHAR(100),
    @RoleId NVARCHAR(450) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX) = '
        SELECT 
            u.Id, 
            u.UserName, 
            u.Email, 
            u.PhoneNumber, 
            u.EmailConfirmed,
            u.LockoutEnabled,
            u.AccessFailedCount,
            STUFF((
                SELECT '', '' + r.Name
                FROM AspNetUserRoles ur
                INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
                WHERE ur.UserId = u.Id
                FOR XML PATH('''')
            ), 1, 2, '''') AS Roles,
            a.Id AS AlumnoId,
            CASE WHEN a.Id IS NOT NULL THEN 1 ELSE 0 END AS EsAlumno
        FROM AspNetUsers u
        LEFT JOIN Alumno a ON u.Id = a.UserId';
    
    -- Agregar join con roles si se especifica un rol
    IF @RoleId IS NOT NULL
        SET @Query = @Query + '
        INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
        WHERE ur.RoleId = ''' + @RoleId + '''';
    ELSE
        SET @Query = @Query + ' WHERE 1=1';
    
    -- Agregar condición de búsqueda
    IF @Busqueda IS NOT NULL
        SET @Query = @Query + ' AND (
            u.UserName LIKE ''%' + @Busqueda + '%'' OR
            u.Email LIKE ''%' + @Busqueda + '%'' OR
            u.PhoneNumber LIKE ''%' + @Busqueda + '%''
        )';
    
    -- Ordenar los resultados
    SET @Query = @Query + ' ORDER BY u.UserName';
    
    -- Ejecutar la consulta
    EXEC sp_executesql @Query;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_ObtenerPorId]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_ObtenerPorId]
    @Id NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        u.Id, 
        u.UserName, 
        u.Email, 
        u.PhoneNumber, 
        u.EmailConfirmed,
        u.LockoutEnabled,
        u.AccessFailedCount,
        STUFF((
            SELECT ', ' + r.Name
            FROM AspNetUserRoles ur
            INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
            WHERE ur.UserId = u.Id
            FOR XML PATH('')
        ), 1, 2, '') AS Roles,
        a.Id AS AlumnoId,
        CASE WHEN a.Id IS NOT NULL THEN 1 ELSE 0 END AS EsAlumno
    FROM AspNetUsers u
    LEFT JOIN Alumno a ON u.Id = a.UserId
    WHERE u.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_ObtenerRoles]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_ObtenerRoles]
    @UserId NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT r.Id, r.Name
    FROM AspNetRoles r
    INNER JOIN AspNetUserRoles ur ON r.Id = ur.RoleId
    WHERE ur.UserId = @UserId
    ORDER BY r.Name;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_ObtenerTodos]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_ObtenerTodos]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        u.Id, 
        u.UserName, 
        u.Email, 
        u.PhoneNumber, 
        u.EmailConfirmed,
        u.LockoutEnabled,
        u.AccessFailedCount,
        STUFF((
            SELECT ', ' + r.Name
            FROM AspNetUserRoles ur
            INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
            WHERE ur.UserId = u.Id
            FOR XML PATH('')
        ), 1, 2, '') AS Roles,
        a.Id AS AlumnoId,
        CASE WHEN a.Id IS NOT NULL THEN 1 ELSE 0 END AS EsAlumno
    FROM AspNetUsers u
    LEFT JOIN Alumno a ON u.Id = a.UserId
    ORDER BY u.UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_QuitarRol]    Script Date: 27/03/2025 05:26:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usuarios_QuitarRol]
    @UserId NVARCHAR(450),
    @RoleId NVARCHAR(450)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar si el usuario existe
        IF NOT EXISTS (SELECT 1 FROM AspNetUsers WHERE Id = @UserId)
        BEGIN
            RAISERROR('El usuario especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el rol existe
        IF NOT EXISTS (SELECT 1 FROM AspNetRoles WHERE Id = @RoleId)
        BEGIN
            RAISERROR('El rol especificado no existe.', 16, 1);
            RETURN;
        END
        
        -- Verificar si el usuario tiene el rol
        IF NOT EXISTS (SELECT 1 FROM AspNetUserRoles WHERE UserId = @UserId AND RoleId = @RoleId)
        BEGIN
            RAISERROR('El usuario no tiene el rol especificado.', 16, 1);
            RETURN;
        END
        
        -- Quitar el rol al usuario
        DELETE FROM AspNetUserRoles
        WHERE UserId = @UserId AND RoleId = @RoleId;
        
        -- Retornar resultado exitoso
        SELECT 'Rol quitado correctamente al usuario.' AS Mensaje;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [db_alumnos] SET  READ_WRITE 
GO
