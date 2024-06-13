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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (8, 5);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (8, 15);
INSERT INTO public.games VALUES (16, 13);
INSERT INTO public.games VALUES (16, 11);
INSERT INTO public.games VALUES (17, 603);
INSERT INTO public.games VALUES (17, 308);
INSERT INTO public.games VALUES (18, 306);
INSERT INTO public.games VALUES (18, 882);
INSERT INTO public.games VALUES (17, 554);
INSERT INTO public.games VALUES (17, 163);
INSERT INTO public.games VALUES (17, 567);
INSERT INTO public.games VALUES (19, 759);
INSERT INTO public.games VALUES (19, 679);
INSERT INTO public.games VALUES (20, 495);
INSERT INTO public.games VALUES (20, 597);
INSERT INTO public.games VALUES (19, 209);
INSERT INTO public.games VALUES (19, 634);
INSERT INTO public.games VALUES (19, 268);
INSERT INTO public.games VALUES (21, 659);
INSERT INTO public.games VALUES (21, 946);
INSERT INTO public.games VALUES (22, 402);
INSERT INTO public.games VALUES (22, 981);
INSERT INTO public.games VALUES (21, 548);
INSERT INTO public.games VALUES (21, 128);
INSERT INTO public.games VALUES (21, 682);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1718265365293', 4, 6);
INSERT INTO public.users VALUES (3, 'user_1718265365292', 4, 6);
INSERT INTO public.users VALUES (9, 'user_1718265881685', 4, 6);
INSERT INTO public.users VALUES (10, 'user_1718265881684', 4, 6);
INSERT INTO public.users VALUES (11, 'user_1718265956974', 4, 6);
INSERT INTO public.users VALUES (12, 'user_1718265956973', 4, 6);
INSERT INTO public.users VALUES (8, 'laviel', 7, 10);
INSERT INTO public.users VALUES (13, 'user_1718266168995', NULL, NULL);
INSERT INTO public.users VALUES (14, 'user_1718266168994', NULL, NULL);
INSERT INTO public.users VALUES (15, 'LAVIEL', NULL, NULL);
INSERT INTO public.users VALUES (16, 'rivka', NULL, NULL);
INSERT INTO public.users VALUES (17, 'user_1718266782044', NULL, NULL);
INSERT INTO public.users VALUES (18, 'user_1718266782043', NULL, NULL);
INSERT INTO public.users VALUES (19, 'user_1718266809830', NULL, NULL);
INSERT INTO public.users VALUES (20, 'user_1718266809829', NULL, NULL);
INSERT INTO public.users VALUES (21, 'user_1718266856829', NULL, NULL);
INSERT INTO public.users VALUES (22, 'user_1718266856828', NULL, NULL);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

