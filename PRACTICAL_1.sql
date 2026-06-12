---CREATING DATABASE

DROP DATABASE IF EXISTS myTimetable;
CREATE DATABASE myTimetable;
USE myTimetable;

DROP TABLE IF EXISTS ScheduleTable;
DROP TABLE IF EXISTS SubjectTable;
DROP TABLE IF EXISTS TimeRangeTable;
DROP TABLE IF EXISTS DayTable;
---CREATING TABLES 

-- Day table
CREATE TABLE DayTable (
    DayID INT PRIMARY KEY,
    DayName VARCHAR(20) NOT NULL
);

-- Time table
CREATE TABLE TimeRageTable (
    TimeID INT PRIMARY KEY,
    StartTime VARCHAR(10) NOT NULL,
    EndTime VARCHAR(10)  NOT NULL
);

-- Subject table
CREATE TABLE SubjectTable (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL
);

-- Schedule table (created last)
CREATE TABLE ScheduleTable (
    ScheduleID INT PRIMARY KEY,
    DayID INT NOT NULL,
    TimeID INT NOT NULL,
    SubjectID INT NOT NULL,
    FOREIGN KEY (DayID) REFERENCES DayTable(DayID),
    FOREIGN KEY (TimeID) REFERENCES TimeRageTable(TimeID),
    FOREIGN KEY (SubjectID) REFERENCES SubjectTable(SubjectID)
);

INSERT INTO DayTable (DayID, DayName) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday');

INSERT INTO TimeRageTable (TimeID, StartTime, EndTime) VALUES
(1, '08:00', '08:45'),
(2, '08:50', '09:35'),
(3, '09:40', '10:25'),
(4, '10:30', '11:15'),
(5, '11:20', '12:05'),
(6, '12:10', '12:55'),
(7, '13:00', '13:45'),
(8, '13:50', '14:35'),
(9, '14:40', '15:25'),
(10, '15:30', '16:15'),
(11, '16:20', '17:05');

INSERT INTO SubjectTable (SubjectID, SubjectName) VALUES
(1, 'ETS13A3 CLASS'),
(2, 'ETS13A3 TUTORIAL'),
(3,'PRO001 CLASS'),
(4,'PRO001 TUTORIAL'),
(5, 'ILS3A01 CLASS'),
(6, 'ILS3A01 PRACTICAL'),
(7, 'ILS3A01 TUTORIAL');

INSERT INTO ScheduleTable (ScheduleID, DayID, TimeID, SubjectID) VALUES 
(1,1,4,3),
(2,1,5,3),
(3,1,6,4),
(4,1,7,4),
(5,2,3,6),
(6,2,4,5),
(7,2,5,5),
(8,3,6,2),
(10,4,3,1),
(11,4,4,1),
(12,4,8,7),
(13,4,9,7);



SELECT * FROM DayTable;
	SELECT * FROM SubjectTable;
	SELECT * FROM ScheduleTable;
    SELECT * FROM TimeRageTable;



SELECT 
    TimeRageTable.StartTime,
    TimeRageTable.EndTime,
    Monday.SubjectName    AS Monday,
    Tuesday.SubjectName   AS Tuesday,
    Wednesday.SubjectName AS Wednesday,
    Thursday.SubjectName  AS Thursday,
    Friday.SubjectName    AS Friday
FROM TimeRageTable
LEFT JOIN ScheduleTable AS ScheduleMonday 
    ON ScheduleMonday.TimeID = TimeRageTable.TimeID 
    AND ScheduleMonday.DayID = (SELECT DayID FROM DayTable WHERE DayName = 'Monday')
LEFT JOIN SubjectTable AS Monday 
    ON ScheduleMonday.SubjectID = Monday.SubjectID
LEFT JOIN ScheduleTable AS ScheduleTuesday 
    ON ScheduleTuesday.TimeID = TimeRageTable.TimeID 
    AND ScheduleTuesday.DayID = (SELECT DayID FROM DayTable WHERE DayName = 'Tuesday')
LEFT JOIN SubjectTable AS Tuesday 
    ON ScheduleTuesday.SubjectID = Tuesday.SubjectID
LEFT JOIN ScheduleTable AS ScheduleWednesday 
    ON ScheduleWednesday.TimeID = TimeRageTable.TimeID 
    AND ScheduleWednesday.DayID = (SELECT DayID FROM DayTable WHERE DayName = 'Wednesday')
LEFT JOIN SubjectTable AS Wednesday 
    ON ScheduleWednesday.SubjectID = Wednesday.SubjectID
LEFT JOIN ScheduleTable AS ScheduleThursday 
    ON ScheduleThursday.TimeID = TimeRageTable.TimeID 
    AND ScheduleThursday.DayID = (SELECT DayID FROM DayTable WHERE DayName = 'Thursday')
LEFT JOIN SubjectTable AS Thursday 
    ON ScheduleThursday.SubjectID = Thursday.SubjectID
LEFT JOIN ScheduleTable AS ScheduleFriday 
    ON ScheduleFriday.TimeID = TimeRageTable.TimeID 
    AND ScheduleFriday.DayID = (SELECT DayID FROM DayTable WHERE DayName = 'Friday')
LEFT JOIN SubjectTable AS Friday 
    ON ScheduleFriday.SubjectID = Friday.SubjectID
ORDER BY TimeRageTable.TimeID;