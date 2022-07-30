-- ======================================================================
-- create the employees table
-- ======================================================================
create table employees
(
	id         bigserial not null,
	hired_at   timestamp,
	first_name varchar(50),
	last_name  varchar(75),
	primary key (id)
)


-- ======================================================================
-- seed the employees table
-- ======================================================================
insert into employees 
values
(default, current_timestamp, 'Daniel', 'Long'),
(default, current_timestamp, 'Blair', 'Long');
