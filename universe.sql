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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km double precision NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(100),
    total_mass_in_billion_solar_mass double precision,
    size_in_light_years double precision,
    total_number_of_stars_billions integer
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
    name character varying(100) NOT NULL,
    moon_type character varying(100),
    moon_relative_size double precision,
    orbits_planet character varying(100),
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
    name character varying(100) NOT NULL,
    planet_type character varying(100),
    age_in_millions_of_years numeric,
    earth_relative_size double precision,
    number_of_moons_in_orbit integer,
    distance_from_earth_light_years double precision,
    has_life boolean,
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
    name character varying(100) NOT NULL,
    star_type character varying(100) NOT NULL,
    age_in_millions_of_years double precision,
    sun_relative_size double precision,
    number_of_planets_in_orbit integer,
    distance_from_earth_in_light_years numeric,
    has_planet_in_habitable_zone boolean,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Haley', 15, 'It is a periodic comet visible from Earth every 74-79 years. It has been observed and recorded for over 2,000 years and is the only known short-period comet that is regularly visible to the naked eye from Earth');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 40, 'Discovered in 1995, it was one of the brightest comets of the 20th century and was visible to the naked eye for a record 18 months');
INSERT INTO public.comet VALUES (3, 'McNaught', 25, 'Discovered in 2006, it became extremely bright in early 2007 and was visible in broad daylight.it was one of the brightest comets seen in the Southern Hemisphere in over 40 years');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 1.5, 100, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', 1.5, 220, 100);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 0.05, 60, 40);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical galaxy', 1, 50, 200);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Spiral galaxy', 0.08, 70, 50);
INSERT INTO public.galaxy VALUES (6, 'NGC 300', 'Spiral galaxy', 0.002, 50, 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Regular (major) moon', 1, 'Earth', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular moon', 0.015, 'Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Irregular moon', 0.004, 'Mars', 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Regular (major) moon', 1.25, 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Regular (major) moon', 0.87, 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Regular (major) moon', 1.48, 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Regular (major) moon', 1.36, 'Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Regular (major) moon', 1.53, 'Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Regular (major) moon', 0.44, 'Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Regular (major) moon', 0.29, 'Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Regular (major) moon', 0.54, 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Regular (major) moon', 0.39, 'Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Regular (major) moon', 0.29, 'Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Regular (major) moon', 0.18, 'Saturn', 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Irregular moon', 0.16, 'Saturn', 6);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'Irregular moon', 0.08, 'Saturn', 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Irregular moon', 0.05, 'Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Retrograde moon', 0.21, 'Neptune', 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Irregular moon', 0.01, 'Neptune', 8);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Irregular moon', 0.18, 'Uranus', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 4500, 0.38, 0, 0, false, 4);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 4500, 0.95, 0, 0, false, 4);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 4500, 1, 1, 0, true, 4);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 4500, 0.53, 2, 0, false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4500, 11.2, 79, 0, false, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 4500, 9.45, 82, 0, false, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 4500, 4, 27, 0, false, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 4500, 3.88, 14, 0, false, 4);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Terrestrial Exoplanet', NULL, 1.17, 0, 4.24, false, 5);
INSERT INTO public.planet VALUES (10, 'HD 189733 b', 'Hot Jupiter Exoplanet', NULL, 1.13, 0, 63, false, 8);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1 d', 'Terrestrial Exoplanet', NULL, 0.41, 0, 39.6, false, 9);
INSERT INTO public.planet VALUES (12, 'WASP-121 b', 'Hot Jupiter Exoplanet', NULL, 1.18, 0, 900, false, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 'Red supergiant (M1-2 Ia-Iab)', 10, 1000, NULL, 642.5, false, 1);
INSERT INTO public.star VALUES (2, 'Rigel', 'Blue supergiant (B8 Ia)', 10, 70, NULL, 860, false, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A-type main-sequence (A0 V)', 450, 2.1, NULL, 25, false, 1);
INSERT INTO public.star VALUES (6, 'M31-ULS-1', 'Ultra-luminous X-ray source', NULL, NULL, NULL, 2537000, false, 1);
INSERT INTO public.star VALUES (7, 'ESO 137-001', 'Wolf-Rayet star', NULL, NULL, NULL, 11000000, false, 1);
INSERT INTO public.star VALUES (8, 'HD 189733', 'G-type main-sequence star', 500, 0.84, 1, 63, false, 1);
INSERT INTO public.star VALUES (10, 'WASP-121', 'F-type main-sequence star', 600, 1.54, 1, 900, false, 1);
INSERT INTO public.star VALUES (4, 'Sun', 'G-type main-sequence (G2V)', 4600, 1, 8, 0, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red dwarf (M5.5Ve)', 4850, 0.14, 2, 4.24, true, 1);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 'M-type ultra-cool dwarf star', 7.6, 0.08, 7, 39.6, true, 1);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: planet planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

