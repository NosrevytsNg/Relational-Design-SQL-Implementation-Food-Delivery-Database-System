# 🍜 FineFoods4U Food Delivery Database System <br> Relational Database Design | SQL Implementation | Business Analytics

## Project Overview

This repository documents the design and implementation of a relational database system for a fictional food delivery platform called FineFoods4U. <br>
The project demonstrates the complete lifecycle of database engineering, including: <br>

- Entity-Relationship modelling
- Relational schema design
- Database normalization (3NF)
- SQL database implementation
- Analytical SQL queries & views

The database was designed to support both operational and analytical requirements of a food delivery system. <br>

Key objectives include:

- Structuring platform data using a normalized relational schema
- Enforcing referential integrity and domain constraints
- Supporting efficient retrieval of operational data
- Generating business insights through SQL reporting queries

Example analytical requirements include:

- Identifying vegetarian dishes available within a specific preparation time
- Analysing delivery performance
- Tracking driver delivery histories
- Determining restaurant order volumes
- Generating restaurant menu listings

## Database Engineering Workflow
The project followed a structured database development workflow.

```mermaid
flowchart LR

A[Business Requirements Analysis]

A --> B[Conceptual Design<br>Entity Relationship Diagram]

B --> C[Logical Design<br>Relational Schema Development]

C --> D[Normalization]

D --> E[SQL Database Implementation]

E --> F[Analytical SQL Views and Reporting Queries]
```

## Core Database Entities

The database schema consists of several key entities:
| Entity | Description |
| ----- | ----- |
| Customer | Registered users of the platform who place food orders. |
| Restaurant | Food vendors offering dishes available for delivery. |
| Dish | Individual menu items associated with restaurants. |
| Driver | Delivery personnel responsible for transporting orders. |
| CustomerOrder | Orders placed by customers. |
| OrderItem | Individual dishes within an order. |
| Certification | Food safety or quality certifications assigned to restaurants. |
| RestaurantCertification | Linking entity connecting restaurants and certifications. |
| Suburb | Geographical delivery zones used to coordinate orders and drivers. |


## Database Structure
```mermaid
erDiagram

CUSTOMER {
    int CustomerID
    string FirstName
    string LastName
    string Email
    string PhoneNumber
    string Address
    int SuburbID
}

SUBURB {
    int SuburbID
    string SuburbName
}

RESTAURANT {
    int RestaurantID
    string RestaurantName
    string Address
    int SuburbID
}

DISH {
    int DishID
    string DishName
    int PreparationTime
    boolean Vegetarian
    int RestaurantID
}

DRIVER {
    int DriverID
    string DriverStatus
    int SuburbID
}

CUSTOMERORDER {
    int OrderID
    date OrderDate
    int CustomerID
    int DriverID
}

ORDERITEM {
    int OrderItemID
    int OrderID
    int DishID
    int Quantity
}

CERTIFICATION {
    int CertificationID
    string CertificationName
}

RESTAURANTCERTIFICATION {
    int RestaurantID
    int CertificationID
}

CUSTOMER ||--o{ CUSTOMERORDER : places
CUSTOMERORDER ||--o{ ORDERITEM : contains
ORDERITEM }o--|| DISH : includes
DISH }o--|| RESTAURANT : offered_by
CUSTOMERORDER }o--|| DRIVER : delivered_by

RESTAURANT ||--o{ RESTAURANTCERTIFICATION : holds
CERTIFICATION ||--o{ RESTAURANTCERTIFICATION : assigned_to

CUSTOMER }o--|| SUBURB : located_in
RESTAURANT }o--|| SUBURB : located_in
DRIVER }o--|| SUBURB : operates_in

This structure ensures data consistency, scalability, and normalized relationships between entities.
```

## Key Database Concepts Demonstrated
This project covers the full lifecycle of relational database engineering:

### Database Design

- Entity Relationship modelling
- Relational schema development
- Domain and integrity constraints

### Data Integrity

- Primary keys
- Foreign keys
- Referential integrity

### Database Optimization

- Normalization up to Third Normal Form (3NF)

### Query Engineering

- SQL queries
- Aggregation queries
- Business reporting views

## 📊 Analytical SQL Views

Several SQL views were created to support operational insights:<br>

📦 Driver Pickup Information<br>
Orders ready for drivers to collect.<br>

🥗 Vegetarian Dishes Under 30 Minutes<br>
Restaurants offering fast vegetarian meals.<br>

🍽 Restaurant Menu Listings<br>
Menu summaries including preparation times.<br>

🚚 Driver Delivery History<br>
Delivery records for drivers.<br>

📈 Restaurant Order Volume<br>
Total number of orders per restaurant.<br>

⏱ Delivery Performance Metrics<br>
Late delivery analysis and delay averages.<br>

These queries demonstrate how relational databases support business intelligence reporting.<br>

## Technologies Used

### Database Systems

- Oracle SQLPlus

### Query Languages

- SQL
- Relational Algebra

### Database Design Techniques

- ER Modelling
- Relational Schema Design
- Database Normalization










