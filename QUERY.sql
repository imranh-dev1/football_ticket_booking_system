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