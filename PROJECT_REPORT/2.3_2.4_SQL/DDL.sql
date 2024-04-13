CREATE TABLE Trainer (
    trainerID SERIAL PRIMARY KEY, 
    fName VARCHAR(255),
    lName VARCHAR(255),
    gender CHAR(1),
    certification VARCHAR(255), 
    securityCheck BOOLEAN, 
    emailAddr VARCHAR(255), 
    phone VARCHAR(255), 
    scheduleTID INTEGER
);

CREATE TABLE Availability (
    availabilityID SERIAL PRIMARY KEY, 
    day VARCHAR(255),
    startTime TIME,
    endTime TIME
);

CREATE TABLE TrainerAvailability ( 
    trainerID INTEGER,
    availabilityID INTEGER,
    PRIMARY KEY (trainerID, availabilityID) 
);
    
CREATE TABLE TrainerSchedule ( 
    scheduleTID SERIAL PRIMARY KEY, 
    trainerID INTEGER,
    updatingAdmin INTEGER
);

CREATE TABLE TrainerView ( 
    profileID INTEGER, 
    trainerID INTEGER,
    PRIMARY KEY (profileID, trainerID) 
);
    
CREATE TABLE TrainerAssigns ( 
    trainerID INTEGER,
    profileID INTEGER,
    exerciseID INTEGER,
    PRIMARY KEY (trainerID, profileID)
);

CREATE TABLE Member (
    memberID SERIAL PRIMARY KEY,
    profileID INTEGER,
    fName VARCHAR(255),
    lName VARCHAR(255),
    gender CHAR(1),
    emailAddr VARCHAR(255),
    phone VARCHAR(255),
    homeNum VARCHAR(255),
    streetName VARCHAR(255),
    postalCode VARCHAR(255),
    dateOfBirth DATE CHECK (dateOfBirth <= CURRENT_DATE - INTERVAL '18 years') 

);

CREATE TABLE MemberSchedule ( 
    scheduleMID SERIAL PRIMARY KEY, 
    memberID INTEGER,
    updatingAdmin INTEGER
);

CREATE TABLE EventsMember ( 
    bookingID INTEGER,
    scheduleMID INTEGER,
    PRIMARY KEY (bookingID, scheduleMID) 
);

CREATE TABLE Booking (
    bookingID SERIAL PRIMARY KEY, 
    room VARCHAR(255),
    type VARCHAR(255),
    date DATE,
    time TIME,
    status VARCHAR(255),
    instructor INTEGER, 
    processingAdmin INTEGER, 
    equipmentStatus BOOLEAN, 
    roomStatus BOOLEAN, 
    trainerAvailable BOOLEAN, 
    scheduleTID INTEGER,
    duration SMALLINT
);

CREATE TABLE RequestBooking ( 
    bookingID INTEGER,
    memberID INTEGER,
    PRIMARY KEY (bookingID, memberID) 
);

CREATE TABLE Equipment (
    equipmentID SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    monitoringAdmin INTEGER,
    lastMonitored DATE,
    score SMALLINT CHECK (score BETWEEN 1 AND 10)
);

CREATE TABLE Admin (
    adminID SERIAL PRIMARY KEY, 
    fName VARCHAR(255),
    lName VARCHAR(255), 
    emailAddr VARCHAR(255), 
    phone VARCHAR(255)
);

CREATE TABLE Payment (
    paymentID SERIAL PRIMARY KEY, 
    type VARCHAR(255),
    dateIssued DATE,
    dateBilled DATE,
    amount MONEY,
    processingAdmin INTEGER,
    payee INTEGER
);

CREATE TABLE Profile (
    profileID SERIAL PRIMARY KEY, 
    memberID INTEGER,
    status VARCHAR(255),
    weight INTEGER,
    bloodPressure VARCHAR(255), bodyFat INTEGER
);

CREATE TABLE Goal (
    goalID SERIAL PRIMARY KEY,
    targetWeight INTEGER, 
    targetPace TIME, 
    targetBodyFat INTEGER
);

CREATE TABLE Achievements ( 
    achievID SERIAL PRIMARY KEY, 
    goalID INTEGER
);

CREATE TABLE ProfileAchievements ( 
    profileID INTEGER,
    achievID INTEGER,
    PRIMARY KEY (profileID, achievID) 
);

CREATE TABLE ProfileGoals ( 
    profileID INTEGER,
    goalID INTEGER,
    PRIMARY KEY (profileID, goalID) 
);

CREATE TABLE ProfileRoutines ( 
    profileID INTEGER,
    exerciseID INTEGER,
    PRIMARY KEY (profileID, exerciseID) 
);

CREATE TABLE Exercise(
    exerciseID SERIAL PRIMARY KEY, 
    name VARCHAR(255),
    description TEXT
);

ALTER TABLE Profile ADD CONSTRAINT fk_profile_member FOREIGN KEY (memberID) REFERENCES Member(memberID);
ALTER TABLE Member ADD CONSTRAINT fk_member_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE Achievements ADD CONSTRAINT fk_achievements_goal FOREIGN KEY (goalID) REFERENCES Goal(goalID);
ALTER TABLE Trainer ADD CONSTRAINT fk_trainer_scheduleTID FOREIGN KEY (scheduleTID) REFERENCES TrainerSchedule(scheduleTID);
ALTER TABLE TrainerSchedule ADD CONSTRAINT fk_trainerSchedule_trainer FOREIGN KEY (trainerID) REFERENCES Trainer(trainerID);
ALTER TABLE TrainerSchedule ADD CONSTRAINT fk_trainerSchedule_admin FOREIGN KEY (updatingAdmin) REFERENCES Admin(adminID);
ALTER TABLE Booking ADD CONSTRAINT fk_booking_instructor FOREIGN KEY (instructor) REFERENCES Trainer(trainerID);
ALTER TABLE Booking ADD CONSTRAINT fk_booking_processingAdmin FOREIGN KEY (processingAdmin) REFERENCES Admin(adminID);
ALTER TABLE Booking ADD CONSTRAINT fk_booking_scheduleTID FOREIGN KEY (scheduleTID) REFERENCES TrainerSchedule(scheduleTID);
ALTER TABLE MemberSchedule ADD CONSTRAINT fk_memberSchedule_member FOREIGN KEY (memberID) REFERENCES Member(memberID);
ALTER TABLE MemberSchedule ADD CONSTRAINT fk_memberSchedule_admin FOREIGN KEY (updatingAdmin) REFERENCES Admin(adminID);
ALTER TABLE Equipment ADD CONSTRAINT fk_equipment_admin FOREIGN KEY (monitoringAdmin) REFERENCES Admin(adminID);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_processingAdmin FOREIGN KEY (processingAdmin) REFERENCES Admin(adminID);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_payee FOREIGN KEY (payee) REFERENCES Profile(profileID);
ALTER TABLE TrainerAvailability ADD CONSTRAINT fk_trainerAvailability_trainer FOREIGN KEY (trainerID) REFERENCES Trainer(trainerID);
ALTER TABLE TrainerAvailability ADD CONSTRAINT fk_trainerAvailability_availability FOREIGN KEY (availabilityID) REFERENCES Availability(availabilityID);
ALTER TABLE TrainerView ADD CONSTRAINT fk_trainerView_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE TrainerView ADD CONSTRAINT fk_trainerView_trainer FOREIGN KEY (trainerID) REFERENCES Trainer(trainerID);
ALTER TABLE TrainerAssigns ADD CONSTRAINT fk_trainerAssigns_trainer FOREIGN KEY (trainerID) REFERENCES Trainer(trainerID);
ALTER TABLE TrainerAssigns ADD CONSTRAINT fk_trainerAssigns_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE TrainerAssigns ADD CONSTRAINT fk_trainerAssigns_exercise FOREIGN KEY (exerciseID) REFERENCES Exercise(exerciseID);
ALTER TABLE EventsMember ADD CONSTRAINT fk_eventsMember_booking FOREIGN KEY (bookingID) REFERENCES Booking(bookingID);
ALTER TABLE EventsMember ADD CONSTRAINT fk_eventsMember_scheduleMID FOREIGN KEY (scheduleMID) REFERENCES MemberSchedule(scheduleMID);
ALTER TABLE RequestBooking ADD CONSTRAINT fk_requestBooking_booking FOREIGN KEY (bookingID) REFERENCES Booking(bookingID);
ALTER TABLE RequestBooking ADD CONSTRAINT fk_requestBooking_member FOREIGN KEY (memberID) REFERENCES Member(memberID);
ALTER TABLE ProfileAchievements ADD CONSTRAINT fk_profileAchievements_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE ProfileAchievements ADD CONSTRAINT fk_profileAchievements_achiev FOREIGN KEY (achievID) REFERENCES Achievements(achievID);
ALTER TABLE ProfileGoals ADD CONSTRAINT fk_profileGoals_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE ProfileGoals ADD CONSTRAINT fk_profileGoals_goal FOREIGN KEY (goalID) REFERENCES Goal(goalID);
ALTER TABLE ProfileRoutines ADD CONSTRAINT fk_profileRoutines_profile FOREIGN KEY (profileID) REFERENCES Profile(profileID);
ALTER TABLE ProfileRoutines ADD CONSTRAINT fk_profileRoutines_exercise FOREIGN KEY (exerciseID) REFERENCES Exercise(exerciseID);