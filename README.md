# 🍜 FineFoods4U Food Delivery Database System <br> Relational Database Design | SQL Implementation

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
flowchart LR

Customer[Customer]
Order[Customer Order]

%% Upper section (Driver chain)
subgraph Delivery Progress
direction LR
Driver[Driver]
Delivery[Delivery]
Delivery --> Driver
end

%% Lower section (Food chain)
subgraph Food_System
direction LR
OrderItem[Order Item]
Dish[Dish]
Restaurant[Restaurant]
Certification[Certification]
RestaurantCertification[Restaurant Certification]

OrderItem --> Dish
Dish --> Restaurant
Restaurant --> RestaurantCertification
RestaurantCertification --> Certification
end

Customer --> Order
Order --> OrderItem
Order --> Restaurant
Order --> Delivery
```


This structure ensures data consistency, scalability, and normalized relationships between entities.


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










