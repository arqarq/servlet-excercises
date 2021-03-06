--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id bigint NOT NULL,
    city character varying(255),
    houseno character varying(255),
    street character varying(255)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.address ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id bigint NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255)
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);


ALTER TABLE public.sequence OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    address_id bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users2 (
    id bigint NOT NULL,
    login character varying(255),
    password character varying(255)
);


ALTER TABLE public.users2 OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, city, houseno, street) FROM stdin;
58	Gowa	228	Esch
66	Troparëvo	3	Graedel
102	Dąbrowa Górnicza	49/48	Wojska Polskiego
104	Katowice	58/8	Zamkowa
1304	W-wa	1/172	TVNu
24	Warszawa	22	Łopuszańska
204	Brzęczkowice	ÓÓÓŹŹŹ	ĘĄ Games
1354	Katowice	12a	Plac Wolności
14	Maków Mazowiecki	50a	Sportowa
16	Sochaczew	16/166	Olimpijska
1554	sdfdsfds	sffdsfsdfs	444444444
1654	Wąchock	eee	asd
56	Saurama	63/91/67	Everett
177	Maków MazowieckiZZZ	50/98	SportowaVVV
10	Szczecin	2/2	Stanisława Żółkiewskiego
60	Lidköping	48/45	Kings
6	Czechowice-Dziedzice	83/83	Legionów
52	Tsarychanka	91/8	Esker
68	Nishio	55	Veith
20	Środa Wlkp.	6/111	Stary Rynek
12	Żyrardów	52/43	Limanowskiego
1954	C	E	D
1604	DG	33	WP
1704	ccc	eeee	ddd
1804	ada	adad	adad
1806	Chorzów	34/43	Jakaś
1904	DG	48/500	PW
1054	NBA	23	street
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, email, first_name, last_name, phone_number) FROM stdin;
\.


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sequence (seq_name, seq_count) FROM stdin;
SEQ_GEN	2002
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, firstname, lastname, address_id) FROM stdin;
203	Paweł	Waflewśki	204
51	Lexine	Berling	52
55	Ichabod	Lambregts	56
57	Verine	Thick	58
59	Caye	Heild	60
65	Vasilis	Bitchener	66
67	Wash	Maving	68
101	Arkadiusz	Sekuła	102
103	Arkadiusz	Sekuła	104
9	Artur	Kubiak	10
11	Andrzej	Braciak	12
13	Romuald	Olszewski	14
15	Dominika	Szymańska	16
19	Żaneta	Krzyminska	20
23	Marek	Dominik	24
1053	Shawn	Kemp	1054
1303	Ędward	Ącki	1304
5	Szymon	Szymoński	6
1353	Urzędnik	Urzędnicki	1354
1553	aaa	bbb	1554
1653	aaa	bb	1654
1953	A	B	1954
1603	Arek	Arecki	1604
1703	aaa	bbb	1704
1803	aaa	asda	1804
1805	Robercik	22	1806
1903	Arkadiusz	Tomaszewski	1904
177	ZenobiuszVVV	ZZZ	177
\.


--
-- Data for Name: users2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users2 (id, login, password) FROM stdin;
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 177, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 177, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: sequence sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


--
-- Name: users2 users2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users2
    ADD CONSTRAINT users2_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users fk_users_address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_address_id FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- PostgreSQL database dump complete
--

