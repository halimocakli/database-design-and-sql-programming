


IF	OBJECT_ID(N'[dbo].[Cities]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[LoadingStations]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[Municipalities]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[VehicleRoute]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[Card]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[VehicleTypes]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[Drivers]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[AppointmentsDriverVehicle]', N'U')	IS NULL
IF	OBJECT_ID(N'[dbo].[Shifts]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[ShiftsDrivers]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[CardLoading]', N'U')					IS NULL
IF	OBJECT_ID(N'[dbo].[DriverContacts]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[Complaint]', N'U')					IS NULL
IF	OBJECT_ID(N'[dbo].[Vehicles]', N'U')					IS NULL
IF	OBJECT_ID(N'[dbo].[BusLine]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[PassengerVehicle]', N'U')			IS NULL
IF	OBJECT_ID(N'[dbo].[Departure]', N'U')					IS NULL
IF	OBJECT_ID(N'[dbo].[Neighbourhood]', N'U')				IS NULL
IF	OBJECT_ID(N'[dbo].[BusStop]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[Route]', N'U')						IS NULL
IF	OBJECT_ID(N'[dbo].[Passenger]', N'U')					IS NULL
IF	OBJECT_ID(N'[dbo].[CardType]', N'U')					IS NULL

BEGIN;
CREATE TABLE Cities
(
    PK_CityID INT IDENTITY(1, 1),
    CityName VARCHAR(50),
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE LoadingStations
(
    PK_LoadingStationID INT IDENTITY(1, 1),
    LoadingStationName VARCHAR(200),
    AuthorizedName VARCHAR(100),
    AuthorizedSurname VARCHAR(100),
    x_Coordinate VARCHAR(20),
    y_Coordinate VARCHAR(20),
    FK_NeighbourhoodID INT,
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
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
        DEFAULT Getdate()
);
CREATE TABLE VehicleRoute
(
    PK_VehicleRouteID INT IDENTITY(1, 1),
    FK_VehicleID INT,
    FK_BusLineID INT,
    StartDate DATE,
    EndDate DATE,
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Card
(
    PK_CardID INT IDENTITY(1, 1),
    AK_CardNo VARCHAR(16) NOT NULL,
    Balance FLOAT
        DEFAULT 0,
    ExpireDate DATE,
    IsActive BIT
        DEFAULT 1,
    FK_CardTypeID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE VehicleTypes
(
    PK_VehicleTypeID INT IDENTITY(1, 1),
    VehicleType VARCHAR(90),
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Drivers
(
    PK_DriverID INT IDENTITY(1, 1),
    AK_TcNo CHAR(11) NOT NULL,
    DriverName VARCHAR(100),
    DriverSurname VARCHAR(100),
    AK_DriverRegisterNo VARCHAR(20),
    CHK_DriverGender CHAR(1) CHECK (CHK_DriverGender = 'M'
                                    OR CHK_DriverGender = 'W'
                                   ),
    DriverBirthDate DATE,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE AppointmentsDriverVehicle
(
    PK_AppointmentID INT IDENTITY(1, 1),
    FK_DriverID INT,
    FK_VehicleID INT,
    StartDate DATE,
    EndDate DATE,
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Shifts
(
    PK_ShiftID INT IDENTITY(1, 1),
    CHK_ShiftType CHAR(1) CHECK (CHK_ShiftType = 'M'
                                 OR CHK_ShiftType = 'E'
                                 OR CHK_ShiftType = 'N'
                                ),
    Date DATE,
    ShiftStartingTime TIME,
    ShiftEndingTime TIME,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE ShiftsDrivers
(
    PK_DriverShiftID INT IDENTITY(1, 1),
    FK_DriverID INT,
    FK_ShiftID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE CardLoading
(
    PK_CardLoadingID INT IDENTITY(1, 1),
    AK_InvoiceNo VARCHAR(30) NOT NULL,
    LoadingAmount MONEY
        DEFAULT 0,
    FK_CardID INT,
    FK_LoadingStationID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
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
        DEFAULT Getdate()
);
CREATE TABLE Complaint
(
    PK_ComplaintID INT IDENTITY(1, 1),
    IncidentDate DATETIME
        DEFAULT Getdate(),
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
        DEFAULT Getdate()
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
        DEFAULT Getdate()
);
CREATE TABLE BusLine
(
    PK_BusLineID INT IDENTITY(1, 1),
    AK_BusLineCode VARCHAR(6) NOT NULL,
    Route VARCHAR(60),
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE PassengerVehicle
(
    PK_PassengerVehicleID INT IDENTITY(1, 1),
    FK_PassengerID INT,
    FK_VehicleID INT,
    Price MONEY
        DEFAULT 0,
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Departure
(
    PK_DepartureID INT IDENTITY(1, 1),
    Date DATE,
    DepartureTime TIME,
    FK_VehicleRouteID INT,
    IsDeleted BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Neighbourhood
(
    PK_NeighbourhoodID INT IDENTITY(1, 1),
    NeighbourhoodName VARCHAR(100),
    FK_CityID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE BusStop
(
    PK_BusStopID INT IDENTITY(1, 1),
    AK_BusStopCode VARCHAR(6) NOT NULL,
    BusStopName VARCHAR(60),
    FK_NeighbourhoodID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Route
(
    PK_RouteID INT IDENTITY(1, 1),
    FK_BusStopID INT,
    FK_BusLineID INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE Passenger
(
    PK_PassengerID INT IDENTITY(1, 1),
    AK_TcNo CHAR(11) NOT NULL,
    PassengerName VARCHAR(100),
    PassengerSurname VARCHAR(100),
    CHK_PassengerGender CHAR(1) CHECK (CHK_PassengerGender = 'M'
                                       OR CHK_PassengerGender = 'W'
                                      ),
    PassengerBirthDate DATE,
    PassengerPhotoURL VARCHAR(120),
    AK_PassengerHesCode CHAR(10) NOT NULL,
    FK_CardID_AK INT,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
CREATE TABLE CardType
(
    PK_CardTypeID INT IDENTITY(1, 1),
    CardType VARCHAR(30),
    Discount FLOAT
        DEFAULT 0,
    IsDelete BIT
        DEFAULT 0,
    CreatedDatetime DATETIME
        DEFAULT Getdate()
);
ALTER TABLE Cities ADD CONSTRAINT PK_Cities PRIMARY KEY (PK_CityID)
ALTER TABLE LoadingStations
ADD CONSTRAINT PK_LoadingStations
    PRIMARY KEY (PK_LoadingStationID)
ALTER TABLE Municipalities
ADD CONSTRAINT PK_Municipalities
    PRIMARY KEY (PK_MunicipalityID)
ALTER TABLE VehicleRoute
ADD CONSTRAINT PK_VehicleRoute
    PRIMARY KEY (PK_VehicleRouteID)
ALTER TABLE Card ADD CONSTRAINT PK_Card PRIMARY KEY (PK_CardID)
ALTER TABLE VehicleTypes
ADD CONSTRAINT PK_VehicleTypes
    PRIMARY KEY (PK_VehicleTypeID)
ALTER TABLE Drivers ADD CONSTRAINT PK_Drivers PRIMARY KEY (PK_DriverID)
ALTER TABLE AppointmentsDriverVehicle
ADD CONSTRAINT PK_AppointmentsDriverVehicle
    PRIMARY KEY (PK_AppointmentID)
ALTER TABLE Shifts ADD CONSTRAINT PK_Shifts PRIMARY KEY (PK_ShiftID)
ALTER TABLE ShiftsDrivers
ADD CONSTRAINT PK_ShiftsDrivers
    PRIMARY KEY (PK_DriverShiftID)
ALTER TABLE CardLoading
ADD CONSTRAINT PK_CardLoading
    PRIMARY KEY (PK_CardLoadingID)
ALTER TABLE DriverContacts
ADD CONSTRAINT PK_DriverContacts
    PRIMARY KEY (PK_DriverContactID)
ALTER TABLE Complaint
ADD CONSTRAINT PK_Complaint
    PRIMARY KEY (PK_ComplaintID)
ALTER TABLE Vehicles ADD CONSTRAINT PK_Vehicles PRIMARY KEY (PK_VehicleID)
ALTER TABLE BusLine ADD CONSTRAINT PK_BusLine PRIMARY KEY (PK_BusLineID)
ALTER TABLE PassengerVehicle
ADD CONSTRAINT PK_PassengerVehicle
    PRIMARY KEY (PK_PassengerVehicleID)
ALTER TABLE Departure
ADD CONSTRAINT PK_Departure
    PRIMARY KEY (PK_DepartureID)
ALTER TABLE Neighbourhood
ADD CONSTRAINT PK_Neighbourhood
    PRIMARY KEY (PK_NeighbourhoodID)
ALTER TABLE BusStop ADD CONSTRAINT PK_BusStop PRIMARY KEY (PK_BusStopID)
ALTER TABLE Route ADD CONSTRAINT PK_Route PRIMARY KEY (PK_RouteID)
ALTER TABLE Passenger
ADD CONSTRAINT PK_Passenger
    PRIMARY KEY (PK_PassengerID)
ALTER TABLE CardType
ADD CONSTRAINT PK_CardType
    PRIMARY KEY (PK_CardTypeID)
ALTER TABLE LoadingStations
ADD CONSTRAINT FK_LoadingStations_Neighbourhood
    FOREIGN KEY (FK_NeighbourhoodID)
    REFERENCES Neighbourhood (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Municipalities
ADD CONSTRAINT FK_Municipalities_Cities
    FOREIGN KEY (FK_CityID)
    REFERENCES Cities (PK_CityID) ON DELETE CASCADE 
	ON UPDATE CASCADE
ALTER TABLE VehicleRoute
ADD CONSTRAINT FK_VehicleRoute_Vehicles
    FOREIGN KEY (FK_VehicleID)
    REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE 
	ON UPDATE CASCADE
ALTER TABLE VehicleRoute
ADD CONSTRAINT FK_VehicleRoute_BusLine
    FOREIGN KEY (FK_BusLineID)
    REFERENCES BusLine (PK_BusLineID) ON DELETE CASCADE 
	ON UPDATE CASCADE
ALTER TABLE Card
ADD CONSTRAINT FK_Card_CardType
    FOREIGN KEY (FK_CardTypeID)
    REFERENCES CardType (PK_CardTypeID) ON DELETE CASCADE 
	ON UPDATE CASCADE
ALTER TABLE AppointmentsDriverVehicle
ADD CONSTRAINT FK_AppointmentsDriverVehicle_Drivers
    FOREIGN KEY (FK_DriverID)
    REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE 
	ON UPDATE CASCADE
ALTER TABLE AppointmentsDriverVehicle
ADD CONSTRAINT FK_AppointmentsDriverVehicle_Vehicles
    FOREIGN KEY (FK_VehicleID)
    REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE ShiftsDrivers
ADD CONSTRAINT FK_ShiftsDrivers_Drivers
    FOREIGN KEY (FK_DriverID)
    REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE ShiftsDrivers
ADD CONSTRAINT FK_ShiftsDrivers_Shifts
    FOREIGN KEY (FK_ShiftID)
    REFERENCES Shifts (PK_ShiftID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE CardLoading
ADD CONSTRAINT FK_CardLoading_Card
    FOREIGN KEY (FK_CardID)
    REFERENCES Card (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE CardLoading
ADD CONSTRAINT FK_CardLoading_LoadingStations
    FOREIGN KEY (FK_LoadingStationID)
    REFERENCES LoadingStations (PK_LoadingStationID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE DriverContacts
ADD CONSTRAINT FK_DriverContacts_Drivers
    FOREIGN KEY (FK_DriverID_AK)
    REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Complaint
ADD CONSTRAINT FK_Complaint_Drivers
    FOREIGN KEY (FK_DriverID)
    REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Vehicles
ADD CONSTRAINT FK_Vehicles_Municipalities
    FOREIGN KEY (FK_MunicipalityID)
    REFERENCES Municipalities (PK_MunicipalityID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Vehicles
ADD CONSTRAINT FK_Vehicles_VehicleTypes
    FOREIGN KEY (FK_VehicleTypeID)
    REFERENCES VehicleTypes (PK_VehicleTypeID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE PassengerVehicle
ADD CONSTRAINT FK_PassengerVehicle_Passenger
    FOREIGN KEY (FK_PassengerID)
    REFERENCES Passenger (PK_PassengerID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE PassengerVehicle
ADD CONSTRAINT FK_PassengerVehicle_Vehicles
    FOREIGN KEY (FK_VehicleID)
    REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Departure
ADD CONSTRAINT FK_Departure_VehicleRoute
    FOREIGN KEY (FK_VehicleRouteID)
    REFERENCES VehicleRoute (PK_VehicleRouteID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Neighbourhood
ADD CONSTRAINT FK_Neighbourhood_Cities
    FOREIGN KEY (FK_CityID)
    REFERENCES Cities (PK_CityID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE BusStop
ADD CONSTRAINT FK_BusStop_Neighbourhood
    FOREIGN KEY (FK_NeighbourhoodID)
    REFERENCES Neighbourhood (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Route
ADD CONSTRAINT FK_Route_BusStop
    FOREIGN KEY (FK_BusStopID)
    REFERENCES BusStop (PK_BusStopID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Route
ADD CONSTRAINT FK_Route_BusLine
    FOREIGN KEY (FK_BusLineID)
    REFERENCES BusLine (PK_BusLineID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Passenger
ADD CONSTRAINT FK_Passenger_Card
    FOREIGN KEY (FK_CardID_AK)
    REFERENCES Card (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Drivers
ADD CONSTRAINT CHK_DriverGender CHECK (CHK_DriverGender = 'M'
                                       OR CHK_DriverGender = 'W'
                                      );
ALTER TABLE Shifts
ADD CONSTRAINT CHK_ShiftType CHECK (CHK_ShiftType = 'M'
                                    OR CHK_ShiftType = 'E'
                                    OR CHK_ShiftType = 'N'
                                   );
ALTER TABLE Passenger
ADD CONSTRAINT CHK_PassengerGender CHECK (CHK_PassengerGender = 'M'
                                          OR CHK_PassengerGender = 'W'
                                         );


END;


