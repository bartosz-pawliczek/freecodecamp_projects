--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(30),
    year_of_birth integer NOT NULL,
    year_of_first_flight integer,
    length_of_life numeric,
    country text,
    man boolean,
    born_after_1990 boolean
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size integer NOT NULL,
    diameter integer,
    mass numeric,
    etymology text,
    visible_to_the_naked_eye boolean,
    known_in_antiquity boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    perigee integer NOT NULL,
    apogee integer,
    mass numeric,
    etymology text,
    visible_to_the_naked_eye boolean,
    known_in_antiquity boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_number_from_the_sun integer NOT NULL,
    radius integer,
    mass numeric,
    etymology text,
    visible_to_the_naked_eye boolean,
    known_in_antiquity boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    magnitude integer NOT NULL,
    radius integer,
    mass numeric,
    etymology text,
    visible_to_the_naked_eye boolean,
    known_in_antiquity boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Yuri Gagarin', 1934, 1961, 34, 'Russian SFSR', true, false);
INSERT INTO public.astronaut VALUES (2, 'Timothy Lennart Kopra', 1963, 2009, 59, 'USA', true, false);
INSERT INTO public.astronaut VALUES (3, 'Neil Armstrong', 1930, 1969, 82, 'USA', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 27, 87400, 1150000000000, 'milky circle', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 47, 152000, 1500000000000, 'Messier 31', true, true);
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', 66, 123000, 950000000000, 'Large and Small Magellanic  Cloud', true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 24, 76900, 1120000000000, 'M51a', false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 15, 49000, 630000000000, 'M104', false, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 52, 169300, 2040000000000, 'M101', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 362600, 405400, 73400000000000000000000, 'Luna, Selene or Cynthia', true, true, 3);
INSERT INTO public.moon VALUES (2, 'Io', 420000, 423400, 89300000000000000000000, 'Discovered by Galileo Galilei', true, false, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 664862, 676938, 48000000000000000000000, 'Discovered by Galileo Galilei and Simon Marius', true, false, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1069200, 1071600, 148000000000000000000000, 'Discovered by Galileo Galilei', true, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1869000, 1897000, 108000000000000000000000, 'Discovered by Galileo Galilei', true, false, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 1186680, 125060, 135000000000000000000000, 'Discovered by Christiaan Huygens', true, false, 6);
INSERT INTO public.moon VALUES (7, 'Tethys', 294619, 294619, 617000000000000000000, 'Discovered by G. D. Cassini', false, false, 6);
INSERT INTO public.moon VALUES (8, 'Dione', 377396, 377396, 1100000000000000000000, 'Discovered by G. D. Cassini', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 527108, 527108, 2310000000000000000000, 'Discovered by G. D. Cassini', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3560820, 3560820, 1810000000000000000000, 'Discovered by G. D. Cassini', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 181902, 189176, 37500000000000000000, 'Discovered by William Herschel', false, false, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 237948, 23948, 108000000000000000000, 'Discovered by William Herschel', false, false, 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', 1481009, 1481009, 5620000000000000000, 'Discovered by William Bond, George Bond and William Lassell', false, false, 6);
INSERT INTO public.moon VALUES (14, 'Phoebe', 12960000, 12960000, 8290000000000000000, 'Discovered by W. H. Pickering', false, false, 6);
INSERT INTO public.moon VALUES (15, 'Janus', 151460, 151460, 1900000000000000000, 'Discovered by Audouin Dollfus', false, false, 6);
INSERT INTO public.moon VALUES (16, 'Epimetheus', 151410, 151410, 527000000000000000, 'Discovered by Richard Walker', false, false, 6);
INSERT INTO public.moon VALUES (17, 'Helene', 377396, 377396, 1000, 'Discovered by P. Laques and J. Lecacheux', false, false, 6);
INSERT INTO public.moon VALUES (18, 'Telesto', 294619, 294619, 1000, 'Discovered by Bradford A. Smith, Harold Reitsema, Stephen M. Larson and John W. Fountain', false, false, 6);
INSERT INTO public.moon VALUES (19, 'Calypso', 294619, 294619, 1000, 'Discovered by Dan Pascu, P. Kenneth Seidelmann, William A. Baum and Douglas G. Currie', false, false, 6);
INSERT INTO public.moon VALUES (20, 'Miranda', 129390, 129390, 64000000000000000000, 'Discovered by Gerald P. Kuiper', false, false, 7);
INSERT INTO public.moon VALUES (21, 'Ariel', 191020, 191020, 1250000000000000000000, 'Discovered by William Lassell', false, false, 7);
INSERT INTO public.moon VALUES (22, 'Umbriel', 266000, 266000, 1280000000000000000000, 'Discovered by William Lassell', false, false, 7);
INSERT INTO public.moon VALUES (23, 'Titania', 435910, 435910, 3400000000000000000000, 'Discovered by William Herschel', false, false, 7);
INSERT INTO public.moon VALUES (24, 'Oberon', 583520, 583520, 3080000000000000000000, 'Discovered by William Herschel', false, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, 330000000000000000000000, 'Roman god Mercurius', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 2, 6052, 4870000000000000000000000, 'Roman god Venus', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, 6371, 5970000000000000000000000, 'The Blue Marble', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 3390, 542000000000000000000000, 'Roman god of war – Mars', true, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, 69911, 1900000000000000000000000000, 'Roman god Jupiter', true, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, 58232, 568000000000000000000000000, 'Roman god Saturn', true, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 25362, 86800000000000000000000000, 'Roman god Uranus', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 8, 24622, 102000000000000000000000000, 'Roman god Neptune', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto – dwarf planet', 9, 1188, 13000000000000000000000, 'Roman god Pluto', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Ceres – dwarf planet', 4, 939, 938000000000000000000, 'The first discovered asteroid', false, false, 1);
INSERT INTO public.planet VALUES (11, 'Eris – dwarf planet', 8, 1163, 16500000000000000000000, 'Trans-Neptunian object (TNO)', false, false, 1);
INSERT INTO public.planet VALUES (12, 'Gonggong – dwarf planet', 8, 615, 1750000000000000000000, 'A water god in Chinese mithology', false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 695700, 1990000000000000000000000000000, 'Helios', true, true, 1);
INSERT INTO public.star VALUES (2, 'Vega', 0, 1739250, 4010000000000000000000000000000, 'Al Nesr al Waki', true, true, 1);
INSERT INTO public.star VALUES (3, 'Polaris', -4, 26088750, 10750000000000000000000000000000, 'Polar star', true, true, 1);
INSERT INTO public.star VALUES (4, 'UY Scuti', -6, 1188255600, 19990000000000000000000000000000, 'Hypergiant', true, false, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', -6, 531514800, 32840000000000000000000000000000, 'Betelgeux', true, true, 1);
INSERT INTO public.star VALUES (6, 'Antares', -5, 473076000, 21890000000000000000000000000000, 'GABA GIR.TAB', true, true, 1);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
