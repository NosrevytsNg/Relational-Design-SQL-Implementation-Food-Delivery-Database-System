View A:

CREATE VIEW ViewA AS
SELECT CustomerOrder.OrderID, 
       CustomerOrder.CustomerID, 
       Customer.FirstName AS CustomerFirstName, 
       Customer.LastName AS CustomerLastName,
       CustomerOrder.DriverID, 
       Driver.FirstName AS DriverFirstName, 
       Driver.LastName AS DriverLastName, 
       CustomerOrder.OrderDate, 
       CustomerOrder.DeliveryAddress, 
       CustomerOrder.DeliveryStatus, 
       OrderItem.DishID, 
       Dish.DishName, 
       Dish.DishDescription, 
       OrderItem.Quantity
FROM CustomerOrder 
JOIN Customer ON CustomerOrder.CustomerID = Customer.CustomerID
JOIN Driver ON CustomerOrder.DriverID = Driver.DriverID
JOIN OrderItem ON CustomerOrder.OrderID = OrderItem.OrderID
JOIN Dish ON OrderItem.DishID = Dish.DishID
WHERE CustomerOrder.CustomerID = 1001;

---------------------------------------------------------------------

View B:

CREATE VIEW ViewB AS
SELECT Dish.DishID, 
       Restaurant.RestaurantID, 
       Suburb.SuburbID, 
       Dish.DishName, 
       Dish.DishDescription, 
       Dish.Price, 
       Dish.DeliveryTimeCategory
FROM Dish
JOIN Restaurant ON Dish.RestaurantID = Restaurant.RestaurantID
JOIN Suburb ON Restaurant.SuburbID = Suburb.SuburbID
WHERE Dish.Vegetarian = 'Y' AND Suburb.SuburbID = 101 AND Dish.DeliveryTimeCategory = 'Fast';

---------------------------------------------------------------------

View C:

CREATE VIEW ViewC AS
SELECT CustomerOrder.OrderID, 
       CustomerOrder.OrderDate, 
       CustomerOrder.CustomerID, 
       Customer.FirstName AS CustomerFirstName, 
       Customer.LastName AS CustomerLastName, 
       OrderItem.DishID, 
       Dish.DishName, 
       Dish.Price, 
       OrderItem.Quantity
FROM CustomerOrder 
JOIN OrderItem ON CustomerOrder.OrderID = OrderItem.OrderID
JOIN Dish ON OrderItem.DishID = Dish.DishID
JOIN Restaurant ON Dish.RestaurantID = Restaurant.RestaurantID
JOIN Customer ON CustomerOrder.CustomerID = Customer.CustomerID
WHERE Restaurant.RestaurantID = 304 AND TO_CHAR(CustomerOrder.OrderDate, 'DD-MON-YY') = '04-NOV-24';

---------------------------------------------------------------------

View D:

CREATE VIEW ViewD AS
SELECT Restaurant.RestaurantID, 
       Restaurant.RestaurantName, 
       Dish.DishName, 
       Dish.DishDescription, 
       Dish.Price
FROM Restaurant 
JOIN Dish ON Restaurant.RestaurantID = Dish.RestaurantID
WHERE Dish.Vegetarian = 'Y';

---------------------------------------------------------------------

View E:

CREATE VIEW ViewE AS
SELECT Driver.DriverID, 
       Driver.FirstName AS DriverFirstName, 
       Driver.LastName AS DriverLastName,
       CustomerOrder.OrderID, 
       CustomerOrder.CustomerID, 
       Customer.FirstName AS CustomerFirstName, 
       Customer.LastName AS CustomerLastName, 
       CustomerOrder.OrderDate
FROM Driver
LEFT JOIN CustomerOrder ON Driver.DriverID = CustomerOrder.DriverID
LEFT JOIN Customer ON CustomerOrder.CustomerID = Customer.CustomerID
WHERE TO_CHAR(CustomerOrder.OrderDate, 'DD-MON-YY') = '04-NOV-24';

---------------------------------------------------------------------

View F:

CREATE VIEW ViewF AS
SELECT Driver.DriverID, 
       Driver.FirstName, 
       Driver.LastName, 
       Driver.PhoneNumber, 
       Driver.DriverStatus, 
       Suburb.SuburbName
FROM Driver
JOIN Suburb ON Driver.SuburbID = Suburb.SuburbID
WHERE Driver.DriverStatus = 'Available' AND Suburb.SuburbID = 101;

---------------------------------------------------------------------

View G:

CREATE VIEW ViewG AS
SELECT Restaurant.RestaurantID, 
       Restaurant.RestaurantName, 
       COUNT(CustomerOrder.OrderID) AS TotalNumberOfOrders
FROM Restaurant
JOIN Dish ON Restaurant.RestaurantID = Dish.RestaurantID
JOIN OrderItem ON Dish.DishID = OrderItem.DishID
JOIN CustomerOrder ON OrderItem.OrderID = CustomerOrder.OrderID
GROUP BY Restaurant.RestaurantID, Restaurant.RestaurantName;

---------------------------------------------------------------------

View H:

CREATE VIEW ViewH AS
SELECT Restaurant.RestaurantName,
       Dish.DishName, 
       Dish.DishDescription, 
       Dish.CourseType, 
       Dish.Price, 
       Dish.DeliveryTimeCategory
FROM Dish 
JOIN Restaurant ON Dish.RestaurantID = Restaurant.RestaurantID
WHERE Restaurant.RestaurantID = 301;

---------------------------------------------------------------------

View I:

CREATE VIEW ViewI AS
SELECT Suburb.SuburbID, 
       Suburb.SuburbName, 
       CustomerOrder.OrderDate,
       SYSDATE AS CurrentDate,
       COUNT(CustomerOrder.OrderID) AS OrderCount
FROM CustomerOrder 
JOIN Customer Customer ON CustomerOrder.CustomerID = Customer.CustomerID
JOIN Suburb ON Customer.SuburbID = Suburb.SuburbID
WHERE CustomerOrder.OrderDate >= TRUNC(ADD_MONTHS(SYSDATE, -1), 'MM') 
  AND CustomerOrder.OrderDate < TRUNC(SYSDATE, 'MM')
GROUP BY Suburb.SuburbID, Suburb.SuburbName, CustomerOrder.OrderDate, SYSDATE

---------------------------------------------------------------------

View J:

CREATE VIEW ViewJ AS
SELECT Suburb.SuburbID, 
       Suburb.SuburbName, 
       TO_CHAR(CustomerOrder.OrderDate, 'Month YYYY') AS Month, 
       COUNT(CustomerOrder.OrderID) AS NumberOfLateOrders,
       AVG(EXTRACT(MINUTE FROM (CustomerOrder.ActualDeliveryDuration - CustomerOrder.RequestedDeliveryDuration))) AS AvgMinutesLate
FROM CustomerOrder
JOIN Customer ON CustomerOrder.CustomerID = Customer.CustomerID
JOIN Suburb ON Customer.SuburbID = Suburb.SuburbID
WHERE CustomerOrder.OrderDate >= TO_DATE('01-NOV-2024', 'DD-MON-YYYY')
  AND CustomerOrder.OrderDate < TO_DATE('01-DEC-2024', 'DD-MON-YYYY')
  AND CustomerOrder.ActualDeliveryDuration > CustomerOrder.RequestedDeliveryDuration
GROUP BY Suburb.SuburbID, Suburb.SuburbName, TO_CHAR(CustomerOrder.OrderDate, 'Month YYYY');

---------------------------------------------------------------------
