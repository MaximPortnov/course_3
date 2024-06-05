CREATE TABLE Genders (
	genderID INT PRIMARY KEY,
	genderName VARCHAR(255),
);

CREATE TABLE Citys (
	cityID INT PRIMARY KEY,
	cityName VARCHAR(255)
);

CREATE TABLE Users (
    userID INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    dateOfBirth DATE,
	genderID INT,
    email VARCHAR(255),
    password VARCHAR(255),
    cityID INT,
    avatar VARCHAR(255),
    registrationDate DATE
	FOREIGN KEY (genderID) REFERENCES Genders(genderID),
	FOREIGN KEY (cityID) REFERENCES Citys(cityID)
);

CREATE TABLE Profiles (
    profileID INT PRIMARY KEY,
    userID INT,
    description TEXT,
    relationshipStatus VARCHAR(255),
    height INT,
    weight INT,
    eyeColor VARCHAR(255),
    hairColor VARCHAR(255),
    FOREIGN KEY (userID) REFERENCES Users(userID),
);
CREATE TABLE Interests (
    interestID INT PRIMARY KEY,
    interestName VARCHAR(255)
);
CREATE TABLE UserInterests (
    userInterestID INT PRIMARY KEY,
    userID INT,
    interestID INT,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (interestID) REFERENCES Interests(interestID)
);
CREATE TABLE UserPreferences (
    userPreferenceID INT PRIMARY KEY,
    userID INT,
    interestID INT,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (interestID) REFERENCES Interests(interestID)
);
CREATE TABLE Chat (
    chatID INT PRIMARY KEY,
    createDate DATETIME,
	firstUserID INT,
	secondUserID INT,
    FOREIGN KEY (firstUserID) REFERENCES Users(userID),
	FOREIGN KEY (secondUserID) REFERENCES Users(userID),
);
CREATE TABLE ChatMessages (
    chatMessageID INT PRIMARY KEY,
    chatID INT,
    senderID INT,
    messageText TEXT,
    sendDate DATETIME,
    FOREIGN KEY (chatID) REFERENCES Chat(chatID),
    FOREIGN KEY (senderID) REFERENCES Users(userID)
);
