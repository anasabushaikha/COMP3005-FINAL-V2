INSERT INTO Trainer (fName, lName, gender, certification, securityCheck, emailAddr, phone, scheduleTID) VALUES
('John', 'Doe', 'M', 'Certified Personal Trainer', TRUE, 'johndoe@email.com', '123-456-7890', 1), 
('Jane', 'Smith', 'F', 'Certified Strength and Conditioning Specialist', TRUE, 'janesmith@email.com', '098-765-4321', 2);

INSERT INTO Availability (day, startTime, endTime) VALUES
('Monday', '08:00:00', '12:00:00'),
('Tuesday', '13:00:00', '17:00:00');

INSERT INTO TrainerAvailability (trainerID, availabilityID) VALUES
(1, 1),
(2, 2);

INSERT INTO TrainerSchedule (trainerID, updatingAdmin) VALUES
(1, 1),
(2, 2);

INSERT INTO TrainerView (profileID, trainerID) VALUES
(1, 1),
(2, 2);

INSERT INTO TrainerAssigns (trainerID, profileID, exerciseID) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO Member (fName, lName, gender, emailAddr, phone, homeNum, streetName, postalCode, dateOfBirth) VALUES
('Alice', 'Wong', 'F', 'alicewong@email.com', '234-567-8901', '123', 'Maple Street', 'A1A 2B2', '1985-04-12'),
('Bob', 'Johnson', 'M', 'bobjohnson@email.com', '678-901-2345', '456', 'Oak Avenue', 'B2B 3C3', '1978-08-24');

INSERT INTO MemberSchedule (memberID, updatingAdmin) VALUES
(1, 1),
(2, 2);

 INSERT INTO EventsMember (bookingID, scheduleMID) VALUES
(1, 1),
(2, 2);

INSERT INTO Booking (room, type, date, time, status, instructor, processingAdmin, equipmentStatus, roomStatus, trainerAvailable, scheduleTID, duration) VALUES
('101', 'Personal', '2024-04-01', '10:00:00', 'Scheduled', 1, 1, TRUE, TRUE, TRUE, 1, 60), 
('102', 'Group', '2024-04-02', '12:00:00', 'Scheduled', 2, 2, TRUE, TRUE, TRUE, 2, 45);

INSERT INTO RequestBooking (bookingID, memberID) VALUES
(1, 1),
(2, 2);

INSERT INTO Equipment (name, location, monitoringAdmin, lastMonitored, score) VALUES
('Treadmill', 'Gym Floor', 1, '2024-03-28', 9),
('Dumbbells', 'Weights Area', 2, '2024-03-29', 8);

INSERT INTO Admin (fName, lName, emailAddr, phone) VALUES 
('Charlie', 'Admin', 'charlieadmin@email.com', '123-456-7899'),
('Dana', 'Manager', 'danamanager@email.com', '987-654-3210');

INSERT INTO Payment (type, dateIssued, dateBilled, amount, processingAdmin, payee) VALUES
('Membership', '2024-03-01', '2024-03-15', '50.00', 1, 1),
('Session', '2024-03-16', '2024-03-30', '30.00', 2, 2);

INSERT INTO Profile (memberID, status, weight, bloodPressure, bodyFat) VALUES
(1, 'Active', 70, '120/80', 20),
(2, 'Active', 80, '130/85', 25);

INSERT INTO Goal (targetWeight, targetPace, targetBodyFat) VALUES
(65, '00:06:00', 18),
(75, '00:05:30', 22);

INSERT INTO Achievements (goalID) VALUES
(1), (2);

INSERT INTO ProfileAchievements (profileID, achievID) VALUES
(1, 1),
(2, 2);

INSERT INTO ProfileGoals (profileID, goalID) VALUES
(1, 1),
(2, 2);

INSERT INTO ProfileRoutines (profileID, exerciseID) VALUES
(1, 1),
(2, 2);

INSERT INTO Exercise (name, description) VALUES
('Squat', 'A lower body exercise that primarily targets the thighs and the glutes.'), 
('Bench Press', 'An upper body exercise that primarily targets the chest, shoulders, and triceps.');

