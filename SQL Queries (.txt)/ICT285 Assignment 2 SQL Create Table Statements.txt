CREATE TABLE Suburb (
    SuburbID INT PRIMARY KEY,
    SuburbName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    DeliveryAddress VARCHAR(200) NOT NULL,
    RegistrationDate DATE DEFAULT CURRENT_DATE NOT NULL,
    SuburbID INT,
    FOREIGN KEY (SuburbID) REFERENCES Suburb(SuburbID) ON DELETE SET NULL
);

CREATE TABLE CustomerOrder (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    DriverID INT,
    OrderDate DATE DEFAULT CURRENT_DATE NOT NULL,
    RequestedDeliveryDuration INTERVAL DAY TO SECOND DEFAULT INTERVAL '0 00:10:00' DAY TO SECOND NOT NULL,
    ActualDeliveryDuration INTERVAL DAY TO SECOND,
    DeliveryAddress VARCHAR(200) NOT NULL,
    DeliveryStatus VARCHAR(20) DEFAULT 'Out for Delivery' NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID) ON DELETE SET NULL
);


CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    SuburbID INT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DriverStatus VARCHAR(20) DEFAULT 'Available' NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    FOREIGN KEY (SuburbID) REFERENCES Suburb(SuburbID) ON DELETE SET NULL
);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    SuburbID INT,
    RestaurantName VARCHAR(100) UNIQUE NOT NULL,
    Ethnicity VARCHAR(50) NOT NULL,
    Style VARCHAR(50) NOT NULL,
    AboutUs VARCHAR(500),
    FoodDescription VARCHAR(500),
    FOREIGN KEY (SuburbID) REFERENCES Suburb(SuburbID) ON DELETE SET NULL
);

CREATE TABLE Dish (
    DishID INT PRIMARY KEY,
    RestaurantID INT NOT NULL,
    DishName VARCHAR(100) NOT NULL,
    DishDescription VARCHAR(500) NOT NULL,
    Preparation VARCHAR(50) NOT NULL,
    MainIngredient VARCHAR(50) NOT NULL,
    CourseType VARCHAR(50) NOT NULL,
    Price DECIMAL(5, 2) NOT NULL,
    KiloJoules INT NOT NULL,
    Vegetarian CHAR(1) CHECK (Vegetarian IN ('Y', 'N')) NOT NULL,
    GlutenFree CHAR(1) CHECK (GlutenFree IN ('Y', 'N')) NOT NULL,
    DairyFree CHAR(1) CHECK (DairyFree IN ('Y', 'N')) NOT NULL,
    DeliveryTimeCategory VARCHAR(20) NOT NULL,
    NutritionalDescription VARCHAR(200) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID) ON DELETE CASCADE
);


CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    DishID INT NOT NULL,
    Quantity INT DEFAULT 1 NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES CustomerOrder(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (DishID) REFERENCES Dish(DishID) ON DELETE SET NULL
);

CREATE TABLE Certification (
    CertificationID INT PRIMARY KEY,
    CertificationName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE RestaurantCertification (
    RestaurantID INT NOT NULL,
    CertificationID INT NOT NULL,
    PRIMARY KEY (RestaurantID, CertificationID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID) ON DELETE CASCADE,
    FOREIGN KEY (CertificationID) REFERENCES Certification(CertificationID) ON DELETE CASCADE
);