PGDMP  7                    |            db_ej_1    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    49338    db_ej_1    DATABASE     }   CREATE DATABASE db_ej_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE db_ej_1;
                postgres    false            �            1259    49350    activity    TABLE     �   CREATE TABLE public.activity (
    id bigint NOT NULL,
    name character varying,
    description text,
    id_project bigint NOT NULL
);
    DROP TABLE public.activity;
       public         heap    postgres    false            �            1259    49349    activity_id_seq    SEQUENCE     x   CREATE SEQUENCE public.activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.activity_id_seq;
       public          postgres    false    218                       0    0    activity_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.activity_id_seq OWNED BY public.activity.id;
          public          postgres    false    217            �            1259    49364    employ    TABLE     �   CREATE TABLE public.employ (
    id bigint NOT NULL,
    name character varying(200),
    lastname character varying(200),
    email character varying(150)
);
    DROP TABLE public.employ;
       public         heap    postgres    false            �            1259    49363    employ_id_seq    SEQUENCE     v   CREATE SEQUENCE public.employ_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.employ_id_seq;
       public          postgres    false    220                       0    0    employ_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.employ_id_seq OWNED BY public.employ.id;
          public          postgres    false    219            �            1259    49340    project    TABLE     �   CREATE TABLE public.project (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    state boolean DEFAULT true,
    id_per_res integer
);
    DROP TABLE public.project;
       public         heap    postgres    false            �            1259    49339    project_id_seq    SEQUENCE     w   CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.project_id_seq;
       public          postgres    false    216                       0    0    project_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;
          public          postgres    false    215            \           2604    49353    activity id    DEFAULT     j   ALTER TABLE ONLY public.activity ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq'::regclass);
 :   ALTER TABLE public.activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ]           2604    49367 	   employ id    DEFAULT     f   ALTER TABLE ONLY public.employ ALTER COLUMN id SET DEFAULT nextval('public.employ_id_seq'::regclass);
 8   ALTER TABLE public.employ ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            Z           2604    49343 
   project id    DEFAULT     h   ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);
 9   ALTER TABLE public.project ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    49350    activity 
   TABLE DATA           E   COPY public.activity (id, name, description, id_project) FROM stdin;
    public          postgres    false    218          �          0    49364    employ 
   TABLE DATA           ;   COPY public.employ (id, name, lastname, email) FROM stdin;
    public          postgres    false    220   e       �          0    49340    project 
   TABLE DATA           L   COPY public.project (id, title, description, state, id_per_res) FROM stdin;
    public          postgres    false    216   �                  0    0    activity_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.activity_id_seq', 4, true);
          public          postgres    false    217                       0    0    employ_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.employ_id_seq', 4, true);
          public          postgres    false    219                       0    0    project_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.project_id_seq', 4, true);
          public          postgres    false    215            a           2606    49357    activity activity_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id_project);
 @   ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_pkey;
       public            postgres    false    218            c           2606    49371    employ employ_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.employ
    ADD CONSTRAINT employ_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.employ DROP CONSTRAINT employ_pkey;
       public            postgres    false    220            _           2606    49348    project project_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    216            e           2606    49358    activity id_project    FK CONSTRAINT     w   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT id_project FOREIGN KEY (id_project) REFERENCES public.project(id);
 =   ALTER TABLE ONLY public.activity DROP CONSTRAINT id_project;
       public          postgres    false    4703    218    216            d           2606    49372    project project_id_per_res_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_id_per_res_fkey FOREIGN KEY (id_per_res) REFERENCES public.employ(id);
 I   ALTER TABLE ONLY public.project DROP CONSTRAINT project_id_per_res_fkey;
       public          postgres    false    220    216    4707            �   S   x�3�tL.�,�LILQ0�tI-N.�,H�<�9O!%U!'Q!Iڐ�I�~�F�F\�Hʍ�+7�4�2�D�M�+7�4����� ��@      �   n   x�3��J�,����M�L/Ḿr�s3s���s��8�J�8R�R�8��L�Ԋ�܂�T��1Pc�ᵉ���yU�� ��&e&�(2�N)���9�� �� �AQ���� X�0�      �   V   x�3�(ʯLM.�W0�tI-N.�,H�<�9O!%5G� !W�i�e�Pl�G�P��1B�1��@��\&�
p�@6n�&@�&\1z\\\ ��>}     