--DROP TABLE Cities
--DROP TABLE LoadingStations
--DROP TABLE Municipalities
--DROP TABLE VehicleRoutes
--DROP TABLE Cards
--DROP TABLE VehicleTypes
--DROP TABLE Drivers
--DROP TABLE DriverVehicleAppointments
--DROP TABLE Shifts
--DROP TABLE ShiftsDrivers
--DROP TABLE CardCreditLoadings
--DROP TABLE DriverContacts
--DROP TABLE Complaints
--DROP TABLE Vehicles
--DROP TABLE BusLines
--DROP TABLE PassengerVehicles
--DROP TABLE Departures
--DROP TABLE Neighbourhoods
--DROP TABLE BusStops
--DROP TABLE Routes_
--DROP TABLE Passengers
--DROP TABLE CardTypes

BEGIN

	CREATE TABLE Cities
	(
		PK_CityID INT IDENTITY(1, 1),
		CityName VARCHAR(50),
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE LoadingStations
	(
		PK_LoadingStationID INT IDENTITY(1, 1),
		LoadingStationName VARCHAR(200),
		AuthorizedName VARCHAR(100) NOT NULL,
		AuthorizedSurname VARCHAR(100) NOT NULL,
		AuthorizedPhone VARCHAR(10) NOT NULL,
		x_Coordinate VARCHAR(20),
		y_Coordinate VARCHAR(20),
		FK_NeighbourhoodID INT,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Municipalities
	(
		PK_MunicipalityID INT IDENTITY(1, 1),
		MunicipalityName VARCHAR(140) NOT NULL,
		MunicipalityAddress VARCHAR(MAX),
		AuthorizedName VARCHAR(100),
		AuthorizedSurname VARCHAR(100),
		AuthorizedPhone VARCHAR(10),
		AuthorizedEmail VARCHAR(100),
		x_coordinate VARCHAR(40),
		y_coordinate VARCHAR(40),
		FK_CityID INT,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE VehicleRoutes
	(
		PK_VehicleRouteID INT IDENTITY(1, 1),
		FK_VehicleID INT,
		FK_BusLineID INT,
		StartDate DATE,
		EndDate DATE,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Cards
	(
		PK_CardID INT IDENTITY(1, 1),
		AK_CardNo VARCHAR(16) NOT NULL,
		Balance FLOAT
			DEFAULT 0,
		CardExpireDate DATE,
		IsActive BIT
			DEFAULT 1,
		FK_CardTypeID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE VehicleTypes
	(
		PK_VehicleTypeID INT IDENTITY(1, 1),
		VehicleType VARCHAR(90),
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Drivers
	(
		PK_DriverID INT IDENTITY(1, 1),
		AK_DriverTcNo CHAR(11) NOT NULL,
		DriverName VARCHAR(100),
		DriverSurname VARCHAR(100),
		AK_DriverRegisterNo VARCHAR(20),
		CHK_DriverGender CHAR(1),
		DriverBirthDate DATE,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE DriverVehicleAppointments
	(
		PK_AppointmentID INT IDENTITY(1, 1),
		FK_DriverID INT,
		FK_VehicleID INT,
		StartDate DATE,
		EndDate DATE,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Shifts
	(
		PK_ShiftID INT IDENTITY(1, 1),
		CHK_ShiftType CHAR(1),
		ShiftDate DATE,
		ShiftStartingTime TIME,
		ShiftEndingTime TIME,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE ShiftsDrivers
	(
		PK_DriverShiftID INT IDENTITY(1, 1),
		FK_DriverID INT,
		FK_ShiftID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE CardCreditLoadings
	(
		PK_CardCreditLoadingID INT IDENTITY(1, 1),
		AK_InvoiceNo VARCHAR(30) NOT NULL,
		LoadingAmount MONEY
			DEFAULT 0,
		FK_CardID INT,
		FK_LoadingStationID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE DriverContacts
	(
		PK_DriverContactID INT IDENTITY(1, 1),
		DriverPhone CHAR(10),
		DriverEmail VARCHAR(100),
		DriverAddress VARCHAR(MAX),
		FK_DriverID_AK INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Complaints
	(
		PK_ComplaintID INT IDENTITY(1, 1),
		IncidentDate DATETIME
			DEFAULT GETDATE(),
		Grievance VARCHAR(100),
		Content VARCHAR(MAX),
		ComplainantName VARCHAR(100),
		ComplainantSurname VARCHAR(100),
		ComplainantPhone CHAR(10),
		ComplainantEmail VARCHAR(100),
		FK_DriverID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Vehicles
	(
		PK_VehicleID INT IDENTITY(1, 1),
		AK_LicencePlate VARCHAR(15) NOT NULL,
		Brand VARCHAR(60),
		Model VARCHAR(60),
		Capacity SMALLINT
			DEFAULT 0,
		IsActive BIT
			DEFAULT 0,
		IsBroken BIT
			DEFAULT 0,
		FK_MunicipalityID INT,
		FK_VehicleTypeID INT,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE BusLines
	(
		PK_BusLineID INT IDENTITY(1, 1),
		AK_BusLineCode VARCHAR(6) NOT NULL,
		Line VARCHAR(60),
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE PassengerVehicles
	(
		PK_PassengerVehicleID INT IDENTITY(1, 1),
		FK_PassengerID INT,
		FK_VehicleID INT,
		Price MONEY
			DEFAULT 0,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Departures
	(
		PK_DepartureID INT IDENTITY(1, 1),
		Date DATE,
		DepartureTime TIME,
		FK_VehicleRouteID INT,
		IsDeleted BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Neighbourhoods
	(
		PK_NeighbourhoodID INT IDENTITY(1, 1),
		NeighbourhoodName VARCHAR(100),
		FK_CityID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE BusStops
	(
		PK_BusStopID INT IDENTITY(1, 1),
		AK_BusStopCode VARCHAR(6) NOT NULL,
		BusStopName VARCHAR(60),
		FK_NeighbourhoodID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Routes_
	(
		PK_RouteID INT IDENTITY(1, 1),
		FK_BusStopID INT,
		FK_BusLineID INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE Passengers
	(
		PK_PassengerID INT IDENTITY(1, 1),
		AK_TcNo CHAR(11) NOT NULL,
		PassengerName VARCHAR(100),
		PassengerSurname VARCHAR(100),
		CHK_PassengerGender CHAR(1),
		PassengerBirthDate DATE,
		PassengerPhotoURL VARCHAR(120),
		AK_PassengerHesCode CHAR(10) NOT NULL,
		FK_CardID_AK INT,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);

	CREATE TABLE CardTypes
	(
		PK_CardTypeID INT IDENTITY(1, 1),
		CardType VARCHAR(30),
		Discount FLOAT
			DEFAULT 0,
		IsDelete BIT
			DEFAULT 0,
		CreatedDatetime DATETIME
			DEFAULT GETDATE()
	);


	ALTER TABLE Cities 
		ADD CONSTRAINT PK_Cities 
		PRIMARY KEY (PK_CityID);

	ALTER TABLE LoadingStations
		ADD CONSTRAINT PK_LoadingStations
		PRIMARY KEY (PK_LoadingStationID);

	ALTER TABLE Municipalities
		ADD CONSTRAINT PK_Municipalities
		PRIMARY KEY (PK_MunicipalityID);

	ALTER TABLE VehicleRoutes
		ADD CONSTRAINT PK_VehicleRoutes
		PRIMARY KEY (PK_VehicleRouteID);

	ALTER TABLE Cards 
		ADD CONSTRAINT PK_Cards 
		PRIMARY KEY (PK_CardID);

	ALTER TABLE VehicleTypes
		ADD CONSTRAINT PK_VehicleTypes
		PRIMARY KEY (PK_VehicleTypeID);

	ALTER TABLE Drivers 
		ADD CONSTRAINT PK_Drivers 
		PRIMARY KEY (PK_DriverID);

	ALTER TABLE DriverVehicleAppointments
		ADD CONSTRAINT PK_DriverVehicleAppointments
		PRIMARY KEY (PK_AppointmentID);

	ALTER TABLE Shifts 
		ADD CONSTRAINT PK_Shifts 
		PRIMARY KEY (PK_ShiftID);

	ALTER TABLE ShiftsDrivers
		ADD CONSTRAINT PK_ShiftsDrivers
		PRIMARY KEY (PK_DriverShiftID);

	ALTER TABLE CardCreditLoadings
	ADD CONSTRAINT PK_CardCreditLoadings
		PRIMARY KEY (PK_CardCreditLoadingID);

	ALTER TABLE DriverContacts
		ADD CONSTRAINT PK_DriverContacts
		PRIMARY KEY (PK_DriverContactID);

	ALTER TABLE Complaints
		ADD CONSTRAINT PK_Complaints
		PRIMARY KEY (PK_ComplaintID);

	ALTER TABLE Vehicles
		ADD CONSTRAINT PK_Vehicles
		PRIMARY KEY (PK_VehicleID);

	ALTER TABLE BusLines
		ADD CONSTRAINT PK_BusLines
		PRIMARY KEY (PK_BusLineID);

	ALTER TABLE PassengerVehicles
		ADD CONSTRAINT PK_PassengerVehicles
		PRIMARY KEY (PK_PassengerVehicleID);

	ALTER TABLE Departures
		ADD CONSTRAINT PK_Departures
		PRIMARY KEY (PK_DepartureID);

	ALTER TABLE Neighbourhoods
		ADD CONSTRAINT PK_Neighbourhoods
		PRIMARY KEY (PK_NeighbourhoodID);

	ALTER TABLE BusStops
		ADD CONSTRAINT PK_BusStops
		PRIMARY KEY (PK_BusStopID);

	ALTER TABLE Routes_ 
		ADD CONSTRAINT PK_Routes_ 
		PRIMARY KEY (PK_RouteID);

	ALTER TABLE Passengers
		ADD CONSTRAINT PK_Passengers
		PRIMARY KEY (PK_PassengerID);

	ALTER TABLE CardTypes
		ADD CONSTRAINT PK_CardTypes
		PRIMARY KEY (PK_CardTypeID);


	ALTER TABLE LoadingStations
		ADD CONSTRAINT FK_LoadingStations_Neighbourhoods
		FOREIGN KEY (FK_NeighbourhoodID)
		REFERENCES Neighbourhoods (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Municipalities
		ADD CONSTRAINT FK_Municipalities_Cities
		FOREIGN KEY (FK_CityID)
		REFERENCES Cities (PK_CityID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE VehicleRoutes
		ADD CONSTRAINT FK_VehicleRoutes_Vehicles
		FOREIGN KEY (FK_VehicleID)
		REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE VehicleRoutes
		ADD CONSTRAINT FK_VehicleRoutes_BusLines
		FOREIGN KEY (FK_BusLineID)
		REFERENCES BusLines (PK_BusLineID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Cards
		ADD CONSTRAINT FK_Cards_CardTypes
		FOREIGN KEY (FK_CardTypeID)
		REFERENCES CardTypes (PK_CardTypeID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE DriverVehicleAppointments
		ADD CONSTRAINT FK_DriverVehicleAppointments_Drivers
		FOREIGN KEY (FK_DriverID)
		REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE DriverVehicleAppointments
		ADD CONSTRAINT FK_DriverVehicleAppointments_Vehicles
		FOREIGN KEY (FK_VehicleID)
		REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE ShiftsDrivers
		ADD CONSTRAINT FK_ShiftsDrivers_Drivers
		FOREIGN KEY (FK_DriverID)
		REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE ShiftsDrivers
		ADD CONSTRAINT FK_ShiftsDrivers_Shifts
		FOREIGN KEY (FK_ShiftID)
		REFERENCES Shifts (PK_ShiftID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE CardCreditLoadings
		ADD CONSTRAINT FK_CardCreditLoadings_Cards
		FOREIGN KEY (FK_CardID)
		REFERENCES Cards (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE CardCreditLoadings
		ADD CONSTRAINT FK_CardCreditLoadings_LoadingStations
		FOREIGN KEY (FK_LoadingStationID)
		REFERENCES LoadingStations (PK_LoadingStationID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE DriverContacts
		ADD CONSTRAINT FK_DriverContacts_Drivers
		FOREIGN KEY (FK_DriverID_AK)
		REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Complaints
		ADD CONSTRAINT FK_Complaints_Drivers
		FOREIGN KEY (FK_DriverID)
		REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Vehicles
		ADD CONSTRAINT FK_Vehicles_Municipalities
		FOREIGN KEY (FK_MunicipalityID)
		REFERENCES Municipalities (PK_MunicipalityID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Vehicles
		ADD CONSTRAINT FK_Vehicles_VehicleTypes
		FOREIGN KEY (FK_VehicleTypeID)
		REFERENCES VehicleTypes (PK_VehicleTypeID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE PassengerVehicles
		ADD CONSTRAINT FK_PassengerVehicles_Passengers
		FOREIGN KEY (FK_PassengerID)
		REFERENCES Passengers (PK_PassengerID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE PassengerVehicles
		ADD CONSTRAINT FK_PassengerVehicles_Vehicles
		FOREIGN KEY (FK_VehicleID)
		REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Departures
		ADD CONSTRAINT FK_Departures_VehicleRoutes
		FOREIGN KEY (FK_VehicleRouteID)
		REFERENCES VehicleRoutes (PK_VehicleRouteID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Neighbourhoods
		ADD CONSTRAINT FK_Neighbourhoods_Cities
		FOREIGN KEY (FK_CityID)
		REFERENCES Cities (PK_CityID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE BusStops
		ADD CONSTRAINT FK_BusStops_Neighbourhoods
		FOREIGN KEY (FK_NeighbourhoodID)
		REFERENCES Neighbourhoods (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Routes_
		ADD CONSTRAINT FK_Routes__BusStops
		FOREIGN KEY (FK_BusStopID)
		REFERENCES BusStops (PK_BusStopID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Routes_
		ADD CONSTRAINT FK_Routes__BusLines
		FOREIGN KEY (FK_BusLineID)
		REFERENCES BusLines (PK_BusLineID) ON DELETE CASCADE ON UPDATE CASCADE;

	ALTER TABLE Passengers
		ADD CONSTRAINT FK_Passengers_Cards
		FOREIGN KEY (FK_CardID_AK)
		REFERENCES Cards (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE Drivers
	ADD CONSTRAINT CHK_DriverGender CHECK (CHK_DriverGender = 'M'
										   OR CHK_DriverGender = 'W'
										  );

	ALTER TABLE Shifts
	ADD CONSTRAINT CHK_ShiftType CHECK (CHK_ShiftType = 'M'
										OR CHK_ShiftType = 'E'
										OR CHK_ShiftType = 'N'
									   );

	ALTER TABLE Passengers
	ADD CONSTRAINT CHK_PassengerGender CHECK (CHK_PassengerGender = 'M'
												  OR CHK_PassengerGender = 'W'
												 );
END;