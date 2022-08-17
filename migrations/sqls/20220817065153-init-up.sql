/* Replace with your SQL commands */

drop table "Users";

create table "Users"
(
    uuid    uuid                     default gen_random_uuid() not null,
    name    varchar                                            not null,
    email   varchar                                            not null,
    created timestamp with time zone default now()             not null,
    updated timestamp with time zone default now()             not null
);

insert into "Users"("name", "email") values ('demo', 'demo@example.com');
