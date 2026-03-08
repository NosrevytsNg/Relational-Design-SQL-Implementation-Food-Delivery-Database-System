# Relational Design & SQL Implementation: <br> Food Delivery Database System (FineFoods4U) <br> (ICT285-Databases)

## Project Overview

This repository documents the design and implementation of a relational database system developed for a fictional food delivery platform called FineFoods4U. <br>
The project demonstrates the complete lifecycle of database engineering, including: <br>

- Conceptual data modelling
- Relational schema design
- Normalization
- SQL database implementation
- Analytical query development

The system models the core operations of a food delivery platform, including: <br>

- Customers placing orders
- Restaurants offering dishes
- Drivers delivering food
- Restaurants holding food certifications
- Orders consisting of multiple dishes

The repository focuses on database architecture and query engineering, rather than application development.

## System Objectives

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

## System Architecture

The system is structured around several core operational entities.

erDiagram

CUSTOMER ||--o{ CUSTOMERORDER : places
CUSTOMERORDER ||--o{ ORDERITEM : contains
ORDERITEM }o--|| DISH : references
DISH }o--|| RESTAURANT : offered_by
CUSTOMERORDER }o--|| DRIVER : delivered_by
RESTAURANT ||--o{ RESTAURANTCERTIFICATION : holds
CERTIFICATION ||--o{ RESTAURANTCERTIFICATION : assigned_to
CUSTOMER }o--|| SUBURB : located_in
RESTAURANT }o--|| SUBURB : located_in
DRIVER }o--|| SUBURB : operates_in

This architecture ensures that relationships between customers, orders, restaurants, and drivers are clearly represented while maintaining database normalization.

## Database Engineering Workflow
The project followed a structured database development workflow.

```mermaid
flowchart LR

A[Business Requirements Analysis]

A --> B[Conceptual Design<br>Entity Relationship Diagram]

B --> C[Logical Design<br>Relational Schema Development]

C --> D[Normalization<br>Elimination of Data Redundancy]

D --> E[SQL Database Implementation]

E --> F[Analytical SQL Views and Reporting Queries]
```

## Core Database Entities

The database schema consists of several key entities:
| 0000 | 0000 |
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
















