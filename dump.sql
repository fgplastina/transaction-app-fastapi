--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    id_client integer
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_client (
    id_category integer,
    id_client integer
);


ALTER TABLE public.category_client OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: movement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movement (
    id integer NOT NULL,
    id_account integer,
    type character varying(50),
    amount numeric(12,2) NOT NULL,
    event_date timestamp without time zone NOT NULL
);


ALTER TABLE public.movement OWNER TO postgres;

--
-- Name: movement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_id_seq OWNER TO postgres;

--
-- Name: movement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movement_id_seq OWNED BY public.movement.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: movement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement ALTER COLUMN id SET DEFAULT nextval('public.movement_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, id_client) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
16	16
17	17
18	18
19	19
20	20
21	21
22	22
23	23
24	24
25	25
26	26
27	27
28	28
29	29
30	30
31	31
32	32
33	33
34	34
35	35
36	36
37	37
38	38
39	39
40	40
41	41
42	42
43	43
44	44
45	45
46	46
47	47
48	48
49	49
50	50
51	51
52	52
53	53
54	54
55	55
56	56
57	57
58	58
59	59
60	60
61	61
62	62
63	63
64	64
65	65
66	66
67	67
68	68
69	69
70	70
71	71
72	72
73	73
74	74
75	75
76	76
77	77
78	78
79	79
80	80
81	81
82	82
83	83
84	84
85	85
86	86
87	87
88	88
89	89
90	90
91	91
92	92
93	93
94	94
95	95
96	96
97	97
98	98
99	99
100	100
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	eu mi nulla ac enim in tempor turpis nec euismod
2	libero
3	sed
4	eget
5	cursus
6	montes
7	non
8	potenti nullam
9	sit amet
10	lacus morbi
11	sapien dignissim
12	ut erat
13	aliquam
14	elit
15	eget vulputate
16	in lacus
17	venenatis non
18	condimentum
19	diam
20	sem
21	semper
22	aliquet
23	consequat dui
24	consectetuer
25	curae duis
26	justo aliquam
27	cras in
28	est risus
29	tincidunt lacus
30	adipiscing elit
31	sagittis
32	donec
33	tempus
34	lorem
35	ut
36	egestas
37	nulla
38	convallis eget
39	elit proin
40	in felis
41	platea dictumst
42	luctus
43	orci luctus
44	magna bibendum
45	felis
46	ut dolor
47	erat fermentum
48	sociis
49	nulla pede
50	dui luctus
51	volutpat
52	quisque porta
53	vestibulum
54	aliquet
55	molestie
56	pellentesque ultrices
57	curabitur at
58	convallis
59	consequat lectus
60	sed vel
61	consequat
62	a nibh
63	ac tellus
64	in
65	aliquam erat
66	augue
67	hac
68	cum sociis
69	pede justo
70	odio
71	odio odio
72	condimentum
73	vehicula
74	eget elit
75	id pretium
76	vestibulum
77	vivamus tortor
78	aliquam convallis
79	convallis duis
80	consequat
81	fermentum
82	amet cursus
83	quis turpis
84	vivamus tortor
85	vitae consectetuer
86	at
87	tortor
88	erat nulla
89	ut
90	sagittis dui
91	enim lorem
92	vulputate
93	quis augue
94	ultrices
95	nec
96	augue quam
97	vel augue
98	odio
99	quam
100	diam
101	felis ut
\.


--
-- Data for Name: category_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_client (id_category, id_client) FROM stdin;
40	74
76	75
53	78
63	55
3	39
20	62
11	13
43	23
82	62
3	84
93	48
55	17
45	71
14	46
82	19
31	46
76	72
41	85
100	64
35	24
36	72
28	71
1	37
21	42
2	91
25	45
7	44
23	19
68	93
73	71
67	50
30	72
45	75
29	59
85	45
33	60
24	51
88	35
44	41
29	23
13	81
86	4
50	59
65	66
10	90
65	29
76	33
31	24
95	80
70	82
7	65
47	26
50	63
28	14
20	80
13	26
39	21
16	36
88	65
81	6
89	11
85	58
57	66
70	69
40	91
16	91
35	63
76	25
33	73
47	81
89	85
29	69
8	48
53	10
70	35
28	15
67	44
84	15
77	47
38	86
47	28
71	50
79	16
9	36
36	55
5	75
75	61
67	2
18	82
49	19
74	67
99	9
62	97
42	96
86	18
42	60
82	52
68	49
87	89
84	69
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name) FROM stdin;
1	Leann Cesconi
2	Aurora Fewtrell
3	Joell Barringer
4	Reynard Scoyles
5	Max Hasson
6	Case Longford
7	Zedekiah Wynett
8	Trina Kingzett
9	Deirdre Jeanes
10	Cullin McArdle
11	Elane Clemenceau
12	Davin Rosenblad
13	Jillene Gallie
14	Nobe Senior
15	Minny Endicott
16	Perrine Kopec
17	Hollyanne Mulrenan
18	Bamby Hitschke
19	Emilie McDuffie
20	Cesya Havenhand
21	Ray Batstone
22	Giuseppe Roderighi
23	Judd Moakes
24	Camila Lawes
25	Kailey Mateev
26	Iggy Lathleiffure
27	Giovanni Grimbaldeston
28	Luciana McAster
29	North Ambrosi
30	Selestina Jelk
31	Chrissy Eschalotte
32	Cherri Guerrier
33	Lorry Apfler
34	Virgilio Hutchinson
35	Loralee Wackly
36	Shandeigh Hallowell
37	Pyotr Edards
38	Mimi Rothery
39	Ossie Salzburger
40	Bev di Rocca
41	Madalyn Ebi
42	Oralee Reynalds
43	Robena Pluck
44	Giuseppe Rousell
45	Bernard Foulcher
46	Goldarina Sappell
47	Leland Hawse
48	Atlante Darcey
49	Laina Parrott
50	Pepito Pettus
51	Gaston Waggitt
52	Dee dee Kleisle
53	Burl Shaves
54	Lorne Husthwaite
55	Konstantine Cant
56	Lamond Guymer
57	Aurora Yeo
58	Kipper Yakubowicz
59	Fonz Jochen
60	Lexy Nisius
61	Wilona Pizey
62	Damien Wholesworth
63	Der Martschik
64	Janene Hunsworth
65	Zsa zsa Jewsbury
66	Adina Macartney
67	Ban Calendar
68	Imogene Zolini
69	Pru Helwig
70	Juana Accomb
71	Trenton Avesque
72	Nerte Qualtrough
73	Luce Iacovaccio
74	Josiah Walework
75	Kliment Tunnicliff
76	Orion Olwen
77	Dom Gasnoll
78	Doll Demann
79	Launce Andrivel
80	Loise Durnford
81	Ninnetta Vickerstaff
82	Cecile Clifton
83	Xenia Tabrett
84	Verena Stoves
85	Gerianna Simonitto
86	Francois Philipart
87	Ninette Logan
88	Brita Aitkin
89	Inglis Burgott
90	Land Checci
91	Malina Batterham
92	Laura Highway
93	Madel Anmore
94	Liuka Paolotto
95	Louisa Braithwaite
96	Elly Zambon
97	Esme Clapham
98	Ralf Mullins
99	Christina Nuemann
100	Kyle Sconce
\.


--
-- Data for Name: movement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movement (id, id_account, type, amount, event_date) FROM stdin;
202	56	egress	32296.29	2021-09-20 00:00:00
203	9	ingress	43129.10	2021-10-10 00:00:00
204	73	ingress	11709.62	2022-03-02 00:00:00
205	17	ingress	23198.89	2023-05-20 00:00:00
206	67	ingress	35754.04	2021-09-29 00:00:00
207	77	egress	39281.70	2022-02-07 00:00:00
208	3	ingress	45577.10	2021-09-19 00:00:00
209	73	ingress	11272.58	2021-09-06 00:00:00
210	97	ingress	16386.23	2022-07-08 00:00:00
211	67	egress	20720.42	2023-01-25 00:00:00
212	52	ingress	38164.74	2022-09-01 00:00:00
213	73	ingress	37287.66	2022-05-27 00:00:00
214	17	ingress	27413.21	2023-04-13 00:00:00
215	88	egress	36329.33	2021-12-07 00:00:00
216	91	ingress	35804.18	2022-11-13 00:00:00
217	89	egress	47311.18	2021-09-26 00:00:00
218	23	egress	31009.66	2022-02-02 00:00:00
219	50	ingress	3882.89	2022-10-12 00:00:00
220	78	egress	26476.24	2022-08-14 00:00:00
221	44	ingress	35503.73	2023-04-20 00:00:00
222	13	egress	17774.61	2022-07-22 00:00:00
223	43	ingress	25911.85	2022-11-08 00:00:00
224	8	ingress	34472.56	2023-01-06 00:00:00
225	40	ingress	31077.38	2022-12-21 00:00:00
226	30	egress	4969.36	2021-11-17 00:00:00
227	1	ingress	602.88	2023-04-13 00:00:00
228	50	ingress	11724.62	2023-02-26 00:00:00
229	86	ingress	14147.25	2023-02-02 00:00:00
230	5	ingress	4475.29	2021-10-20 00:00:00
231	96	ingress	23921.57	2023-06-27 00:00:00
232	3	ingress	22707.41	2023-07-02 00:00:00
233	56	egress	10864.96	2023-04-12 00:00:00
234	71	egress	15203.05	2021-11-18 00:00:00
235	48	ingress	44830.49	2023-03-02 00:00:00
236	96	egress	13103.28	2022-01-25 00:00:00
237	53	ingress	23889.92	2022-06-19 00:00:00
238	33	ingress	28522.54	2023-05-03 00:00:00
239	67	egress	42224.67	2022-05-10 00:00:00
240	68	ingress	20273.65	2023-01-05 00:00:00
241	90	ingress	37018.26	2023-02-10 00:00:00
242	69	egress	11077.90	2022-12-30 00:00:00
243	82	ingress	10743.09	2022-06-28 00:00:00
244	79	egress	19955.46	2021-10-29 00:00:00
245	13	ingress	6265.09	2022-12-27 00:00:00
246	100	egress	29921.15	2022-05-10 00:00:00
247	80	ingress	30473.18	2022-04-17 00:00:00
248	23	ingress	3013.75	2022-03-01 00:00:00
249	80	ingress	18108.81	2021-10-06 00:00:00
250	14	ingress	7238.62	2022-08-28 00:00:00
251	49	egress	45761.76	2022-01-27 00:00:00
252	28	ingress	22418.10	2021-11-05 00:00:00
253	58	ingress	16056.31	2023-02-23 00:00:00
254	87	ingress	13096.70	2022-06-16 00:00:00
255	37	ingress	35237.57	2023-02-09 00:00:00
256	46	ingress	41111.35	2022-04-10 00:00:00
257	55	ingress	21060.65	2021-11-24 00:00:00
258	1	ingress	15630.19	2023-02-13 00:00:00
259	1	ingress	35832.03	2023-01-21 00:00:00
260	67	ingress	48483.15	2022-02-18 00:00:00
261	19	ingress	37797.85	2022-05-23 00:00:00
262	49	ingress	13904.25	2022-11-03 00:00:00
263	19	ingress	16528.44	2023-02-28 00:00:00
264	88	ingress	43527.24	2022-08-13 00:00:00
265	43	ingress	43220.16	2023-05-24 00:00:00
266	19	ingress	48144.58	2021-10-30 00:00:00
267	18	ingress	48638.26	2022-11-04 00:00:00
268	16	ingress	20892.02	2023-03-26 00:00:00
269	39	ingress	6480.53	2022-08-21 00:00:00
270	54	ingress	14216.03	2021-11-13 00:00:00
271	31	ingress	26333.80	2022-06-20 00:00:00
272	97	ingress	5691.41	2022-06-09 00:00:00
273	50	ingress	41738.89	2022-03-01 00:00:00
274	22	ingress	2005.75	2023-01-19 00:00:00
275	67	ingress	10177.16	2022-07-10 00:00:00
276	41	ingress	13356.02	2023-02-15 00:00:00
277	8	ingress	38940.68	2023-05-27 00:00:00
278	70	egress	42259.05	2022-02-16 00:00:00
279	93	ingress	32780.33	2023-05-23 00:00:00
280	80	ingress	7128.52	2022-11-21 00:00:00
281	14	ingress	23430.40	2021-09-07 00:00:00
282	87	ingress	18494.40	2022-04-06 00:00:00
283	74	ingress	21669.25	2022-12-03 00:00:00
284	48	ingress	23057.50	2022-07-12 00:00:00
285	6	ingress	4638.48	2023-01-02 00:00:00
286	32	ingress	36913.33	2021-12-13 00:00:00
287	48	egress	6818.84	2022-11-18 00:00:00
288	34	ingress	39885.60	2023-05-20 00:00:00
289	66	ingress	40176.13	2022-06-22 00:00:00
290	2	ingress	48693.37	2023-03-18 00:00:00
291	50	ingress	11982.30	2022-06-17 00:00:00
292	33	ingress	40440.28	2023-04-12 00:00:00
293	20	ingress	19203.94	2022-05-23 00:00:00
294	92	ingress	28551.64	2023-03-22 00:00:00
295	90	ingress	20482.90	2022-03-21 00:00:00
296	50	ingress	22337.65	2021-11-09 00:00:00
297	99	ingress	35362.27	2022-07-27 00:00:00
298	86	ingress	47302.59	2022-02-07 00:00:00
299	25	egress	43266.16	2023-03-11 00:00:00
300	7	ingress	44059.91	2022-10-16 00:00:00
301	24	egress	37050.13	2021-10-24 00:00:00
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 100, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 101, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 100, true);


--
-- Name: movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movement_id_seq', 301, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: movement movement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_pkey PRIMARY KEY (id);


--
-- Name: account account_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id);


--
-- Name: category_client category_client_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_client
    ADD CONSTRAINT category_client_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id);


--
-- Name: category_client category_client_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_client
    ADD CONSTRAINT category_client_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id);


--
-- Name: movement movement_id_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_id_account_fkey FOREIGN KEY (id_account) REFERENCES public.account(id);


--
-- PostgreSQL database dump complete
--

