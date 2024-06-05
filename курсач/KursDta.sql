--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-04-26 12:37:54

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
-- TOC entry 216 (class 1259 OID 81922)
-- Name: cabinets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabinets (
    id integer NOT NULL,
    number character varying(255),
    description text
);


ALTER TABLE public.cabinets OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 81921)
-- Name: cabinets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cabinets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cabinets_id_seq OWNER TO postgres;

--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 215
-- Name: cabinets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cabinets_id_seq OWNED BY public.cabinets.id;


--
-- TOC entry 218 (class 1259 OID 81931)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(255),
    url character varying(255)
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 81930)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 217
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 4639 (class 2604 OID 81925)
-- Name: cabinets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabinets ALTER COLUMN id SET DEFAULT nextval('public.cabinets_id_seq'::regclass);


--
-- TOC entry 4640 (class 2604 OID 81934)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 4789 (class 0 OID 81922)
-- Dependencies: 216
-- Data for Name: cabinets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabinets (id, number, description) FROM stdin;
36	244	Лаборатория
39	345	Лаборатория
40	348	Лаборатория
1	Библиотека	Здесь вы можете взять книги и распечатать документы 12:00-18:00\n
2	Компьютеры	Можно выполнять учебные занятия 12-18
3	Зона отдыха	Здесь вы можете отдохнуть на перерывах 12-18
4	Актовый зал	Закрыт на ремон до 2010
5	94	Лаборотория
6	101	Лаборотория
7	102	Лаборотория
8	103	Лаборотория
9	104	Лаборотория
10	106	Лаборотория
11	108	Лаборотория
12	110	Лаборотория
13	112	Лаборотория
14	113	Лаборотория
15	114	Лаборотория
16	115	Бухгалтерия 10-19\n
17	116	Ремонт 
18	117	Бухгалтерия
19	120	Аудитория
20	121	Лаборотория
21	122	Столовая 12-20
22	123	Хоз.Помещение
23	124	Столовая 12-19
24	126	Раздевалка М
25	127	Раздевалка Ж
26	128	Тренерская
27	129	Спорт зал Ремон
28	232	Аудитория
29	233	Кабинеты сотрудников
30	234	Аудитория
31	236	Приёмная Директора
32	239	Аудитория 
33	240	Аудитория
34	241	Аудитория
35	242	Аудитория
37	245	Лекционный зал
38	246	Аудитория
41	349а	Кабинет заведующей отделением
42	349б	Кабинет заведующей отделением
43	349в	Кабинет заведующей отделением
44	349г	Кабинет заведующей отделением
45	349д	Кабинет заведующей отделением
46	351	Лаборатория
47	352	Лаборатория
48	353	Лаборатория
49	354	Серверная
50	355	Аудитория лучшая
51	356	Аудитория
52	358	Аудитория
53	360	Аудитория
54	362	Аудитория
55	364	Аудитория
56	366	Лаборатория
57	368	Лаборатория
58	369	Лаборатория
59	473	Лаборатория
60	473a	Лаборатория
61	474	Аудитория
62	475	Аудитория
63	476	Аудитория
64	477	Аудитория
65	478	Лаборатория
66	479	Аудитория
67	480	Лаборатория
68	481	Лаборатория
69	482	Аудитория
70	483	Аудитория
71	484	Аудитория
72	485	Аудитория
73	486	Аудитория
74	487	Аудитория
75	488	Аудитория
80	492	Автошкола
76	489а	Кабинет заведующей отделением
77	489б	Кабинет заведующей отделением
78	490	Кабинет заведующей отделением
79	491	Кабинет заведующей отделением
\.


--
-- TOC entry 4791 (class 0 OID 81931)
-- Dependencies: 218
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, url) FROM stdin;
1	Юбилей города	https://telegra.ph/YUbilej-goroda-04-25
2	Профессионалы	https://telegra.ph/Professionaly-04-25
3	Концерт студентов	https://telegra.ph/StudVesna-04-25
4	День открытых дверей	https://telegra.ph/DenOtkrytyhDverej-04-25
\.


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 215
-- Name: cabinets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cabinets_id_seq', 80, true);


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 217
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 4642 (class 2606 OID 81929)
-- Name: cabinets cabinets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabinets
    ADD CONSTRAINT cabinets_pkey PRIMARY KEY (id);


--
-- TOC entry 4644 (class 2606 OID 81938)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


-- Completed on 2024-04-26 12:37:54

--
-- PostgreSQL database dump complete
--

