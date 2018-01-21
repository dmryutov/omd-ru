--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO dmryutov;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO dmryutov;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO dmryutov;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO dmryutov;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO dmryutov;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO dmryutov;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO dmryutov;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO dmryutov;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO dmryutov;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO dmryutov;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO dmryutov;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO dmryutov;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: dealer_brand; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE dealer_brand (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE dealer_brand OWNER TO dmryutov;

--
-- Name: dealer_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE dealer_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dealer_brand_id_seq OWNER TO dmryutov;

--
-- Name: dealer_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE dealer_brand_id_seq OWNED BY dealer_brand.id;


--
-- Name: dealer_city; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE dealer_city (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    region_id integer
);


ALTER TABLE dealer_city OWNER TO dmryutov;

--
-- Name: dealer_city_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE dealer_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dealer_city_id_seq OWNER TO dmryutov;

--
-- Name: dealer_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE dealer_city_id_seq OWNED BY dealer_city.id;


--
-- Name: dealer_dealer; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE dealer_dealer (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address text NOT NULL,
    phone character varying(255),
    site character varying(200),
    brand_id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE dealer_dealer OWNER TO dmryutov;

--
-- Name: dealer_dealer_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE dealer_dealer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dealer_dealer_id_seq OWNER TO dmryutov;

--
-- Name: dealer_dealer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE dealer_dealer_id_seq OWNED BY dealer_dealer.id;


--
-- Name: dealer_region; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE dealer_region (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE dealer_region OWNER TO dmryutov;

--
-- Name: dealer_region_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE dealer_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dealer_region_id_seq OWNER TO dmryutov;

--
-- Name: dealer_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE dealer_region_id_seq OWNED BY dealer_region.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO dmryutov;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO dmryutov;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO dmryutov;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO dmryutov;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO dmryutov;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dmryutov
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO dmryutov;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmryutov
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: dmryutov
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO dmryutov;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dealer_brand id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_brand ALTER COLUMN id SET DEFAULT nextval('dealer_brand_id_seq'::regclass);


--
-- Name: dealer_city id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_city ALTER COLUMN id SET DEFAULT nextval('dealer_city_id_seq'::regclass);


--
-- Name: dealer_dealer id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_dealer ALTER COLUMN id SET DEFAULT nextval('dealer_dealer_id_seq'::regclass);


--
-- Name: dealer_region id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_region ALTER COLUMN id SET DEFAULT nextval('dealer_region_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Марка	7	add_brand
20	Can change Марка	7	change_brand
21	Can delete Марка	7	delete_brand
22	Can add Федеральный округ	8	add_region
23	Can change Федеральный округ	8	change_region
24	Can delete Федеральный округ	8	delete_region
25	Can add Город	9	add_city
26	Can change Город	9	change_city
27	Can delete Город	9	delete_city
28	Can add Дилер	10	add_dealer
29	Can change Дилер	10	change_dealer
30	Can delete Дилер	10	delete_dealer
31	Города Центрального и Северо-Западного ФО РФ	10	manager_central
32	Города Южного, Приволжского и Северо-Кавказского ФО РФ	10	manager_south
33	Города Уральского, Сибирского и Дальневосточного ФО РФ	10	manager_east
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$DQZZTOVFfL05$dPbnscJZd+U5ZGEo6QxS4CpNax8mo8XUmB87wk246MY=	\N	f	south				f	t	2018-01-21 21:31:39+03
3	pbkdf2_sha256$36000$SdEiL6TqwRxO$dBnYIjGVCvBSH+wPYwjNgQZL1o6+5N6h5aRwcdJLrJA=	2018-01-21 21:32:43.638503+03	f	center				f	t	2018-01-21 21:32:17+03
1	pbkdf2_sha256$36000$yi1g4XirVTpA$4VgvSqAgJcrA3Wpjp3JdA7BVFxcJEtu83gl2VXOX5WI=	2018-01-21 22:02:13.69153+03	t	admin			admin@mail.ru	t	t	2018-01-21 21:00:51.029975+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	32
2	3	31
\.


--
-- Data for Name: dealer_brand; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY dealer_brand (id, name) FROM stdin;
1	Hyundai
2	Kia
\.


--
-- Data for Name: dealer_city; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY dealer_city (id, name, region_id) FROM stdin;
1	Абакан	7
2	Альметьевск	5
3	Ангарск	7
4	Архангельск	2
5	Астрахань	3
6	Барнаул	7
7	Батайск	3
8	Белгород	1
9	Бийск	7
10	Благовещенск	8
11	Братск	7
12	Брянск	1
13	Великий Новгород	2
14	Владивосток	8
15	Владикавказ	4
16	Владимир	1
17	Волгоград	3
18	Волжский	3
19	Вологда	2
20	Воронеж	1
21	Грозный	4
22	Дзержинск	5
23	Екатеринбург	6
24	Иваново	1
25	Ижевск	5
26	Иркутск	7
27	Йошкар-Ола	5
28	Казань	5
29	Калининград	2
30	Калуга	1
31	Кемерово	7
32	Киров	5
33	Комсомольск-на-Амуре	8
34	Кострома	1
35	Краснодар	3
36	Красноярск	7
37	Курган	6
38	Курск	1
39	Липецк	1
40	Магнитогорск	6
41	Махачкала	4
42	Миасс	6
43	Минеральные Воды	4
44	Москва и Подмосковье	1
45	Москва	1
46	Мурманск	2
47	Набережные Челны	5
48	Нальчик	4
49	Нефтекамск	5
50	Нижневартовск	6
51	Нижнекамск	5
52	Нижний Новгород	5
53	Нижний Тагил	6
54	Новокузнецк	7
55	Новомосковск	1
56	Новороссийск	3
57	Новосибирск	7
58	Ноябрьск	6
59	Обнинск	1
60	Октябрьский	5
61	Омск	7
62	Орел	1
63	Оренбург	5
64	Орск	5
65	Пенза	5
66	Пермь	5
67	Петрозаводск	2
68	Петропавловск-Камчатский	8
69	Прокопьевск	7
70	Псков	2
71	Пятигорск	4
72	Ростов-на-Дону	3
73	Рязань	1
74	Самара	5
75	Санкт-Петербург	2
76	Саранск	5
77	Саратов	5
78	Севастополь	3
79	Северодвинск	2
80	Симферополь	3
81	Смоленск	1
82	Сочи	3
83	Ставрополь	4
84	Старый Оскол	1
85	Стерлитамак	5
86	Сургут	6
87	Сыктывкар	2
88	Таганрог	3
89	Тамбов	1
90	Тверь	1
91	Тольятти	5
92	Томск	7
93	Тула	1
94	Тюмень	6
95	Улан-Удэ	7
96	Ульяновск	5
97	Уфа	5
98	Хабаровск	8
99	Чебоксары	5
100	Челябинск	6
101	Череповец	2
102	Чита	7
103	Шахты	3
104	Энгельс	5
105	Южно-Сахалинск	8
106	Якутск	8
107	Ярославль	1
\.


--
-- Data for Name: dealer_dealer; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY dealer_dealer (id, name, address, phone, site, brand_id, city_id) FROM stdin;
1	Hyundai City Store АВИЛОН	г. Москва, Ленинградское шоссе, д. 16А, стр. 4, 2-ой этаж ТЦ «МЕТРОПОЛИС»	+7 (495) 021-17-55	http://www.hyundai-avilon.ru/city_store_avilon/	1	44
2	Аванта Коломна	г. Коломна, Московская область, Коломенский район, 100-й км автодороги М5 	+7 (495) 287-76-76	http://www.hyundai-avanta-kolomna.ru	1	44
3	АВАНТАЙМ СП	г. Сергиев Посад, Новоугличское ш., д. 87	+7 (495) 921-02-02	http://hyundai-avantime.ru/	1	44
4	Аврора	г. Серпухов, Московское шоссе, д. 72	+7 (495) 902-75-75	http://www.hyundai-aurora.ru/	1	44
5	Авто-Лидер на Шефской	Г. Екатеринбург, ул. Шефская, 2Г/2	+7 (343) 270-60-60	http://hyundai-alshef.ru/	1	23
6	АвтоГЕРМЕС	г. Москва, ш. Энтузиастов, д. 59	+7 (495) 223-89-46	http://www.hyundai-avtogermes.ru	1	44
7	Автоимпорт	г. Рязань, Московское шоссе, д. 22 «Б» 	+7 (4912) 70-00-07	http://www.hyundai-avtoimport.ru 	1	73
8	АвтоЛига Ярославль	Ярославская обл., Ярославский р-н,п. Нагорный, д. 8	+7 (4852) 67-27-27	http://hyundai-avtoliga.ru/	1	107
9	Автомастер	г. Пенза, ул. Ульяновская 56А	+7 (8412)45-50-50	http://hyundai-avtomaster.ru/	1	65
10	Автомир	г. Воронеж, ул.Дорожная, д.11Б	+7 (473) 233-15-15	http://hyundai-avtomir-vrn.ru/	1	20
11	Автомир	г. Новокузнецк, ул. Рудокопровая, д. 22А	+7 (3843) 910-910	http://hyundai-avtomir-nvk.ru/	1	54
12	Автополе	Ленинградская обл., Всеволожский р-н, д. Кудрово, 13 км а/д 	+7 (812) 607-77-77	http://www.hyundai-autopole.ru/	1	75
13	Авторай-Заволжье	г. Ульяновск, ул. Наганова, д. 14	+7 (8422) 27-08-27	http://www.hyundai-avtoray.ru/	1	96
14	Авторусь Бутово	г. Москва, Южное Бутово, Чечерский проезд, д. 1	+7 (495) 716-08-09	http://hyundai-avtorus.ru/	1	44
15	Авторусь Лосиный Остров	г. Москва, 95км МКАД, Ярославское шоссе вл.2В, стр.3	+7 (495) 135-49-91	http://hyundai-losinyostrov.ru/	1	44
16	Авторусь Подольск	г. Подольск, Московская обл., пр-т Юных Ленинцев, д. 1И, стр. 2	+7 (495) 276-34-34	http://www.hyundai-avtorus.ru/	1	44
17	Автосалон-2000	г. Орск, 234 м трассы Орск-Оренбург	+7 (3537)340099	http://hyundai-autosalon2000.ru/	1	64
18	Автоцентр Кемерово	г. Кемерово, пр. Октябрьский, 2а	+7 (3842) 45-01-01	http://www.hyundai-kemerovo.ru/	1	31
19	Автоцентр на Шаляпина	г. Улан-Удэ, ул. Шаляпина, д. 39	+7 (301) 255-30-24	http://hyundai-fregat.ru/	1	95
20	Автоцентр Сити Юг	Москва, Внешняя сторона МКАД, 22км.	+7 (495) 6-600-400	http://hyundai-avtocity.ru/	1	44
21	Автоцентр-М	г. Симферополь, улица Киевская, 187-В	+7 (978) 835-70-07	http://www.hyundai-avtocenter.ru	1	80
22	АГ-Моторс Балашиха	г. Балашиха, Московская обл, ш. Энтузиастов, д. 12а	+7 (495) 961-28-70	http://www.hyundai-avtogermes.ru/	1	44
23	АГАТ	Республика Мордовия, г. Саранск, Пр-кт 70 лет Октября, д. 86а	+7 (8342) 47-00-00	http://www.hyundai-agat13.ru/	1	76
24	АГАТ на Ларина	г. Нижний Новгород, ул. Ларина, д. 23 	+7 (831) 200-00-00	http://www.hyundai-agat.ru	1	52
25	АГАТ на Московском шоссе	г. Нижний Новгород, Московское шоссе, д. 294 б	+7 (831) 200-00-00	http://www.hyundai-agat.ru	1	52
26	АГАТ на пр.Ленина 	г. Волгоград, пр. Ленина, д. 118 Б	+7 (8442) 72-27-22	http://www.hyundai-agat34.ru	1	17
27	АГАТ на ш.Авиаторов	г. Волгоград, шоссе Авиаторов, д. 2 А	+7 (8442) 72-27-22	http://www.agat34-hyundai.ru	1	17
28	Акрос	г. Москва, ул. Академика Королева, д. 13	+7 (495) 223-23-35	http://www.hyundai-akros.ru/	1	44
29	Альфа-Сервис	г. Уфа, ул. Электрозаводская, д. 18/2	+7 (347) 286-77-77	http://www.hyundai-alfa.ru/	1	97
30	Арена Авто	г. Тольятти, Южное шоссе, д. 32	+7 (8482) 270-600	http://www.hyundai-arena.ru/	1	91
31	Арконт М	Волгоградская обл., г. Волжский, пр-т им. Ленина, д. 359	+7 (8443) 51-78-78	http://hyundai-arkont.ru/	1	18
32	Блок Роско	г. Иваново, ул. Загородная, д. 26	+7 (4932) 93-96-46	http://www.hyundai-block-rosko.ru	1	24
33	Важная персона - Авто	г.Тверь, Московское шоссе д.21	8 (4822) 74-74-77	http://www.hyundai-vip.ru/	1	90
34	Восток Моторс	г. Тюмень, ул. Алебашевская, д. 11	+7 (3452) 52-17-00	http://www.hyundai-vostokmotors.ru 	1	94
35	Восток Моторс	г. Пермь, ш. Космонавтов, д. 316В	+7 (342) 254-44-44	http://hyundai-vm.ru/	1	66
36	ВостокевроТехника	Республика Саха (Якутия), г. Якутск, Вилюйский тракт 3 км д.53	+7 (914) 271-13-53	http://hyundai-vet.ru/	1	106
37	ГК Мир	г. Нефтекамск, Республика Башкортостан, ул. Янаульская, д. 12Б; Индекс: 452681	+7 (34783) 2-23-15	http://hyundai-gkmir.ru/	1	49
38	ДАВ-АВТО	г. Пермь, ул. Героев Хасана, д. 76	+7 (342) 246-26-06	http://www.hyundai-dav-auto.ru/	1	66
39	Евразия плюс	г. Омск, ул. Димитрова, д. 75	+7 (3812) 33-00-99, +7 (3812) 33-09-11, +7 (3812) 33 00 99	http://www.hyundai-eurasia.ru	1	61
40	Иравто	г. Владикавказ, Московское шоссе, д. 2	+7 (8672) 282-343	http://hyundai-irauto.ru/	1	15
41	К-Моторс	г. Петрозаводск, Лесной проспект, д.55	+7 (8142) 59-33-93	http://www.hyundai-kmotors.ru/	1	67
42	КАН АВТО	г. Казань, ул.Сибирский тр. 51	+7 (8432) 230-30-30	http://www.hyundai-kanavto.ru	1	28
43	КОМОС-Авто	г. Ижевск, ул. Пушкинская, 62	+7 (3412) 905-555	http://www.hyundai-komos-auto.ru/	1	25
44	Лаки Моторс	г. Екатеринбург, ул. Селькоровская, д.22	+7 (343) 228-21-21	http://www.hyundai.luckymotors.ru/	1	23
45	Лидер Авто	г. Кострома, ул. Локомотивная,  д. 2В,  Индекс: 156019	+7 (4942) 49-62-22	http://www.hyundai-leaderavto.ru	1	34
46	Лидер Авто	г.Грозный, проспект Кирова, д.13	+7 (928) 888-56-56	http://hyundai-lideravto.ru/	1	21
47	Максимум	г. Санкт-Петербург, ул. Руставели, д. 53	+7 (812) 777-70-02	http://hyundai-maximum.ru/	1	75
48	Мотом	г. Ульяновск, ул. Московское шоссе, д. 102	+7 (8422) 27-22-77	http://www.hyundai-motom.ru	1	96
49	Октан-В	г. Смоленск , Краснинское шоссе, д. 37а	+7 (4812) 61-92-22	http://www.hyundai-oktanv.ru	1	81
50	Планета Авто	г. Челябинск, Копейское шоссе, д. 82	+7 (351) 272-07-20	http://www.hyundai-planeta-avto.ru/	1	100
51	Регион 62	г. Рязань, Куйбышевское шоссе, д. 51	+7 (4912) 77-77-62	 http://hyundai-region62.ru	1	73
52	Ринг Авто	г. Воронеж, ул. Изыскателей, д. 39, корп. 2	+7 (473) 261-77-77	http://www.hyundai-ringauto.ru/	1	20
53	Ринг Авто	г. Липецк, ул. 50 лет НЛМК, строение 24, офис 1	8(4742) 72-77-77	http://hyundai-ringauto-lip.ru/	1	39
54	Ринг Авто Оскол	г. Старый Оскол, Белгородская область, проспект Алексея Угарова, д. 22	+7 (4725) 46-00-22	http://hyundai-oskol.ru/	1	84
55	Ринг Авто Север	Воронежская обл., Рамонский район, п. Солнечный, Западная промзона, участок 2/2	+7 (473) 347-77-77	http://hyundai-ringsever.ru/	1	20
56	Рольф Алтуфьево	г. Москва, Алтуфьевское ш., д. 31, корп. 1	+7 (495) 755-88-44	http://www.rolf-hyundai.ru	1	44
57	Рольф Октябрьская	г. Санкт-Петербург, Октябрьская набережная, 8, к.2	+7 (800) 250-41-41	http://www.hyundai-rolfoct.ru/	1	75
58	Рольф Химки	г. Химки, Ленинградское шоссе, вл. 21	+7 (495) 788-48-88	http://www.rolf-hyundai.ru	1	44
59	Сатурн-Р	г. Курган, пр. Конституции, д.35	+7 (3522) 64-11-33	http://hyundai.saturn-r.ru/	1	37
60	Северный	г. Вологда, ул.Маршала Конева, 43	+7 (8172) 75 09 99	http://www.hyundai-severnyj35v.ru/	1	19
61	Сибкар+	г. Нижневартовск, ул. Кузоваткина, д. 26, стр. 1	+7 (3466) 27-11-88	http://hyundai-sibcarplus.ru	1	50
62	СИМ	г. Москва, Варшавское ш., д. 26, стр. 11 	+7 (495) 725-47-67	http://www.hyundai-sim.ru	1	44
63	СИМ Ярославль	г. Ярославль, Полушкина роща, д. 21	+7 (4852) 58-20-40	http://www.hyundai-yaroslavl.ru	1	107
64	Сокол Моторс	 г. Шахты, ул. Дачная, д. 272 Б	+7 (8636) 28-30-30	http://www.hyundai.sokolmotors.ru/	1	103
65	Сура-Моторс	г. Пенза, ул. Беляева, д. 2в	+7 (8412) 20-00-99	http://www.hyundai.sura-motors.ru	1	65
66	Тамбов-Авто	г. Тамбов, ул. Киквидзе, д. 85 В	+7 (4752) 73-41-00	http://www.hyundai-tambovavto.ru	1	89
67	Темп Авто	г. Аксай, Ростовская область, ул. Западная, д. 37в	+7 (863) 268-88-88, +7 (863) 268-87-07	http://www.hyundai-tempauto.ru/	1	72
68	ТрансТехСервис	г. Уфа, ул. Жукова, д. 34	+7 (347) 293-63-63	http://hyundai.tts.ru	1	97
69	ТрансТехСервис	г. Казань, проспект Победы, д. 194	+7 (843) 519-48-20	http://hyundai.tts.ru	1	28
70	ТрансТехСервис	г. Чебоксары, Марпосадское шоссе, д. 29	+7 (8352) 24-02-05	http://hyundai-tts.ru	1	99
71	ТрансТехСервис	г. Альметьевск ул. Советская, д. 43	+7 (8553) 39-21-21	http://www.hyundai-tts.ru/	1	2
72	Феникс Моторс	г. Санкт-Петербург, Пискарёвский пр., д. 2, к. 3, литера А	+7 (812) 331-51-51	http://hyundai-phoenix.ru/	1	75
73	Форсаж	г. Санкт-Петербург, Выборгское шоссе, д.27, к.2, лит. Б	+7 (812) 245-28-59	http://www.hyundai-forsage.ru/	1	75
74	Хёндэ Центр Автохолдинг	г. Краснодар, Тургеневское шоссе, 20	+7 (861) 297-44-44	http://www.hyundai-autoholding.ru/	1	35
75	Хендэ Центр Кунцево	г. Москва, ул. Горбунова, д. 14	+7 (495) 933-40-33	http://www.hyundai-kuntsevo.ru	1	44
76	Центр Зеленоград	Московская область, Солнечногорский р-н, рабочий поселок Ржавки, микрорайон №2, строение 14	+7 (495) 775-44-00	http://hyundai-zel.ru/	1	44
77	Центр КОМИ	г. Сыктывкар, Сысольское ш., д. 39	+7 (8212) 22-29-99	http://hyundai-komi.ru/	1	87
78	ЭКСПЕРТ АВТО	Оренбургский район, п. Весенний, ул. Весенняя, д. 5/1	+7 (3532) 99-00-99	http://www.hyundai-expertavto.ru/	1	63
79	Эксперт-Авто	г. Новосибирск, ул. Богдана Хмельницкого 75/1	8 (383) 363-22-99	http://hyundai-expert-auto.ru/	1	57
80	Юг-Авто	г. Новороссийск, с. Владимировка, Приморский округ, р-н автотрассы «Kраснодар-Hoвoроссийск»	+7 (8617) 30-11-01	http://hyundai.yug-avto.ru	1	56
81	Юг-Авто	г. Краснодар, п. Яблоновский, ул. Краснодарская, д. 3	+7 (861) 210-44-00	http://www.hyundai.yug-avto.ru/ 	1	35
82	Genser Новоясенево	г. Москва, Новоясеневский пр-т, д. 6	+7 (495) 788-58-58	http://www.hyundai-genser.ru	1	44
83	Major	г. Москва, ул. Маршала Прошлякова, д. 13	+7 (495) 739-03-03	http://www.hyundai-major.ru/	1	44
84	Major МКАД 18 км	140090, Московская область, г. Дзержинский, ул. Алексеевская, д. 12	+7 (495) 730-09-90	http://www.hyundai-major.ru/	1	44
85	Major МКАД 47 км	142784, г. Москва, пос. Московский, дер. Говорово, МКАД 47	+7 (495) 730-00-09	http://www.hyundai-major.ru/	1	44
86	ААА моторс	г. Ростов-на-Дону, ул. Текучева, д. 352Б	+7 (863) 201-33-33	http://www.hyundai-aaamotors.ru	1	72
87	Аванта-Запад	г. Москва, Аминьевское ш., д. 1А	+7 (495) 287-77-77	http://www.hyundai-avanta.ru	1	44
88	Авилон	г. Москва, Волгоградский проспект, д. 41/2	+7 (495) 730-44-33	http://www.hyundai-avilon.ru/	1	44
89	АВН	г. Великий Новгород, ул. Большая Санкт-Петербургская, д. 41, к. 7	+7 (8162) 64-99-99	http://www.hyundai-avn.ru	1	13
90	Авто Брокер Мурманск	г. Мурманск, пр. Кольский, д. 53	+7 (8152) 63-66-36	http://hyundai-abm.ru/	1	46
91	Авто-Лидер Центр	г. Екатеринбург, проспект Космонавтов, д. 8	+7 (343) 216-02-87, +7 (343) 216-02-88, +7 (343) 216-02-89	http://www.hyundai-al.ru	1	23
92	Автокласс-Лаура	г. Тула, ул. Новомосковское шоссе, д. 15	+7 (4872) 50-20-30	http://www.hyundai-tula.ru	1	93
93	Автоком	г. Йошкар-Ола, Республика Марий Эл, ул. Карла Либкнехта, д. 108	+7 (8362) 64-60-60	http://www.hyundai-avtokom.ru 	1	27
94	АвтоМакс	г. Тюмень, ул. Республики, д. 287	+7 (3452) 66-61-50	http://www.hyundai-automax.ru	1	94
95	Автомир	г. Брянск, пр-т Станке Димитрова, д. 114	+7 (4832) 58-95-85	http://hyundai-avtomir-br.ru/	1	12
96	Автомир	г. Новосибирск, проезд Энергетиков, д. 4	+7 (383) 210-50-60	http://www.hyundai-avtomir-nsk.ru/	1	57
97	Автомир Дмитровка	г. Москва, Дмитровское шоссе, д. 98, стр. 1	+7 (495) 956-25-52	http://www.hyundai-avtomir.ru	1	44
98	Автомир Марьино	Москва, ул. Перерва, д. 19, таксопарк № 6	+7 (495) 956-11-44	http://www.hyundai-avtomir.ru	1	44
99	Автомир Сокольники	г. Москва, ул. Краснобогатырская, д. 2, стр. 26	+7 (495) 223-22-11	http://www.hyundai-avtomir.ru/	1	44
100	Автосалон Арго	г. Самара, ул. Ново-Садовая, д. 149 А	+7 (846) 263-00-00	http://www.hyundai-argo.ru/	1	74
101	АвтоСпецЦентр Внуково	г. Москва, Киевское шоссе, 5 км от МКАД	+7 (495) 660-44-44	http://www.hyundai-vnukovo.ru	1	44
102	Автофан	г. Тольятти, ул. Ленина, д. 44, стр.1	+7 (8482) 27-04-70, +7 (8482) 27-05-70	http://hyundai.avtofan.ru	1	91
103	Автоцентр Genser	г. Белгород, просп. Б. Хмельницкого, д. 182	+7 (4722) 37-61-36, +7 (4722) 37-61-16	http://hyundai-belgorod.genser.ru/	1	8
104	Автоцентр АНТ	г. Барнаул, ул. Павловский тракт, д. 251д	+7 (3852) 29-00-20	http://hyundai-ant22.ru	1	6
105	АГАТ	г. Саратов, ул. Симбирская, д. 154	+7 (8452) 43-00-44	http://www.hyundai-agat64.ru	1	77
106	АГАТ на Родионова	г. Нижний Новгород, ул. Родионова, д. 203	+7 (831) 200-00-00	http://www.agat-hyundai.ru	1	52
107	АГАТ-Плюс	г. Астрахань,1-ый проезд Рождественского, д. 6	+7 (8512) 48-28-28	http://hyundai-agatplus.ru/	1	5
108	Акцент-Авто Москва	г. Москва, ул. Полбина, д. 29, стр. 1	+7 (495) 363-91-90, +7 (495) 363-91-91	http://www.hyundai-accentauto.ru	1	44
109	Арт-Моторс	г. Уфа, проспект Салавата Юлаева, 60	+7 (347) 246-57-00	http://hyundai-art-motors.ru/	1	97
110	Атик-Моторс	г. Благовещенск, Новотроицкое ш., д. 12	+7 (4162) 77-37-77	http://www.hyundai-atic.ru	1	10
111	Возрождение	г. Орел, Наугорское шоссе, д. 108а	+7 (4862) 49-54-00	http://www.hyundai-vozrojdenie.ru	1	62
112	Восток	г. Владивосток, ул. Лесная, д. 1В	+7 (423) 207-70-77	http://www.hyundai-vostok.ru/	1	14
113	Восток - Моторс Новокузнецк	г. Новокузнецк, ул. Фестивальная, 23	+7 (3843) 450-777	http://hyundai.vostokmotors42.ru/	1	54
114	Восток-Авто	г. Санкт-Петербург, ул. Бухарестская, д. 1	+7 (812) 612-97-60	http://www.hyundai-vostokavto.ru	1	75
115	Восток-Авто Жукова	г. Санкт-Петербург, ул. Портовая, д. 15, лит. Б	+7 (812) 748-35-82	http://hyundai-vostokavto.ru/	1	75
116	Восток-Моторс Кемерово	г. Кемерово, ул. Юрия Двужильного, д.3	+7 (3842) 77-77-75	http://hyundai.vostokmotors42.ru/	1	31
117	Дакар Невский 	г. Санкт-Петербург, ул. Кржижановского, д. 15, корп. 2	+7 (812) 327-00-00	http://www.hyundai-dacar.ru	1	75
118	Дакар Пулковское	г. Санкт-Петербург, Пулковское шоссе, д. 44/1, лит. А	+7 (812) 327-00-00	http://www.hyundai-dacar.ru	1	75
119	Дельта Моторс	г. Ростов-на-Дону, ул. Малиновского, д. 172/3а	+7 (863) 333-22-00	http://www.hyundai-deltamotors.ru/	1	72
120	Динамика	г. Архангельск, Московский проспект, д. 48	+7 (8182) 42-24-22	http://www.hyundai-dynamica.ru	1	4
121	Динамика	г. Калининград, ул. Дзержинского, д. 130	+7 (4012) 77-75-20	http://www.hyundai-kaliningrad.ru	1	29
122	Дрим Кар	г. Ставрополь, пр. Кулакова, д. 33	+7 (8652) 38-38-78	http://hyundai-dream-car.ru/	1	83
123	Истен Моторс	г. Челябинск, Свердловский тракт, д. 5	+7 (351) 211-02-20	http://hyundai-istenmotors.ru/	1	100
124	Калуга-Авто	г.Калуга, ул.Зерновая, д.17	+7 (4842) 22-20-02	http://www.hyundai-kalugaauto.ru	1	30
125	КАН АВТО	г. Казань, Оренбургский тракт, д. 209	+7 (843) 230-30-30	http://www.hyundai-kanavto.ru/	1	28
126	Каскад-М	Оренбургская обл., Оренбургский район, п. Пригородный, 13-й км шоссе 	+7 (3532) 91-01-04	http://hyundai-kaskad.ru/	1	63
215	Автоцентр Аврора, Кубинская	ул. Кубинская, д. 4	+7 (812) 325-01-25	http://aa-kia.ru	2	75
127	КВИСТ	Московская область, г. Мытищи, Волковское шоссе, д. 17	+7 (495) 582-42-32	http://www.hyundai-kvist.ru	1	44
128	КЛЮЧАВТО	г. Сочи, ул. Кипарисовая, д. 16/1	+7 (862) 255 88 00	http://www.hyundai.keyauto.ru/	1	82
129	КЛЮЧАВТО	г. Краснодар, ул. Аэропортовская, д. 4	+7 (861) 227-77-22	http://www.hyundai.keyauto.ru/	1	35
130	КЛЮЧАВТО	г. Минеральные воды, ул. Автомобильная, д. 3	+7 (87922) 5-62-62	http://www.hyundai.keyauto.ru/	1	43
131	КОМОС-Авто	г. Ижевск, ул. Воткинское шоссе, д. 17В	+7 (3412) 90-50-00	http://www.hyundai-komos-auto.ru	1	25
132	Медведь	г. Абакан, кв-л  Молодежный, д. 2В	+7 (3902) 21-75-01	http://hyundai-abakan.ru/	1	1
133	Медведь-СеверАвто	г. Красноярск, Северное шоссе, д. 19д	+7 (391) 220-41-41	http://www.hyundai-krasnoyarsk.ru/	1	36
134	Модус	г. Липецк, ул. Московская, стр. 34	+7 (4742) 51-55-16	http://hyundai-modus.ru/	1	39
135	Модус	г. Краснодар, ул. Дзержинского, д. 229/5	+7 (861) 217-02-17	http://hyundai-modus.ru/	1	35
136	Модус	г. Ростов-на-Дону, ул. Каширская, д. 8/5 	+7 (863) 292-02-92	http://hyundai-modus.ru/	1	72
137	Модус	г. Воронеж, 3 км автодороги 	+7 (473) 233-30-05	http://hyundai-modus.ru/	1	20
138	Модус 	г. Ставрополь, Старомарьевское шоссе, д. 8 Б	+7 (8652) 28-28-28	http://www.hyundai-modus.ru	1	83
139	Модус	г. Ростов-на-Дону, просп. Шолохова, д. 312	+7 (863) 292-02-92	http://hyundai-modus.ru	1	72
140	Модус	г. Пятигорск, ул. Ермолова, д. 48	+7 (8793) 39-96-66	http://hyundai-modus.ru/	1	71
141	Модус	г. Новороссийск, 9 км трассы 	+7 (8617) 60-72-60	http://www.hyundai-modus.ru/	1	56
142	НАС-2	г. Псков, ул. Труда, д. 26	+7 (8112) 29-02-32	http://www.hyundai-nas.ru	1	70
143	Нижегородец	г. Нижний Новгород, Московское шоссе, д. 34	+7 (831) 275-99-52	http://www.hyundai.nnmotors.ru	1	52
144	Оками Восток	г. Екатеринбург, ул. Сибирский тракт, д. 30	+7 (343) 222-22-20	http://www.hyundai-okami.ru	1	23
145	Оками Запад	г. Екатеринбург, ул. Металлургов, д. 80	+7 (343) 222-21-21	http://www.hyundai-okami.ru	1	23
146	Оками Тагил	г. Нижний Тагил, Восточное шоссе, д. 3	+7 (3435) 47-18-00	http://www.hyundai-okami.ru	1	53
147	ОренРОЛЬФ	г. Оренбург, ул. Волгоградская, д. 5	+7 (3532) 34-80-08; +7 (3532) 34-80-10	http://www.hyundai-orenrolf.ru 	1	63
148	Орехово-АвтоЦентр	г. Орехово-Зуево, Московская область, ул. Красина, д. 4	+7 (495) 115-35-11	http://www.hyundai-orehovo.ru	1	44
149	Орион Авто	г. Курск, ул. 50 лет Октября, д. 185	+7 (4712) 73-03-00	http://hyundai.orion-kursk.ru	1	38
150	Прайм Моторс	г. Череповец, Солманское, стр. 11 В	+7 (8202) 60-26-26	http://hyundai-primemotors.ru/	1	101
151	Регинас	г. Магнитогорск, ул. Зеленый Лог, д. 53/1	+7 (3519) 49-04-40, +7 (3519) 41-85-18	http://hyundai-reginasmag.ru/	1	40
152	Регинас	г. Челябинск, ул. Бр. Кашириных, д. 141А	+7 (351) 239-52-20	http://hyundai-reginas.ru/	1	100
153	РОЛЬФ Лахта	г. Санкт-Петербург, ул. Савушкина, д. 103	+7 (812) 335-67-70	http://www.hyundai-rolflahta.ru/	1	75
154	Рольф Сити	г. Москва, Ярославское шоссе, д. 31	+7 (495) 788-53-53	http://www.rolf-hyundai.ru	1	44
155	Рольф Юг	Москва, ул. Обручева, д. 27, к. 1	+7 (495) 755-55-05	http://www.rolf-hyundai.ru	1	44
156	РТР-Авто	г. Москва, г. Красногорск, Новорижское шоссе, 5 км от МКАД	+7 (495)785-54-88	http://www.hyundai-rtr.ru	1	44
157	Самарские Автомобили	г. Самара, Южное шоссе, д. 12	+7 (846) 993-68-00	http://www.hyundai-samavto.ru	1	74
158	Сибкар	г. Сургут, Набережный пр-кт, д. 7, корп. 1	+7 (3462) 23-02-04	http://hyundai-sibcar.ru	1	86
159	Сибкар Север	г. Сургут, ул. Профсоюзов, д. 58, стр. 1	+7 (3462) 21-60-00	http://www.hyundai-sibcar.ru/	1	86
160	Сильвер Моторс	г. Пермь, ул. Спешилова, д. 109	+7 (342) 250-78-00	http://www.hyundai-silver.ru	1	66
161	Техцентр Гранд	г. Владимир, ул. Растопчина, д. 24	+7 (4922) 37-98-88	http://www.hyundai-grandtech.ru	1	16
162	ТрансТехСервис	г. Казань, Республика Татарстан, ул. Декабристов, д. 81 В	+7 (843) 519-48-90	http://hyundai-tts.ru/	1	28
163	ТрансТехСервис	г. Стерлитамак, Республика Башкортостан, пр. Ленина, 2И	+7 (3473) 43-00-51	http://www.hyundai-tts.ru	1	85
164	ТрансТехСервис	г. Уфа, ул. Рубежная, д. 180	+7 (347) 292-44-11	http://hyundai-tts.ru	1	97
165	ТрансТехСервис	г. Набережные Челны, Автодорога №1, Орловское кольцо	+7 (8552) 39-25-25	http://hyundai.tts.ru	1	47
166	ТСК Мотор	г. Киров, ул. Московская, д. 106 а	+7 (8332) 66-30-00	http://www.hyundai-tskmotor.ru	1	32
167	Феникс-Авто	г. Омск, ул. 10-лет Октября, д. 182	+7 (3812) 92-50-10, +7 (3812) 92-50-20	http://www.hyundai-fenixauto.ru	1	61
168	Хендэ Центр Иркутск	г. Иркутск, ул. Дыбовского, д. 17	+7 (3952) 50-05-77	http://hyundai-interline.ru/ 	1	26
169	Хендэ-центр Красноярск	г. Красноярск, ул. Караульная, д. 33 	+7 (391) 222-22-23	http://www.hyundai-krsk.ru	1	36
170	Эксперт-Авто	г. Самара, ул. Демократическая, д. 55	+7 (846) 321-00-00	http://www.hyundai-expertauto.ru	1	74
171	Элвис	г. Саратов, Московское шоссе, д. 116	+7 (8452) 25-99-90	http://www.hyundai-elvis.ru	1	77
172	Элвис Покровск	г. Энгельс, Саратовская обл., ул. Степная, д. 124 А	+7 (8453) 76-76-15, +7 (8452) 76-77-55	http://www.hyundai-elvis.ru/	1	104
173	Элке Мотор	г. Томск, ул. Елизаровых, д. 82	+7 (3822) 90-88-90	http://www.hyundai-elkemotor.ru/	1	92
174	Юг-Авто	г. Краснодар, Краснодарский край, ул. Дзержинского, 229/1	+7 (861) 210-44-00	http://hyundai.yug-avto.ru	1	35
175	Genser Волоколамское	г. Москва, Волоколамское шоссе, д. 95	+7 (495) 785-72-72	http://www.hyundai-genser.ru	1	44
176	Genser Новорязанское	г. Москва, Новорязанское шоссе, д. 1Г	+7 (495) 780-62-62	http://www.hyundai-genser.ru	1	44
177	ИРБИС СЕВЕР	Студеный пр-д, 7Б - 90км МКАД, внутренняя сторона	+7 (495) 644-18-18	http://irbis.kia.ru/	2	44
178	АВТОРУСЬ ПОДОЛЬСК	Подольск, просп. Юных Ленинцев, д.1и, стр. 1	+7 (495) 276-23-23	https://www.kia-avtoruss.ru	2	44
179	АВТОСПЕЦЦЕНТР КАШИРКА 39	115409, Каширское шоссе, д. 39, корп. 1	+7 (495) 967-94-77	http://www.kia-asc.ru/	2	44
180	АвтоГЕРМЕС Ярославское ш.	ул. Красная Сосна, д. 3, стр. 1	+7 (495) 789-86-28	http://kia-avtogermes.ru	2	44
181	AA Major Auto МКАД 47 км	МКАД 47 км	+7 (495) 232-00-44	http://www.major-kia.ru/	2	44
182	AA Major Auto Новорижский	Новорижское шоссе, 8 км от МКАД.	+7 (495) 737-77-75	http://www.major-kia.ru/	2	44
183	AA Мajor Auto	ул. Псковская, д.13	+7 (495) 229-20-88	http://www.major-kia.ru/	2	44
184	FAVORIT MOTORS Варшавское шоссе	1-й Дорожный проезд дом 4, строение 1 (Варшавское ш.)	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
185	FAVORIT MOTORS Ленинградское шоссе	ул. Коптевская, д. 69А стр.2	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
186	FAVORIT MOTORS Ленинский проспект	Ленинский пр-кт, д. 146	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
187	FAVORIT MOTORS МКАД Реутов	Реутов, 2-3-ий км МКАД, д. 7	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
188	FAVORIT MOTORS Рязанское шоссе	Люберцы, Рязанское шоссе д. 46, (п.Томилино, Лит 2С)	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
189	FAVORIT MOTORS Шоссе Энтузиастов	ул. Большая Семеновская, д. 42, строение 4	+7 (495) 308-96-62	https://kia.favorit-motors.ru	2	44
190	KIA NATC GROUP	Ногинск, Горьковское шоссе, 59 км	+7 (495) 926-03-02	http://kia.natc-group.ru	2	44
191	Аванта-Зеленоград	г.Москва, г.Зеленоград, 37км Ленинградского шоссе (17 км от МКАД)	+7 (495) 983-03-83	http://www.kia-zelenograd.ru/	2	44
192	Авто-Старт 15 км МКАД	15 км МКАД (внешняя сторона) ул. Энергетиков, 24	+7 (495) 225-23-53	http://www.avto-start-kia.ru	2	44
193	АвтоГЕРМЕС Рябиновая ул.	Рябиновая ул., д. 43Б	+7 (495) 789-86-28	http://kia-avtogermes.ru	2	44
194	АвтоГЕРМЕС Рязанский проспект	Москва, Рязанский проспект, дом 2, стр. 27	+7 (495) 789-86-28	http://kia-avtogermes.ru	2	44
195	Автомир Крылатское	ул.Крылатская, д.35 строение 1А	+7 (495) 228-98-98	http://avtomir.kia.ru	2	44
196	Автомир Щелковская	ул. Иркутская, д.5/6, стр.1	+7 (495) 925-50-60	http://avtomir.kia.ru	2	44
197	АВТОРУСЬ БУТОВО	117042, Южное Бутово, Чечерский проезд, 1	+7 (495) 717-07-07	https://kia-butovo.ru/	2	44
198	АВТОСПЕЦЦЕНТР МАРЬИНО	109469, ул. Марьинский парк, д.1	+7 (495) 792-39-93	http://www.kia-asc.ru	2	44
199	АВТОСПЕЦЦЕНТР СЕВЕР Дмитровское ш.	127644, ул. Клязьминская, д.5	+7 (495) 287-08-95	http://www.kia-asc.ru/	2	44
200	АВТОСПЕЦЦЕНТР СТОЛИЦА (м.Дубровка)	115088, 2-я ул. Машиностроения, д.6	+7 (495) 740-02-20	http://www.kia-asc.ru/	2	44
201	Автоцентр на Волгоградке	Волгоградский проспект, д.32, к.7	+7 (495) 363-93-43	http://vist-motors.kia.ru	2	44
202	АГАЛАТ АВТО Сущевский вал	г.Москва, Сущевский вал, д.5, стр.18	+7 (495) 710-72-62	http://agalat.kia.ru/	2	44
203	Арманд	Москва, Гостиничный пр., д. 10А, стр.1	+7 (495) 956-44-44	http://armand.kia.ru	2	44
204	Вист-Авто	Домодедовский район,Трасса М-4 «ДОН» 12 км от МКАД	+7 (495) 926-25-25	http://vistauto.kia.ru/	2	44
205	ИРБИС Юго-Запад	44-км. МКАД, внешняя сторона	+7 (495) 644-18-18	http://irbis.kia.ru	2	44
206	Киа Аванта-Коломна	Коломенский район, вблизи с. Никульское, 100-й км автодороги М5 "Урал"	+7 (495) 287-65-65	http://avanta.kia.ru	2	44
207	КИА ЦЕНТР АГАЛАТ Ярославское ш.	г.Мытищи, 9-ый Ленинский переулок, д.11	+7 (495) 582-42-82	http://agalat.kia.ru/	2	44
208	КИА Центр Шереметьево	Химки, Ленинградское шоссе, 3 км от МКАД, владение 7	+7 (495) 780-01-00	http://sheremetyevo.kia.ru	2	44
209	КОМПАНИЯ-Т	г. Орехово-Зуево, Малодубенское шоссе, д. 24	+7 (496) 424-30-00	http://t-company.kia.ru	2	44
210	СИМ на Калужской	ул. Введенского, 4а	+7 (495) 737-47-19	http://sim.kia.ru/	2	44
211	У Сервис+ на Волоколамском шоссе	125476, ул.Василия Петушкова, д.3, к.2	+7 (495) 258-47-77	http://www.uservice.kia.ru	2	44
212	Автоцентр Автопродикс	ул. Ушинского, д. 12	+7 (812) 325-20-20	http://kia.autoprodix.ru/	2	75
213	ТСК «Автомир-Санкт-Петербург»	Дунайский проспект, д. 25, к. 3А	+7 (812) 320-22-00	http://avtomir-spb.kia.ru/	2	75
214	Аларм-Моторс Киа	ул. Савушкина, д.108	+7 (812) 777-27-77	http://www.alarm-kia.ru/	2	75
216	Автоцентр Аврора, Софийская	ул. Софийская, д. 2, лит. Б.	+7 (812) 325-20-25	http://aa-kia.ru	2	75
217	Автоцентр Аврора, Стартовая	Стартовая д.4 лит. А	+7 (812) 325-52-25	http://aa-kia.ru	2	75
218	Автоцентр Василеостровский	В.О., ул. Уральская, д. 33	+7 (812) 676-22-22	http://www.vasauto-kia.ru/	2	75
219	Аларм-Моторс KIA Юго-Запад	пр. Маршала Жукова, 51	+7 (812) 777-27-77	http://www.alarm-kia.ru/	2	75
220	ДАКАР Kia Лахта	Богатырский проспект, 16	+7 (812) 327-00-00	http://dacar-kia.ru	2	75
221	ДАКАР Kia Московский	ул. Камчатская, 9А	+7 (812) 327-00-00	http://dacar-kia.ru	2	75
222	МАКСИМУМ	Непокоренных проспект,47	+7 (812) 702-33-55	http://maximum-kia.ru/	2	75
223	ПЛТ Автоцентр Купчино	ул. Малая Балканская, д. 57	+7 (812) 448-12-12	http://www.plt-kia.ru	2	75
224	Шувалово-Моторс	Выборгское шоссе, д. 31а	+7 (812) 313-30-30	http://s-m.kia.ru/	2	75
225	KIA Центр Абакан	ул. Игарская 21 С	+7 (3902) 23-03-03	http://www.kia-abakan.ru/	2	1
226	Апельсин- Авто	ул. Герцена 1Б	+7 (8553) 36-99-55	http://kia-almet.ru/	2	2
227	Автоцентр KIA Нахимовский	ул. Адмирала Нахимова, д. 76	+7 (8512) 31-73-17	http://www.kia30.ru/	2	5
228	ТехСоюзКИА	ул. 5-я Керченская, д. 4а	+7 (8512) 50-66-66	http://www.tech-soyuz.kia.ru/	2	5
229	Автоцентр «Реал»	Правобережный тракт, д. 29а	+7 (3852) 20-05-55	http://real.kia.ru	2	6
230	ООО Барнаул-Моторс К	г. Барнаул, пр-т Калинина, д. 31	+7 (3852) 22-98-98	http://barnaulmotors.kia.ru	2	6
231	СкифАвто	26-й км. трассы Ростов-Баку	+7 (863) 333-20-60	http://skif-avto.kia.ru	2	7
232	КИА Центр Тавровский	п. Таврово, мкр. Таврово 1, ул. Абрикосовая, д. 2а	+7 (4722) 57-58-54	https://tavrovsky.kia.ru	2	8
233	ТРИНИТИ МОТОРС	пр-т Б. Хмельницкого, 205 А	+7 (4722) 22-72-72	http://belgorod-kia.ru/	2	8
234	БН-Моторс	пр-т Ст. Димитрова, 62	+7 (4832) 31-23-01	http://bn-motors.kia.ru/	2	12
235	ООО «Авто-МК»	ул. Большая Санкт-Петербургская д. 173	+7 (8162) 50-07-17	http://avto-mk.kia.ru	2	13
236	ООО «Сумотори-Авто»	Приморский край, г. Артем, ул. Тульская, д. 2	+7 (423) 260-00-02	http://sumotori.kia.ru	2	14
237	Автоград	ул. Растопчина, д. 1б	+7 (4922) 44-55-55	http://avtograd-vladimir.kia.ru/	2	16
238	А.С.-Авто	шоссе Авиаторов, д. 11	+7 (8442) 60-23-33	http://asauto.kia.ru/	2	17
239	Арконт север	ул. Вильнюсская, д. 42	+7 (844) 229-25-05	http://kia-arkont.ru	2	17
240	Автоцентр Северный	Окружное шоссе, 51	+7 (817) 279-97-77	http://severnyj.kia.ru	2	19
241	Fresh Auto	4 км автодороги Воронеж-Москва, строение 2	+7 (473) 373-33-33	http://kiafreshauto.ru/	2	20
242	БОРАВТО на 9 Января	394020, ул.9 Января, 221д	+7 (473) 200-08-88	http://borauto.kia.ru	2	20
243	МОТОР ЛЕНД	ул. Изыскателей, д. 23	+7 (473) 233-33-23	http://www.kiavrn.ru/	2	20
244	Lucky Motors	ул. Щербакова, 142 а	+7 (343) 270-27-27	http://www.kia.luckymotors.ru	2	23
245	АВТОБАН-КИА	ул. Металлургов, д.67	+7 (343) 237-70-00	http://avtoban-kia.ru/	2	23
246	АСМОТО	Верхняя Пышма, ул.Петрова 59 б	+7 (343) 311-59-59	http://asmoto.kia.ru	2	23
247	КИА на РАСТОЧНОЙ	ул.Расточная, 38	+7 (343) 372-77-77	http://www.unicum-kia.ru	2	23
248	Нормандия-Авто	ул. Фрунзе, 90	+7 (493) 258-77-44	http://avtograd-normandia.kia.ru	2	24
249	АСПЭК-Авто	ул. Союзная 2В	+7 (3412) 50-55-55	http://aspec.kia.ru	2	25
250	Лео Смарт Лидер	ул. Лесозаводская д. 29	+7 (3412) 61-46-14	http://leosmart.kia.ru	2	25
251	Агат-Авто	ул.Полярная,145	+7 (395) 233-73-37	http://www.agatauto.kia.ru/	2	26
252	МАГ МОТОРС	ул. Строителей д.110	+7 (8362) 41-32-10	http://avto-5.kia.ru	2	27
253	КАН АВТО Сибирский тракт, 52	ул. Сибирский Тракт, д. 52	+7 (843) 230-30-30	http://kia.kanavto.ru/	2	28
254	ТрансТехСервис-19 KIA пр. Ибрагимова, 48	пр. Ибрагимова, 48	+7 (843) 526-75-55	http://tts-kazan.kia.ru/	2	28
255	ТрансТехСервис-7 KIA пр. Победы, 194	420025, пр-т. Победы 194	+7 (843) 519-48-55	http://tts-kazan.kia.ru/	2	28
256	ДО-КАР	Московский пр-т, 207	+7 (401) 257-73-33	http://do-car.kia.ru/	2	29
257	Корейские автомобили	ул. Зерновая, д. 28	+7 (484) 279-11-00	http://kaluga.kia.ru/	2	30
258	КИА Центр Кемерово-ЮГ	ул. Баумана, д. 57б	+7 (3842) 68-00-81	http://yug-motors.kia.ru	2	31
259	АВТОМОТОР	ул. Московская, 166	+7 (8332) 52-30-00	http://avtomotor.kia.ru/	2	32
260	КИА-Центр Киров	Труда, 90	+7 (833) 235-02-02	http://kia.kirov.ru/	2	32
261	К-Моторс	г.Кострома, ул. Сутырина, д. 2а	+7 (4942) 46-16-90	http://www.kmotors-kia.ru	2	34
262	Автохолдинг	Тургеневское шоссе, 25	+7 (861) 279-59-79	http://autoholding.kia.ru/	2	35
263	КИА НК	ул. им. Дзержинского, д. 231/Г.	+7 (861) 258-52-58	http://www.kia-krasnodar.ru	2	35
264	РВ Сервис	350912, Краснодарский край, г. Краснодар,ул. Крупской 180	+7 (861) 227-80-80	http://rvservice-kia.ru/	2	35
265	Темп Авто	Ростовское шоссе, д. 12/6	+7 (861) 212-88-12	http://kia-tempavto.ru	2	35
266	Техно Темп	ул. Бородинская, 131/1	+7 (861) 279-05-55	https://kia-kuban.ru/	2	35
267	Юг-Авто	пос. Яблоновский, ул. Краснодарская, 3, Автомобильная деревня Юг-Авто	+7 (861) 231-55-55	http://kia.yug-avto.ru	2	35
268	КИА Центр Красноярск	ул. Маерчака, 105 Г	+7 (391) 257-78-88	http://www.kiacenter-krasnoyarsk.ru	2	36
269	СИАЛАВТО	ул. Пограничников, д. 101	+7 (391) 274-90-10	http://www.kia-krasnoyarsk.ru/	2	36
270	Техноком-Инвест	ул. Омская, д. 141	+7 (3522) 64-45-55	http://www.tech-auto.kia.ru/	2	37
271	ООО «Автостиль»	305047 г. Курск, ул.Энгельса 173 е	+7 (4712) 74-04-04	http://kursk.kia.ru	2	38
272	Киа Центр Ринг	ул. 50 лет НЛМК, стр. 22а	+7 (4742) 34-77-77	http://kia-lipetsk.ru	2	39
273	Серебряный саквояж	Пр. Ленина, 113	+7 (351) 958-00-77	http://www.kia-magnitogorsk.ru	2	40
274	Урал-Авто	Белорецкое шоссе, 17	+7 (351) 922-85-07	http://www.kiamgn.ru	2	40
275	KIA Центр Автореал	Тургоякское шоссе, 5	+7 (3513) 28-79-50	http://avto-real.kia.ru	2	42
276	КИА Минеральные воды	Ставропольский край, Минераловодский р-он, х.Красный Пахарь, ул.Автомобильная, дом 13 (р-н аэропорта)	+7 (87922) 5-88-22	http://kia-kmv.ru/	2	43
277	Автомаркет	пр. Кольский, д.118	+7 (8152) 33-30-00	http://kia.am51.ru/	2	46
278	KIA Автодорога № 1, Орловское кольцо	Автодорога №1, "Орловское кольцо"	+7 (855) 239-99-11	http://tts.kia.ru	2	47
279	ООО «Сапфир»	ул.Янаульская, д.2Е.	+7 (347) 839-15-35	http://sapfir.kia.ru	2	49
280	Киа Центр Нижневартовск	ул. Авиаторов, д.25	+7 (3466) 48-11-48	http://kia-nv.ru	2	50
281	Апельсин	ул. Спортивная д.4а	+7 (8555) 32-31-31	http://apelsin.kia.ru	2	51
282	КИА на Комсомольском	ул. Комсомольское шоссе, д. 5	+7 (831) 279-40-40	http://kia-nn.com	2	52
283	БЦР МОТОРС на Новикова-Прибоя	ул. Новикова-Прибоя, 4	+7 (831) 299-99-90	http://bcr.kia.ru	2	52
284	KIA Нижегородец	ул. Ларина, д. 28б	+7 (831) 290-07-00	http://kia.nnmotors.ru/	2	52
285	БЦР МОТОРС на Гагарина	проспект Гагарина, д. 29 Д	+7 (831) 220-00-11	http://bcr.kia.ru	2	52
286	Уникум Тагил	Черноисточинское ш., д.74А	+7 (3435) 37-87-77	http://www.unicum-tagil.ru	2	53
287	Киа Центр Новокузнецк	ул. ДОЗ, 31	+7 (384) 333-70-77	http://kuzbass.kia.ru	2	54
288	КИА центр Новомосковск	ул. Космонавтов, д. 39 г	+7 (48762) 9-77-70	http://kia-nmsk.ru/	2	55
289	Новокар Мысхакское шоссе	ул. Мысхакское шоссе, 48	+7 (8617) 30-81-01	http://novocar-kia.ru	2	56
290	Новокар с.Цемдолина, ул.Промышленная	с. Цемдолина, ул. Промышленная	+7 (8617) 30-80-00	http://novocar-kia.ru	2	56
291	МЕГАПАРК	ул. Ватутина, д.46	+7 (383) 200-35-35	http://megapark.kia.ru/	2	57
292	Сармат	ул. Богдана Хмельницкого, 124	+7 (383) 363-53-63	http://sarmat.kia.ru	2	57
293	ЯМАЛ МОТОРС	Юго - Восточный промузел Панель 9В	+7 (3496) 39-44-44	http://yamal-motors.ru	2	58
294	БН-Моторс Обнинск	Киевское шоссе 25В, стр.2	+7 (48439) 7-96-08	http://bn-motors.kia.ru/	2	59
295	Автоцентр Форпост	ул. Северная, д. 19/18	+7 (34767) 5-98-00	http://auto-forpost.kia.ru	2	60
296	ООО "Барс-Запад"	644106, ул. Волгоградская, 61	+7 (381) 233-07-07	http://www.kia-bars.ru	2	61
297	КИА Центр на Лермонтова	ул. Лермонтова, д. 179 а	+7 (3812) 36-80-08	http://www.kiaomsk.ru	2	61
298	Форпост	302004, ул. Ливенская, 76	+7 (4862) 63-38-39	http://www.forpost.kia.ru/	2	62
299	Автосалон-2000	Нежинское шоссе, 9	+7 (3532) 30-50-30	http://avtosalon2000.kia.ru	2	63
300	МЕРКУРИЙ	ул. Волгоградская, д. 5	+7 (3532) 43-73-73	http://www.orenkia.ru	2	63
301	Созвездие	ул. Жуковского, д. 15	+7 (3537) 37-51-61	http://sozvezdie.kia.ru	2	64
302	Автолоцман	пр. Победы, 53	+7 (8412) 92-91-11	http://penza.kia.ru	2	65
303	Автомастер	ул. Окружная, 3	+7 (8412) 99-55-11	http://avtomaster.kia.ru	2	65
304	Вега-Моторс	шоссе Космонавтов, д. 198	+7 (342) 249-30-03	http://www.kia59.ru	2	66
305	КИА ЦЕНТР ПРИКАМЬЕ	ул.Спешилова, 75	+7 (342) 240-38-38	http://kia159.ru/	2	66
306	САТУРН-Р-АВТО	г. Пермь, Бродовский тракт, д. 1	+7 (342) 254-40-40	http://kia-perm.ru/	2	66
307	ПКФ «Слово»	Лососинское шоссе, д. 39	+7 (8142) 44-44-00	http://pkfslovo.kia.ru	2	67
308	ПЕЛИКЕН-АВТО	Северо-Восточное шоссе, д.43	+7 (4152) 30-20-02	http://peliken.kia.ru	2	68
309	КИА Центр Пятигорск	ул. Ермолова, д. 40	+7 (879) 397-61-16	http://kiakavkaz.kia.ru/	2	71
310	Автоцентр "Юг-Моторс"	г.Ростов-на-Дону, ул.Российская, 48М (р-он Аэропорта)	+7 (863) 211-08-22	http://artex.kia.ru	2	72
311	Авингруп	ул. Вавилова, д.74/1Р	+7 (863) 230-00-00	http://avingroup.kia.ru	2	72
312	КИА ЦЕНТР ЗАПАД	пер. 1-й Машиностроительный, д. 1	+7 (863) 207-52-07	http://artex.kia.ru	2	72
313	Корея Кар	Куйбышевское шоссе, д. 42	+7 (4912) 29-44-15	http://koreacar.kia.ru	2	73
314	Рязаньавто	ул. Островского, д. 91	+7 (4912) 95-09-50	http://ryazan-avto.kia.ru/	2	73
315	Диверс Моторс Север	Красноглинский район, Микрорайон Крутые Ключи, ул. Мира, д. 1	+7 (846) 973-77-22	http://dmsever.kia.ru	2	74
316	КИА Центр на Московском	Московское шоссе, 262а	+7 (846) 205-99-99	http://kia-samara.kia.ru/	2	74
317	КИА Центр Самара	ул. Ново-Урицкая, д. 22	+7 (846) 977-77-00	http://kia-samara.kia.ru	2	74
318	Саранскмоторс	ул. Строительная, 4Б (Рядом с Центральным ГИБДД)	+7 (8342) 22-32-32	http://www.saranskmotors.kia.ru/	2	76
319	АвтоФорум	ул. Шехурдина, д. 6	+7 (8452) 55-91-22	http://avtoforum.kia.ru	2	77
320	Элвис	2-й км. Усть-Курдюмского шоссе	+7 (8452) 38-77-77	http://elvis-kia.ru/	2	77
321	АВТО-ЛЮКС	Севастополь г., ул. Вакуленчука, 47	+7 (989) 801-02-00	http://autoluks-kia.ru/	2	78
322	АВТОритет	Ягринское шоссе, д.6	+7 (8184) 92-00-29	http://avtoritet.kia.ru/	2	79
323	Черномор Авто	ул. Бородина , 57	+7 (978) 010-10-33	http://crimea-kia.ru	2	80
324	КИА Центр Смоленск	ул. Кутузова, д. 15 Б	+7 (4812) 70-07-77	http://centr-smolensk.kia.ru	2	81
325	Сочи АТО	ул. Конституции СССР, 48	+7 (862) 268-02-20	http://sochiato-kia.ru/	2	82
326	Автоцентр КИА Моторс	Старомарьевское шоссе, д.42	+7 (865) 274-81-00	http://www.stavkiamotors.ru	2	83
327	КИА Ставрополь	просп. Кулакова, 16А	+7 (8652) 57-33-33	http://kia-stavropol.ru	2	83
328	Авто-Белогорье	проспект Алексея Угарова д. 18Г	+7 (4725) 39-11-11	http://kia-oskol.ru/	2	84
329	ТАСКо-Моторс KIA	ул.Западная, д.9	+7 (3473) 20-11-01	http://taskomotors.kia.ru	2	85
330	КИА Центр Сургут	Нефтеюганское шоссе д.62/2	+7 (346) 250-08-88	http://www.kiasurgut.ru	2	86
331	КИА ЦЕНТР СУРГУТ - СЕВЕР	ул. Югорский тракт, д. 1	+7 (346) 295-10-01	http://www.kiacentersurgut.ru/	2	86
332	Авторесурс, ООО «Авторесурс моторс»	ул. Гаражная, д. 19	+7 (8212) 25-03-50	http://autoresurs.kia.ru	2	87
333	АвтоПорт-Т	347900, Ростовское шоссе, 10	+7 (863) 460-99-60	http://www.kia-taganrog.ru/	2	88
334	Глобус	ул. Бастионная, д. 29	+7 (4752) 70-05-07	http://globus.kia.ru	2	89
335	РУМОС-Авто	Трасса М10 "Москва-Санкт-Петербург ", 165 км	+7 (482) 258-90-90	http://www.rumos-kia.ru/	2	90
336	КИА ЦЕНТР НА ЮЖНОМ	Южное шоссе, 26А	+7 (8482) 55-50-66	http://www.kiatlt.ru	2	91
337	АЛЬМАКС-КИА	Обводное шоссе,10	+7 (8482) 77-28-88	http://almax-kia.ru/	2	91
338	ООО «Арсенал Моторс»	ул. Владимира Высоцкого, дом 25, строение 6	+7 (3822) 63-44-44	http://stokoney.kia.ru	2	92
339	КИА центр на Рязанской	ул. Рязанская, д. 44 б	+7 (4872) 71-07-87	http://www.kia71.ru	2	93
340	Автоград	ул. Республики, д. 264	+7 (345) 229-00-02	http://www.kia-agrad.ru	2	94
341	Интер-Авто	ул. Пермякова, д. 19	+7 (345) 233-83-73	http://inter-avto.kia.ru/	2	94
342	КИА Моторс Тюмень	ул. Одесская, д. 1г	+7 (3452) 56-05-05	http://nikko.kia.ru	2	94
343	СИБАВТО	ул.Кабанская, 52	+7 (3012) 37-20-88	http://sibavto.kia.ru	2	95
344	Авторай-КИА	ул. Октябрьская, 22л	+7 (842) 227-01-27	http://www.kia.avtoray.ru/	2	96
345	КИА Центр Зубово	ул. Электрозаводская 18/1 (ост. "Кафе Отдых")	+7 (347) 246-68-68	http://kiaufa.ru/	2	97
346	ТрансТехСервис KIA ул. Маршала Жукова, 32	ул. М.Жукова, д. 32	+7 (347) 293-63-60	http://tts-ufa.kia.ru	2	97
347	KIA пр. Салавата Юлаева, 65	проспект Салавата Юлаева, 65	+7 (347) 292-41-92	http://tts-ufa.kia.ru/	2	97
348	Альянс-Моторс	Марпосадское шоссе, д. 3А	+7 (835) 232-11-10	http://almotors.kia.ru	2	99
349	Автокомплекс «Регинас»	Свердловский тракт, 5-Р (Лакокраска)	+7 (351) 211-75-75	https://www.kia-chel.ru	2	100
350	КИА Центр на копейском	г. Челябинск, ул. Копейское шоссе, д.33	+7 (351) 274-40-40	http://www.kia74.ru	2	100
351	Техно Моторс	ул. Братьев Кашириных, д. 129д	+7 (351) 726-78-78	http://techno-motors.kia.ru	2	100
352	Прайм Моторс	д. Солманское, ул. Центральная, 13-В	+7 (8202) 49-02-01	http://prime-motors.kia.ru	2	101
353	ТЕМП АВТО ДОН	ул. Маяковского 222 в	+7 (8636) 28-10-10	http://tempavto-kia.ru/	2	103
354	АЦ Юго-Запад	Волжский проспект, д. 75	+7 (8453) 52-83-83	http://kia-engels.com	2	104
355	Дальтехмашсервис	ул. Ленина 591	+7 (4242) 51-15-11	http://dtms.kia.ru	2	105
356	Авто Бизнес Центр Групп	Тутаевское шоссе, д. 8	+7 (4852) 20-80-30	http://abcgr.kia.ru	2	107
357	ООО «Спектр-Авто-К»	Московский проспект, д.80а	+7 (4852) 67-22-76	http://spectrauto.kia.ru/	2	107
\.


--
-- Data for Name: dealer_region; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY dealer_region (id, name) FROM stdin;
1	Центральный
2	Северо-Западный
3	Южный
4	Северо-Кавказский
5	Приволжский
6	Уральский
7	Сибирский
8	Дальневосточный
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-01-21 21:31:39.561882+03	2	south	1	[{"added": {}}]	4	1
2	2018-01-21 21:31:59.176933+03	2	south	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
3	2018-01-21 21:32:17.540877+03	3	center	1	[{"added": {}}]	4	1
4	2018-01-21 21:32:28.211858+03	3	center	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	dealer	brand
8	dealer	region
9	dealer	city
10	dealer	dealer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-01-21 21:00:13.047191+03
2	auth	0001_initial	2018-01-21 21:00:13.118401+03
3	admin	0001_initial	2018-01-21 21:00:13.175789+03
4	admin	0002_logentry_remove_auto_add	2018-01-21 21:00:13.188853+03
5	contenttypes	0002_remove_content_type_name	2018-01-21 21:00:13.224374+03
6	auth	0002_alter_permission_name_max_length	2018-01-21 21:00:13.232688+03
7	auth	0003_alter_user_email_max_length	2018-01-21 21:00:13.249325+03
8	auth	0004_alter_user_username_opts	2018-01-21 21:00:13.26067+03
9	auth	0005_alter_user_last_login_null	2018-01-21 21:00:13.273093+03
10	auth	0006_require_contenttypes_0002	2018-01-21 21:00:13.276256+03
11	auth	0007_alter_validators_add_error_messages	2018-01-21 21:00:13.286703+03
12	auth	0008_alter_user_username_max_length	2018-01-21 21:00:13.303909+03
13	sessions	0001_initial	2018-01-21 21:00:13.315069+03
14	dealer	0001_initial	2018-01-21 21:02:06.859009+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dmryutov
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
n3rhite1ny02tbymvrkacv8o78jngdro	ZjViNDFjOWZjOTM0NDhjOTRlMjhiMGUyMTljMzU3ZTk2ZGE2YTE4Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlY2M4ZDNmOTBlNjRmMzc5YWVjZmFhYWU4M2ZmMzdjMmRlNmIzMWRlIn0=	2018-02-04 22:02:13.695172+03
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 2, true);


--
-- Name: dealer_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('dealer_brand_id_seq', 2, true);


--
-- Name: dealer_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('dealer_city_id_seq', 107, true);


--
-- Name: dealer_dealer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('dealer_dealer_id_seq', 357, true);


--
-- Name: dealer_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('dealer_region_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmryutov
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dealer_brand dealer_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_brand
    ADD CONSTRAINT dealer_brand_pkey PRIMARY KEY (id);


--
-- Name: dealer_city dealer_city_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_city
    ADD CONSTRAINT dealer_city_pkey PRIMARY KEY (id);


--
-- Name: dealer_dealer dealer_dealer_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_dealer
    ADD CONSTRAINT dealer_dealer_pkey PRIMARY KEY (id);


--
-- Name: dealer_region dealer_region_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_region
    ADD CONSTRAINT dealer_region_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: dealer_city_region_id_a34d3558; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX dealer_city_region_id_a34d3558 ON dealer_city USING btree (region_id);


--
-- Name: dealer_dealer_brand_id_211f1398; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX dealer_dealer_brand_id_211f1398 ON dealer_dealer USING btree (brand_id);


--
-- Name: dealer_dealer_city_id_ce94b5d5; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX dealer_dealer_city_id_ce94b5d5 ON dealer_dealer USING btree (city_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: dmryutov
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dealer_city dealer_city_region_id_a34d3558_fk_dealer_region_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_city
    ADD CONSTRAINT dealer_city_region_id_a34d3558_fk_dealer_region_id FOREIGN KEY (region_id) REFERENCES dealer_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dealer_dealer dealer_dealer_brand_id_211f1398_fk_dealer_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_dealer
    ADD CONSTRAINT dealer_dealer_brand_id_211f1398_fk_dealer_brand_id FOREIGN KEY (brand_id) REFERENCES dealer_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dealer_dealer dealer_dealer_city_id_ce94b5d5_fk_dealer_city_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY dealer_dealer
    ADD CONSTRAINT dealer_dealer_city_id_ce94b5d5_fk_dealer_city_id FOREIGN KEY (city_id) REFERENCES dealer_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmryutov
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

