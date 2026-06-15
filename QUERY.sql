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

