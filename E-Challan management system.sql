create database echallan;
use echallan;
-- creating tables
create table owner (
    owner_id int auto_increment primary key,
    owner_name varchar(50) not null,
    owner_address varchar(100),
    contact int,
    email varchar(100)
);
create table vehicle_type (
    type_id int auto_increment primary key,
    type_name varchar(50) not null,
    description varchar(100)
);
create table vehicle (
    vehicle_id int auto_increment primary key,
    registration_number varchar(50) not null,
    owner_id int,
    type_id int,
    foreign key (owner_id) references owner(owner_id),
    foreign key (type_id) references vehicle_type(type_id)
);
create table violation (
    violation_id int auto_increment primary key,
    violation_type varchar(50),
    fine_amount int
);
create table enforcement_camera (
    camera_id int auto_increment primary key,
    camera_location varchar(100),
    installation_date date
);
create table challan (
    challan_id int auto_increment primary key,
    issue_date date,
    vehicle_id int,
    violation_id int,
    camera_id int,
    foreign key (vehicle_id) references vehicle(vehicle_id),
    foreign key (violation_id) references violation(violation_id),
    foreign key (camera_id) references enforcement_camera(camera_id)
);
create table payment (
    payment_id int auto_increment primary key,
    payment_date date,
    amount_paid int,
    challan_id int,
    foreign key (challan_id) references challan(challan_id)
);
create table notification (
    notification_id int auto_increment primary key,
    send_date date,
    message varchar(100),
    owner_id int,
    foreign key (owner_id) references owner(owner_id)
);
create table violation_history (
    history_id int auto_increment primary key,
    violation_date date,
    challan_id int,
    foreign key (challan_id) references challan(challan_id)
);
create table admin (
    admin_id int auto_increment primary key,
    name varchar(100),
    username varchar(50),
    password varchar(100),
    contact int
);

-- inserting data into the tables
insert into owner (owner_name, owner_address, contact, email)
values
('maha Tariq', 'Lahore', '032821456', 'mahatariq@gmail.com'),
('sajila Butt', 'Karachi', '0345654367', 'sajilabutt@gmail.com');
insert into vehicle_type (type_name, description)
values
('Car', 'civic '),
('Bike', 'motorcycle');
insert into vehicle (registration_number, owner_id, type_id)
values
('ajb-3456', 1, 1),
('isa-2345', 2, 2);
insert into violation (violation_type, fine_amount)
values
('over Speeding', 1000),
('No helmet', 500);
insert into enforcement_camera (camera_location, installation_date)
values
('Bahria Town Lahore', '2025-05-20'),
('Karachi', '2025-12-04');
insert into challan (issue_date, vehicle_id, violation_id, camera_id)
values
('2025-05-20', 1, 1, 1),
('2025-12-04', 2, 2, 2);
insert into payment (payment_date, amount_paid, challan_id)
values
('2025-05-21', 1000, 1),
('2025-12-05', 500, 2);
insert into notification (send_date, message, owner_id)
values
('2025-05-21', 'challan paid successfully', 1),
('2025-12-05', 'challan paid successfully', 2);
insert into violation_history (violation_date, challan_id)
values
('2025-05-20', 1),
('2025-12-04', 2);
insert into admin (name, username, password, contact)
values 
('admin', 'system admin', '12345678', '0302-456785');

-- basic select queries
select * from owner;
select * from vehicle_type;
select * from vehicle;
select * from violation;
select * from enforcement_camera;
select * from challan;
select * from payment;
select * from notification;
select * from violation_history;
select * from admin;

-- update 
update owner
set owner_address = 'Islamabad'
where owner_id = 1;

-- alter
alter table owner
modify email varchar(150);

-- delete 
delete from owner
where owner_id = 2;

-- aggregate functions
select max(fine_amount) as max_fine
from violation;
select min(fine_amount) as minimum_fine
from violation;

-- group by used with aggregate function
select violation_type, avg(fine_amount) as average_fine
from violation 
group by violation_type;
select vehicle_id, count(challan_id) as total_challans 
from challan
group by vehicle_id;
select challan_id, sum(amount_paid) as total_paid
from payment
group by challan_id;

-- joins
select v.registration_number, o.owner_name 
from vehicle v 
join owner o on v.owner_id = o.owner_id;

-- left join
select v.registration_number, o.owner_name
from vehicle v
left join owner o on v.owner_id = o.owner_id;

-- right join
select c.challan_id, p.amount_paid
from challan c
right join payment p on c.challan_id = p.challan_id;

-- outer join
select v.registration_number, o.owner_name
from vehicle v
left join owner o on v.owner_id = o.owner_id
union
select v.registration_number, o.owner_name
from vehicle v
right join owner o on v.owner_id = o.owner_id;

-- inner join
select v.registration_number, o.owner_name
from vehicle v
inner join owner o on v.owner_id = o.owner_id;

-- order by
select owner_name, owner_address
from owner
order by owner_name asc;
select issue_date, challan_id
from challan
order by issue_date desc;

-- where
select * from violation
where fine_amount > 500;

-- nested query 
select owner_name
from owner
where owner_id in (
    select owner_id
    from vehicle
);