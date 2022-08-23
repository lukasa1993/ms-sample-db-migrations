/* Replace with your SQL commands */

CREATE
EXTENSION IF NOT EXISTS pgcrypto;

drop table IF EXISTS "Users";
drop table IF EXISTS "Company";

create table "Company"
(
    uuid    uuid                     default gen_random_uuid() not null,
    name    varchar                                            not null,
    email   varchar                                            not null,
    meta    jsonb                    default '{}'              not null,
    created timestamp with time zone default now()             not null,
    updated timestamp with time zone default now()             not null
);

create table "Users"
(
    uuid         uuid                     default gen_random_uuid() not null,
    company_uuid uuid                                               not null,
    name         varchar                                            not null,
    email        varchar                                            not null,
    code         varchar null,
    type         varchar                  default 'user'            not null,
    meta         jsonb                    default '{}'              not null,
    created      timestamp with time zone default now()             not null,
    updated      timestamp with time zone default now()             not null
);

insert into "Company"("name", "email")
values ('LLC Demo', 'support@example.com');

insert into "Users"("company_uuid", "name", "email", "code")
select uuid as "company_uuid", 'demo' as "name", 'demo@example.com' as "email", '1234567890' as "code"
from "Company"
where email = 'support@example.com';

insert into "Users"("company_uuid", "name", "email", "type")
select uuid as "company_uuid", 'admin' as "name", 'admin@example.com' as "email", 'admin' as "type"
from "Company"
where email = 'support@example.com';
