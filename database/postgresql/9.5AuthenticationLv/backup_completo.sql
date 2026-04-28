--
-- PostgreSQL database cluster dump
--

\restrict TfqIVJfKdmf0QnkVCXgnFA3B34zCaMFp3lrBMrDF0t1lEIKs1z7w1rChDu9LlXf

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE arquimagic26;
ALTER ROLE arquimagic26 WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:gXCijEkfPkWSs3lFGAYj/Q==$4NIwTd7oO7zl7wJnYNZk0P3fRSSwhKzEdTix2az9fKw=:e0qyCpzLYoFNnmIUsqy7dQ+ZWowCnyt2DafMDxxCYfc=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:2t4Y9+1MlOJuY5oozqNv0Q==$1GUE5IGZoBkIay6Ot1mpj3Hk6St8FdngV0buhZsmmFs=:5MuE2KXmOuq2ueJTw8mb7E4OuE5gFy0dowDOypa/B14=';

--
-- User Configurations
--








\unrestrict TfqIVJfKdmf0QnkVCXgnFA3B34zCaMFp3lrBMrDF0t1lEIKs1z7w1rChDu9LlXf

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

