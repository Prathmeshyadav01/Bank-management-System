create database banking_system;

use banking_system;

create table users(name varchar(20),
    acct_number char(10),
    dob date, city varchar(30),
    password varchar(255) not null,
    initial_balance decimal(10, 2) not null,
     contact_number CHAR(10) not null,
     email_id varchar(30),address varchar(80),
    CONSTRAINT chk_contact_number check
    (contact_number REGEXP '^[0-9]{10}$'),
    constraint chk_initial_balance check
    (initial_balance >= 2000),
    constraint chk_password check (
	length(password) >= 8 and
	password REGEXP '.*[A-Z].*' and
	password REGEXP '.*[a-z].*' and
	password REGEXP '.*[0-9].*' and
	password REGEXP '.*[!@#$%^&*(),.?":{}|<>].*'
    ),
    constraint acct_phone_number check
    (acct_number REGEXP '^[0-9]+$'and
    length(acct_number) = 10)
    );
    
    
    desc users;
    
create table login (
    login_id int auto_increment primary key,
    acct_number char(10) not null,
    email_id varchar(50) not null unique,
    password varchar(255) not null,
    last_login datetime default null,
    failed_attempts int default 0,
    is_locked boolean default false,
    created_at datetime default current_timestamp,
    constraint fk_acct_number foreign key 
    (acct_number) references users(acct_number)
);

alter table users add primary key (acct_number);

desc login;