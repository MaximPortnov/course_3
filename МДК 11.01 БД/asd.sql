INSERT INTO [dbo].[Fakulteti]([Kod_fakulteta],[Name_fakulteta],[FIO],[N_komnatu_dekanata],[Telefon_dekanata])
     VALUES (1,'Програмированние','Иванов Иван Иванович','11','89991111213')
GO
INSERT INTO [dbo].[Fakulteti]([Kod_fakulteta],[Name_fakulteta],[FIO],[N_komnatu_dekanata],[Telefon_dekanata])
     VALUES (2,'Строительство','Сергеев Иван Иванович','12','89991111224')
GO
INSERT INTO [dbo].[Fakulteti]([Kod_fakulteta],[Name_fakulteta],[FIO],[N_komnatu_dekanata],[Telefon_dekanata])
     VALUES (3,'Парикмахерское дело','Петров Иван Иванович','13','89991111235')
GO
INSERT INTO [dbo].[Fakulteti]([Kod_fakulteta],[Name_fakulteta],[FIO],[N_komnatu_dekanata],[Telefon_dekanata])
     VALUES (4,'Философия','Краснов Иван Иванович','14','89991111246')
GO
INSERT INTO [dbo].[Fakulteti]([Kod_fakulteta],[Name_fakulteta],[FIO],[N_komnatu_dekanata],[Telefon_dekanata])
     VALUES (5,'Юрфак','Пахомов Иван Иванович','15','89991111256')
GO
// kafedra
INSERT INTO [dbo].[Kafedra]([Kod_kafedru],[Kod_fakulteta],[Name_kafedru],[FIO],[N_komnatu_kafedru],[Telefon_kafedru])
     VALUES (1,2,'Птицестроительсво','Иванов Сергей Сергеевич','21','89130000001')
GO
INSERT INTO [dbo].[Kafedra]([Kod_kafedru],[Kod_fakulteta],[Name_kafedru],[FIO],[N_komnatu_kafedru],[Telefon_kafedru])
     VALUES (2,1,'Птицеужарество','Петров Сергей Сергеевич','22','89130000002')
GO
INSERT INTO [dbo].[Kafedra]([Kod_kafedru],[Kod_fakulteta],[Name_kafedru],[FIO],[N_komnatu_kafedru],[Telefon_kafedru])
     VALUES (3,3,'Воровское','Сергеев Сергей Сергеевич','23','89130000003')
GO
INSERT INTO [dbo].[Kafedra]([Kod_kafedru],[Kod_fakulteta],[Name_kafedru],[FIO],[N_komnatu_kafedru],[Telefon_kafedru])
     VALUES (4,5,'Мусорское','Ишак Сергей Сергеевич','24','89130000004')
GO
INSERT INTO [dbo].[Kafedra]([Kod_kafedru],[Kod_fakulteta],[Name_kafedru],[FIO],[N_komnatu_kafedru],[Telefon_kafedru])
     VALUES (5,4,'Карманная тяга','Питон Сергей Сергеевич','25','89130000005')
GO
// Disciplane
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (1,1,'ОАП',100,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (2,2,'Математика',130,'Незачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (3,3,'Русский язык',80,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (4,4,'Литература',50,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (5,5,'Базы данных',90,'Зачет')
GO
// grupu
INSERT INTO [dbo].[Grupu]([Kod_grupu],[Kod_kafedru],[N_grupu],[God_post],[Kurs])
     VALUES(1,1,'52',18,1)
GO

INSERT INTO [dbo].[Grupu]([Kod_grupu],[Kod_kafedru],[N_grupu],[God_post],[Kurs])
     VALUES(2,2,'21',19,2)
GO
INSERT INTO [dbo].[Grupu]([Kod_grupu],[Kod_kafedru],[N_grupu],[God_post],[Kurs])
     VALUES(3,3,'12',20,3)
GO
INSERT INTO [dbo].[Grupu]([Kod_grupu],[Kod_kafedru],[N_grupu],[God_post],[Kurs])
     VALUES(4,4,'14',21,4)
GO
INSERT INTO [dbo].[Grupu]([Kod_grupu],[Kod_kafedru],[N_grupu],[God_post],[Kurs])
     VALUES(5,5,'72',22,5)
GO
// prepodavately
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (1,1,'ОАП',100,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (2,2,'Математика',130,'Незачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (3,3,'Русский язык',80,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (4,4,'Литература',50,'Зачет')
GO
INSERT INTO [dbo].[Disciplane]([Kod_disciplinu],[Kod_kafedru],[Name_dis],[Raschasovka],[Kontrol])
     VALUES (5,5,'Базы данных',90,'Зачет')
GO

// Vedomosti
INSERT INTO [dbo].[Vedomosti]           ([Kod_vedomopsti],[Kod_grupu],[Kod_disciplinu],[Kod_prepodavately],[God],[Semestr])
     VALUES           (1,1,1,1,2012,1)
GO
INSERT INTO [dbo].[Vedomosti]           ([Kod_vedomopsti],[Kod_grupu],[Kod_disciplinu],[Kod_prepodavately],[God],[Semestr])
     VALUES           (2,2,2,2,2013,2)
GOINSERT INTO [dbo].[Vedomosti]
           ([Kod_vedomopsti],[Kod_grupu],[Kod_disciplinu],[Kod_prepodavately],[God],[Semestr])     VALUES
           (3,3,3,3,2014,1)GO
INSERT INTO [dbo].[Vedomosti]           ([Kod_vedomopsti],[Kod_grupu],[Kod_disciplinu],[Kod_prepodavately],[God],[Semestr])
     VALUES           (4,4,4,4,2015,2)
GO
INSERT INTO [dbo].[Vedomosti]           ([Kod_vedomopsti],[Kod_grupu],[Kod_disciplinu],[Kod_prepodavately],[God],[Semestr])
     VALUES           (5,5,5,5,2015,1)
GO

INSERT INTO [dbo].[Podchinennaya_tablica_vedomosti]           ([Kod_pod_vedomopsti],[Kod_ vedomopsti],[Kod_studenta],[Osenka])
     VALUES           (1,1,1,5)
GOINSERT INTO [dbo].[Podchinennaya_tablica_vedomosti]
           ([Kod_pod_vedomopsti],[Kod_ vedomopsti],[Kod_studenta],[Osenka])     VALUES
           (2,2,2,4)GO
INSERT INTO [dbo].[Podchinennaya_tablica_vedomosti]           ([Kod_pod_vedomopsti],[Kod_ vedomopsti],[Kod_studenta],[Osenka])
     VALUES           (3,3,3,2)
GOINSERT INTO [dbo].[Podchinennaya_tablica_vedomosti]
           ([Kod_pod_vedomopsti],[Kod_ vedomopsti],[Kod_studenta],[Osenka])     VALUES
           (4,4,4,5)GO
INSERT INTO [dbo].[Podchinennaya_tablica_vedomosti]           ([Kod_pod_vedomopsti],[Kod_ vedomopsti],[Kod_studenta],[Osenka])
     VALUES           (5,5,5,3)
GO