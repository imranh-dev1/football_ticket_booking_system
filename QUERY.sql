-- CREATE DATABASE

create database football_ticket_booking_system;


-- USERS TABLE

create table users (
    user_id int primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    role varchar(20) not null,
    phone_number varchar(20),

    check (role in ('Football Fan', 'Ticket Manager'))
);



-- MATCHES TABLE

create table matches (
    match_id int primary key,
    fixture varchar(150) not null,
    tournament_category varchar(100) not null,
    base_ticket_price decimal(10,2) not null,

    match_status varchar(20) not null,

    check (base_ticket_price >= 0),

    check (
        match_status in (
            'Available',
            'Selling Fast',
            'Sold Out',
            'Postponed'
        )
    )
);


-- BOOKINGS TABLE

create table bookings (
    booking_id int primary key,
    user_id int not null,
    match_id int not null,
    seat_number varchar(20),
    payment_status varchar(20),
    total_cost decimal(10,2) not null,

    foreign key (user_id)
        references users(user_id),

    foreign key (match_id)
        references matches(match_id),

    check (total_cost >= 0),

    check (
        payment_status in (
            'Pending',
            'Confirmed',
            'Cancelled',
            'Refunded'
        ) 
    )
);


-- USERS DATA INSERT

insert into users (
    user_id, 
    full_name, 
    email, 
    role, 
    phone_number
) 
values
  
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);


-- MATCHES DATA INSERT

insert into matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
)
values
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');


-- BOOKINGS DATA INSERT

insert into bookings (
    booking_id,
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
)
values
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);



-- QUERY -- 01

select
    match_id,
    fixture,
    round(base_ticket_price)
from matches
where tournament_category = 'Champions League'
and match_status = 'Available';



-- QUERY -- 02

select
    user_id,
    full_name,
    email
from users
where full_name ilike 'Tanvir%'
or full_name ilike '%Haque%';



-- QUERY -- 03

select
    booking_id,
    user_id,
    match_id,
    coalesce(payment_status, 'Action Required')
        as systematic_status
from bookings
where payment_status is null;


-- QUERY -- 04

select
    b.booking_id,
    u.full_name,
    m.fixture,
    round(b.total_cost) as total_cost
from bookings b
inner join users u
on b.user_id = u.user_id
inner join matches m
on b.match_id = m.match_id;


-- QUERY -- 05

select
    u.user_id,
    u.full_name,
    b.booking_id
from users u
left join bookings b
on u.user_id = b.user_id;