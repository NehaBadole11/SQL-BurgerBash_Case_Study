Create database burger_bash;
Use burger_bash;

Create Table burger_names
(burger_id int primary key, burger_name varchar(25));

Insert into burger_names values (1, 'meatlovers'), (2, 'vegetarian');

Select * from burger_names;

Create table runner_orders
(
order_id int primary key, 
runner_id int, pickup_time timestamp, 
distance varchar(20), duration varchar(20), 
cancellation varchar(20)
);

Create table burger_runner
(
runner_id int primary key, 
registration_date date
);

Create table customer_orders
(
order_id int, customer_id int, burger_id int, 
exclusions varchar(20), extras varchar(20), 
order_time timestamp
);

Insert into burger_runner values
(1, '2021-01-01'),
(2, '2021-01-02'),
(3, '2021-01-08'),
(4, '2021-01-15');

Select * from burger_runner;

Insert into runner_orders values
(1, 1, '2021-01-01 18:15:00', '20km', '32 minutes', 'null'),
(2, 1, '2021-01-01 19:10:00', '20km', '27 minutes', 'null'),
(3, 1, '2021-01-03 00:12:00', '13.4km', '20 mins', 'null' ),
(4, 2, '2021-01-04 13:53:00', '23.4', '40', 'null'),
(5, 3, '2021-01-08 21:10:00', '10', '15', 'null'),
(6, 3, 'null', 'null', 'null', 'Restaurant Cancellation'),
(7, 2, '2021-01-08 21:30:00', '25km', '25mins', 'null'),
(8, 2, '2021-01-10 00:15:00', '23.4 km', '15 minute', 'null'),
(9, 2, 'null', 'null', 'null', 'Customer Cancellation'),
(10, 1, '2021-01-11 18:50:00', '10km', '10minutes', 'null');

Insert into runner_orders values
(6, 3, null, 'null', 'null', 'Restaurant Cancellation'),
(9, 2, null, 'null', 'null', 'Customer Cancellation');


Insert into customer_orders values
(1, 101, 1, null, null, '2021-01-01 18:05:01'),
(2, 101, 1, null, null, '2021-01-01 19:00:52'),
(3, 102, 1, null, null, '2021-01-02 23:51:23'),
(3, 102, 2, null, null, '2021-01-02 23:51:23'),
(4, 103, 1, '4', null, '2021-01-04 13:23:46'),
(4, 103, 1, '4', null, '2021-01-04 13:23:46'),
(4, 103, 2, '4', null, '2021-01-04 13:23:46'),
(5, 104, 1, null, '1', '2021-01-08 21:00:29'),
(6, 101, 2, null, null, '2021-01-08 23:03:13'),
(7, 105, 2, null, '1', '2021-01-08 21:20:29'),
(8, 102, 1, null, null, '2021-01-09 23:54:33'),
(9, 103, 1, '4', '1,5', '2021-01-10 11:22:59'),
(10, 104, 1, null, null, '2021-01-11 18:34:49'),
(10, 104, 1, '2,6', '1,4', '2021-01-11 18:34:49');

Select * from customer_orders;

Select * from runner_orders;

Select * from burger_runner;

Create table runner_orders
(
order_id int primary key, 
runner_id int, pickup_time timestamp, 
distance varchar(20), duration varchar(20), 
cancellation varchar(50)
);

Insert into runner_orders values
(1, 1, '2021-01-01 18:15:00', '20km', '32 minutes', null),
(2, 1, '2021-01-01 19:10:00', '20km', '27 minutes', null),
(3, 1, '2021-01-03 00:12:00', '13.4km', '20 mins', null),
(4, 2, '2021-01-04 13:53:00', '23.4', '40', null),
(5, 3, '2021-01-08 21:10:00', '10', '15', null),
(6, 3, null, null, null, 'Restaurant Cancellation'),
(7, 2, '2021-01-08 21:30:00', '25km', '25mins', null),
(8, 2, '2021-01-10 00:15:00', '23.4 km', '15 minute', null),
(9, 2, null, null, null, 'Customer Cancellation'),
(10, 1, '2021-01-11 18:50:00', '10km', '10minutes', null);

Select * from runner_orders;
-- How many burgers were ordered?
Select count(burger_id) as total_burgers from customer_orders;

-- How many unique customer orders were made?
Select count(distinct(order_id)) as unique_order from customer_orders;
Select count(distinct order_id) as unique_order from runner_orders;

-- How many successful orders were delivered by each runner?
Select runner_id, count(runner_id)
from runner_orders
where cancellation IS NULL
group by runner_id;

Select runner_id, count(runner_id)
from runner_orders
where cancellation IS NULL
group by runner_id
having count(runner_id)>2;

-- How many of each type of burger was delivered?
Select burger_names.burger_name, count(burger_names.burger_name) as total_burger
from 
burger_names 
inner join 
customer_orders 
on 
burger_names.burger_id = customer_orders.burger_id
inner join 
runner_orders 
on
customer_orders.order_id = runner_orders.order_id
where cancellation is null
group by burger_names.burger_name;

-- How many Vegetarian and Meatlovers were ordered by each customer?
Select burger_names.burger_name, count(burger_names.burger_name) as total_burgers, customer_orders.customer_id
from burger_names inner join customer_orders
on
burger_names.burger_id = customer_orders.burger_id
group by customer_id, burger_name
order by customer_id;


-- What was the average distance travelled for each customer?
Select c.customer_id, round(avg(r.distance),2) as avg_dist_travelled
from customer_orders c
inner join runner_orders r
on c.order_id = r.order_id
where cancellation is NULL
group by customer_id;

select avg(trim(trailing, 'km');

-- What was the maximum number of burgers delivered in a single order?
Select max(total_burgers_delivered) from 
(Select c.order_id, count(c.burger_id) as total_burgers_delivered
from customer_orders c
inner join runner_orders r
on c.order_id = r.order_id
where r.cancellation is null
group by c.order_id) as t;


Select order_id , total_burgers_delivered from 
(Select c.order_id, count(c.burger_id) as total_burgers_delivered
from customer_orders c
inner join runner_orders r
on c.order_id = r.order_id
where r.cancellation is null
group by c.order_id
order by total_burgers_delivered desc limit 1) as t;


Select c.order_id, count(c.burger_id) as total_burgers_delivered
from customer_orders c
inner join runner_orders r
on c.order_id = r.order_id
where r.cancellation is null
group by c.order_id
order by total_burgers_delivered desc limit 1;

-- For each customer, how many delivered burgers had at least 1 change and how many had no changes?
with CTE as
(Select c.customer_id, count(c.exclusions) as excluded, count(c.extras) as added from customer_orders
inner join runner_orders r
on c.order_id = r.order_id
where r.cancellation is NULL
group by c.customer_id), 
no_changes as
(Select count(customer_id) from CTE where excluded = 0 and added = 0),
with_changes as
(select count(customer_id) from CTE where excluded !=0 or added !=0)
Select * from no_changes; 
-- select * from with_changes

-- What was the total volume of burgers ordered for each hour of the day?
Select extract(Hour from order_time) as Hour, count(burger_id) as total_burgers
from customer_orders
group by hour
order by hour;

-- How many runners signed up for each 1 week period?
Select extract(week from registration_date) as runners_signed_up, count(runner_id) as runner_id
from burger_runner
group by runners_signed_up;








