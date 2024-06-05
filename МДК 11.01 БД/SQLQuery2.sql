USE Var2

INSERT INTO Genders (genderID, genderName)
VALUES
(1, 'male'),
(2, 'female'),
(3, 'other'),

INSERT INTO Citys (cityID, cityName)
VALUES
(1, '������'),
(2, '�����-���������'),
(3, '������������'),
(4, '�����������'),
(5, '����������');

INSERT INTO Users (userID, firstName, lastName, dateOfBirth, genderID, email, password, cityID, avatar, registrationDate)
VALUES
(1, '����', '������', '1990-05-15', 1, 'ivanov@email.com', '������1', 1, 'path/avatar1.jpg', '2023-01-05'),
(2, '�����', '��������', '1988-09-22', 2, 'smirnova@email.com', '������2', 2, 'path/avatar2.jpg', '2023-02-10'),
(3, '�������', '������', '1995-03-30', 1, 'petrov@email.com', '������3', 1, 'path/avatar3.jpg', '2023-03-15'),
(4, '���������', '��������', '1993-07-11', 2, 'sergeeva@email.com', '������4', 2, 'path/avatar4.jpg', '2023-04-20'),
(5, '�������', '������', '1987-11-28', 1, 'kozlov@email.com', '������5', 3, 'path/avatar5.jpg', '2023-05-25');

INSERT INTO Profiles (profileID, userID, description, relationshipStatus, height, weight, eyeColor, hairColor)
VALUES
(1, 1, '������ �������� ����� �� ������� � �����������.', 'single', 180, 75, '�������', '������'),
(2, 2, '��������� ���������� � ���������.', 'single', 165, 55, '�������', '�����'),
(3, 3, '����� ����� � ���.', 'single', 175, 80, '����������', '������'),
(4, 4, '��������� ������������ � ������������ �������.', 'single', 160, 65, '�����', '�����'),
(5, 5, '�����-��������� � �������.', 'single', 175, 70, '����������', '������');

INSERT INTO Interests (interestID, interestName)
VALUES
(1, '�����������'),
(2, '�����'),
(3, '���������'),
(4, '������'),
(5, '������');

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
(1, 1, 1, '������, �����!', '2023-06-01 08:05:00'),
(2, 1, 2, '������, ����! ��� ����?', '2023-06-01 08:07:00'),
(3, 2, 1, '������, �������! ���� ������� ����?', '2023-06-01 09:15:00'),
(4, 2, 3, '������, ����! ������ �� �� � ����?', '2023-06-01 09:20:00'),
(5, 3, 2, '�����, �� ������ � ��������?', '2023-06-01 10:10:00');
