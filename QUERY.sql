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