# Library Management System Project

## Overview

This project is a **Library Management System** built using MySQL. It includes table creation, data loading, and various queries to manage and analyze library operations efficiently.

---

## Files in the Project

1. **`Creating Tables & Loading Data.sql`**  
   - Creates the **Library Management System** database.  
   - Defines the database schema by creating tables:  
     - `books`, `branch`, `employees`, `members`, `issued_status`, and `return_status`.  
   - Loads data into the tables from CSV files.

2. **`Querying Schema.sql`**  
   - Contains various queries for performing and analyzing library operations, including:  
     - **Data Analysis**: Overdue books, branch performance, and active member queries.  
     - **Data Management**: Insert, update, and delete operations.

3. **Data Files (CSV)**  
   - **`books.csv`**: Contains book records.  
   - **`branch.csv`**: Contains branch details.  
   - **`employees.csv`**: Contains employee information.  
   - **`members.csv`**: Contains library member data.  
   - **`issued_status.csv`**: Tracks book issuance.  
   - **`return_status.csv`**: Tracks returned books.

---

## Database Schema

Below is the schema diagram representing the structure of the Library Management System:

![Library Management Schema](Schema.png)

---

## Key Functionalities

- **Manage Books**: Add, update, and retrieve book records.  
- **Track Issued and Returned Books**: Monitor book issuance and returns across branches.  
- **Branch Performance Reports**: Analyze the number of books issued, returned, and total revenue by branch.  
- **Active Member Tracking**: Identify members who borrowed books in the last two months.  
- **Employee Performance**: Find employees who processed the highest number of book issues.  
- **Overdue Books**: Identify members with overdue books beyond the 30-day period.

---

## Tools Used

- **Database**: MySQL  
- **Data Files**: CSV files containing sample library data  

---

## Usage Instructions

1. Run `Creating Tables & Loading Data.sql` to create the database and load data.  
2. Execute `Querying Schema.sql` to perform operations and queries.  

---

## Contact

For any queries or suggestions, feel free to reach out:  
**Bahaa Medhat Wanas**  
- LinkedIn: [Bahaa Wanas](https://www.linkedin.com/in/bahaa-wanas-9797b923a)  
- Email: [bahaawanas427@gmail.com](mailto:bahaawanas427@gmail.com)
