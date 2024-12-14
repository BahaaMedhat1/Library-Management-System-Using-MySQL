-- 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
use library_manage;

select * from books;

insert into books
values( '978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');



-- 2. Update an Existing Member's Address
UPDATE member
SET member_address = '125 Oak St'
WHERE member_id = 'C103';



-- 3. Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
DELETE from issued_status
where issued_id = "IS121";


-- 4. Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select
	*
from
	issued_status
where
	issued_emp_id = "E101";


-- 5. List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
select
	issued_member_id,
    count(issued_member_id) as num_memb
from
	issued_status
group by 
	issued_member_id
having
	count(issued_member_id) > 1
order by 2 desc;

-- 6. Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
create table book_issue_count as
select 
	b.isbn,
    b.book_title,
    count(iss.issued_id) as num_issue
from
	books as b
inner join
	issued_status as iss
on
	b.isbn = iss.issued_book_isbn
group by 
	b.isbn,
    b.book_title;




-- 7. Retrieve All Books in a Classic Category:
select * from books where category = "Classic";



--  8: Find Total Rental Income by Category:
select 
	category,
    round(sum(rental_price))as total_rental_price
from
	books
group by
	category;


-- 9. List Members Who Registered in the Last 180 Days:
show tables from library_manage;

select
	*
from
	member
where
	reg_date >= date_sub('2024-06-01', interval 180 day);



-- 10. List Employees with Their Branch Manager's Name and their branch details:
select 	
	e.emp_id,
	e.emp_name,
    b.*,
    e2. emp_name as manager_name
from
	employees as e
left join
	branch as b
on
	b.branch_id = e.branch_id
left join
	employees as e2
on
	e2.emp_id = b.manager_id;



-- 11. Create a Table of Books with Rental Price Above a Certain Threshold:
CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;


-- 12. Retrieve the List of Books Not Yet Returned
SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;


-- Advanced SQL Operations

/*Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.*/

select 
	ist.issued_id,
    ist.issued_member_id,
    ist.issued_book_name,
    ist.issued_date,
    mem.member_id,
    mem.member_name,
    bk.isbn,
    bk.book_title,
    rst.*
from
	issued_status as ist
left join
	member as mem
on
	mem.member_id = ist.issued_member_id
left join
	books as bk
on
	ist.issued_book_isbn = bk.isbn
join
	return_status as rst
on
	ist.issued_id = rst.issued_id
where
		datediff("2025-08-25", issued_date) > 30;
	


/*Task 14: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.*/

CREATE VIEW Performacne_report as (
select
	bch.branch_id,
    bch.manager_id,
    count(ist.issued_id) as num_issued_book,
	count(rst.return_id) as num_returned_book,
    sum(bk.rental_price) as total_revenue
from
	branch as bch
left join
	employees as emp
on
	emp.branch_id = bch.branch_id
left join
	issued_status as ist
on
	ist.issued_emp_id = emp.emp_id
left join
	books as bk
on
	ist.issued_book_isbn = bk.isbn
left join
	return_status as rst
on
	ist.issued_id = rst.issued_id
group by	
	branch_id, manager_id);

select * from Performacne_report;
    


/*Task 15: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.*/

create table active_members as 
select  distinct
	mem.member_id
   
from
	member as mem
inner join
	issued_status as ist
on
	ist.issued_member_id = mem.member_id
where
	ist.issued_date >=  date_sub("2024-05-10", interval 2 month)
order by 1;



/*Task 16: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.*/
with emp_issued_books as (
select 
	emp.emp_id,
    emp.branch_id,
    count(ist.issued_id) as num_issued_books
from
	employees as emp
left join
	issued_status as ist
on
	ist.issued_emp_id = emp.emp_id
group by	
	emp.emp_id,
    emp.branch_id)
select
	*
from
	emp_issued_books  as emp_books
left join
	branch as bch
on
	bch.branch_id = emp_books.branch_id
order by
	num_issued_books desc
limit 3
	























































































































































