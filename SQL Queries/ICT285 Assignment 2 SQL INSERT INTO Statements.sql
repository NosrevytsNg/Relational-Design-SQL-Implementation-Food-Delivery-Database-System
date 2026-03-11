SELECT * FROM Customer; --DONE--
SELECT * FROM Suburb; --DONE--
SELECT * FROM CustomerOrder; --DONE--
SELECT * FROM Driver; --Done--
SELECT * FROM Restaurant; --DONE--
SELECT * FROM Dish; --DONE--
SELECT * FROM OrderItem; --DONE--
SELECT * FROM Certification; --DONE--
SELECT * FROM RestaurantCertification; --DONE--

INSERT INTO Certification (CertificationID, CertificationName)
VALUES (701, 'Vegan');
INSERT INTO Certification (CertificationID, CertificationName)
VALUES (702, 'Gluten-Free');
INSERT INTO Certification (CertificationID, CertificationName)
VALUES (703, 'Dairy-Free');

INSERT INTO RestaurantCertification (RestaurantID, CertificationID)
VALUES (301, 701);
INSERT INTO RestaurantCertification (RestaurantID, CertificationID)
VALUES (302, 702);
INSERT INTO RestaurantCertification (RestaurantID, CertificationID)
VALUES (303, 702);
INSERT INTO RestaurantCertification (RestaurantID, CertificationID)
VALUES (304, 702);

INSERT INTO CustomerOrder (OrderID, CustomerID, DriverID, OrderDate, RequestedDeliveryDuration, ActualDeliveryDuration, DeliveryAddress, DeliveryStatus)
VALUES (501, 1001, 2001, SYSDATE, INTERVAL '15' MINUTE, INTERVAL '10' MINUTE, 'Bukit Batok Avenue 5 Blk 123', 'Pending');
INSERT INTO CustomerOrder (OrderID, CustomerID, DriverID, OrderDate, RequestedDeliveryDuration, ActualDeliveryDuration, DeliveryAddress, DeliveryStatus)
VALUES (502, 1002, 2002, SYSDATE, INTERVAL '30' MINUTE, INTERVAL '20' MINUTE, 'Bukit Panjang Avenue 9 Blk 333', 'Delivered');
INSERT INTO CustomerOrder (OrderID, CustomerID, DriverID, OrderDate, RequestedDeliveryDuration, ActualDeliveryDuration, DeliveryAddress, DeliveryStatus)
VALUES (503, 1003, 2003, SYSDATE, INTERVAL '30' MINUTE, INTERVAL '35' MINUTE, 'Jurong East Street 44 Blk 44', 'Delivered');
INSERT INTO CustomerOrder (OrderID, CustomerID, DriverID, OrderDate, RequestedDeliveryDuration, ActualDeliveryDuration, DeliveryAddress, DeliveryStatus)
VALUES (504, 1004, 2004, SYSDATE, INTERVAL '60' MINUTE, INTERVAL '35' MINUTE, 'Punggol Drive 5 Blk 951', 'Delivered');

INSERT INTO OrderItem (OrderItemID, OrderID, DishID, Quantity)
VALUES (601, 501, 402, 2);
INSERT INTO OrderItem (OrderItemID, OrderID, DishID, Quantity)
VALUES (602, 502, 403, 1);
INSERT INTO OrderItem (OrderItemID, OrderID, DishID, Quantity)
VALUES (603, 503, 405, 2);
INSERT INTO OrderItem (OrderItemID, OrderID, DishID, Quantity)
VALUES (604, 504, 407, 5);

INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (401, 301, 'Spaghetti Carbonara', 'Creamy pasta with pancetta', 'Boiled', 'Pasta', 'Main', 12.50, 800, 'N', 'Y', 'N', 'Regular', 'Contains dairy');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (402, 301, 'Cheese Pizza', 'Freshly baked pizza', 'Baked', 'Dough', 'Main', 15.00, 1000, 'Y', 'N', 'N', 'Fast', 'Contains high carbohydrates');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (403, 302, 'Wagyu Beef Don', 'A1 Wagyu Beef', 'Steamed', 'Wagyu Beef', 'Main', 18.50, 850, 'N', 'Y', 'N', 'Regular', 'High in protein and carbs');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (404, 302, 'Salmon Sashimi', 'Fresh salmon slices', 'Raw', 'Salmon', 'Starter', 15.00, 300, 'N', 'Y', 'Y', 'Fast', 'Rich in protein and omega-3 fatty acids');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (405, 303, 'Tacos', 'Crispy corn tortillas filled with a variety of fillings', 'Fried', 'Tortillas', 'Sides', 10.50, 750, 'N', 'Y', 'N', 'Regular', 'High in protein and vegetables');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (406, 303, 'Quesadillas', 'Freshly baked corn tortillas filled with cheese and meat', 'Baked', 'Tortilas', 'Main', 16.00, 1200, 'N', 'N', 'N', 'Fast', 'High in protein and vegetables');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (407, 304, 'Xiao Long Bao', 'Juicy meat wrapped in a thin skin', 'Steamed', 'Pork', 'Sides', 6.50, 120, 'N', 'N', 'N', 'Worth the wait', 'Contains protein');
INSERT INTO Dish (DishID, RestaurantID, DishName, DishDescription, Preparation, MainIngredient, CourseType, Price, KiloJoules, Vegetarian, GlutenFree, DairyFree, DeliveryTimeCategory, NutritionalDescription)
VALUES (408, 304, 'Har Gao', 'Steamed prawn dumpling', 'Steamed', 'Prawn', 'Sides', 3.00, 100, 'N', 'N', 'N', 'Fast', 'Low calorie');

INSERT INTO Restaurant (RestaurantID, SuburbID, RestaurantName, Ethnicity, Style, AboutUs, FoodDescription)
VALUES (301, 101, 'Italian Bistro', 'Italian', 'Western', 'A cozy Italian restaurant', 'Traditional Italian dishes');
INSERT INTO Restaurant (RestaurantID, SuburbID, RestaurantName, Ethnicity, Style, AboutUs, FoodDescription)
VALUES (302, 102, 'Yuki Sushi', 'Japanese', 'Asian', 'Fresh sushi and sashimi', 'Wide variety of sushi');
INSERT INTO Restaurant (RestaurantID, SuburbID, RestaurantName, Ethnicity, Style, AboutUs, FoodDescription)
VALUES (303, 103, 'Mexico Iberico', 'Mexican', 'BBQ', 'Bringing Mexico to you', 'Spicy but delicious');
INSERT INTO Restaurant (RestaurantID, SuburbID, RestaurantName, Ethnicity, Style, AboutUs, FoodDescription)
VALUES (304, 104, 'Get Some Dim Sum', 'Chinese', 'Dim Sum', 'Authenic Chinese cuisine', 'Diversity on a table');

INSERT INTO Driver (DriverID, SuburbID, FirstName, LastName, DriverStatus, PhoneNumber)
VALUES (2001, 101, 'Carlos', 'Sainz', 'Available', '98526325');
INSERT INTO Driver (DriverID, SuburbID, FirstName, LastName, DriverStatus, PhoneNumber)
VALUES (2002, 102, 'Ayrton', 'Senna', 'On delivery', '98456215');
INSERT INTO Driver (DriverID, SuburbID, FirstName, LastName, DriverStatus, PhoneNumber)
VALUES (2003, 103, 'Sebastian', 'Vettel', 'On delivery', '98568745');
INSERT INTO Driver (DriverID, SuburbID, FirstName, LastName, DriverStatus, PhoneNumber)
VALUES (2004, 104, 'Daniel', 'Riccardo', 'On delivery', '96328541');

INSERT INTO Suburb (SuburbID, SuburbName) VALUES (101, 'Bukit Batok');
INSERT INTO Suburb (SuburbID, SuburbName) VALUES (102, 'Bukit Panjang');
INSERT INTO Suburb (SuburbID, SuburbName) VALUES (103, 'Jurong');
INSERT INTO Suburb (SuburbID, SuburbName) VALUES (104, 'Punggol');

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, DeliveryAddress, RegistrationDate, SuburbID) 
VALUES (1001,'Charles', 'Leclerc', 'leclerc@gmail.com', '98746521', 'Bukit Batok Avenue 5 Blk 123', SYSDATE, '101');
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, DeliveryAddress, RegistrationDate, SuburbID) 
VALUES (1002,'Fernando', 'Alonso', 'alonso@gmail.com', '98576241', 'Bukit Panjang Avenue 9 Blk 333', SYSDATE, '102');
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, DeliveryAddress, RegistrationDate, SuburbID) 
VALUES (1003,'Lewis', 'Hamilton', 'hamburger@gmail.com', '96857412', 'Jurong East Street 44 Blk 44', SYSDATE, '103');
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, DeliveryAddress, RegistrationDate, SuburbID) 
VALUES (1004,'Oscar', 'Piastri', 'pastry@gmail.com', '96385214', 'Punggol Drive 5 Blk 951', SYSDATE, '104');
