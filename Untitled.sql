PGDMP                          {            postgres    15.1    15.0 3    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    5    postgres    DATABASE     j   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE postgres;
                postgres    false            A           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3648                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            B           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    24641    admins1    TABLE     ?   CREATE TABLE public.admins1 (
    id integer NOT NULL,
    mail character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "adminRole" "char"
);
    DROP TABLE public.admins1;
       public         heap    postgres    false            ?            1259    24640    admins1_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.admins1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.admins1_id_seq;
       public          postgres    false    226            C           0    0    admins1_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.admins1_id_seq OWNED BY public.admins1.id;
          public          postgres    false    225            ?            1259    24627    knex_admin_migration    TABLE     ?   CREATE TABLE public.knex_admin_migration (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 (   DROP TABLE public.knex_admin_migration;
       public         heap    postgres    false            ?            1259    24626    knex_admin_migration_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_admin_migration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.knex_admin_migration_id_seq;
       public          postgres    false    222            D           0    0    knex_admin_migration_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.knex_admin_migration_id_seq OWNED BY public.knex_admin_migration.id;
          public          postgres    false    221            ?            1259    24634    knex_admin_migration_lock    TABLE     e   CREATE TABLE public.knex_admin_migration_lock (
    index integer NOT NULL,
    is_locked integer
);
 -   DROP TABLE public.knex_admin_migration_lock;
       public         heap    postgres    false            ?            1259    24633 #   knex_admin_migration_lock_index_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_admin_migration_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.knex_admin_migration_lock_index_seq;
       public          postgres    false    224            E           0    0 #   knex_admin_migration_lock_index_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.knex_admin_migration_lock_index_seq OWNED BY public.knex_admin_migration_lock.index;
          public          postgres    false    223            ?            1259    16400    knex_migrations    TABLE     ?   CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 #   DROP TABLE public.knex_migrations;
       public         heap    postgres    false            ?            1259    16399    knex_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.knex_migrations_id_seq;
       public          postgres    false    216            F           0    0    knex_migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;
          public          postgres    false    215            ?            1259    16407    knex_migrations_lock    TABLE     `   CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);
 (   DROP TABLE public.knex_migrations_lock;
       public         heap    postgres    false            ?            1259    16406    knex_migrations_lock_index_seq    SEQUENCE     ?   CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.knex_migrations_lock_index_seq;
       public          postgres    false    218            G           0    0    knex_migrations_lock_index_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;
          public          postgres    false    217            ?            1259    16414    vouchers    TABLE     1  CREATE TABLE public.vouchers (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(255) NOT NULL,
    "voucher_Code" character varying(255) NOT NULL
);
    DROP TABLE public.vouchers;
       public         heap    postgres    false            ?            1259    16413    vouchers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vouchers_id_seq;
       public          postgres    false    220            H           0    0    vouchers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;
          public          postgres    false    219            ?           2604    24644 
   admins1 id    DEFAULT     h   ALTER TABLE ONLY public.admins1 ALTER COLUMN id SET DEFAULT nextval('public.admins1_id_seq'::regclass);
 9   ALTER TABLE public.admins1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            ?           2604    24630    knex_admin_migration id    DEFAULT     ?   ALTER TABLE ONLY public.knex_admin_migration ALTER COLUMN id SET DEFAULT nextval('public.knex_admin_migration_id_seq'::regclass);
 F   ALTER TABLE public.knex_admin_migration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    24637    knex_admin_migration_lock index    DEFAULT     ?   ALTER TABLE ONLY public.knex_admin_migration_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_admin_migration_lock_index_seq'::regclass);
 N   ALTER TABLE public.knex_admin_migration_lock ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    224    223    224            ?           2604    16403    knex_migrations id    DEFAULT     x   ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);
 A   ALTER TABLE public.knex_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ?           2604    16410    knex_migrations_lock index    DEFAULT     ?   ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);
 I   ALTER TABLE public.knex_migrations_lock ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    218    217    218            ?           2604    16417    vouchers id    DEFAULT     j   ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);
 :   ALTER TABLE public.vouchers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            :          0    24641    admins1 
   TABLE DATA           B   COPY public.admins1 (id, mail, password, "adminRole") FROM stdin;
    public          postgres    false    226   P9       6          0    24627    knex_admin_migration 
   TABLE DATA           O   COPY public.knex_admin_migration (id, name, batch, migration_time) FROM stdin;
    public          postgres    false    222   ?9       8          0    24634    knex_admin_migration_lock 
   TABLE DATA           E   COPY public.knex_admin_migration_lock (index, is_locked) FROM stdin;
    public          postgres    false    224   :       0          0    16400    knex_migrations 
   TABLE DATA           J   COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
    public          postgres    false    216   >:       2          0    16407    knex_migrations_lock 
   TABLE DATA           @   COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
    public          postgres    false    218   ?:       4          0    16414    vouchers 
   TABLE DATA           U   COPY public.vouchers (id, created_at, updated_at, email, "voucher_Code") FROM stdin;
    public          postgres    false    220   ?:       I           0    0    admins1_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.admins1_id_seq', 4, true);
          public          postgres    false    225            J           0    0    knex_admin_migration_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.knex_admin_migration_id_seq', 1, true);
          public          postgres    false    221            K           0    0 #   knex_admin_migration_lock_index_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.knex_admin_migration_lock_index_seq', 1, true);
          public          postgres    false    223            L           0    0    knex_migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.knex_migrations_id_seq', 1, true);
          public          postgres    false    215            M           0    0    knex_migrations_lock_index_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);
          public          postgres    false    217            N           0    0    vouchers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.vouchers_id_seq', 8, true);
          public          postgres    false    219            ?           2606    24648    admins1 admins1_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.admins1
    ADD CONSTRAINT admins1_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.admins1 DROP CONSTRAINT admins1_pkey;
       public            postgres    false    226            ?           2606    24639 8   knex_admin_migration_lock knex_admin_migration_lock_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.knex_admin_migration_lock
    ADD CONSTRAINT knex_admin_migration_lock_pkey PRIMARY KEY (index);
 b   ALTER TABLE ONLY public.knex_admin_migration_lock DROP CONSTRAINT knex_admin_migration_lock_pkey;
       public            postgres    false    224            ?           2606    24632 .   knex_admin_migration knex_admin_migration_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.knex_admin_migration
    ADD CONSTRAINT knex_admin_migration_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.knex_admin_migration DROP CONSTRAINT knex_admin_migration_pkey;
       public            postgres    false    222            ?           2606    16412 .   knex_migrations_lock knex_migrations_lock_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);
 X   ALTER TABLE ONLY public.knex_migrations_lock DROP CONSTRAINT knex_migrations_lock_pkey;
       public            postgres    false    218            ?           2606    16405 $   knex_migrations knex_migrations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.knex_migrations DROP CONSTRAINT knex_migrations_pkey;
       public            postgres    false    216            ?           2606    16425    vouchers vouchers_email_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_email_unique UNIQUE (email);
 H   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_email_unique;
       public            postgres    false    220            ?           2606    16423    vouchers vouchers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_pkey;
       public            postgres    false    220            ?           2606    16427 %   vouchers vouchers_voucher_code_unique 
   CONSTRAINT     j   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_voucher_code_unique UNIQUE ("voucher_Code");
 O   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_voucher_code_unique;
       public            postgres    false    220            :   f   x?3?L,)-J?qH.?,(?/?/M?H-????T1JR14P1*?p?7?4r?6?/0I-66H??????q??H?6?vtʬ??N5p,2J???,?????? ?d-      6   G   x?3?4202242234460??O.JM,I?/-N-??*?4????)Y?YY???jr??qqq ??      8      x?3?4?????? V      0   @   x?3?42022444722?01????,??*?4K??Z(X?ZX??jr??qqq ??      2      x?3?4?????? V      4   I  x???Kk?@??ί??TfFGW?3?o?H?&%?5???Y?.?,????q???!?/?z?	?&D&????!?C???d?b???(?nü8??0???*?C?????hVu???Hnh??z;~?? ??(?MK?????? 	??+c?55!*?A?m?y?8????H?KMU8??+???E??d!jy?8J
?e?i)??b???A??6Z?>+ۊ;(X??7~?{?Nq?h?x??͗?;X???<?q???Q?)!^??e6Ԗ?W4?pg?2?2[Q???VH? 5!4?&???????]o]C?&)yQ`?zC?m?????k밺~?P??U |?'??     