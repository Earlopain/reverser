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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) with time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: artist_submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_submissions (
    id bigint NOT NULL,
    artist_url_id bigint NOT NULL,
    identifier_on_site text NOT NULL,
    title_on_site text NOT NULL,
    description_on_site text NOT NULL,
    created_at_on_site timestamp(6) with time zone NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: artist_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_submissions_id_seq OWNED BY public.artist_submissions.id;


--
-- Name: artist_urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_urls (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    url_identifier text NOT NULL,
    created_at_on_site timestamp(6) with time zone NOT NULL,
    about_on_site text NOT NULL,
    scraping_disabled boolean DEFAULT false NOT NULL,
    last_scraped_at timestamp(6) with time zone,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    api_identifier text,
    site_type integer NOT NULL
);


--
-- Name: artist_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_urls_id_seq OWNED BY public.artist_urls.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artists (
    id bigint NOT NULL,
    name text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: e6_iqdb_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.e6_iqdb_data (
    id bigint NOT NULL,
    submission_file_id bigint NOT NULL,
    post_id integer NOT NULL,
    post_width integer NOT NULL,
    post_height integer NOT NULL,
    post_size integer NOT NULL,
    similarity_score double precision NOT NULL,
    is_exact_match boolean NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: e6_iqdb_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.e6_iqdb_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: e6_iqdb_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.e6_iqdb_data_id_seq OWNED BY public.e6_iqdb_data.id;


--
-- Name: log_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.log_events (
    id bigint NOT NULL,
    loggable_type text NOT NULL,
    loggable_id integer NOT NULL,
    action text NOT NULL,
    payload jsonb NOT NULL,
    created_at timestamp(6) with time zone NOT NULL
);


--
-- Name: log_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.log_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.log_events_id_seq OWNED BY public.log_events.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submission_files (
    id bigint NOT NULL,
    artist_submission_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    direct_url text NOT NULL,
    created_at_on_site timestamp(6) with time zone NOT NULL,
    file_identifier text NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    size integer NOT NULL,
    content_type text NOT NULL,
    in_backlog boolean DEFAULT false NOT NULL,
    added_to_backlog_at timestamp without time zone
);


--
-- Name: submission_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submission_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submission_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submission_files_id_seq OWNED BY public.submission_files.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: artist_submissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_submissions ALTER COLUMN id SET DEFAULT nextval('public.artist_submissions_id_seq'::regclass);


--
-- Name: artist_urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_urls ALTER COLUMN id SET DEFAULT nextval('public.artist_urls_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: e6_iqdb_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.e6_iqdb_data ALTER COLUMN id SET DEFAULT nextval('public.e6_iqdb_data_id_seq'::regclass);


--
-- Name: log_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_events ALTER COLUMN id SET DEFAULT nextval('public.log_events_id_seq'::regclass);


--
-- Name: submission_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN id SET DEFAULT nextval('public.submission_files_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artist_submissions artist_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_submissions
    ADD CONSTRAINT artist_submissions_pkey PRIMARY KEY (id);


--
-- Name: artist_urls artist_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_urls
    ADD CONSTRAINT artist_urls_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: e6_iqdb_data e6_iqdb_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.e6_iqdb_data
    ADD CONSTRAINT e6_iqdb_data_pkey PRIMARY KEY (id);


--
-- Name: log_events log_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_events
    ADD CONSTRAINT log_events_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: submission_files submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_artist_submissions_on_artist_url_and_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_artist_submissions_on_artist_url_and_identifier ON public.artist_submissions USING btree (artist_url_id, lower(identifier_on_site));


--
-- Name: index_artist_submissions_on_artist_url_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_submissions_on_artist_url_id ON public.artist_submissions USING btree (artist_url_id);


--
-- Name: index_artist_urls_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_urls_on_artist_id ON public.artist_urls USING btree (artist_id);


--
-- Name: index_artist_urls_on_site_and_url_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_artist_urls_on_site_and_url_identifier ON public.artist_urls USING btree (site_type, lower(url_identifier));


--
-- Name: index_artist_urls_on_url_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_urls_on_url_identifier ON public.artist_urls USING btree (url_identifier);


--
-- Name: index_artists_on_lower_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_artists_on_lower_name ON public.artists USING btree (lower(name));


--
-- Name: index_e6_iqdb_data_on_submission_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_e6_iqdb_data_on_submission_file_id ON public.e6_iqdb_data USING btree (submission_file_id);


--
-- Name: index_log_events_on_action; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_log_events_on_action ON public.log_events USING btree (action);


--
-- Name: index_log_events_on_loggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_log_events_on_loggable_id ON public.log_events USING btree (loggable_id);


--
-- Name: index_log_events_on_loggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_log_events_on_loggable_type ON public.log_events USING btree (loggable_type);


--
-- Name: index_log_events_on_loggable_type_and_loggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_log_events_on_loggable_type_and_loggable_id ON public.log_events USING btree (loggable_type, loggable_id);


--
-- Name: index_site_type_on_api_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_site_type_on_api_identifier ON public.artist_urls USING btree (site_type, api_identifier);


--
-- Name: index_submission_files_on_artist_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_files_on_artist_submission_id ON public.submission_files USING btree (artist_submission_id);


--
-- Name: index_submission_files_on_artist_submission_id_and_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submission_files_on_artist_submission_id_and_file_id ON public.submission_files USING btree (artist_submission_id, file_identifier);


--
-- Name: e6_iqdb_data fk_rails_259e338a6c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.e6_iqdb_data
    ADD CONSTRAINT fk_rails_259e338a6c FOREIGN KEY (submission_file_id) REFERENCES public.submission_files(id);


--
-- Name: artist_submissions fk_rails_2ebf31f3af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_submissions
    ADD CONSTRAINT fk_rails_2ebf31f3af FOREIGN KEY (artist_url_id) REFERENCES public.artist_urls(id);


--
-- Name: submission_files fk_rails_82aa353edd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT fk_rails_82aa353edd FOREIGN KEY (artist_submission_id) REFERENCES public.artist_submissions(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: artist_urls fk_rails_e4e6c00d41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_urls
    ADD CONSTRAINT fk_rails_e4e6c00d41 FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210908132036'),
('20210908142922'),
('20210908165941'),
('20210908173750'),
('20210908174953'),
('20210908181041'),
('20210912183057'),
('20210912205610'),
('20211216211836'),
('20211216212437'),
('20211217112445'),
('20211219115819'),
('20211220080129'),
('20211222200616'),
('20211223151833'),
('20211226145933'),
('20211228140124'),
('20211231152643'),
('20211231164336'),
('20211231175728'),
('20220110175714'),
('20220111084241'),
('20220117214057'),
('20220118200359'),
('20220227111715'),
('20220302162603'),
('20220312164752'),
('20220312195219'),
('20220313184210'),
('20220313192715'),
('20220314114806'),
('20220716130948'),
('20220716142252'),
('20220716145739'),
('20220716151643'),
('20220716195525');


