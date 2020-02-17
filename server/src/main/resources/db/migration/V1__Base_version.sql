--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-0ubuntu0.19.04.1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-0ubuntu0.19.04.1)

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

SET default_with_oids = false;

--
-- Name: extension; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension (
    id bigint NOT NULL,
    average_rating double precision,
    name character varying(255),
    latest_id bigint,
    publisher_id bigint
);


--
-- Name: extension_binary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_binary (
    id bigint NOT NULL,
    content bytea,
    extension_id bigint
);


--
-- Name: extension_icon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_icon (
    id bigint NOT NULL,
    content bytea,
    extension_id bigint
);


--
-- Name: extension_readme; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_readme (
    id bigint NOT NULL,
    content bytea,
    extension_id bigint
);


--
-- Name: extension_review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_review (
    id bigint NOT NULL,
    comment character varying(255),
    rating integer NOT NULL,
    "timestamp" timestamp without time zone,
    title character varying(255),
    extension_id bigint,
    user_id bigint
);


--
-- Name: extension_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_version (
    id bigint NOT NULL,
    bugs character varying(255),
    description character varying(2048),
    display_name character varying(255),
    extension_file_name character varying(255),
    gallery_color character varying(255),
    gallery_theme character varying(255),
    homepage character varying(255),
    icon_file_name character varying(255),
    license character varying(255),
    markdown character varying(255),
    preview boolean NOT NULL,
    qna character varying(255),
    readme_file_name character varying(255),
    repository character varying(255),
    "timestamp" timestamp without time zone,
    version character varying(255),
    extension_id bigint,
    published_with_id bigint
);


--
-- Name: extension_version_bundled_extensions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_version_bundled_extensions (
    extension_version_id bigint NOT NULL,
    bundled_extensions_id bigint NOT NULL
);


--
-- Name: extension_version_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_version_categories (
    extension_version_id bigint NOT NULL,
    categories character varying(255)
);


--
-- Name: extension_version_dependencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_version_dependencies (
    extension_version_id bigint NOT NULL,
    dependencies_id bigint NOT NULL
);


--
-- Name: extension_version_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extension_version_tags (
    extension_version_id bigint NOT NULL,
    tags character varying(255)
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_access_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_token (
    id bigint NOT NULL,
    accessed_timestamp timestamp without time zone,
    active boolean NOT NULL,
    created_timestamp timestamp without time zone,
    description character varying(255),
    value character varying(255),
    user_data bigint
);


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publisher (
    id bigint NOT NULL,
    name character varying(255)
);


--
-- Name: publisher_membership; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publisher_membership (
    id bigint NOT NULL,
    role character varying(255),
    publisher bigint,
    user_data bigint
);


--
-- Name: spring_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


--
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


--
-- Name: user_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_data (
    id bigint NOT NULL,
    avatar_url character varying(255),
    email character varying(255),
    full_name character varying(255),
    login_name character varying(255),
    provider character varying(255),
    provider_id character varying(255)
);


--
-- Name: extension_binary extension_binary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_binary
    ADD CONSTRAINT extension_binary_pkey PRIMARY KEY (id);


--
-- Name: extension_icon extension_icon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_icon
    ADD CONSTRAINT extension_icon_pkey PRIMARY KEY (id);


--
-- Name: extension extension_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension
    ADD CONSTRAINT extension_pkey PRIMARY KEY (id);


--
-- Name: extension_readme extension_readme_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_readme
    ADD CONSTRAINT extension_readme_pkey PRIMARY KEY (id);


--
-- Name: extension_review extension_review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_review
    ADD CONSTRAINT extension_review_pkey PRIMARY KEY (id);


--
-- Name: extension_version extension_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version
    ADD CONSTRAINT extension_version_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: personal_access_token personal_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_token
    ADD CONSTRAINT personal_access_token_pkey PRIMARY KEY (id);


--
-- Name: publisher_membership publisher_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publisher_membership
    ADD CONSTRAINT publisher_membership_pkey PRIMARY KEY (id);


--
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- Name: publisher ukh9trv4xhmh6s68vbw9ba6to70; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT ukh9trv4xhmh6s68vbw9ba6to70 UNIQUE (name);


--
-- Name: personal_access_token ukjeud5mssqbqkid58rd2k1inof; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_token
    ADD CONSTRAINT ukjeud5mssqbqkid58rd2k1inof UNIQUE (value);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- Name: extension fk4uxqcu3nal7b8extpmuhe35wk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension
    ADD CONSTRAINT fk4uxqcu3nal7b8extpmuhe35wk FOREIGN KEY (publisher_id) REFERENCES public.publisher(id);


--
-- Name: extension_version_bundled_extensions fk5c81oqeatr9715wfkrx0w615t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_bundled_extensions
    ADD CONSTRAINT fk5c81oqeatr9715wfkrx0w615t FOREIGN KEY (bundled_extensions_id) REFERENCES public.extension(id);


--
-- Name: extension_version_dependencies fk64s9lyasel78kwkpodtedgcv2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_dependencies
    ADD CONSTRAINT fk64s9lyasel78kwkpodtedgcv2 FOREIGN KEY (extension_version_id) REFERENCES public.extension_version(id);


--
-- Name: extension_version fk70khj8pm0vacasuiiaq0w0r80; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version
    ADD CONSTRAINT fk70khj8pm0vacasuiiaq0w0r80 FOREIGN KEY (published_with_id) REFERENCES public.personal_access_token(id);


--
-- Name: extension_version_tags fk8qxmudnllmiyukng19hfkp042; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_tags
    ADD CONSTRAINT fk8qxmudnllmiyukng19hfkp042 FOREIGN KEY (extension_version_id) REFERENCES public.extension_version(id);


--
-- Name: publisher_membership fk8r3555760hm2d1b1fy4tpdyq6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publisher_membership
    ADD CONSTRAINT fk8r3555760hm2d1b1fy4tpdyq6 FOREIGN KEY (publisher) REFERENCES public.publisher(id);


--
-- Name: extension_version_dependencies fkamd8bx0gf5ju3a7sbx8fnen5v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_dependencies
    ADD CONSTRAINT fkamd8bx0gf5ju3a7sbx8fnen5v FOREIGN KEY (dependencies_id) REFERENCES public.extension(id);


--
-- Name: extension fkeqj0wvhffqqvnh4voknohjhtw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension
    ADD CONSTRAINT fkeqj0wvhffqqvnh4voknohjhtw FOREIGN KEY (latest_id) REFERENCES public.extension_version(id);


--
-- Name: extension_binary fkfhwy3ix1g95yh2vktlnt1l96x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_binary
    ADD CONSTRAINT fkfhwy3ix1g95yh2vktlnt1l96x FOREIGN KEY (extension_id) REFERENCES public.extension_version(id);


--
-- Name: extension_version_categories fkgcqpms03rsk0q4hxx5pbycroq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_categories
    ADD CONSTRAINT fkgcqpms03rsk0q4hxx5pbycroq FOREIGN KEY (extension_version_id) REFERENCES public.extension_version(id);


--
-- Name: extension_review fkgd2dqdc23ogbnobx8afjfpnkp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_review
    ADD CONSTRAINT fkgd2dqdc23ogbnobx8afjfpnkp FOREIGN KEY (extension_id) REFERENCES public.extension(id);


--
-- Name: extension_review fkinjbn9grk135y6ik0ut4ujp0w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_review
    ADD CONSTRAINT fkinjbn9grk135y6ik0ut4ujp0w FOREIGN KEY (user_id) REFERENCES public.user_data(id);


--
-- Name: extension_version fkkhs1ec9s9j08fgicq9pmwu6bt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version
    ADD CONSTRAINT fkkhs1ec9s9j08fgicq9pmwu6bt FOREIGN KEY (extension_id) REFERENCES public.extension(id);


--
-- Name: extension_readme fknipfwgf0mwn87jbc5bn2giqov; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_readme
    ADD CONSTRAINT fknipfwgf0mwn87jbc5bn2giqov FOREIGN KEY (extension_id) REFERENCES public.extension_version(id);


--
-- Name: extension_version_bundled_extensions fkp7o7ws8hrcv24897g2y89f8x5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_version_bundled_extensions
    ADD CONSTRAINT fkp7o7ws8hrcv24897g2y89f8x5 FOREIGN KEY (extension_version_id) REFERENCES public.extension_version(id);


--
-- Name: extension_icon fks849r0hw53a2x8nnwrciho2pp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extension_icon
    ADD CONSTRAINT fks849r0hw53a2x8nnwrciho2pp FOREIGN KEY (extension_id) REFERENCES public.extension_version(id);


--
-- Name: publisher_membership fksprejgjfk4d4txpmmj95gy5ia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publisher_membership
    ADD CONSTRAINT fksprejgjfk4d4txpmmj95gy5ia FOREIGN KEY (user_data) REFERENCES public.user_data(id);


--
-- Name: personal_access_token fktqjvmhoig3wttj6dl1ibcaj3l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_token
    ADD CONSTRAINT fktqjvmhoig3wttj6dl1ibcaj3l FOREIGN KEY (user_data) REFERENCES public.user_data(id);


--
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

