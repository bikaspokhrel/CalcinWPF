USE [master]
GO
/****** Object:  Database [student_db]    Script Date: 21/12/2018 9:37:08 AM ******/
CREATE DATABASE [student_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'student_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\student_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'student_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\student_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [student_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [student_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [student_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [student_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [student_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [student_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [student_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [student_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [student_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [student_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [student_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [student_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [student_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [student_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [student_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [student_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [student_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [student_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [student_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [student_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [student_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [student_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [student_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [student_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [student_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [student_db] SET  MULTI_USER 
GO
ALTER DATABASE [student_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [student_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [student_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [student_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [student_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [student_db] SET QUERY_STORE = OFF
GO
USE [student_db]
GO
/****** Object:  Table [dbo].[course_details]    Script Date: 21/12/2018 9:37:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_details](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nchar](10) NULL,
	[tutor_id] [int] NULL,
 CONSTRAINT [PK_course_details] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_details]    Script Date: 21/12/2018 9:37:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_details](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nchar](10) NULL,
	[l_name] [nchar](10) NULL,
	[course_id] [int] NULL,
	[email] [nchar](30) NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK_student_details] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutor_details]    Script Date: 21/12/2018 9:37:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutor_details](
	[tutor_id] [int] IDENTITY(1,1) NOT NULL,
	[tutor_name] [nchar](10) NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK_tutor_details] PRIMARY KEY CLUSTERED 
(
	[tutor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[course_details] ON 

INSERT [dbo].[course_details] ([course_id], [course_name], [tutor_id]) VALUES (1, N'Software  ', 2)
INSERT [dbo].[course_details] ([course_id], [course_name], [tutor_id]) VALUES (2, N'Web       ', 3)
INSERT [dbo].[course_details] ([course_id], [course_name], [tutor_id]) VALUES (5, N'jATIN     ', 3)
SET IDENTITY_INSERT [dbo].[course_details] OFF
SET IDENTITY_INSERT [dbo].[tutor_details] ON 

INSERT [dbo].[tutor_details] ([tutor_id], [tutor_name], [phone]) VALUES (1, N'Bikash    ', 9876543)
INSERT [dbo].[tutor_details] ([tutor_id], [tutor_name], [phone]) VALUES (2, N'Aakash    ', 987654)
INSERT [dbo].[tutor_details] ([tutor_id], [tutor_name], [phone]) VALUES (3, N'Rames     ', 98765)
SET IDENTITY_INSERT [dbo].[tutor_details] OFF
ALTER TABLE [dbo].[course_details]  WITH CHECK ADD  CONSTRAINT [FK_course_details_tutor_details] FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor_details] ([tutor_id])
GO
ALTER TABLE [dbo].[course_details] CHECK CONSTRAINT [FK_course_details_tutor_details]
GO
USE [master]
GO
ALTER DATABASE [student_db] SET  READ_WRITE 
GO
