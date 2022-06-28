
/****** Object:  Table [dbo].[Category]    Script Date: 28.06.2022 10:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 28.06.2022 10:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[BirthYear] [int] NULL,
	[Father] [uniqueidentifier] NULL,
	[Mother] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28.06.2022 10:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Category] [int] NOT NULL,
 CONSTRAINT [PK_PRoduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Laptoper')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Gamingstoler')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Grafikkort')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [BirthYear], [Father], [Mother]) VALUES (N'22aefe0e-f6ba-11ec-b939-0242ac120002', N'Haakon Magnus', NULL, 1973, N'0f8919d6-f6ba-11ec-b939-0242ac120002', NULL)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [BirthYear], [Father], [Mother]) VALUES (N'56cea662-f6ba-11ec-b939-0242ac120002', N'Sverre Magnus', NULL, NULL, N'22aefe0e-f6ba-11ec-b939-0242ac120002', NULL)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [BirthYear], [Father], [Mother]) VALUES (N'0f8919d6-f6ba-11ec-b939-0242ac120002', N'Harald', NULL, 1937, NULL, NULL)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [BirthYear], [Father], [Mother]) VALUES (N'401f15fa-f6ba-11ec-b939-0242ac120002', N'Ingrid Alexandre', NULL, 2004, N'22aefe0e-f6ba-11ec-b939-0242ac120002', NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Category]) VALUES (1, N'Stol X', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [Category]) VALUES (2, N'Stol Y', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [Category]) VALUES (3, N'Stol Z', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [Category]) VALUES (4, N'HP Ultrabultra', 1)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Person] FOREIGN KEY([Mother])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Person]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Person1] FOREIGN KEY([Father])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Person1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRoduct_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRoduct_Category]
GO
USE [master]
GO
ALTER DATABASE [FamilyTree] SET  READ_WRITE 
GO
