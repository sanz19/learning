--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer NOT NULL,
    galaxy_types integer,
    distance_from_earth numeric(10,2) NOT NULL
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
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric(10,2) NOT NULL,
    planet_id integer
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
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric(10,2) NOT NULL,
    star_id integer
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
    age_in_millions_of_years integer NOT NULL,
    is_spherical integer,
    distance_from_earth numeric(10,2) NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Constelacion 1', 1234, 1234.00);
INSERT INTO public.constellation VALUES (2, 'Constelacion 2', 1234, 1234.00);
INSERT INTO public.constellation VALUES (3, 'Constelacion 3', 1234, 1234.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxia 1', 9876543, 5, 987654.32);
INSERT INTO public.galaxy VALUES (2, 'Galaxia 2', 9876543, 4, 987654.32);
INSERT INTO public.galaxy VALUES (3, 'Galaxia 3', 9876543, 4, 987654.32);
INSERT INTO public.galaxy VALUES (4, 'Galaxia 4', 9876543, 3, 987654.32);
INSERT INTO public.galaxy VALUES (5, 'Galaxia 5', 9876543, 1, 987654.32);
INSERT INTO public.galaxy VALUES (6, 'Galaxia 6', 9876543, 2, 987654.32);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna Tierra', 12345678, true, 123456.78, 2);
INSERT INTO public.moon VALUES (2, 'Luna Mercurio', 12345678, true, 123456.78, 3);
INSERT INTO public.moon VALUES (3, 'Luna Venus', 12345678, true, 123456.78, 4);
INSERT INTO public.moon VALUES (4, 'Luna Marte 1', 12345678, false, 123456.78, 5);
INSERT INTO public.moon VALUES (5, 'Luna Marte 2', 12345678, true, 123456.78, 5);
INSERT INTO public.moon VALUES (6, 'Luna Marte 3', 12345678, false, 123456.78, 5);
INSERT INTO public.moon VALUES (7, 'Luna Jupiter', 12345678, true, 123456.78, 6);
INSERT INTO public.moon VALUES (8, 'Luna Urano', 12345678, true, 123456.78, 7);
INSERT INTO public.moon VALUES (9, 'Luna Saturno', 12345678, true, 123456.78, 8);
INSERT INTO public.moon VALUES (10, 'Luna Neptuno 1', 12345678, true, 123456.78, 9);
INSERT INTO public.moon VALUES (11, 'Luna Neptuno 2', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (12, 'Luna Neptuno 3', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (13, 'Luna Neptuno 4', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (14, 'Luna Neptuno 5', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (15, 'Luna Pluton', 12345678, false, 123456.78, 10);
INSERT INTO public.moon VALUES (16, 'Luna Neptuno 6', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (17, 'Luna Neptuno 7', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (18, 'Luna Neptuno 8', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (19, 'Luna Neptuno 9', 12345678, false, 123456.78, 9);
INSERT INTO public.moon VALUES (20, 'Luna Neptuno 10', 12345678, false, 123456.78, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Tierra', 'Planeta Tierra', 12345678, true, true, 123456.78, 2);
INSERT INTO public.planet VALUES (3, 'Mercurio', 'Planeta Mercurio', 12345678, true, false, 123456.78, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'Planeta Venus', 12345678, false, false, 123456.78, 7);
INSERT INTO public.planet VALUES (5, 'Marte', 'Planeta Marte', 12345678, false, false, 123456.78, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Planeta Jupiter', 12345678, false, false, 123456.78, 3);
INSERT INTO public.planet VALUES (7, 'Urano', 'Planeta Urano', 12345678, false, false, 123456.78, 4);
INSERT INTO public.planet VALUES (8, 'Saturno', 'Planeta Saturno', 12345678, false, false, 123456.78, 2);
INSERT INTO public.planet VALUES (9, 'Neptuno', 'Planeta Neptuno', 12345678, false, false, 123456.78, 3);
INSERT INTO public.planet VALUES (10, 'Pluton', 'Planeta Enano Pluton', 12345888, false, false, 125.78, 5);
INSERT INTO public.planet VALUES (11, 'Planeta 1', 'Planeta Imaginario', 12345678, false, false, 123456.78, 4);
INSERT INTO public.planet VALUES (12, 'Planeta 2', 'Planeta Imaginario', 12345678, false, false, 123456.78, 4);
INSERT INTO public.planet VALUES (13, 'Planeta 3', 'Planeta Imaginario', 12345678, false, false, 123456.78, 2);
INSERT INTO public.planet VALUES (14, 'Planeta 4', 'Planeta Imaginario', 12345678, true, true, 123456.78, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Estrella 1', 12345678, 1, 123456.78, 1);
INSERT INTO public.star VALUES (3, 'Estrella 2', 12345678, 0, 123456.78, 1);
INSERT INTO public.star VALUES (4, 'Estrella 3', 12345678, 0, 123456.78, 5);
INSERT INTO public.star VALUES (5, 'Estrella 4', 12345678, 0, 123456.78, 6);
INSERT INTO public.star VALUES (6, 'Estrella 5', 12345678, 0, 123456.78, 2);
INSERT INTO public.star VALUES (7, 'Estrella 6', 12345678, 0, 123456.78, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

