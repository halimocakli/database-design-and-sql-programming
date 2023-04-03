IF OBJECT_ID(N'[dbo].[Cities]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[LoadingStations]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Municipalities]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[VehicleRoutes]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Cards]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[VehicleTypes]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Drivers]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[DriverVehicleAppointments]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Shifts]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[ShiftsDrivers]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[CardLoadings]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[DriverContacts]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Complaints]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Vehicles]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[BusLines]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[PassengerVehicles]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Departures]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Neighbourhoods]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[BusStops]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Routes_]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[Passengers]', N'U') IS NULL
IF OBJECT_ID(N'[dbo].[CardTypes]', N'U') IS NULL


BEGIN
   CREATE TABLE Cities (
      PK_CityID int IDENTITY (1 ,1) ,
      CityName varchar(50) ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE LoadingStations (
      PK_LoadingStationID int IDENTITY (1 ,1) ,
      LoadingStationName varchar(200) ,
      AuthorizedName varchar(100) ,
      AuthorizedSurname varchar(100) ,
      x_Coordinate varchar(20) ,
      y_Coordinate varchar(20) ,
      FK_NeighbourhoodID int ,
      IsDeleted bit ,
      CreatedDatetime datetime
   );
   CREATE TABLE Municipalities (
      PK_MunicipalityID int IDENTITY (1 ,1) ,
      MunicipalityName varchar(140) NOT NULL ,
      MunicipalityAddress varchar(max) ,
      AuthorizedName varchar(100) ,
      AuthorizedSurname varchar(100) ,
      AuthorizedPhone varchar(10) ,
      AuthorizedEmail varchar(100) ,
      x_coordinate varchar(40) ,
      y_coordinate varchar(40) ,
      FK_CityID int ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE VehicleRoutes (
      PK_VehicleRouteID int IDENTITY (1 ,1) ,
      FK_VehicleID int ,
      FK_BusLineID int ,
      StartDate date ,
      EndDate date ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Cards (
      PK_CardID int IDENTITY (1 ,1) ,
      AK_CardNo varchar(16) NOT NULL ,
      Balance float
      DEFAULT 0 ,
      ExpireDate date ,
      IsActive bit
      DEFAULT 1 ,
      FK_CardTypeID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE VehicleTypes (
      PK_VehicleTypeID int IDENTITY (1 ,1) ,
      VehicleType varchar(90) ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Drivers (
      PK_DriverID int IDENTITY (1 ,1) ,
      AK_TcNo char(11) NOT NULL ,
      DriverName varchar(100) ,
      DriverSurname varchar(100) ,
      AK_DriverRegisterNo varchar(20) ,
      CHK_DriverGender char(1) CHECK (CHK_DriverGender = 'M'
      OR CHK_DriverGender = 'W'
      ) ,
      DriverBirthDate date ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE DriverVehicleAppointments (
      PK_AppointmentID int IDENTITY (1 ,1) ,
      FK_DriverID int ,
      FK_VehicleID int ,
      StartDate date ,
      EndDate date ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Shifts (
      PK_ShiftID int IDENTITY (1 ,1) ,
      CHK_ShiftType char(1) CHECK (CHK_ShiftType = 'M'
      OR CHK_ShiftType = 'E'
      OR CHK_ShiftType = 'N'
      ) ,
      Date date ,
      ShiftStartingTime time ,
      ShiftEndingTime time ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE ShiftsDrivers (
      PK_DriverShiftID int IDENTITY (1 ,1) ,
      FK_DriverID int ,
      FK_ShiftID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE CardLoadings (
      PK_CardLoadingID int IDENTITY (1 ,1) ,
      AK_InvoiceNo varchar(30) NOT NULL ,
      LoadingAmount money
      DEFAULT 0 ,
      FK_CardID int ,
      FK_LoadingStationID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE DriverContacts (
      PK_DriverContactID int IDENTITY (1 ,1) ,
      DriverPhone char(10) ,
      DriverEmail varchar(100) ,
      DriverAddress varchar(max) ,
      FK_DriverID_AK int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Complaints (
      PK_ComplaintID int IDENTITY (1 ,1) ,
      IncidentDate datetime
      DEFAULT GETDATE() ,
      Grievance varchar(100) ,
      Content varchar(max) ,
      ComplainantName varchar(100) ,
      ComplainantSurname varchar(100) ,
      ComplainantPhone char(10) ,
      ComplainantEmail varchar(100) ,
      FK_DriverID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Vehicles (
      PK_VehicleID int IDENTITY (1 ,1) ,
      AK_LicencePlate varchar(15) NOT NULL ,
      Brand varchar(60) ,
      Model varchar(60) ,
      Capacity smallint
      DEFAULT 0 ,
      IsActive bit
      DEFAULT 0 ,
      IsBroken bit
      DEFAULT 0 ,
      FK_MunicipalityID int ,
      FK_VehicleTypeID int ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE BusLines (
      PK_BusLineID int IDENTITY (1 ,1) ,
      AK_BusLineCode varchar(6) NOT NULL ,
      Route varchar(60) ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE PassengerVehicles (
      PK_PassengerVehicleID int IDENTITY (1 ,1) ,
      FK_PassengerID int ,
      FK_VehicleID int ,
      Price money
      DEFAULT 0 ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Departures (
      PK_DepartureID int IDENTITY (1 ,1) ,
      Date date ,
      DepartureTime time ,
      FK_VehicleRouteID int ,
      IsDeleted bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Neighbourhoods (
      PK_NeighbourhoodID int IDENTITY (1 ,1) ,
      NeighbourhoodName varchar(100) ,
      FK_CityID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE BusStops (
      PK_BusStopID int IDENTITY (1 ,1) ,
      AK_BusStopCode varchar(6) NOT NULL ,
      BusStopName varchar(60) ,
      FK_NeighbourhoodID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Routes_ (
      PK_RouteID int IDENTITY (1 ,1) ,
      FK_BusStopID int ,
      FK_BusLineID int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE Passengers (
      PK_PassengerID int IDENTITY (1 ,1) ,
      AK_TcNo char(11) NOT NULL ,
      PassengerName varchar(100) ,
      PassengerSurname varchar(100) ,
      CHK_PassengerGender char(1) CHECK (CHK_PassengerGender = 'M'
      OR CHK_PassengerGender = 'W'
      ) ,
      PassengerBirthDate date ,
      PassengerPhotoURL varchar(120) ,
      AK_PassengerHesCode char(10) NOT NULL ,
      FK_CardID_AK int ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );
   CREATE TABLE CardTypes (
      PK_CardTypeID int IDENTITY (1 ,1) ,
      CardType varchar(30) ,
      Discount float
      DEFAULT 0 ,
      IsDelete bit
      DEFAULT 0 ,
      CreatedDatetime datetime
      DEFAULT GETDATE()
   );

   ALTER TABLE Cities ADD CONSTRAINT PK_Cities PRIMARY KEY (PK_CityID)
   ALTER TABLE LoadingStations ADD CONSTRAINT PK_LoadingStations PRIMARY KEY (PK_LoadingStationID)
   ALTER TABLE Municipalities ADD CONSTRAINT PK_Municipalities PRIMARY KEY (PK_MunicipalityID)
   ALTER TABLE VehicleRoutes ADD CONSTRAINT PK_VehicleRoutes PRIMARY KEY (PK_VehicleRouteID)
   ALTER TABLE Cards ADD CONSTRAINT PK_Cards PRIMARY KEY (PK_CardID)
   ALTER TABLE VehicleTypes ADD CONSTRAINT PK_VehicleTypes PRIMARY KEY (PK_VehicleTypeID)
   ALTER TABLE Drivers ADD CONSTRAINT PK_Drivers PRIMARY KEY (PK_DriverID)
   ALTER TABLE DriverVehicleAppointments ADD CONSTRAINT PK_DriverVehicleAppointments PRIMARY KEY (PK_AppointmentID)
   ALTER TABLE Shifts ADD CONSTRAINT PK_Shifts PRIMARY KEY (PK_ShiftID)
   ALTER TABLE ShiftsDrivers ADD CONSTRAINT PK_ShiftsDrivers PRIMARY KEY (PK_DriverShiftID)
   ALTER TABLE CardLoadings ADD CONSTRAINT PK_CardLoadings PRIMARY KEY (PK_CardLoadingID)
   ALTER TABLE DriverContacts ADD CONSTRAINT PK_DriverContacts PRIMARY KEY (PK_DriverContactID)
   ALTER TABLE Complaints ADD CONSTRAINT PK_Complaints PRIMARY KEY (PK_ComplaintID)
   ALTER TABLE Vehicles ADD CONSTRAINT PK_Vehicles PRIMARY KEY (PK_VehicleID)
   ALTER TABLE BusLines ADD CONSTRAINT PK_BusLines PRIMARY KEY (PK_BusLineID)
   ALTER TABLE PassengerVehicles ADD CONSTRAINT PK_PassengerVehicles PRIMARY KEY (PK_PassengerVehicleID)
   ALTER TABLE Departures ADD CONSTRAINT PK_Departures PRIMARY KEY (PK_DepartureID)
   ALTER TABLE Neighbourhoods ADD CONSTRAINT PK_Neighbourhoods PRIMARY KEY (PK_NeighbourhoodID)
   ALTER TABLE BusStops ADD CONSTRAINT PK_BusStops PRIMARY KEY (PK_BusStopID)
   ALTER TABLE Routes_ ADD CONSTRAINT PK_Routes_ PRIMARY KEY (PK_RouteID)
   ALTER TABLE Passengers ADD CONSTRAINT PK_Passengers PRIMARY KEY (PK_PassengerID)
   ALTER TABLE CardTypes ADD CONSTRAINT PK_CardTypes PRIMARY KEY (PK_CardTypeID)


   ALTER TABLE LoadingStations ADD CONSTRAINT FK_LoadingStations_Neighbourhoods FOREIGN KEY (FK_NeighbourhoodID) REFERENCES Neighbourhoods (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Municipalities ADD CONSTRAINT FK_Municipalities_Cities FOREIGN KEY (FK_CityID) REFERENCES Cities (PK_CityID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE VehicleRoutes ADD CONSTRAINT FK_VehicleRoutes_Vehicles FOREIGN KEY (FK_VehicleID) REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE VehicleRoutes ADD CONSTRAINT FK_VehicleRoutes_BusLines FOREIGN KEY (FK_BusLineID) REFERENCES BusLines (PK_BusLineID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Cards ADD CONSTRAINT FK_Cards_CardTypes FOREIGN KEY (FK_CardTypeID) REFERENCES CardTypes (PK_CardTypeID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE DriverVehicleAppointments ADD CONSTRAINT FK_DriverVehicleAppointments_Drivers FOREIGN KEY (FK_DriverID) REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE DriverVehicleAppointments ADD CONSTRAINT FK_DriverVehicleAppointments_Vehicles FOREIGN KEY (FK_VehicleID) REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE ShiftsDrivers ADD CONSTRAINT FK_ShiftsDrivers_Drivers FOREIGN KEY (FK_DriverID) REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE ShiftsDrivers ADD CONSTRAINT FK_ShiftsDrivers_Shifts FOREIGN KEY (FK_ShiftID) REFERENCES Shifts (PK_ShiftID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE CardLoadings ADD CONSTRAINT FK_CardLoadings_Cards FOREIGN KEY (FK_CardID) REFERENCES Cards (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE CardLoadings ADD CONSTRAINT FK_CardLoadings_LoadingStations FOREIGN KEY (FK_LoadingStationID) REFERENCES LoadingStations (PK_LoadingStationID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE DriverContacts ADD CONSTRAINT FK_DriverContacts_Drivers FOREIGN KEY (FK_DriverID_AK) REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Complaints ADD CONSTRAINT FK_Complaints_Drivers FOREIGN KEY (FK_DriverID) REFERENCES Drivers (PK_DriverID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Vehicles ADD CONSTRAINT FK_Vehicles_Municipalities FOREIGN KEY (FK_MunicipalityID) REFERENCES Municipalities (PK_MunicipalityID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Vehicles ADD CONSTRAINT FK_Vehicles_VehicleTypes FOREIGN KEY (FK_VehicleTypeID) REFERENCES VehicleTypes (PK_VehicleTypeID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE PassengerVehicles ADD CONSTRAINT FK_PassengerVehicles_Passengers FOREIGN KEY (FK_PassengerID) REFERENCES Passengers (PK_PassengerID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE PassengerVehicles ADD CONSTRAINT FK_PassengerVehicles_Vehicles FOREIGN KEY (FK_VehicleID) REFERENCES Vehicles (PK_VehicleID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Departures ADD CONSTRAINT FK_Departures_VehicleRoutes FOREIGN KEY (FK_VehicleRouteID) REFERENCES VehicleRoutes (PK_VehicleRouteID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Neighbourhoods ADD CONSTRAINT FK_Neighbourhoods_Cities FOREIGN KEY (FK_CityID) REFERENCES Cities (PK_CityID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE BusStops ADD CONSTRAINT FK_BusStops_Neighbourhoods FOREIGN KEY (FK_NeighbourhoodID) REFERENCES Neighbourhoods (PK_NeighbourhoodID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Routes_ ADD CONSTRAINT FK_Routes__BusStops FOREIGN KEY (FK_BusStopID) REFERENCES BusStops (PK_BusStopID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Routes_ ADD CONSTRAINT FK_Routes__BusLines FOREIGN KEY (FK_BusLineID) REFERENCES BusLines (PK_BusLineID) ON DELETE CASCADE ON UPDATE CASCADE
   ALTER TABLE Passengers ADD CONSTRAINT FK_Passengers_Cards FOREIGN KEY (FK_CardID_AK) REFERENCES Cards (PK_CardID) ON DELETE CASCADE ON UPDATE CASCADE

   ALTER TABLE Drivers ADD CONSTRAINT CHK_DriverGender CHECK (CHK_DriverGender = 'M' OR CHK_DriverGender = 'W');
   ALTER TABLE Shifts ADD CONSTRAINT CHK_ShiftType CHECK (CHK_ShiftType = 'M' OR CHK_ShiftType = 'E' OR CHK_ShiftType = 'N');
   ALTER TABLE Passengers ADD CONSTRAINT CHK_PassengerGender CHECK (CHK_PassengerGender = 'M' OR CHK_PassengerGender = 'W');

END;