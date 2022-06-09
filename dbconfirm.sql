USE [master]
GO
/****** Object:  Database [ass_prj]    Script Date: 6/9/2022 5:13:18 PM ******/
CREATE DATABASE [ass_prj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ass_prj', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\ass_prj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ass_prj_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\ass_prj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ass_prj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ass_prj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ass_prj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ass_prj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ass_prj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ass_prj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ass_prj] SET ARITHABORT OFF 
GO
ALTER DATABASE [ass_prj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ass_prj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ass_prj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ass_prj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ass_prj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ass_prj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ass_prj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ass_prj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ass_prj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ass_prj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ass_prj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ass_prj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ass_prj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ass_prj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ass_prj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ass_prj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ass_prj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ass_prj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ass_prj] SET  MULTI_USER 
GO
ALTER DATABASE [ass_prj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ass_prj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ass_prj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ass_prj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ass_prj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ass_prj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ass_prj] SET QUERY_STORE = OFF
GO
USE [ass_prj]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nchar](50) NOT NULL,
	[password] [nchar](16) NOT NULL,
	[role] [int] NOT NULL,
	[name] [nchar](50) NULL,
	[gender] [nvarchar](150) NULL,
	[age] [int] NULL,
	[address] [nvarchar](150) NULL,
	[phone] [nvarchar](150) NULL,
	[email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseID] [nvarchar](50) NOT NULL,
	[doctorID] [nvarchar](50) NOT NULL,
	[courseName] [nvarchar](150) NOT NULL,
	[courseTimeWorking] [nvarchar](50) NOT NULL,
	[coursePrice] [nvarchar](50) NULL,
	[courseImg] [nvarchar](150) NULL,
	[courseInfo] [nvarchar](500) NULL,
 CONSTRAINT [PK__Course__2AA84FF1170874B3] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[departmentID] [nvarchar](50) NOT NULL,
	[departmentName] [varchar](150) NOT NULL,
	[departmentPhone] [char](11) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[departmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[doctorID] [nvarchar](50) NOT NULL,
	[departmentID] [nvarchar](50) NOT NULL,
	[username] [nchar](50) NULL,
 CONSTRAINT [PK__Doctor__7224859660E7C171] PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[patientID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [nvarchar](50) NULL,
	[username] [nchar](50) NULL,
 CONSTRAINT [PK_Patient_1] PRIMARY KEY CLUSTERED 
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Course]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Course](
	[patientID] [int] NOT NULL,
	[courseID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomPatient]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPatient](
	[roomID] [nvarchar](50) NOT NULL,
	[departmentID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 6/9/2022 5:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[supervisorID] [int] IDENTITY(1,1) NOT NULL,
	[departmentID] [nvarchar](50) NULL,
	[username] [nchar](50) NULL,
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[supervisorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'admin                                             ', N'admin           ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'D                                                 ', N'd               ', 2, N'A                                                 ', N'1', 25, N'A', N'12', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd1                                                ', N'1               ', 1, N'D                                                 ', N'0', 20, N'B', N'12', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd2                                                ', N'2               ', 1, N'M                                                 ', N'1', 22, N'a', N'65', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd3                                                ', N'3               ', 1, N'B                                                 ', N'1', 23, N'b', N'55', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd4                                                ', N'4               ', 1, N'V                                                 ', N'1', 24, N'v', N'3', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd5                                                ', N'5               ', 1, N'A                                                 ', N'0', 30, N'c', N'2', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd6                                                ', N'6               ', 1, N'B                                                 ', N'1', 31, N'f', N'1', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'd7                                                ', N'7               ', 1, N'N                                                 ', N'0', 35, N'h', N'3', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'dg                                                ', N'd               ', 2, N'R                                                 ', N'0', 36, N'g', N'51', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'n1                                                ', N'1               ', 1, N'T                                                 ', N'1', 40, N'f', N'2', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'n2                                                ', N'2               ', 1, N'H                                                 ', N'1', 45, N'b', N'3', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'n3                                                ', N'3               ', 1, N'N                                                 ', N'1', 45, N'm', N'22', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p10                                               ', N'10              ', 2, N'S                                                 ', N'0', 44, N'k', NULL, N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p11                                               ', N'11              ', 2, N'A                                                 ', N'1', 46, N'j', N'5', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p12                                               ', N'12              ', 2, N'V                                                 ', N'0', 41, N'h', N'78', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p13                                               ', N'13              ', 2, N'G                                                 ', N'1', 42, N'g', N'9', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p14                                               ', N'14              ', 2, N'B                                                 ', N'1', 46, N'f', N'78', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p3                                                ', N'3               ', 2, N'A                                                 ', N'1', 43, N'd', N'6', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p4                                                ', N'4               ', 2, N'R                                                 ', N'0', 20, N's', N'5', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p5                                                ', N'5               ', 2, N'T                                                 ', N'0', 30, N'r', N'8', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p6                                                ', N'6               ', 2, N'Y                                                 ', N'0', 35, N't', N'9', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p7                                                ', N'7               ', 2, N'K                                                 ', N'1', 34, N'y', N'6', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p8                                                ', N'8               ', 2, N'Q                                                 ', N'1', 20, N'u', N'56', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'p9                                                ', N'9               ', 2, N'A                                                 ', N'0', 21, N'j', N'12', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'r1                                                ', N'1               ', 1, N'R                                                 ', N'1', 23, N'f', N'62', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'r2                                                ', N'2               ', 1, N'U                                                 ', N'0', 26, N'd', N'5', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'r3                                                ', N'3               ', 1, N'I                                                 ', N'1', 28, N's', N'89', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's1                                                ', N'1               ', 0, NULL, NULL, NULL, NULL, N'4', NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's2                                                ', N'2               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's3                                                ', N'3               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's4                                                ', N'4               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's5                                                ', N'5               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's6                                                ', N'6               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's7                                                ', N'7               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N's8                                                ', N'8               ', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'ss1                                               ', N'1               ', 1, N'P                                                 ', N'1', 22, N'e', N'6', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'ss2                                               ', N'2               ', 1, N'T                                                 ', N'0', 60, N'w', N'5', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'x                                                 ', N'x               ', 1, N'U                                                 ', N'1', 61, N'k', N'23', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'x10                                               ', N'10              ', 2, N'I                                                 ', N'0', 40, N'l', N'22', N'a@b')
INSERT [dbo].[Account] ([username], [password], [role], [name], [gender], [age], [address], [phone], [email]) VALUES (N'z                                                 ', N'z               ', 1, N'O                                                 ', N'0', 40, N'k', N'12', N'a@b')
GO
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'A01', N'D6', N'Electroencephalography ', N'8am-10am', N'36', N'https://i.pinimg.com/236x/0a/08/dd/0a08ddb2fc3c9c9b22a033ff04dce5a8.jpg', N'What does it mean to truly change something? How does one persuade others to change? How do we reduce roadblocks to change? In this course, you’ll learn about the barriers to change and how to become more effective in inspiring change within others and your organization.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'A02', N'D7', N'Psychosis', N'8am-10am', N'50', N'https://i.pinimg.com/236x/2c/56/e0/2c56e0ba6c250de1c16c3a8f10ce0d00.jpg', N'A challenging but fascinating topic on the way to achieving self-knowledge is the unconscious. For well over a century, psychologists, philosophers, and many others have posited a level of mentality that is not immediately open to introspection; some would even say that certain unconscious elements cannot be known through introspection.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B01', N'D1', N'Practice', N'2pm-4pm', N'29', N'https://i.pinimg.com/564x/44/6d/9b/446d9b914767595be8ab217cdecf31ec.jpg', N'In this course you will engage in a series of challenges designed to increase your own happiness and build more productive habits. As preparation for these tasks, Professor Laurie Santos reveals misconceptions about happiness, annoying features of the mind that lead us to think the way we do')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B02', N'D1', N'Depression', N'2pm-4:30pm', N'59', N'https://i.pinimg.com/564x/16/c9/15/16c915610e0690c5d0bf4ad9202d3d04.jpg', N'This is the sequel course to Foundations of Mindfulness that will continue to provide a broad overview of the fundamental concepts, principles, and practices of mindfulness. With interactive exercises to help students explore their own attitudes, mental habits and behaviors, Foundations of Mindfulness series offers a pathway for living with more freedom, authenticity and ease.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B03', N'D2', N'Marital Relationship', N'7pm-8pm', N'99', N'https://i.pinimg.com/236x/9a/ad/47/9aad474c8cadb47c0c4a0c359b99a2f5.jpg', N'In today’s world, mental illness and distress are common and these account for a significant burden of disability within our community. At the same time, there is a growing interest in understanding and enhancing positive mental health and wellbeing; particularly from developments in the fields of positive psychology and mental health promotion.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B04', N'D2', N'Multiple Personalities', N'2pm-5pm', N'49', N'https://i.pinimg.com/564x/ac/73/18/ac73185a4ad64c74d7725476f0956810.jpg', N'What does it mean to truly change something? How does one persuade others to change? How do we reduce roadblocks to change? In this course, you’ll learn about the barriers to change and how to become more effective in inspiring change within others and your organization.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B05', N'D3', N'Introduction to Psychology', N'3pm-6pm', N'20', N'https://i.pinimg.com/236x/2d/74/f9/2d74f96986b738acea3dbc0c881ea7c7.jpg', N'What are people most afraid of? What do our dreams mean? Are we natural-born racists? What makes us happy? What are the causes and cures of mental illness? This course tries to answer these questions and many others, providing a comprehensive overview of the scientific study of thought and behavior.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'B06', N'D4', N'Abnormal Psychology', N'3pm-6pm', N'20', N'https://i.pinimg.com/236x/29/fd/2e/29fd2ef64ab384bfb300ff9cf1f5f932.jpg', N'This specialization provides an introduction to the study of abnormal psychology, with a survey of various mental health concerns through both a modern and historical lens. It concludes with an opportunity to practice effecting behavioral change in your own life through an overview of scientifically-supported treatment strategies.')
INSERT [dbo].[Course] ([courseID], [doctorID], [courseName], [courseTimeWorking], [coursePrice], [courseImg], [courseInfo]) VALUES (N'X00', N'X', N'New Course', N'12pm', N'30', N'...', N'...')
GO
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'G01', N'Giao Duc 1', N'1301391986 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'G02', N'Giao Duc 2', N'3109352121 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'GD01', N'Gia Dinh 1', N'1714648269 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'GD02', N'Gia Dinh 2', N'3515283524 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'HP01', N'Hanh Phuc', N'3992991220 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'K02', N'Khac', N'9062508701 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'Nhi01', N'Nhi', N'7163964035 ')
INSERT [dbo].[Department] ([departmentID], [departmentName], [departmentPhone]) VALUES (N'TC01', N'Tram Cam', N'5482470031 ')
GO
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D1', N'Nhi01', N'd1                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D2', N'Nhi01', N'd2                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D3', N'GD01', N'd3                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D4', N'GD01', N'd4                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D6', N'GD02', N'd6                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'D7', N'GD02', N'd7                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'N1', N'TC01', N'n1                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'N2', N'K02', N'n2                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'N3', N'K02', N'n3                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'R1', N'G01', N'r1                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'R2', N'G02', N'r2                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'R3', N'G02', N'r3                                                ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'S1', N'HP01', N'ss1                                               ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'S2', N'HP01', N'ss2                                               ')
INSERT [dbo].[Doctor] ([doctorID], [departmentID], [username]) VALUES (N'X', N'G01', N'x                                                 ')
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (6, N'RN-2', N'p3                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (7, N'RN-2', N'p4                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (8, N'RD-010', N'p5                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (9, N'RD-010', N'p6                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (10, N'RD-020', N'p7                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (11, N'RD-020', N'p8                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (12, N'RD-020', N'p9                                                ')
INSERT [dbo].[Patient] ([patientID], [roomID], [username]) VALUES (17, NULL, N'dg                                                ')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (6, N'B06')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (17, N'A01')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (7, N'B05                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (8, N'B06                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (9, N'A01                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (10, N'A02                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (11, N'B01                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (12, N'B02                                               ')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (7, N'B02')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (6, N'A02')
INSERT [dbo].[Patient_Course] ([patientID], [courseID]) VALUES (6, N'B02')
GO
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'NN-2', N'TC01')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'NN-4', N'K02')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'RD-010', N'GD01')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'RD-020', N'GD02')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'RHM-11', N'G01')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'RHM-2', N'G02')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'RN-2', N'Nhi01')
INSERT [dbo].[RoomPatient] ([roomID], [departmentID]) VALUES (N'S-A1', N'HP01')
GO
SET IDENTITY_INSERT [dbo].[Supervisor] ON 

INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (1, N'Nhi01', N's1                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (2, N'GD01', N's2                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (3, N'GD02', N's3                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (4, N'HP01', N's4                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (5, N'G01', N's5                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (6, N'G02', N's6                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (7, N'TC01', N's7                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (8, N'K02', N's8                                                ')
INSERT [dbo].[Supervisor] ([supervisorID], [departmentID], [username]) VALUES (10, N'Nhi01', N'admin                                             ')
SET IDENTITY_INSERT [dbo].[Supervisor] OFF
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [fk_nurse] FOREIGN KEY([doctorID])
REFERENCES [dbo].[Doctor] ([doctorID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [fk_nurse]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Account]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([departmentID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Department]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Account]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [fk_patient_room] FOREIGN KEY([roomID])
REFERENCES [dbo].[RoomPatient] ([roomID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [fk_patient_room]
GO
ALTER TABLE [dbo].[Patient_Course]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Course_Course] FOREIGN KEY([courseID])
REFERENCES [dbo].[Course] ([courseID])
GO
ALTER TABLE [dbo].[Patient_Course] CHECK CONSTRAINT [FK_Patient_Course_Course]
GO
ALTER TABLE [dbo].[Patient_Course]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Course_Patient] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patient] ([patientID])
GO
ALTER TABLE [dbo].[Patient_Course] CHECK CONSTRAINT [FK_Patient_Course_Patient]
GO
ALTER TABLE [dbo].[RoomPatient]  WITH CHECK ADD  CONSTRAINT [FK_RoomPatient_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([departmentID])
GO
ALTER TABLE [dbo].[RoomPatient] CHECK CONSTRAINT [FK_RoomPatient_Department]
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD  CONSTRAINT [FK_Supervisor_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Supervisor] CHECK CONSTRAINT [FK_Supervisor_Account]
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD  CONSTRAINT [FK_Supervisor_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([departmentID])
GO
ALTER TABLE [dbo].[Supervisor] CHECK CONSTRAINT [FK_Supervisor_Department]
GO
USE [master]
GO
ALTER DATABASE [ass_prj] SET  READ_WRITE 
GO
