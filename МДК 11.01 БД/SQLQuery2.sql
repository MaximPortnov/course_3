USE Var2

INSERT INTO Genders (genderID, genderName)
VALUES
(1, 'male'),
(2, 'female'),
(3, 'other'),

INSERT INTO Citys (cityID, cityName)
VALUES
(1, 'Москва'),
(2, 'Санкт-Петербург'),
(3, 'Екатеринбург'),
(4, 'Новосибирск'),
(5, 'Красноярск');

INSERT INTO Users (userID, firstName, lastName, dateOfBirth, genderID, email, password, cityID, avatar, registrationDate)
VALUES
(1, 'Иван', 'Иванов', '1990-05-15', 1, 'ivanov@email.com', 'пароль1', 1, 'path/avatar1.jpg', '2023-01-05'),
(2, 'Мария', 'Смирнова', '1988-09-22', 2, 'smirnova@email.com', 'пароль2', 2, 'path/avatar2.jpg', '2023-02-10'),
(3, 'Алексей', 'Петров', '1995-03-30', 1, 'petrov@email.com', 'пароль3', 1, 'path/avatar3.jpg', '2023-03-15'),
(4, 'Екатерина', 'Сергеева', '1993-07-11', 2, 'sergeeva@email.com', 'пароль4', 2, 'path/avatar4.jpg', '2023-04-20'),
(5, 'Дмитрий', 'Козлов', '1987-11-28', 1, 'kozlov@email.com', 'пароль5', 3, 'path/avatar5.jpg', '2023-05-25');

INSERT INTO Profiles (profileID, userID, description, relationshipStatus, height, weight, eyeColor, hairColor)
VALUES
(1, 1, 'Обожаю активный отдых на природе и путешествия.', 'single', 180, 75, 'голубые', 'брюнет'),
(2, 2, 'Увлекаюсь искусством и культурой.', 'single', 165, 55, 'зеленые', 'русые'),
(3, 3, 'Люблю спорт и ЗОЖ.', 'single', 175, 80, 'коричневые', 'черные'),
(4, 4, 'Страстная читательница и любительница природы.', 'single', 160, 65, 'карие', 'рыжие'),
(5, 5, 'Техно-энтузиаст и меломан.', 'single', 175, 70, 'коричневые', 'черные');

INSERT INTO Interests (interestID, interestName)
VALUES
(1, 'путешествия'),
(2, 'спорт'),
(3, 'искусство'),
(4, 'чтение'),
(5, 'музыка');

INSERT INTO UserInterests (userInterestID, userID, interestID)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO UserPreferences (userPreferenceID, userID, interestID)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(4, 4, 3),
(5, 5, 5);

INSERT INTO Chat (chatID, createDate, firstUserID, secondUserID)
VALUES
(1, '2023-06-01 08:00:00', 1, 2),
(2, '2023-06-01 09:00:00', 1, 3),
(3, '2023-06-01 10:00:00', 2, 3),
(4, '2023-06-01 11:00:00', 4, 5),
(5, '2023-06-01 12:00:00', 1, 4);

INSERT INTO ChatMessages (chatMessageID, chatID, senderID, messageText, sendDate)
VALUES
(1, 1, 1, 'Привет, Мария!', '2023-06-01 08:05:00'),
(2, 1, 2, 'Привет, Иван! Как дела?', '2023-06-01 08:07:00'),
(3, 2, 1, 'Привет, Алексей! Куда сегодня идем?', '2023-06-01 09:15:00'),
(4, 2, 3, 'Привет, Иван! Почему бы не в парк?', '2023-06-01 09:20:00'),
(5, 3, 2, 'Мария, ты готова к выставке?', '2023-06-01 10:10:00');
