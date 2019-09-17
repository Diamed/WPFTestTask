/*
Post-Deployment Script Template                            
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.        
 Use SQLCMD syntax to include a file in the post-deployment script.            
 Example:      :r .\myfile.sql                                
 Use SQLCMD syntax to reference a variable in the post-deployment script.        
 Example:      :setvar TableName MyTable                            
               SELECT * FROM [$(TableName)]                    
--------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [Employee].[Keeled] ON
INSERT INTO [Employee].[Keeled] ([Id], [Keel]) VALUES (1, N'Английский')
INSERT INTO [Employee].[Keeled] ([Id], [Keel]) VALUES (2, N'Армянский')
INSERT INTO [Employee].[Keeled] ([Id], [Keel]) VALUES (3, N'Польский')
INSERT INTO [Employee].[Keeled] ([Id], [Keel]) VALUES (4, N'Русский')
INSERT INTO [Employee].[Keeled] ([Id], [Keel]) VALUES (5, N'Эстонский')
SET IDENTITY_INSERT [Employee].[Keeled] OFF

SET IDENTITY_INSERT [Employee].[Tase] ON
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (1, N'A1')
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (2, N'A2')
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (3, N'B1')
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (4, N'B2')
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (5, N'C1')
INSERT INTO [Employee].[Tase] ([Id], [Title]) VALUES (6, N'C2')
SET IDENTITY_INSERT [Employee].[Tase] OFF

SET IDENTITY_INSERT [Employee].[TimeUnit] ON
INSERT INTO [Employee].[TimeUnit] ([Id], [Title]) VALUES (1, N'Час')
INSERT INTO [Employee].[TimeUnit] ([Id], [Title]) VALUES (2, N'Месяц')
SET IDENTITY_INSERT [Employee].[TimeUnit] OFF

SET IDENTITY_INSERT [Employee].[Sugu] ON
INSERT INTO [Employee].[Sugu] ([Id], [Title]) VALUES (1, N'Мужской')
INSERT INTO [Employee].[Sugu] ([Id], [Title]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [Employee].[Sugu] OFF

SET IDENTITY_INSERT [Employee].[Personal] ON
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (2, N'Петров', N'Николай', 1, N'1986-01-12', CAST(1200.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (3, N'Соловейко', N'Любовь', 2, N'1955-01-01', CAST(1500.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (4, N'Еременко', N'Иван', 1, N'1993-05-10', CAST(120.00 AS Decimal(18, 2)), 1)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (5, N'Кошева', N'Ирина', 2, N'1970-06-15', CAST(30.00 AS Decimal(18, 2)), 1)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (6, N'Кухарев', N'Константин', 1, N'1969-03-30', CAST(1700.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (7, N'Иванов', N'Борис', 1, N'1989-05-12', CAST(70.00 AS Decimal(18, 2)), 1)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (8, N'Кривошеева', N'Людмила', 2, N'1996-09-04', CAST(1000.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (9, N'Барабанов', N'Дмитрий', 1, N'1990-01-01', CAST(900.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (10, N'Безруков', N'Михаил', 1, N'1970-02-14', CAST(2000.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (11, N'Гребенщиков', N'Борис', 1, N'1960-01-10', CAST(2000.00 AS Decimal(18, 2)), 1)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (12, N'Брехнева', N'Екатерина', 2, N'1976-03-21', CAST(1300.00 AS Decimal(18, 2)), 2)
INSERT INTO [Employee].[Personal] ([Id], [Perekonnanimi], [Eesnimi], [idSugu], [Sunnipaev], [Palk], [idTimeUnit]) VALUES (13, N'Варапаева', N'Светлана', 2, N'2000-02-01', CAST(500.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [Employee].[Personal] OFF

SET IDENTITY_INSERT [Employee].[KeeleTasud] ON
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (1, 1, CAST(10.00 AS Decimal(18, 2)))
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (2, 2, CAST(30.00 AS Decimal(18, 2)))
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (3, 3, CAST(50.00 AS Decimal(18, 2)))
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (4, 4, CAST(100.00 AS Decimal(18, 2)))
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (5, 5, CAST(200.00 AS Decimal(18, 2)))
INSERT INTO [Employee].[KeeleTasud] ([Id], [idTase], [Summa]) VALUES (6, 6, CAST(200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [Employee].[KeeleTasud] OFF

SET IDENTITY_INSERT [Employee].[PersonalKeeled] ON
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (3, 2, 1, 4)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (4, 2, 4, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (5, 2, 5, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (6, 3, 4, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (7, 4, 5, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (8, 5, 2, 4)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (9, 5, 3, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (10, 6, 1, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (11, 7, 1, 1)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (12, 7, 2, 2)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (13, 7, 3, 2)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (14, 7, 4, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (15, 7, 5, 3)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (16, 8, 4, 5)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (17, 9, 4, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (18, 10, 4, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (19, 11, 5, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (20, 12, 5, 6)
INSERT INTO [Employee].[PersonalKeeled] ([Id], [idPersonal], [idKeeled], [idTase]) VALUES (21, 13, 2, 6)
SET IDENTITY_INSERT [Employee].[PersonalKeeled] OFF

INSERT INTO [Employee].[Tooaeg] ([idPersonal], [Tootunnid], [Kuupaev])
SELECT       2, 8, '2/13/2009'
UNION SELECT 2, 1, '9/22/1989 '
UNION SELECT 2, 2, '8/22/1998 '
UNION SELECT 2, 3, '7/28/2003 '
UNION SELECT 2, 4, '7/21/2018 '
UNION SELECT 2, 5, '10/16/1988'
UNION SELECT 3, 6, '9/4/1985  '
UNION SELECT 3, 7, '5/24/2000 '
UNION SELECT 3, 8, '12/9/1984 '
UNION SELECT 3, 9, '5/8/1981  '
UNION SELECT 3, 1, '12/12/2001'
UNION SELECT 3, 0, '6/9/1984  '
UNION SELECT 4, 2, '7/24/1994 '
UNION SELECT 4, 3, '9/27/1994 '
UNION SELECT 4, 4, '4/26/2007 '
UNION SELECT 4, 5, '3/30/2013 '
UNION SELECT 4, 6, '8/31/1993 '
UNION SELECT 4, 7, '8/17/1998 '
UNION SELECT 4, 0, '6/4/1994  '
UNION SELECT 4, 1, '12/9/1999 '
UNION SELECT 5, 8, '5/6/2002  '
UNION SELECT 5, 9, '12/22/2009'
UNION SELECT 5, 4, '2/16/1986 '
UNION SELECT 5, 9, '5/15/1986 '
UNION SELECT 5, 1, '10/9/1991 '
UNION SELECT 5, 8, '6/29/1989 '
UNION SELECT 5, 3, '5/6/1998  '
UNION SELECT 5, 5, '8/10/2007 '
UNION SELECT 5, 7, '10/29/2005'
UNION SELECT 6, 1, '10/26/1997'
UNION SELECT 6, 5, '4/1/1991  '
UNION SELECT 6, 9, '11/19/2003'
UNION SELECT 6, 3, '6/23/1989 '
UNION SELECT 6, 0, '3/3/2013  '
UNION SELECT 6, 4, '11/15/2007'
UNION SELECT 6, 8, '11/15/2014'
UNION SELECT 6, 2, '2/13/1982 '
UNION SELECT 6, 0, '8/31/1996 '
UNION SELECT 7, 0, '12/14/2004'
UNION SELECT 7, 4, '3/4/1984  '
UNION SELECT 7, 7, '5/31/1996 '
UNION SELECT 7, 8, '4/30/2016 '
UNION SELECT 7, 9, '5/20/2005 '
UNION SELECT 7, 1, '6/15/1992 '
UNION SELECT 7, 1, '9/10/1991 '
UNION SELECT 7, 3, '3/12/2010 '
UNION SELECT 7, 4, '1/23/1994 '
UNION SELECT 7, 8, '10/16/1997'
UNION SELECT 8, 1, '10/22/2012'
UNION SELECT 8, 6, '7/3/2011  '
UNION SELECT 8, 0, '8/1/2014  '
UNION SELECT 8, 4, '11/20/1997'
UNION SELECT 8, 8, '11/29/2013'
UNION SELECT 8, 0, '2/2/2005  '
UNION SELECT 8, 4, '2/8/2018  '
UNION SELECT 8, 4, '10/12/1988'
UNION SELECT 9, 7, '10/15/2017'
UNION SELECT 9, 0, '12/20/2014'
UNION SELECT 9, 5, '4/4/1986  '
UNION SELECT 9, 8, '12/31/2003'
UNION SELECT 9, 9, '3/23/1991 '
UNION SELECT 10,4, '8/30/2013 '
UNION SELECT 10,0, '9/1/2006  '
UNION SELECT 10,4, '7/26/2017 '
UNION SELECT 10,7, '9/21/2006 '
UNION SELECT 10,7, '4/1/2009  '
UNION SELECT 10,8, '5/23/1995 '
UNION SELECT 10,2, '11/25/2004'
UNION SELECT 11,1, '8/23/2006 '
UNION SELECT 11,4, '10/20/1993'
UNION SELECT 11,8, '12/30/1981'
UNION SELECT 11,0, '2/7/1998  '
UNION SELECT 11,4, '1/31/1991 '
UNION SELECT 11,7, '11/19/1995'
UNION SELECT 11,1, '1/18/1992 '
UNION SELECT 12,1, '7/7/2003  '
UNION SELECT 12,3, '7/26/1998 '
UNION SELECT 12,4, '3/11/2010 '
UNION SELECT 12,8, '2/17/2012 '
UNION SELECT 12,1, '8/16/1983 '
UNION SELECT 12,6, '1/20/2003 '
UNION SELECT 12,0, '11/2/2002 '
UNION SELECT 12,4, '1/5/1986  '
UNION SELECT 12,8, '11/25/1995'
UNION SELECT 12,0, '5/8/2013  '
UNION SELECT 12,4, '6/29/2000 '
UNION SELECT 13,4, '12/1/1997 '
UNION SELECT 13,7, '3/17/2014 '
UNION SELECT 13,0, '3/1/2007  '
UNION SELECT 13,5, '6/20/1987 '
UNION SELECT 13,8, '5/28/1992 '
UNION SELECT 13,9, '6/29/1996 '
UNION SELECT 13,4, '10/26/2011'
UNION SELECT 13,0, '2/8/2009  '
UNION SELECT 13,4, '2/26/1985 '
UNION SELECT 13,7, '1/28/1997 '
UNION SELECT 13,7, '12/30/2008'
UNION SELECT 13,8, '9/19/1997 '
UNION SELECT 13,2, '1/9/2004  '
UNION SELECT 13,1, '12/29/2013'
UNION SELECT 2, 1, '2/4/1993'
UNION SELECT 2, 1, '5/1/2017'
UNION SELECT 2, 2, '6/26/1982'
UNION SELECT 2, 3, '10/17/1989'
UNION SELECT 2, 4, '10/2/2012'
UNION SELECT 2, 5, '12/24/1982'
UNION SELECT 3, 6, '8/13/1984'
UNION SELECT 3, 7, '2/14/2017'
UNION SELECT 3, 8, '7/10/2016'
UNION SELECT 3, 9, '9/21/1997'
UNION SELECT 3, 1, '12/29/1984'
UNION SELECT 3, 0, '5/22/1993'
UNION SELECT 4, 2, '6/20/1983'
UNION SELECT 4, 3, '6/30/1999'
UNION SELECT 4, 4, '5/1/2009'
UNION SELECT 4, 5, '5/22/1999'
UNION SELECT 4, 6, '9/11/2003'
UNION SELECT 4, 7, '11/25/2006'
UNION SELECT 4, 0, '9/24/1998'
UNION SELECT 4, 1, '12/15/1987'
UNION SELECT 5, 8, '5/2/1994'
UNION SELECT 5, 9, '1/13/1997'
UNION SELECT 5, 4, '9/19/2005'
UNION SELECT 5, 9, '4/14/1984'
UNION SELECT 5, 1, '12/4/1984'
UNION SELECT 5, 8, '6/8/1984'
UNION SELECT 5, 3, '4/15/1992'
UNION SELECT 5, 5, '5/7/1989'
UNION SELECT 5, 7, '7/24/1998'
UNION SELECT 6, 1, '5/27/2017'
UNION SELECT 6, 5, '2/26/2001'
UNION SELECT 6, 9, '7/27/1993'
UNION SELECT 6, 3, '2/4/1985'
UNION SELECT 6, 0, '8/30/1984'
UNION SELECT 6, 4, '3/9/1995'
UNION SELECT 6, 8, '9/27/1980'
UNION SELECT 6, 2, '7/17/1993'
UNION SELECT 6, 0, '7/14/1987'
UNION SELECT 7, 0, '9/18/2018'
UNION SELECT 7, 4, '9/6/1992'
UNION SELECT 7, 7, '11/23/2011'
UNION SELECT 7, 8, '12/7/2010'
UNION SELECT 7, 9, '1/20/2014'
UNION SELECT 7, 1, '6/19/2001'
UNION SELECT 7, 1, '5/10/2018'
UNION SELECT 7, 3, '12/27/2012'
UNION SELECT 7, 4, '5/5/2003'
UNION SELECT 7, 8, '6/21/1988'
UNION SELECT 8, 1, '11/24/2011'
UNION SELECT 8, 6, '7/6/1985'
UNION SELECT 8, 0, '3/19/2012'
UNION SELECT 8, 4, '12/22/2006'
UNION SELECT 8, 8, '5/21/2012'
UNION SELECT 8, 0, '10/11/1985'
UNION SELECT 8, 4, '5/28/1999'
UNION SELECT 8, 4, '12/7/2011'
UNION SELECT 9, 7, '10/24/2014'
UNION SELECT 9, 0, '9/11/1998'
UNION SELECT 9, 5, '6/2/1980'
UNION SELECT 9, 8, '12/3/2011'
UNION SELECT 9, 9, '1/12/2016'
UNION SELECT 10,4, '11/23/1997'
UNION SELECT 10,0, '9/27/1989'
UNION SELECT 10,4, '5/19/2009'
UNION SELECT 10,7, '1/10/2017'
UNION SELECT 10,7, '12/17/2011'
UNION SELECT 10,8, '12/24/1991'
UNION SELECT 10,2, '9/24/1996'
UNION SELECT 11,1, '7/5/2001'
UNION SELECT 11,4, '5/20/2000'
UNION SELECT 11,8, '4/13/1997'
UNION SELECT 11,0, '8/11/2016'
UNION SELECT 11,4, '8/22/1990'
UNION SELECT 11,7, '2/24/2014'
UNION SELECT 11,1, '12/21/1981'
UNION SELECT 12,1, '10/26/1992'
UNION SELECT 12,3, '2/10/2000'
UNION SELECT 12,4, '6/11/1985'
UNION SELECT 12,8, '8/31/1986'
UNION SELECT 12,1, '6/10/2017'
UNION SELECT 12,6, '9/4/1987'
UNION SELECT 12,0, '5/9/1998'
UNION SELECT 12,4, '11/12/1993'
UNION SELECT 12,8, '1/4/2011'
UNION SELECT 12,0, '1/21/2008'
UNION SELECT 12,4, '6/21/1990'
UNION SELECT 13,4, '2/20/2018'
UNION SELECT 13,7, '1/29/2012'
UNION SELECT 13,0, '11/23/1982'
UNION SELECT 13,5, '4/18/2011'
UNION SELECT 13,8, '3/3/2011'
UNION SELECT 13,9, '6/22/1996'
UNION SELECT 13,4, '1/31/1983'
UNION SELECT 13,0, '6/14/1999'
UNION SELECT 13,4, '9/4/1998'
UNION SELECT 13,7, '11/3/1991'
UNION SELECT 13,7, '4/14/1993'
UNION SELECT 13,8, '10/2/2010'
UNION SELECT 13,2, '7/21/1992'
UNION SELECT 13,1, '4/18/2002'
