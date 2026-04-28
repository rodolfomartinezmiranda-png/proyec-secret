--
-- PostgreSQL database cluster dump
--

\restrict 71JtXpUWtCegXGxESob4TS4EWre5bfNKYzRmxLWwalPe0tyAN5x8nfMAd6kykMX

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








\unrestrict 71JtXpUWtCegXGxESob4TS4EWre5bfNKYzRmxLWwalPe0tyAN5x8nfMAd6kykMX

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict IVcqfSZxqGbr8g3adbALApiqgdU4thjblhnbPGB8baFaD0fm8bgZN0wqgdWBZ2I

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict IVcqfSZxqGbr8g3adbALApiqgdU4thjblhnbPGB8baFaD0fm8bgZN0wqgdWBZ2I

--
-- Database "mi_app" dump
--

--
-- PostgreSQL database dump
--

\restrict XbhTC1PPRGwdpvXaQHco6NqfZYKHPwOyb36W1HvW10WhBM1PbIlgPm6fxEnhhdn

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mi_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mi_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE mi_app OWNER TO postgres;

\unrestrict XbhTC1PPRGwdpvXaQHco6NqfZYKHPwOyb36W1HvW10WhBM1PbIlgPm6fxEnhhdn
\connect mi_app
\restrict XbhTC1PPRGwdpvXaQHco6NqfZYKHPwOyb36W1HvW10WhBM1PbIlgPm6fxEnhhdn

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict XbhTC1PPRGwdpvXaQHco6NqfZYKHPwOyb36W1HvW10WhBM1PbIlgPm6fxEnhhdn

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict SH4TwYuDOBClE0jysrM6EM5jk6YbQ0CSZsTvi8IWQPk7bQOZAMiPkNhwGi14GsV

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase (
    id integer NOT NULL,
    title character varying(45)
);


ALTER TABLE public.clase OWNER TO postgres;

--
-- Name: clase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clase_id_seq OWNER TO postgres;

--
-- Name: clase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clase_id_seq OWNED BY public.clase.id;


--
-- Name: contact_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_detail (
    id integer NOT NULL,
    tel character varying(20),
    address text,
    student_id integer
);


ALTER TABLE public.contact_detail OWNER TO postgres;

--
-- Name: contact_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_detail_id_seq OWNER TO postgres;

--
-- Name: contact_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_detail_id_seq OWNED BY public.contact_detail.id;


--
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    student_id integer NOT NULL,
    class_id integer NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- Name: homework_submission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homework_submission (
    id integer NOT NULL,
    student_id integer,
    submission_date date
);


ALTER TABLE public.homework_submission OWNER TO postgres;

--
-- Name: homework_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homework_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.homework_submission_id_seq OWNER TO postgres;

--
-- Name: homework_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homework_submission_id_seq OWNED BY public.homework_submission.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: clase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase ALTER COLUMN id SET DEFAULT nextval('public.clase_id_seq'::regclass);


--
-- Name: contact_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_detail ALTER COLUMN id SET DEFAULT nextval('public.contact_detail_id_seq'::regclass);


--
-- Name: homework_submission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_submission ALTER COLUMN id SET DEFAULT nextval('public.homework_submission_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Data for Name: clase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clase (id, title) FROM stdin;
\.


--
-- Data for Name: contact_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_detail (id, tel, address, student_id) FROM stdin;
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (student_id, class_id) FROM stdin;
\.


--
-- Data for Name: homework_submission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homework_submission (id, student_id, submission_date) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, first_name, last_name) FROM stdin;
\.


--
-- Name: clase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clase_id_seq', 1, false);


--
-- Name: contact_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_detail_id_seq', 1, false);


--
-- Name: homework_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homework_submission_id_seq', 1, false);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 1, false);


--
-- Name: clase clase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id);


--
-- Name: contact_detail contact_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_detail
    ADD CONSTRAINT contact_detail_pkey PRIMARY KEY (id);


--
-- Name: contact_detail contact_detail_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_detail
    ADD CONSTRAINT contact_detail_student_id_key UNIQUE (student_id);


--
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (student_id, class_id);


--
-- Name: homework_submission homework_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_submission
    ADD CONSTRAINT homework_submission_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: contact_detail contact_detail_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_detail
    ADD CONSTRAINT contact_detail_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: enrollment enrollment_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.clase(id);


--
-- Name: enrollment enrollment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: homework_submission homework_submission_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework_submission
    ADD CONSTRAINT homework_submission_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- PostgreSQL database dump complete
--

\unrestrict SH4TwYuDOBClE0jysrM6EM5jk6YbQ0CSZsTvi8IWQPk7bQOZAMiPkNhwGi14GsV

--
-- Database "secrets" dump
--

--
-- PostgreSQL database dump
--

\restrict dSnZ3ZoBacIokaPnnaYUmCA2nEr8NDhPBe9e5ID09CEyhKQEcXVf6GKRGLILTwl

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: secrets; Type: DATABASE; Schema: -; Owner: arquimagic26
--

CREATE DATABASE secrets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE secrets OWNER TO arquimagic26;

\unrestrict dSnZ3ZoBacIokaPnnaYUmCA2nEr8NDhPBe9e5ID09CEyhKQEcXVf6GKRGLILTwl
\connect secrets
\restrict dSnZ3ZoBacIokaPnnaYUmCA2nEr8NDhPBe9e5ID09CEyhKQEcXVf6GKRGLILTwl

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: arquimagic26
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100),
    google_id text,
    secret text
);


ALTER TABLE public.users OWNER TO arquimagic26;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: arquimagic26
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO arquimagic26;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arquimagic26
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: arquimagic26
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: arquimagic26
--

COPY public.users (id, email, password, google_id, secret) FROM stdin;
1	prueba@prueba.co	198726	\N	\N
2	Angela@prueba.co	123456	\N	\N
3	rodomar_1987@hotmail.com	1234	\N	\N
4	prueba@angelina.co	djdjfid272	\N	\N
5	cacorrin@hotmail.com	$2b$10$lQLd1MmUSwcfEIXLZAYaaucpesqGN3L/l/Umzou4wSsz/WReeaXp6	\N	\N
6	zorrilla@hotmail.com	$2b$10$9C3cPAtCZlNxrpZDbvrrgusyAjgMIowUhcDQN5dZguGxH1tdxi9uW	\N	\N
7	ferrari@angelin.co	$2b$10$C3sp7w.AvxohJmyrz8E03Oa9Ix8YKWVBtinERe8Y6VdplhtzBGBtu	\N	\N
8	patadegallo@hotmail.com	$2b$10$bLGBYyKEy.An4K8auex3UeSEv22oPFa2EAYltWrE3Cxaau/pzGwcO	\N	\N
9	patadegrillo@gmail.com	$2b$10$g1TjeApA7LkS/b/tgSPI9u/AO/gr0gH1AETRbvwLw3TtuKZoVP1Fu	\N	\N
10	rodolfomartinezmiranda@gmail.com	$2b$10$WOCbxZq6ijMEQjCw8HXISOE1Q8PfdlRNDdBFL2XFdSc80zkYmpmsO	\N	\N
11	rmartinezmiranda@mail.uniatlantico.edu.co	google	\N	\N
12	asdadsad@prueba.cos	$2b$10$6t5ttxZYar5r7y4RuWaYyOIsepfnq4hfcT.88T2rcJ/hUpgJtry1u	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arquimagic26
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: arquimagic26
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: arquimagic26
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict dSnZ3ZoBacIokaPnnaYUmCA2nEr8NDhPBe9e5ID09CEyhKQEcXVf6GKRGLILTwl

--
-- Database "world" dump
--

--
-- PostgreSQL database dump
--

\restrict vTdc6cyprtkTutmET7vJ3hCH3vtIsxN6JF3VLDddAeFaXq0HTx9mvVJIZdevfYN

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: world; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE world WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE world OWNER TO postgres;

\unrestrict vTdc6cyprtkTutmET7vJ3hCH3vtIsxN6JF3VLDddAeFaXq0HTx9mvVJIZdevfYN
\connect world
\restrict vTdc6cyprtkTutmET7vJ3hCH3vtIsxN6JF3VLDddAeFaXq0HTx9mvVJIZdevfYN

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: capitals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capitals (
    id integer NOT NULL,
    country character varying(100),
    capital character varying(100)
);


ALTER TABLE public.capitals OWNER TO postgres;

--
-- Name: capitals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capitals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.capitals_id_seq OWNER TO postgres;

--
-- Name: capitals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capitals_id_seq OWNED BY public.capitals.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    country_name character varying(100),
    country_code character(2)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flags (
    id integer NOT NULL,
    name text,
    flag text,
    a3 text,
    url text
);


ALTER TABLE public.flags OWNER TO postgres;

--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flags_id_seq OWNER TO postgres;

--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flags_id_seq OWNED BY public.flags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(15) NOT NULL,
    color character varying(15)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visited_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visited_countries (
    id integer NOT NULL,
    country_code character(2) NOT NULL,
    user_id integer
);


ALTER TABLE public.visited_countries OWNER TO postgres;

--
-- Name: visited_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visited_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visited_countries_id_seq OWNER TO postgres;

--
-- Name: visited_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visited_countries_id_seq OWNED BY public.visited_countries.id;


--
-- Name: world_food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.world_food (
    country character varying(100),
    rice double precision,
    wheat double precision
);


ALTER TABLE public.world_food OWNER TO postgres;

--
-- Name: capitals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitals ALTER COLUMN id SET DEFAULT nextval('public.capitals_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: flags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags ALTER COLUMN id SET DEFAULT nextval('public.flags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visited_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visited_countries ALTER COLUMN id SET DEFAULT nextval('public.visited_countries_id_seq'::regclass);


--
-- Data for Name: capitals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capitals (id, country, capital) FROM stdin;
1	Afghanistan	Kabul
2	Aland Islands	Mariehamn
3	Albania	Tirana
4	Algeria	Algiers
5	American Samoa	Pago Pago
6	Andorra	Andorra la Vella
7	Angola	Luanda
8	Anguilla	The Valley
9	Antarctica	\N
10	Antigua And Barbuda	St. John's
11	Argentina	Buenos Aires
12	Armenia	Yerevan
13	Aruba	Oranjestad
14	Australia	Canberra
15	Austria	Vienna
16	Azerbaijan	Baku
18	Bahrain	Manama
19	Bangladesh	Dhaka
20	Barbados	Bridgetown
21	Belarus	Minsk
22	Belgium	Brussels
23	Belize	Belmopan
24	Benin	Porto-Novo
25	Bermuda	Hamilton
26	Bhutan	Thimphu
27	Bolivia	Sucre
155	Bonaire, Sint Eustatius and Saba	Kralendijk
28	Bosnia and Herzegovina	Sarajevo
29	Botswana	Gaborone
30	Bouvet Island	\N
31	Brazil	Brasilia
32	British Indian Ocean Territory	Diego Garcia
33	Brunei	Bandar Seri Begawan
34	Bulgaria	Sofia
35	Burkina Faso	Ouagadougou
36	Burundi	Bujumbura
37	Cambodia	Phnom Penh
38	Cameroon	Yaounde
39	Canada	Ottawa
40	Cape Verde	Praia
41	Cayman Islands	George Town
42	Central African Republic	Bangui
43	Chad	N'Djamena
44	Chile	Santiago
45	China	Beijing
46	Christmas Island	Flying Fish Cove
47	Cocos (Keeling) Islands	West Island
48	Colombia	Bogotá
49	Comoros	Moroni
50	Congo	Brazzaville
52	Cook Islands	Avarua
53	Costa Rica	San Jose
54	Cote D'Ivoire (Ivory Coast)	Yamoussoukro
55	Croatia	Zagreb
56	Cuba	Havana
249	Curaçao	Willemstad
57	Cyprus	Nicosia
58	Czech Republic	Prague
51	Democratic Republic of the Congo	Kinshasa
59	Denmark	Copenhagen
60	Djibouti	Djibouti
61	Dominica	Roseau
62	Dominican Republic	Santo Domingo
63	East Timor	Dili
64	Ecuador	Quito
65	Egypt	Cairo
66	El Salvador	San Salvador
67	Equatorial Guinea	Malabo
68	Eritrea	Asmara
69	Estonia	Tallinn
70	Ethiopia	Addis Ababa
71	Falkland Islands	Stanley
72	Faroe Islands	Torshavn
73	Fiji Islands	Suva
74	Finland	Helsinki
75	France	Paris
76	French Guiana	Cayenne
77	French Polynesia	Papeete
78	French Southern Territories	Port-aux-Francais
79	Gabon	Libreville
80	Gambia The	Banjul
81	Georgia	Tbilisi
82	Germany	Berlin
83	Ghana	Accra
84	Gibraltar	Gibraltar
85	Greece	Athens
86	Greenland	Nuuk
87	Grenada	St. George's
88	Guadeloupe	Basse-Terre
89	Guam	Hagatna
90	Guatemala	Guatemala City
91	Guernsey and Alderney	St Peter Port
92	Guinea	Conakry
93	Guinea-Bissau	Bissau
94	Guyana	Georgetown
95	Haiti	Port-au-Prince
96	Heard Island and McDonald Islands	\N
97	Honduras	Tegucigalpa
98	Hong Kong S.A.R.	Hong Kong
99	Hungary	Budapest
100	Iceland	Reykjavik
101	India	New Delhi
102	Indonesia	Jakarta
103	Iran	Tehran
104	Iraq	Baghdad
105	Ireland	Dublin
106	Israel	Jerusalem
107	Italy	Rome
108	Jamaica	Kingston
109	Japan	Tokyo
110	Jersey	Saint Helier
111	Jordan	Amman
112	Kazakhstan	Astana
113	Kenya	Nairobi
114	Kiribati	Tarawa
248	Kosovo	Pristina
117	Kuwait	Kuwait City
118	Kyrgyzstan	Bishkek
119	Laos	Vientiane
120	Latvia	Riga
121	Lebanon	Beirut
122	Lesotho	Maseru
123	Liberia	Monrovia
124	Libya	Tripolis
125	Liechtenstein	Vaduz
126	Lithuania	Vilnius
127	Luxembourg	Luxembourg
128	Macau S.A.R.	Macao
130	Madagascar	Antananarivo
131	Malawi	Lilongwe
132	Malaysia	Kuala Lumpur
133	Maldives	Male
134	Mali	Bamako
135	Malta	Valletta
136	Man (Isle of)	Douglas, Isle of Man
137	Marshall Islands	Majuro
138	Martinique	Fort-de-France
139	Mauritania	Nouakchott
140	Mauritius	Port Louis
141	Mayotte	Mamoudzou
142	Mexico	Ciudad de México
143	Micronesia	Palikir
144	Moldova	Chisinau
145	Monaco	Monaco
146	Mongolia	Ulan Bator
147	Montenegro	Podgorica
148	Montserrat	Plymouth
149	Morocco	Rabat
150	Mozambique	Maputo
151	Myanmar	Nay Pyi Taw
152	Namibia	Windhoek
153	Nauru	Yaren
154	Nepal	Kathmandu
156	Netherlands	Amsterdam
157	New Caledonia	Noumea
158	New Zealand	Wellington
159	Nicaragua	Managua
160	Niger	Niamey
161	Nigeria	Abuja
162	Niue	Alofi
163	Norfolk Island	Kingston
115	North Korea	Pyongyang
129	North Macedonia	Skopje
164	Northern Mariana Islands	Saipan
165	Norway	Oslo
166	Oman	Muscat
167	Pakistan	Islamabad
168	Palau	Melekeok
169	Palestinian Territory Occupied	East Jerusalem
170	Panama	Panama City
171	Papua new Guinea	Port Moresby
172	Paraguay	Asuncion
173	Peru	Lima
174	Philippines	Manila
175	Pitcairn Island	Adamstown
176	Poland	Warsaw
177	Portugal	Lisbon
178	Puerto Rico	San Juan
179	Qatar	Doha
180	Reunion	Saint-Denis
181	Romania	Bucharest
182	Russia	Moscow
183	Rwanda	Kigali
184	Saint Helena	Jamestown
185	Saint Kitts And Nevis	Basseterre
186	Saint Lucia	Castries
187	Saint Pierre and Miquelon	Saint-Pierre
188	Saint Vincent And The Grenadines	Kingstown
189	Saint-Barthelemy	Gustavia
190	Saint-Martin (French part)	Marigot
191	Samoa	Apia
192	San Marino	San Marino
193	Sao Tome and Principe	Sao Tome
194	Saudi Arabia	Riyadh
195	Senegal	Dakar
196	Serbia	Belgrade
197	Seychelles	Victoria
198	Sierra Leone	Freetown
199	Singapore	Singapur
250	Sint Maarten (Dutch part)	Philipsburg
200	Slovakia	Bratislava
201	Slovenia	Ljubljana
202	Solomon Islands	Honiara
203	Somalia	Mogadishu
204	South Africa	Pretoria
205	South Georgia	Grytviken
116	South Korea	Seoul
206	South Sudan	Juba
207	Spain	Madrid
208	Sri Lanka	Colombo
209	Sudan	Khartoum
210	Suriname	Paramaribo
211	Svalbard And Jan Mayen Islands	Longyearbyen
212	Swaziland	Mbabane
213	Sweden	Stockholm
214	Switzerland	Bern
215	Syria	Damascus
216	Taiwan	Taipei
217	Tajikistan	Dushanbe
218	Tanzania	Dodoma
219	Thailand	Bangkok
17	The Bahamas	Nassau
220	Togo	Lome
221	Tokelau	\N
222	Tonga	Nuku'alofa
223	Trinidad And Tobago	Port of Spain
224	Tunisia	Tunis
225	Turkey	Ankara
226	Turkmenistan	Ashgabat
227	Turks And Caicos Islands	Cockburn Town
228	Tuvalu	Funafuti
229	Uganda	Kampala
230	Ukraine	Kyiv
231	United Arab Emirates	Abu Dhabi
232	United Kingdom	London
233	United States	Washington
234	United States Minor Outlying Islands	\N
235	Uruguay	Montevideo
236	Uzbekistan	Tashkent
237	Vanuatu	Port Vila
238	Vatican City State (Holy See)	Vatican City
239	Venezuela	Caracas
240	Vietnam	Hanoi
241	Virgin Islands (British)	Road Town
242	Virgin Islands (US)	Charlotte Amalie
243	Wallis And Futuna Islands	Mata Utu
244	Western Sahara	El-Aaiun
245	Yemen	Sanaa
246	Zambia	Lusaka
247	Zimbabwe	Harare
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, country_name, country_code) FROM stdin;
1	Peru	PE
2	Nigeria	NG
3	Afghanistan	AF
4	Albania	AL
5	Algeria	DZ
6	Angola	AO
7	Argentina	AR
8	Australia	AU
9	Austria	AT
10	Brazil	BR
11	Canada	CA
12	Chile	CL
13	China	CN
14	Colombia	CO
15	Denmark	DK
16	Egypt	EG
17	Finland	FI
18	France	FR
19	Germany	DE
20	Greece	GR
21	India	IN
22	Indonesia	ID
23	Italy	IT
24	Japan	JP
25	Mexico	MX
26	Morocco	MA
27	Netherlands	NL
28	New Zealand	NZ
29	Nigeria	NG
30	Norway	NO
31	Peru	PE
32	Portugal	PT
33	Russia	RU
34	Saudi Arabia	SA
35	South Africa	ZA
36	South Korea	KR
37	Spain	ES
38	Sweden	SE
39	Switzerland	CH
40	Turkey	TR
41	United Kingdom	GB
42	United States	US
\.


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flags (id, name, flag, a3, url) FROM stdin;
1	Afghanistan	AF	AFG	https://www.worldometers.info//img/flags/small/tn_af-flag.gif
2	Albania	AL	ALB	https://www.worldometers.info//img/flags/small/tn_al-flag.gif
3	Algeria	DZ	DZA	https://www.worldometers.info//img/flags/small/tn_ag-flag.gif
4	Andorra	AD	AND	https://www.worldometers.info//img/flags/small/tn_an-flag.gif
5	Angola	AO	AGO	https://www.worldometers.info//img/flags/small/tn_ao-flag.gif
6	Antigua and Barbuda	AG	ATG	https://www.worldometers.info//img/flags/small/tn_ac-flag.gif
7	Argentina	AR	ARG	https://www.worldometers.info//img/flags/small/tn_ar-flag.gif
8	Armenia	AM	ARM	https://www.worldometers.info//img/flags/small/tn_am-flag.gif
9	Australia	AU	AUS	https://www.worldometers.info//img/flags/small/tn_as-flag.gif
10	Austria	AT	AUT	https://www.worldometers.info//img/flags/small/tn_au-flag.gif
11	Azerbaijan	AZ	AZE	https://www.worldometers.info//img/flags/small/tn_aj-flag.gif
12	Bahamas (the)	BS	BHS	https://www.worldometers.info//img/flags/small/tn_bf-flag.gif
13	Bahrain	BH	BHR	https://www.worldometers.info//img/flags/small/tn_ba-flag.gif
14	Bangladesh	BD	BGD	https://www.worldometers.info//img/flags/small/tn_bg-flag.gif
15	Barbados	BB	BRB	https://www.worldometers.info//img/flags/small/tn_bb-flag.gif
16	Belarus	BY	BLR	https://www.worldometers.info//img/flags/small/tn_bo-flag.gif
17	Belgium	BE	BEL	https://www.worldometers.info//img/flags/small/tn_be-flag.gif
18	Belize	BZ	BLZ	https://www.worldometers.info//img/flags/small/tn_bh-flag.gif
19	Benin	BJ	BEN	https://www.worldometers.info//img/flags/small/tn_bn-flag.gif
20	Bhutan	BT	BTN	https://www.worldometers.info//img/flags/small/tn_bt-flag.gif
21	Bolivia (Plurinational State of)	BO	BOL	https://www.worldometers.info//img/flags/small/tn_bl-flag.gif
22	Bosnia and Herzegovina	BA	BIH	https://www.worldometers.info//img/flags/small/tn_bk-flag.gif
23	Botswana	BW	BWA	https://www.worldometers.info//img/flags/small/tn_bc-flag.gif
24	Brazil	BR	BRA	https://www.worldometers.info//img/flags/small/tn_br-flag.gif
25	Brunei Darussalam	BN	BRN	https://www.worldometers.info//img/flags/small/tn_bx-flag.gif
26	Bulgaria	BG	BGR	https://www.worldometers.info//img/flags/small/tn_bu-flag.gif
27	Burkina Faso	BF	BFA	https://www.worldometers.info//img/flags/small/tn_uv-flag.gif
28	Burundi	BI	BDI	https://www.worldometers.info//img/flags/small/tn_by-flag.gif
29	Cabo Verde	CV	CPV	https://www.worldometers.info//img/flags/small/tn_cv-flag.gif
30	Cambodia	KH	KHM	https://www.worldometers.info//img/flags/small/tn_cb-flag.gif
31	Cameroon	CM	CMR	https://www.worldometers.info//img/flags/small/tn_cm-flag.gif
32	Canada	CA	CAN	https://www.worldometers.info//img/flags/small/tn_ca-flag.gif
33	Central African Republic (the)	CF	CAF	https://www.worldometers.info//img/flags/small/tn_ct-flag.gif
34	Chad	TD	TCD	https://www.worldometers.info//img/flags/small/tn_cd-flag.gif
35	Chile	CL	CHL	https://www.worldometers.info//img/flags/small/tn_ci-flag.gif
36	China	CN	CHN	https://www.worldometers.info//img/flags/small/tn_ch-flag.gif
37	Colombia	CO	COL	https://www.worldometers.info//img/flags/small/tn_co-flag.gif
38	Comoros (the)	KM	COM	https://www.worldometers.info//img/flags/small/tn_cn-flag.gif
39	Congo (the Democratic Republic of the)	CD	COD	https://www.worldometers.info//img/flags/small/tn_congo-flag.gif
40	Congo (the)	CG	COG	https://www.worldometers.info//img/flags/small/tn_cg-flag.gif
41	Costa Rica	CR	CRI	https://www.worldometers.info//img/flags/small/tn_cs-flag.gif
42	Côte d'Ivoire	CI	CIV	https://www.worldometers.info//img/flags/small/tn_iv-flag.gif
43	Croatia	HR	HRV	https://www.worldometers.info//img/flags/small/tn_hr-flag.gif
44	Cuba	CU	CUB	https://www.worldometers.info//img/flags/small/tn_cu-flag.gif
45	Cyprus	CY	CYP	https://www.worldometers.info//img/flags/small/tn_cy-flag.gif
46	Czechia	CZ	CZE	https://www.worldometers.info//img/flags/small/tn_ez-flag.gif
47	Denmark	DK	DNK	https://www.worldometers.info//img/flags/small/tn_da-flag.gif
48	Djibouti	DJ	DJI	https://www.worldometers.info//img/flags/small/tn_dj-flag.gif
49	Dominica	DM	DMA	https://www.worldometers.info//img/flags/small/tn_do-flag.gif
50	Dominican Republic (the)	DO	DOM	https://www.worldometers.info//img/flags/small/tn_dr-flag.gif
51	Ecuador	EC	ECU	https://www.worldometers.info//img/flags/small/tn_ec-flag.gif
52	Egypt	EG	EGY	https://www.worldometers.info//img/flags/small/tn_eg-flag.gif
53	El Salvador	SV	SLV	https://www.worldometers.info//img/flags/small/tn_es-flag.gif
54	Equatorial Guinea	GQ	GNQ	https://www.worldometers.info//img/flags/small/tn_ek-flag.gif
55	Eritrea	ER	ERI	https://www.worldometers.info//img/flags/small/tn_er-flag.gif
56	Estonia	EE	EST	https://www.worldometers.info//img/flags/small/tn_en-flag.gif
57	Eswatini	SZ	SWZ	https://www.worldometers.info//img/flags/small/tn_wz-flag.gif
58	Ethiopia	ET	ETH	https://www.worldometers.info//img/flags/small/tn_et-flag.gif
59	Fiji	FJ	FJI	https://www.worldometers.info//img/flags/small/tn_fj-flag.gif
60	Finland	FI	FIN	https://www.worldometers.info//img/flags/small/tn_fi-flag.gif
61	France	FR	FRA	https://www.worldometers.info//img/flags/small/tn_fr-flag.gif
62	Gabon	GA	GAB	https://www.worldometers.info//img/flags/small/tn_gb-flag.gif
63	Gambia (the)	GM	GMB	https://www.worldometers.info//img/flags/small/tn_ga-flag.gif
64	Georgia	GE	GEO	https://www.worldometers.info//img/flags/small/tn_gg-flag.gif
65	Germany	DE	DEU	https://www.worldometers.info//img/flags/small/tn_gm-flag.gif
66	Ghana	GH	GHA	https://www.worldometers.info//img/flags/small/tn_gh-flag.gif
67	Greece	GR	GRC	https://www.worldometers.info//img/flags/small/tn_gr-flag.gif
68	Grenada	GD	GRD	https://www.worldometers.info//img/flags/small/tn_gj-flag.gif
69	Guatemala	GT	GTM	https://www.worldometers.info//img/flags/small/tn_gt-flag.gif
70	Guinea	GN	GIN	https://www.worldometers.info//img/flags/small/tn_gv-flag.gif
71	Guinea-Bissau	GW	GNB	https://www.worldometers.info//img/flags/small/tn_pu-flag.gif
72	Guyana	GY	GUY	https://www.worldometers.info//img/flags/small/tn_gy-flag.gif
73	Haiti	HT	HTI	https://www.worldometers.info//img/flags/small/tn_ha-flag.gif
74	Holy See (the)	VA	VAT	https://www.worldometers.info//img/flags/small/tn_vt-flag.gif
75	Honduras	HN	HND	https://www.worldometers.info//img/flags/small/tn_ho-flag.gif
76	Hungary	HU	HUN	https://www.worldometers.info//img/flags/small/tn_hu-flag.gif
77	Iceland	IS	ISL	https://www.worldometers.info//img/flags/small/tn_ic-flag.gif
78	India	IN	IND	https://www.worldometers.info//img/flags/small/tn_in-flag.gif
79	Indonesia	ID	IDN	https://www.worldometers.info//img/flags/small/tn_id-flag.gif
80	Iran (Islamic Republic of)	IR	IRN	https://www.worldometers.info//img/flags/small/tn_ir-flag.gif
81	Iraq	IQ	IRQ	https://www.worldometers.info//img/flags/small/tn_iz-flag.gif
82	Ireland	IE	IRL	https://www.worldometers.info//img/flags/small/tn_ei-flag.gif
83	Israel	IL	ISR	https://www.worldometers.info//img/flags/small/tn_is-flag.gif
84	Italy	IT	ITA	https://www.worldometers.info//img/flags/small/tn_it-flag.gif
85	Jamaica	JM	JAM	https://www.worldometers.info//img/flags/small/tn_jm-flag.gif
86	Japan	JP	JPN	https://www.worldometers.info//img/flags/small/tn_ja-flag.gif
87	Jordan	JO	JOR	https://www.worldometers.info//img/flags/small/tn_jo-flag.gif
88	Kazakhstan	KZ	KAZ	https://www.worldometers.info//img/flags/small/tn_kz-flag.gif
89	Kenya	KE	KEN	https://www.worldometers.info//img/flags/small/tn_ke-flag.gif
90	Kiribati	KI	KIR	https://www.worldometers.info//img/flags/small/tn_kr-flag.gif
91	Korea (the Democratic People's Republic of)	KP	PRK	https://www.worldometers.info//img/flags/small/tn_kn-flag.gif
92	Korea (the Republic of)	KR	KOR	https://www.worldometers.info//img/flags/small/tn_ks-flag.gif
93	Kuwait	KW	KWT	https://www.worldometers.info//img/flags/small/tn_ku-flag.gif
94	Kyrgyzstan	KG	KGZ	https://www.worldometers.info//img/flags/small/tn_kg-flag.gif
95	Lao People's Democratic Republic (the)	LA	LAO	https://www.worldometers.info//img/flags/small/tn_la-flag.gif
96	Latvia	LV	LVA	https://www.worldometers.info//img/flags/small/tn_lg-flag.gif
97	Lebanon	LB	LBN	https://www.worldometers.info//img/flags/small/tn_le-flag.gif
98	Lesotho	LS	LSO	https://www.worldometers.info//img/flags/small/tn_lt-flag.gif
99	Liberia	LR	LBR	https://www.worldometers.info//img/flags/small/tn_li-flag.gif
100	Libya	LY	LBY	https://www.worldometers.info//img/flags/small/tn_ly-flag.gif
101	Liechtenstein	LI	LIE	https://www.worldometers.info//img/flags/small/tn_ls-flag.gif
102	Lithuania	LT	LTU	https://www.worldometers.info//img/flags/small/tn_lh-flag.gif
103	Luxembourg	LU	LUX	https://www.worldometers.info//img/flags/small/tn_lu-flag.gif
104	Madagascar	MG	MDG	https://www.worldometers.info//img/flags/small/tn_ma-flag.gif
105	Malawi	MW	MWI	https://www.worldometers.info//img/flags/small/tn_mi-flag.gif
106	Malaysia	MY	MYS	https://www.worldometers.info//img/flags/small/tn_my-flag.gif
107	Maldives	MV	MDV	https://www.worldometers.info//img/flags/small/tn_mv-flag.gif
108	Mali	ML	MLI	https://www.worldometers.info//img/flags/small/tn_ml-flag.gif
109	Malta	MT	MLT	https://www.worldometers.info//img/flags/small/tn_mt-flag.gif
110	Marshall Islands (the)	MH	MHL	https://www.worldometers.info//img/flags/small/tn_rm-flag.gif
111	Mauritania	MR	MRT	https://www.worldometers.info//img/flags/small/tn_mr-flag.gif
112	Mauritius	MU	MUS	https://www.worldometers.info//img/flags/small/tn_mp-flag.gif
113	Mexico	MX	MEX	https://www.worldometers.info//img/flags/small/tn_mx-flag.gif
114	Micronesia (Federated States of)	FM	FSM	https://www.worldometers.info//img/flags/small/tn_fm-flag.gif
115	Moldova (the Republic of)	MD	MDA	https://www.worldometers.info//img/flags/small/tn_md-flag.gif
116	Monaco	MC	MCO	https://www.worldometers.info//img/flags/small/tn_mn-flag.gif
117	Mongolia	MN	MNG	https://www.worldometers.info//img/flags/small/tn_mg-flag.gif
118	Montenegro	ME	MNE	https://www.worldometers.info//img/flags/small/tn_mj-flag.gif
119	Morocco	MA	MAR	https://www.worldometers.info//img/flags/small/tn_mo-flag.gif
120	Mozambique	MZ	MOZ	https://www.worldometers.info//img/flags/small/tn_mz-flag.gif
121	Myanmar	MM	MMR	https://www.worldometers.info//img/flags/small/tn_bm-flag.gif
122	Namibia	NA	NAM	https://www.worldometers.info//img/flags/small/tn_wa-flag.gif
123	Nauru	NR	NRU	https://www.worldometers.info//img/flags/small/tn_nr-flag.gif
124	Nepal	NP	NPL	https://www.worldometers.info//img/flags/small/tn_np-flag.gif
125	Netherlands (the)	NL	NLD	https://www.worldometers.info//img/flags/small/tn_nl-flag.gif
126	New Zealand	NZ	NZL	https://www.worldometers.info//img/flags/small/tn_nz-flag.gif
127	Nicaragua	NI	NIC	https://www.worldometers.info//img/flags/small/tn_nu-flag.gif
128	Niger (the)	NE	NER	https://www.worldometers.info//img/flags/small/tn_ng-flag.gif
129	Nigeria	NG	NGA	https://www.worldometers.info//img/flags/small/tn_ni-flag.gif
130	Norway	NO	NOR	https://www.worldometers.info//img/flags/small/tn_no-flag.gif
131	Oman	OM	OMN	https://www.worldometers.info//img/flags/small/tn_mu-flag.gif
132	Pakistan	PK	PAK	https://www.worldometers.info//img/flags/small/tn_pk-flag.gif
133	Palau	PW	PLW	https://www.worldometers.info//img/flags/small/tn_ps-flag.gif
134	Palestine, State of	PS	PSE	https://www.worldometers.info//img/flags/small/tn_palestine-flag.gif
135	Panama	PA	PAN	https://www.worldometers.info//img/flags/small/tn_pm-flag.gif
136	Papua New Guinea	PG	PNG	https://www.worldometers.info//img/flags/small/tn_pp-flag.gif
137	Paraguay	PY	PRY	https://www.worldometers.info//img/flags/small/tn_pa-flag.gif
138	Peru	PE	PER	https://www.worldometers.info//img/flags/small/tn_pe-flag.gif
139	Philippines (the)	PH	PHL	https://www.worldometers.info//img/flags/small/tn_rp-flag.gif
140	Poland	PL	POL	https://www.worldometers.info//img/flags/small/tn_pl-flag.gif
141	Portugal	PT	PRT	https://www.worldometers.info//img/flags/small/tn_po-flag.gif
142	Qatar	QA	QAT	https://www.worldometers.info//img/flags/small/tn_qa-flag.gif
143	Republic of North Macedonia	MK	MKD	https://www.worldometers.info//img/flags/small/tn_mk-flag.gif
144	Romania	RO	ROU	https://www.worldometers.info//img/flags/small/tn_ro-flag.gif
145	Russian Federation (the)	RU	RUS	https://www.worldometers.info//img/flags/small/tn_rs-flag.gif
146	Rwanda	RW	RWA	https://www.worldometers.info//img/flags/small/tn_rw-flag.gif
147	Saint Kitts and Nevis	KN	KNA	https://www.worldometers.info//img/flags/small/tn_sc-flag.gif
148	Saint Lucia	LC	LCA	https://www.worldometers.info//img/flags/small/tn_st-flag.gif
149	Saint Vincent and the Grenadines	VC	VCT	https://www.worldometers.info//img/flags/small/tn_vc-flag.gif
150	Samoa	WS	WSM	https://www.worldometers.info//img/flags/small/tn_ws-flag.gif
151	San Marino	SM	SMR	https://www.worldometers.info//img/flags/small/tn_sm-flag.gif
152	Sao Tome and Principe	ST	STP	https://www.worldometers.info//img/flags/small/tn_tp-flag.gif
153	Saudi Arabia	SA	SAU	https://www.worldometers.info//img/flags/small/tn_sa-flag.gif
154	Senegal	SN	SEN	https://www.worldometers.info//img/flags/small/tn_sg-flag.gif
155	Serbia	RS	SRB	https://www.worldometers.info//img/flags/small/tn_ri-flag.gif
156	Seychelles	SC	SYC	https://www.worldometers.info//img/flags/small/tn_se-flag.gif
157	Sierra Leone	SL	SLE	https://www.worldometers.info//img/flags/small/tn_sl-flag.gif
158	Singapore	SG	SGP	https://www.worldometers.info//img/flags/small/tn_sn-flag.gif
159	Slovakia	SK	SVK	https://www.worldometers.info//img/flags/small/tn_lo-flag.gif
160	Slovenia	SI	SVN	https://www.worldometers.info//img/flags/small/tn_si-flag.gif
161	Solomon Islands	SB	SLB	https://www.worldometers.info//img/flags/small/tn_bp-flag.gif
162	Somalia	SO	SOM	https://www.worldometers.info//img/flags/small/tn_so-flag.gif
163	South Africa	ZA	ZAF	https://www.worldometers.info//img/flags/small/tn_sf-flag.gif
164	South Sudan	SS	SSD	https://www.worldometers.info//img/flags/small/tn_od-flag.gif
165	Spain	ES	ESP	https://www.worldometers.info//img/flags/small/tn_sp-flag.gif
166	Sri Lanka	LK	LKA	https://www.worldometers.info//img/flags/small/tn_ce-flag.gif
167	Sudan (the)	SD	SDN	https://www.worldometers.info//img/flags/small/tn_su-flag.gif
168	Suriname	SR	SUR	https://www.worldometers.info//img/flags/small/tn_ns-flag.gif
169	Sweden	SE	SWE	https://www.worldometers.info//img/flags/small/tn_sw-flag.gif
170	Switzerland	CH	CHE	https://www.worldometers.info//img/flags/small/tn_sz-flag.gif
171	Syrian Arab Republic	SY	SYR	https://www.worldometers.info//img/flags/small/tn_sy-flag.gif
172	Tajikistan	TJ	TJK	https://www.worldometers.info//img/flags/small/tn_ti-flag.gif
173	Tanzania, United Republic of	TZ	TZA	https://www.worldometers.info//img/flags/small/tn_tz-flag.gif
174	Thailand	TH	THA	https://www.worldometers.info//img/flags/small/tn_th-flag.gif
175	Timor-Leste	TL	TLS	https://www.worldometers.info//img/flags/small/tn_tt-flag.gif
176	Togo	TG	TGO	https://www.worldometers.info//img/flags/small/tn_to-flag.gif
177	Tonga	TO	TON	https://www.worldometers.info//img/flags/small/tn_tn-flag.gif
178	Trinidad and Tobago	TT	TTO	https://www.worldometers.info//img/flags/small/tn_td-flag.gif
179	Tunisia	TN	TUN	https://www.worldometers.info//img/flags/small/tn_ts-flag.gif
180	Turkey	TR	TUR	https://www.worldometers.info//img/flags/small/tn_tu-flag.gif
181	Turkmenistan	TM	TKM	https://www.worldometers.info//img/flags/small/tn_tx-flag.gif
182	Tuvalu	TV	TUV	https://www.worldometers.info//img/flags/small/tn_tv-flag.gif
183	Uganda	UG	UGA	https://www.worldometers.info//img/flags/small/tn_ug-flag.gif
184	Ukraine	UA	UKR	https://www.worldometers.info//img/flags/small/tn_up-flag.gif
185	United Arab Emirates (the)	AE	ARE	https://www.worldometers.info//img/flags/small/tn_ae-flag.gif
186	United Kingdom of Great Britain and Northern Ireland (the)	GB	GBR	https://www.worldometers.info//img/flags/small/tn_uk-flag.gif
187	United States of America (the)	US	USA	https://www.worldometers.info//img/flags/small/tn_us-flag.gif
188	Uruguay	UY	URY	https://www.worldometers.info//img/flags/small/tn_uy-flag.gif
189	Uzbekistan	UZ	UZB	https://www.worldometers.info//img/flags/small/tn_uz-flag.gif
190	Vanuatu	VU	VUT	https://www.worldometers.info//img/flags/small/tn_nh-flag.gif
191	Venezuela (Bolivarian Republic of)	VE	VEN	https://www.worldometers.info//img/flags/small/tn_ve-flag.gif
192	Viet Nam	VN	VNM	https://www.worldometers.info//img/flags/small/tn_vm-flag.gif
193	Yemen	YE	YEM	https://www.worldometers.info//img/flags/small/tn_ym-flag.gif
194	Zambia	ZM	ZMB	https://www.worldometers.info//img/flags/small/tn_za-flag.gif
195	Zimbabwe	ZW	ZWE	https://www.worldometers.info//img/flags/small/tn_zi-flag.gif
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, color) FROM stdin;
1	Angela	red
2	Jack	blue
3	Rodolfo	yellow
\.


--
-- Data for Name: visited_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visited_countries (id, country_code, user_id) FROM stdin;
1	PE	1
2	PE	1
3	PE	1
4	PE	3
\.


--
-- Data for Name: world_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.world_food (country, rice, wheat) FROM stdin;
Australia	0.42	31.9
Brazil	13.98	7.9
China	212.84	136.9
Ethiopia	0.2	5.2
India	195.43	109.6
Iran	1.6	10.1
Pakistan	13.98	27.5
Ukraine	0.05	32.2
United States	8.7	44.8
\.


--
-- Name: capitals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capitals_id_seq', 7, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 42, true);


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flags_id_seq', 195, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: visited_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visited_countries_id_seq', 4, true);


--
-- Name: capitals capitals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: flags flags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visited_countries visited_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_pkey PRIMARY KEY (id);


--
-- Name: visited_countries visited_countries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict vTdc6cyprtkTutmET7vJ3hCH3vtIsxN6JF3VLDddAeFaXq0HTx9mvVJIZdevfYN

--
-- PostgreSQL database cluster dump complete
--

