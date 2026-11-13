USE [Clapping_Hands]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[activity_id] [int] NOT NULL,
	[activity_name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Child]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Child](
	[child_id] [nvarchar](255) NOT NULL,
	[parent_id] [nvarchar](255) NULL,
	[child_name] [nvarchar](255) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](255) NULL,
	[cultural_background] [nvarchar](255) NULL,
	[mode_of_transport] [nvarchar](255) NULL,
	[distance] [int] NULL,
	[dietary_requirement_Id] [int] NULL,
	[after_hour] [bit] NOT NULL,
	[no_of_days] [int] NULL,
 CONSTRAINT [PK_Child] PRIMARY KEY CLUSTERED 
(
	[child_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildAttendance]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildAttendance](
	[c_attendance_id] [int] NOT NULL,
	[child_id] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[attendance] [bit] NOT NULL,
	[activity_id] [int] NULL,
	[mood] [nvarchar](255) NULL,
	[day] [nvarchar](255) NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_ChildAttendance] PRIMARY KEY CLUSTERED 
(
	[c_attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildWaitlist]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildWaitlist](
	[child_waitlist_id] [int] NOT NULL,
	[parent_id] [nvarchar](255) NULL,
	[child_name] [nvarchar](255) NULL,
	[age] [int] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_ChildWaitlist] PRIMARY KEY CLUSTERED 
(
	[child_waitlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DietaryRequirement]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DietaryRequirement](
	[dietary_requirement_Id] [int] NOT NULL,
	[diet_name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_DietaryRequirement] PRIMARY KEY CLUSTERED 
(
	[dietary_requirement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Educator]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educator](
	[educator_id] [nvarchar](255) NOT NULL,
	[educator_name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone_no] [int] NULL,
	[no_of_days] [int] NULL,
	[cultural_background] [nvarchar](255) NULL,
	[spoken_languages] [int] NULL,
 CONSTRAINT [PK_Educator] PRIMARY KEY CLUSTERED 
(
	[educator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducatorAttendance]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducatorAttendance](
	[e_attendance_id] [int] NOT NULL,
	[educator_id] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[attendance] [bit] NOT NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_EducatorAttendance] PRIMARY KEY CLUSTERED 
(
	[e_attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducatorRating]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducatorRating](
	[educator_rating_id] [int] NOT NULL,
	[educator_id] [nvarchar](255) NULL,
	[teaching_style] [float] NULL,
	[attendance_trend] [float] NULL,
	[overall_rating] [float] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_EducatorRating] PRIMARY KEY CLUSTERED 
(
	[educator_rating_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrolment]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrolment](
	[enrolment_id] [int] NOT NULL,
	[child_id] [nvarchar](255) NULL,
	[educator_id] [nvarchar](255) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[year] [int] NULL,
	[new_admission] [bit] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[enrolment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 7/06/2023 10:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[parent_id] [nvarchar](255) NOT NULL,
	[parent_name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone_no ] [int] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
ALTER TABLE [dbo].[Child]  WITH CHECK ADD  CONSTRAINT [FK_Child_Child] FOREIGN KEY([dietary_requirement_Id])
REFERENCES [dbo].[DietaryRequirement] ([dietary_requirement_Id])
GO
ALTER TABLE [dbo].[Child] CHECK CONSTRAINT [FK_Child_Child]
GO
ALTER TABLE [dbo].[Child]  WITH CHECK ADD  CONSTRAINT [FK_Child_Parent] FOREIGN KEY([parent_id])
REFERENCES [dbo].[Parent] ([parent_id])
GO
ALTER TABLE [dbo].[Child] CHECK CONSTRAINT [FK_Child_Parent]
GO
ALTER TABLE [dbo].[ChildAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ChildAttendance_Activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[Activity] ([activity_id])
GO
ALTER TABLE [dbo].[ChildAttendance] CHECK CONSTRAINT [FK_ChildAttendance_Activity]
GO
ALTER TABLE [dbo].[ChildAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ChildAttendance_ChildAttendance] FOREIGN KEY([child_id])
REFERENCES [dbo].[Child] ([child_id])
GO
ALTER TABLE [dbo].[ChildAttendance] CHECK CONSTRAINT [FK_ChildAttendance_ChildAttendance]
GO
ALTER TABLE [dbo].[ChildWaitlist]  WITH CHECK ADD  CONSTRAINT [FK_ChildWaitlist_Parent] FOREIGN KEY([parent_id])
REFERENCES [dbo].[Parent] ([parent_id])
GO
ALTER TABLE [dbo].[ChildWaitlist] CHECK CONSTRAINT [FK_ChildWaitlist_Parent]
GO
ALTER TABLE [dbo].[EducatorAttendance]  WITH CHECK ADD  CONSTRAINT [FK_EducatorAttendance_Educator] FOREIGN KEY([educator_id])
REFERENCES [dbo].[Educator] ([educator_id])
GO
ALTER TABLE [dbo].[EducatorAttendance] CHECK CONSTRAINT [FK_EducatorAttendance_Educator]
GO
ALTER TABLE [dbo].[EducatorRating]  WITH CHECK ADD  CONSTRAINT [FK_EducatorRating_Educator] FOREIGN KEY([educator_id])
REFERENCES [dbo].[Educator] ([educator_id])
GO
ALTER TABLE [dbo].[EducatorRating] CHECK CONSTRAINT [FK_EducatorRating_Educator]
GO
ALTER TABLE [dbo].[Enrolment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Child] FOREIGN KEY([child_id])
REFERENCES [dbo].[Child] ([child_id])
GO
ALTER TABLE [dbo].[Enrolment] CHECK CONSTRAINT [FK_Enrollment_Child]
GO
ALTER TABLE [dbo].[Enrolment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Educator] FOREIGN KEY([educator_id])
REFERENCES [dbo].[Educator] ([educator_id])
GO
ALTER TABLE [dbo].[Enrolment] CHECK CONSTRAINT [FK_Enrollment_Educator]
GO
ALTER TABLE [dbo].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_Parent_Parent] FOREIGN KEY([parent_id])
REFERENCES [dbo].[Parent] ([parent_id])
GO
ALTER TABLE [dbo].[Parent] CHECK CONSTRAINT [FK_Parent_Parent]
GO
ALTER TABLE [dbo].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_Parent_Parent1] FOREIGN KEY([parent_id])
REFERENCES [dbo].[Parent] ([parent_id])
GO
ALTER TABLE [dbo].[Parent] CHECK CONSTRAINT [FK_Parent_Parent1]
GO