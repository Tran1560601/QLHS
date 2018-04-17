--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hocsinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hocsinh (
    mahs character varying(10) NOT NULL,
    hoten character varying(50),
    diachi character varying(100),
    malop character varying(10)
);


ALTER TABLE public.hocsinh OWNER TO postgres;

--
-- Name: lop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lop (
    malop character varying(10) NOT NULL,
    tenlop character varying(50)
);


ALTER TABLE public.lop OWNER TO postgres;

--
-- Data for Name: hocsinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hocsinh (mahs, hoten, diachi, malop) FROM stdin;
001	Nguyen Van An	10 Dinh Tien Hoang, Q.1	LH01
002	Trần Thị Bình	22 Le Loi, Q.5	LH02
003	Nguyễn Thị Tuyết Anh	14 Nguyễn Trãi, Q.5	LH01
004	Lê Nam Định	64 Hàm Nghi, Q.1	LH03
\.


--
-- Data for Name: lop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lop (malop, tenlop) FROM stdin;
LH02	15CK2
LH01	15CK1
LH03	15CK3
\.


--
-- Name: hocsinh hocsinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hocsinh
    ADD CONSTRAINT hocsinh_pkey PRIMARY KEY (mahs);


--
-- Name: lop lop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lop
    ADD CONSTRAINT lop_pkey PRIMARY KEY (malop);


--
-- Name: fki_t_t; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t_t ON public.hocsinh USING btree (malop);


--
-- Name: hocsinh t_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hocsinh
    ADD CONSTRAINT t_t FOREIGN KEY (malop) REFERENCES public.lop(malop);


--
-- PostgreSQL database dump complete
--

