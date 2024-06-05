USE [Anomic]
GO

INSERT INTO [dbo].[Users] ([ID], [RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (1,1, 'j.doe@amonic.com', 123, 'John', 'Doe',1,'13.1.1983',1)
GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (2,2, 'k.omar@amonic.com', 4258, 'Karim', 'Omar',1,	'19.3.1980',	1)
GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (3,2, 'h.saeed@amonic.com', 2020, 'Hannan', 'Saeed',2,	    '20.12.1989',	1)
GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (4,2, 'a.hobart@amonic.com', 6996, 'Andrew', 'Hobart',5,	    '30.1.1990',	1)

GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (5,2, 'k.anderson@amonic.com', 4570, 'Katrin', 'Anderson',4,	    '10.11.1992',	1)

GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (6,2, 'h.wyrick@amonic.com', 1199, 'Hava', 'Wyrick',1,	'8.8.1988',	1)

GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (7,2, 'marie.horn@amonic.com', 55555, 'Marie', 'Horn',3,	'6.4.1981',	1)

GO
INSERT INTO [dbo].[Users] ([ID],[RoleID],[Email],[Password],[FirstName],[LastName],[OfficeID],[Birthdate],[Active])
     VALUES (8,2, 'm.osteen@amonic.com', 9800, 'Milagros', 'Osteen',1,	'3.2.1991',	0)
GO


