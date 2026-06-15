# Football Ticket Booking System

## Overview

This project is a PostgreSQL database design and SQL query assignment for a Football Ticket Booking System.

The system manages:

* Football fans and ticket managers
* Tournament football matches
* Ticket booking transactions

The project demonstrates database design principles, ERD relationships, constraints, joins, subqueries, aggregations, pattern matching, null handling, and pagination.

---

## Database Schema

### Users

Stores registered users and administrators.

| Column       | Description                    |
| ------------ | ------------------------------ |
| user_id      | Unique user identifier         |
| full_name    | User's full name               |
| email        | User email address             |
| role         | Football Fan or Ticket Manager |
| phone_number | Contact number                 |

---

### Matches

Stores football match information.

| Column              | Description               |
| ------------------- | ------------------------- |
| match_id            | Unique match identifier   |
| fixture             | Competing teams           |
| tournament_category | Competition name          |
| base_ticket_price   | Standard ticket price     |
| match_status        | Match availability status |

---

### Bookings

Stores ticket purchase records.

| Column         | Description               |
| -------------- | ------------------------- |
| booking_id     | Unique booking identifier |
| user_id        | User reference            |
| match_id       | Match reference           |
| seat_number    | Allocated seat            |
| payment_status | Payment state             |
| total_cost     | Final ticket cost         |

---

## Relationships

### One-to-Many

One User can create many Bookings.

```text
Users (1) ----< Bookings (Many)
```

### Many-to-One

Many Bookings can belong to one Match.

```text
Bookings (Many) >---- (1) Matches
```

### Logical One-to-One

Each booking record represents one specific user reserving one specific match seat.

---

## Technologies Used

* PostgreSQL
* Beekeeper Studio
* Draw.io / Lucidchart (ERD)
* GitHub

---

## SQL Concepts Covered

* SELECT
* WHERE
* ORDER BY
* LIMIT
* OFFSET
* LIKE
* ILIKE
* COALESCE
* IS NULL
* INNER JOIN
* LEFT JOIN
* Subqueries
* Aggregate Functions
* AVG()
* Constraints
* PRIMARY KEY
* FOREIGN KEY
* CHECK
* NOT NULL
* UNIQUE

---

## Queries Implemented

### Query 1

Retrieve available Champions League matches.

### Query 2

Search users by name using ILIKE.

### Query 3

Handle missing payment status using COALESCE.

### Query 4

Retrieve booking details with user and match information using INNER JOIN.

### Query 5

Display all users and booking IDs using LEFT JOIN.

### Query 6

Find bookings whose total cost is greater than the average booking cost.

### Query 7

Retrieve top expensive matches using ORDER BY, LIMIT, and OFFSET.

---

## ERD

The ERD includes:

* Primary Keys (PK)
* Foreign Keys (FK)
* One-to-Many Relationships
* Many-to-One Relationships
* Crow's Foot Notation
* Status Fields

---

## Sample Data

The database contains sample records for:

* 4 Users
* 5 Matches
* 5 Bookings

for testing and query execution.

---

## Author

Imran Hossain

Database Design & SQL Assignment

PostgreSQL Essentials
