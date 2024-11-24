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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    mass numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text NOT NULL,
    is_spiral boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    mass numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    moon_type character varying(50) NOT NULL,
    description text NOT NULL,
    is_spiral boolean NOT NULL,
    is_active boolean NOT NULL,
    planet_id bigint NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    mass numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    description text NOT NULL,
    is_spiral boolean NOT NULL,
    is_active boolean NOT NULL,
    star_id bigint NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy character varying(100) NOT NULL,
    star character varying(100) NOT NULL,
    planet character varying(100) NOT NULL,
    moon character varying(100) NOT NULL,
    description text,
    is_active boolean NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    mass numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    star_type character varying(50) NOT NULL,
    description text NOT NULL,
    is_spiral boolean NOT NULL,
    is_active boolean NOT NULL,
    galaxy_id bigint NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 1500000000000, 0, 'Spiral', 'The galaxy that contains our solar system', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1200000000000, 2540000, 'Spiral', 'The nearest spiral galaxy to the Milky Way', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9000, 840000000000, 3000000, 'Spiral', 'A small spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 1100000000000, 23000000, 'Spiral', 'A galaxy with a distinct spiral shape', true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11000, 850000000000, 28000000, 'Spiral', 'A spiral galaxy resembling a sombrero hat', true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 14000, 2500000000000, 53000000, 'Elliptical', 'A giant elliptical galaxy with a supermassive black hole', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'Moon', 4500, 73470000000000000000000, 384400, 'Natural', 'The only natural satellite of Earth', false, true, 1);
INSERT INTO public.moon VALUES (21, 'Phobos', 4600, 10659000000000000, 9377, 'Natural', 'The larger of the two moons of Mars', false, true, 2);
INSERT INTO public.moon VALUES (22, 'Deimos', 4600, 1476200000000000, 23460, 'Natural', 'The smaller of the two moons of Mars', false, true, 2);
INSERT INTO public.moon VALUES (23, 'Io', 4600, 89319000000000000000000, 42170, 'Natural', 'The most volcanically active moon of Jupiter', false, true, 3);
INSERT INTO public.moon VALUES (24, 'Europa', 4600, 47998000000000000000000, 67090, 'Natural', 'One of Jupiters moons, believed to have an ocean beneath its surface', false, true, 3);
INSERT INTO public.moon VALUES (25, 'Ganymede', 4600, 148190000000000000000000, 107040, 'Natural', 'The largest moon in the Solar System, a moon of Jupiter', false, true, 3);
INSERT INTO public.moon VALUES (26, 'Titan', 4600, 134520000000000000000000, 122200, 'Natural', 'The largest moon of Saturn, known for its thick atmosphere', false, true, 4);
INSERT INTO public.moon VALUES (27, 'Rhea', 4600, 2310000000000000000000, 527040000, 'Natural', 'A moon of Saturn, the second-largest moon of the planet', false, true, 4);
INSERT INTO public.moon VALUES (28, 'Enceladus', 4600, 108000000000000000000, 23800, 'Natural', 'A moon of Saturn, known for its ice geysers', false, true, 4);
INSERT INTO public.moon VALUES (29, 'Triton', 4600, 21400000000000000000000, 354760, 'Natural', 'A moon of Neptune, the largest moon of Neptune', false, true, 7);
INSERT INTO public.moon VALUES (30, 'Charon', 4600, 1520000000000000000000, 595000, 'Natural', 'The largest moon of Pluto', false, true, 9);
INSERT INTO public.moon VALUES (31, 'Mimas', 4600, 37490000000000000000, 18500, 'Natural', 'A small moon of Saturn, sometimes called the "Death Star moon"', false, true, 4);
INSERT INTO public.moon VALUES (32, 'Ganymedes', 4600, 148190000000000000000000, 107040, 'Natural', 'One of Jupiters moons', false, true, 3);
INSERT INTO public.moon VALUES (33, 'Hyperion', 4600, 18000000000000000000, 148100, 'Natural', 'A moon of Saturn with an irregular shape', false, true, 4);
INSERT INTO public.moon VALUES (34, 'Ariel', 4600, 1350000000000000000000, 191000, 'Natural', 'A moon of Uranus', false, true, 8);
INSERT INTO public.moon VALUES (35, 'Umbriel', 4600, 1170000000000000000000, 266000, 'Natural', 'A moon of Uranus', false, true, 8);
INSERT INTO public.moon VALUES (36, 'Titania', 4600, 3490000000000000000000, 435000, 'Natural', 'A moon of Uranus', false, true, 8);
INSERT INTO public.moon VALUES (37, 'Oberon', 4600, 3060000000000000000000, 582000, 'Natural', 'A moon of Uranus', false, true, 8);
INSERT INTO public.moon VALUES (38, 'Mimas2', 4600, 37500000000000000000, 18500, 'Natural', 'A small moon of Saturn', false, true, 4);
INSERT INTO public.moon VALUES (39, 'Calypso', 4600, 35500000000000000000, 192000, 'Natural', 'A moon of Saturn', false, true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 5972000000000000000000000, 0, 'Terrestrial', 'The third planet from the Sun and home to all known life', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 641700000000000000000000, 2250, 'Terrestrial', 'The fourth planet from the Sun, known as the Red Planet', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4600, 1898000000000000000000000000, 7780, 'Gas Giant', 'The largest planet in the Solar System', false, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 4500, 568300000000000000000000000, 14270, 'Gas Giant', 'The second-largest planet in the Solar System, known for its rings', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 4600, 4867000000000000000000000, 410, 'Terrestrial', 'The second planet from the Sun, known for its hot, toxic atmosphere', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 4600, 328500000000000000000000, 920, 'Terrestrial', 'The closest planet to the Sun', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 4600, 102400000000000000000000000, 44950, 'Ice Giant', 'The eighth planet from the Sun, known for its deep blue color', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 4600, 86810000000000000000000000, 28710, 'Ice Giant', 'The seventh planet from the Sun, known for its sideways rotation', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600, 13030000000000000000000, 59000, 'Dwarf Planet', 'A dwarf planet in the outer reaches of the Solar System', false, false, 1);
INSERT INTO public.planet VALUES (10, 'Saturn B', 4600, 420000000000000000000000000, 14900, 'Gas Giant', 'Another large gas giant similar to Saturn', false, true, 3);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri b', 500, 120000000000000000000000, 450, 'Exoplanet', 'A rocky exoplanet in the Alpha Centauri system', true, true, 2);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 460, 310000000000000000000000, 2000, 'Exoplanet', 'An exoplanet in the Gliese 581 system, potentially habitable', true, true, 3);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 'Milky Way', 'Sun', 'Earth', 'Moon', 'Our home solar system with Earth and its Moon.', true);
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 'Alpha Centauri', 'Alpha Centauri A', 'Proxima b', 'None', 'A solar system with the closest star to Earth, Proxima Centauri.', true);
INSERT INTO public.solar_system VALUES (3, 'TRAPPIST-1 System', 'TRAPPIST', 'TRAPPIST-1', 'TRAPPIST-1d', 'None', 'A distant solar system with seven Earth-sized planets.', true);
INSERT INTO public.solar_system VALUES (4, 'Kepler-452b System', 'Kepler', 'Kepler-452', 'Kepler-452b', 'None', 'A system with a potentially habitable exoplanet Kepler-452b.', false);
INSERT INTO public.solar_system VALUES (5, 'Andromeda System', 'Andromeda', 'Andromeda Star', 'Andromeda Prime', 'Andromeda Moon', 'A fictional system in the Andromeda galaxy.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 1989000000000000000000000000000, 0, 'G-type main-sequence', 'The star at the center of our solar system', true, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 5500, 2100000000000000000000000000000, 41000000, 'G-type main-sequence', 'The closest star system to the Sun', true, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1000, 1200000000000000000000000000000, 64000000, 'Red supergiant', 'A large red supergiant star in the constellation Orion', true, true, 3);
INSERT INTO public.star VALUES (4, 'Sirius', 200, 4020000000000000000000000000000, 80000000, 'A-type main-sequence', 'The brightest star in the night sky', true, true, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4600, 244600000000000000000000000000, 42000000, 'Red dwarf', 'The closest known star to the Sun', true, true, 2);
INSERT INTO public.star VALUES (6, 'Vega', 3500, 2100000000000000000000000000000, 25000000, 'A-type main-sequence', 'A bright star in the Lyra constellation', true, true, 5);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 39, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_id_seq', 5, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


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
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
-- Name: solar_system unique_system; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT unique_system UNIQUE (galaxy, star, planet, moon);


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

