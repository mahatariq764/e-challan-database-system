# E-Challan Database System

A relational database design and query system for managing traffic violation challans (e-tickets), built as a Semester 3 Database Systems project.

## Overview

This project models a complete e-challan (electronic traffic violation ticket) system, covering vehicle owners, vehicle registration, traffic violations, enforcement cameras, issued challans, payments, and notifications.

## Database Schema

The database (`echallan`) consists of 9 tables:

- **owner** — vehicle owner details (name, address, contact, email)
- **vehicle_type** — vehicle categories (car, bike, etc.)
- **vehicle** — registered vehicles linked to owners and types
- **violation** — traffic violation types and their fine amounts
- **enforcement_camera** — camera locations used to detect violations
- **challan** — issued violation tickets, linking vehicle, violation, and camera
- **payment** — payment records against challans
- **notification** — messages sent to owners (e.g. payment confirmations)
- **violation_history** — historical record of violations per challan
- **admin** — system administrator accounts

Relationships are enforced through foreign keys (e.g. `vehicle.owner_id → owner.owner_id`, `challan.vehicle_id → vehicle.vehicle_id`).

## What's Included

The SQL script (`E-Challan management system.sql`) covers:

- **DDL:** Table creation with primary/foreign key constraints
- **DML:** Sample data insertion across all tables
- **CRUD operations:** `UPDATE`, `ALTER TABLE`, `DELETE`
- **Aggregate functions:** `MAX`, `MIN`, `AVG`, `COUNT`, `SUM` with `GROUP BY`
- **Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and simulated `FULL OUTER JOIN` (via `UNION`)
- **Sorting & filtering:** `ORDER BY`, `WHERE`
- **Nested (subquery) queries:** using `IN`

## How to Run

1. Install MySQL Server (or use a tool like XAMPP/MAMP that bundles it).
2. Open a MySQL client (MySQL Workbench, phpMyAdmin, or the command line).
3. Run the script:
   ```bash
   mysql -u root -p < "E-Challan management system.sql"
   ```
   Or paste its contents directly into your SQL client.
4. The script will create the `echallan` database, populate it with sample data, and run a series of demonstration queries.

## Tech Stack

- MySQL
