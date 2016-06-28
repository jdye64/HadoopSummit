CREATE DATABASE HadoopSummit;
USE HadoopSummit;

CREATE TABLE attendees
(
	ID int primary key,
	RegAmount int,
	RegType varchar(255),
	BadgeType varchar(255),
	PricePoint varchar(255),
	DescCode varchar(255),
	FirstName varchar(255),
	LastName varchar(255),
	JobTitle varchar(255),
	Company varchar(255),
	Email varchar(255),
	CCEmail varchar(255),
	Address varchar(255),
	City varchar(255),
	State varchar(255),
	Zip varchar(255),
	Country varchar(255),
	Phone varchar(255),
	Mobile varchar(255),
	ADANeeds varchar(255),
	Sponsor varchar(255),
	HCCSkillLevel varchar(255),
	Diet varchar(255),
	Password varchar(255),
	Status varchar(255),
	Memo varchar(255),
	RegistrationDate varchar(255),
	Campaign varchar(255),
	Source varchar(255),
	Medium varchar(255),
	HWXCertifiedProfessional varchar(255)
);

CREATE TABLE attendee_visits
(
	ID int primary key auto_increment,
	AttendeeID int,
	timestamp int,
	phrase_spoken int
);

CREATE TABLE phrases
(
	ID int primary key auto_increment,
	message varchar(255),
	day_idx int
);

INSERT INTO phrases(ID, message, speakdate) VALUES(0, "Hello ${FirstName} ${LastName}. How was your flight in from ${City}?", 1);


