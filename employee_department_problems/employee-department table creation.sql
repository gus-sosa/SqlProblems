USE [Study]

GO

/****** Object:  Table [dbo].[Department]    Script Date: 10/26/2018 10:10:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[department_id] [int] NOT NULL,
	[department_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





GO

/****** Object:  Table [dbo].[Employee]    Script Date: 10/26/2018 10:09:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](1) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[department_id] [int] NOT NULL,
	[salary] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO


