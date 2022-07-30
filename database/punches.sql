-- ======================================================================
-- create the employees table
-- ======================================================================
create table punches 
(
	id bigserial not null,
	employee_id  bigint,
	punch_in     timestamp, 
	punch_out    timestamp,
	primary key (id)
)


-- ======================================================================
-- seed the employees table
-- ======================================================================
insert into punches 
values 
(default, 1, current_timestamp - interval '10 hours', current_timestamp - interval '6 hours'),
(default, 2, current_timestamp - interval '12 hours', current_timestamp - interval '10 hours'),
(default, 1, current_timestamp - interval '5 hours', current_timestamp - interval '1 hours'),
(default, 2, current_timestamp - interval '9 hours', current_timestamp - interval '3 hours')