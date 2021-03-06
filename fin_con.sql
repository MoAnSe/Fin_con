PGDMP     #    
                w           fin_con    11.2    11.2     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            *           1262    16641    fin_con    DATABASE     �   CREATE DATABASE fin_con WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE fin_con;
             postgres    false            �            1259    16701    balance    TABLE     U   CREATE TABLE public.balance (
    id bigint NOT NULL,
    total_bal real NOT NULL
);
    DROP TABLE public.balance;
       public         postgres    false            �            1259    16660    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false            �            1259    16642    loss    TABLE     �   CREATE TABLE public.loss (
    id bigint NOT NULL,
    creation_date timestamp without time zone,
    l_amount real NOT NULL,
    text character varying(255),
    user_id character varying(255)
);
    DROP TABLE public.loss;
       public         postgres    false            �            1259    16647    profit    TABLE     �   CREATE TABLE public.profit (
    id bigint NOT NULL,
    creation_date timestamp without time zone,
    p_amount real NOT NULL,
    text character varying(255),
    amount integer,
    user_id character varying(255)
);
    DROP TABLE public.profit;
       public         postgres    false            �            1259    16662    spring_session    TABLE     6  CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(300)
);
 "   DROP TABLE public.spring_session;
       public         postgres    false            �            1259    16670    spring_session_attributes    TABLE     �   CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);
 -   DROP TABLE public.spring_session_attributes;
       public         postgres    false            �            1259    16652    usr    TABLE       CREATE TABLE public.usr (
    id character varying(255) NOT NULL,
    email character varying(255),
    gender character varying(255),
    last_visit timestamp without time zone,
    locale character varying(255),
    name character varying(255),
    userpic character varying(255)
);
    DROP TABLE public.usr;
       public         postgres    false            $          0    16701    balance 
   TABLE DATA               0   COPY public.balance (id, total_bal) FROM stdin;
    public       postgres    false    202   �                 0    16642    loss 
   TABLE DATA               J   COPY public.loss (id, creation_date, l_amount, text, user_id) FROM stdin;
    public       postgres    false    196   �                 0    16647    profit 
   TABLE DATA               T   COPY public.profit (id, creation_date, p_amount, text, amount, user_id) FROM stdin;
    public       postgres    false    197   �       "          0    16662    spring_session 
   TABLE DATA               �   COPY public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) FROM stdin;
    public       postgres    false    200           #          0    16670    spring_session_attributes 
   TABLE DATA               h   COPY public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) FROM stdin;
    public       postgres    false    201   !                  0    16652    usr 
   TABLE DATA               S   COPY public.usr (id, email, gender, last_visit, locale, name, userpic) FROM stdin;
    public       postgres    false    198   �4       +           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 57, true);
            public       postgres    false    199            �
           2606    16705    balance balance_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_pkey;
       public         postgres    false    202            �
           2606    16646    loss loss_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.loss
    ADD CONSTRAINT loss_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.loss DROP CONSTRAINT loss_pkey;
       public         postgres    false    196            �
           2606    16651    profit profit_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.profit
    ADD CONSTRAINT profit_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.profit DROP CONSTRAINT profit_pkey;
       public         postgres    false    197            �
           2606    16677 6   spring_session_attributes spring_session_attributes_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);
 `   ALTER TABLE ONLY public.spring_session_attributes DROP CONSTRAINT spring_session_attributes_pk;
       public         postgres    false    201    201            �
           2606    16666     spring_session spring_session_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);
 J   ALTER TABLE ONLY public.spring_session DROP CONSTRAINT spring_session_pk;
       public         postgres    false    200            �
           2606    16659    usr usr_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.usr DROP CONSTRAINT usr_pkey;
       public         postgres    false    198            �
           1259    16667    spring_session_ix1    INDEX     Z   CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);
 &   DROP INDEX public.spring_session_ix1;
       public         postgres    false    200            �
           1259    16668    spring_session_ix2    INDEX     T   CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);
 &   DROP INDEX public.spring_session_ix2;
       public         postgres    false    200            �
           1259    16669    spring_session_ix3    INDEX     W   CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);
 &   DROP INDEX public.spring_session_ix3;
       public         postgres    false    200            �
           2606    16678 6   spring_session_attributes spring_session_attributes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.spring_session_attributes DROP CONSTRAINT spring_session_attributes_fk;
       public       postgres    false    201    200    2719            $      x������ � �            x������ � �            x������ � �      "      x�]��N1D����v��(��NBI�FWp���q�:�X����R�ں�X/�ƜZ��I�z¥�fВ$��� S��hZ(犙8Sa��2�o+��:<�JD��@�d����Hh�G]
�>&�[��`�g^��)P�F��
�_�\�q~ٞ/�����oq<=��i��/�x���rW�Uu��]Q� T�q��CvJ���_8фC�����h������k�Ք9�W����/k�s��u�dV      #      x��]]�춑}��/c��yq����vq����sN�RKӚ��{�ڱ��t�D��b}���Ԧ冨^����e;�L�l^|��k?��W��?������������~�?��_�R���������W���1ע���F���a�&DS�Y�]
5ĀA�|�r~������m����0��.���W�P�3�9�<rtnvkK�i��3_1��ʓI�=7�L��u�'Pc�K��w�jj=�Au��a~g�����@z
~A��wT�o'R��1u��9�㎴:�TZ/���:*较�F�H�C�\Чf�7�3V}r�2z,8��UR���ğ�9�/#A��{f����稄"R��7կ��5��Ԣ_�V�T�9K[���g�>i���pt��9�k�ȏ�B���;�᪊Y���eD�i��nƺ&���D��EIV��2��k���֣}�"�;J�ˀ��J&/d#v'���\׫�6��F�!�y�EtD~�V��>�W}�\��6�`-� �[E�5E,�uO�ꈾ'�	UΥ`��\f�rv��Z�:�����tM��F�m3{�
��9��0�E��}�R���k�g}v�ѹ��x�����"/��?i5>���Z�(���y��K�-,�U�8{���sd+�����Y+;���z=��f-z���2��o�IV�>m�n�ԽJ�ȣ��3͎�7�Ko-+M>��ۡ=w!��0�<���>�U��IF��!m��\?�\�h �:0b������q�]�O�W�Xj'�:X��t�1b_�aO��Б�������N��o�w�n"�~��6b���o��H�)��^�}��q��4�FLpF[�'��I�-��\����(h�!���zO%�Ri�Q�⥧ͼ[-��f.?��+���e�̃Ue,��:�,6rLw��	xl�����*���f�����C7��r:;ӣ����D.E�"ǋܡ�*w�&AxY����&c7����=\��O���SxG�/�M^�&E��� �f&�lu�:l���7�c��Eӫ�'_���\��yo�5|y�	}��s��Es|/��4޹a��x�v[��*�Q�0IOW��.C�%�1y(Ϩ�]h}����iD�>��a������]� �V�M��_(::��d��c'��|UJī��bU����'��e{[��|�4�N���j��%7=�c�k/�����h鉷=��C�)Л�'�f�Sn��֯�-k�↖z�1���%�_^fV_��=˾�ś34�Jv�z�m}��z˭�dLʡ�1Ou�Z3���6I��Z�Ih�b��XO�8Ǎm}�H��٠՞�ۺ����V}xؓ���J܅�+% |��ը�����.�C[���e��0h���R�IE�_��ከ��~�Ǔ����w���٢��L՛6�h�ç����+�I�"}G�q�%�e`ZѮuԷ0����Z2pH�v�7�_�c:����$�؞8��k]��8U��`�f�%�t½�9$�}������)H�sT�Ź�r��3�2�re�XN>��kV{�x���R�n\[u����N����P_͡��Cms���.8O|K����mnvGh�����\<�0%姰��Kv��k���zm'��a.\�}�c?�����x��� ?�n�`�j�N1�i�r����T6�[_��0�C�nc���UQHt�΀�A-=�G�2d`;񆉞�(
uđ�Wh!��aA��tb }���KV��9o�"J7s�s+����Hm����ZFEÇ��k^�J��Ue_`����Ȭor������}��?��7������������7���u�ޝ�9p�k� �
�-�ض�]�o�sݨS]�}s�� ���A)o�|-1�����'�/=uİ����/t�M�T0�I��F�MpTbWq�W�O��W���W�=*sj@�(�í٭	J݁�ݐ��7�9�7Z_@d��h�X���Tݕw�{XJ7�z~n4�v��H�[13���c/I�G��{�7���2N84���]:� �Hi*I@���L�Y��[=������1.��%��B�A{(�`�3H����2�%I~�`���[�J�xv!��W�|^��a�[�/?���<�7��5{�-^�-����st�+��M�����Z��=X/�����.�FS�� ֪�vZu�i�	Q]�"��hk)�6_S���%(ט>y�bܴ �b��6}�c6�m�lt���&uM+��"�V��*-�h��a�Q,}q�ӄ���2�m�$4s�Zg�W ܵ�)ւ6F����Z,����[
���+���vh�oO',�<F��d�3�� �	�kPC� v@��A+�$ �§�B�+�U�n�ȃ�V �e �u�<��	\0%�;����*�/�NH;}6���$Z� ���h�sq!&�"4(����FW����f�f�?���+Y��אF�L�Ag	v`6��>U�L i����}��{�{���$�V��]��=ۺz�.����|��^;��K("�����lS�d@���Ut��6�|�-��b�.������a�'�JO/��c �mAKHS�l��)�k;��Ư=y%6������pIh�f.�:,�. ���p6�2�ð��B1X$g�qء���[��Df��@���LnAup-UB�c��YBM����/�]K��TJG��)8M�`֣�c��{�xAfe�n^��OpME<�3MWHB2Es����؟�gT�y��K�j��v������E����oI�>���/���b3��Z�wF�;���Pm�1K� ��uV�Ydƥ�F��v�<������r���a��r�=&��x�g�Jڷ�l
@n�nr�J���vRP�=�$c`3���i�^�K�%:�<h��K:�W���2�ur�c�!�cjJGSƻ����.-���F&��T?o{V���{5��Y�l��od0�����xt��%|˒��C�W,kִ����~:͌��oz�xk�����StJ�*c;H�N�5�� �~��$�.��K�#�q�|��&��9-v��I�zf���t�)����������IѬ ��]���6jfZ��#� 2X��<ֺ�w/1�/��K:��	��S{���jK�Z�n���н����3y�th�h��J�m�1C��֞e5�a2C���j(�ٚ-_�87��!����s��K\�KU��x�z�)�0h���{M������ە��Ǻ*��ؼϸ��>f�Wn�2��zU6�q�A�Ɠ�/G=���濺����Z�5�%�n4��R���^.>�F����}E��v��v�/~;�}�֚�o���eF�#�K����I�"y�,
j�A%�n�*J2#�M`oU:;W�>g�J^� ����ߠ�^���fN�2�wg���W�]�>es�g��>�����z�M���eu�^,�=x D����W����W��*7���\J
���"`F,g��_��f�[L�%ra#j���1��s��&h��^n�x)��V�W���u��������qG������&����\�s�l =a�*i�LB{�Jb�:
(J�][�'`�"7�ٲh�!��,0EPh��Z�hQ�JE��(�r�Kv�A�8KG�?�l�׸UᛁR��`E�h�E���b���cŘU�ܰo�n"T�ep
�{p��v��$�tR���bG�d�y<R��O^�����/m^Xs�����"���]�F���|��@i�tjWp8�|�7Z@��[�/Sj��-��Q��&IJ9��@w�/���;V`)�^�#�_�˼��5:�3�>P�����B�Z�)��^"��v�x=,�J�d��Y L�����'U�}��*�P[�������)�O�=�$x�?��O�;8�o�!���8D����YSz��:փ2��2N� {���/�a>���.�W��0bҐG٢$�D�L\��Ԇ�xۭ�=��W�;i��I�x޿���j��.�x��N�����~��_���⠝�<��F�P�k��|�P4��/���U�o� �  �����D+oϤlӚZ�Q>3
��A�K�0��c\�;�C�"������W |כ�0q�(���u�E`�[/�!r!�J��ϐ(�]��?*�V�I��J�]v.,��3����{�)״[胷�Q?�G�l��P��}�=�}��%��34XVW_�*²9���3�28U��!��u�ĉ�Zpef��5T
�*�����1�<�yh9���BdX�Sk������f&�6�y�M�b����*���2�Z�'˚���'�h�nP����ģ�����*j����2�����rT�oY��`�-�/7���a�&�����+>a>8�-��h�UZ�J �c�3Ӌ��5��kf�&Fl�Ԉ~�I��ar�( XPG�|@�cIGF���'���(9��s����sh>������������+�P����qw��R�\�:��ͤ��Xg����a��L,� tQ3�;�Qq�~�*�/�,K��ҫ�cDR�kq���o�X˸�CDڣ
�n�ҎH�鴫z4$	�1ך���V���X*=���+�A-C�Ӧ�������:��g�q�m�Ij{=ǲD,Y,7�Hf6�J����Gh�W�.���o㩒�;�M��o�|������/��_·��9�r>�e�����_z���/��_~Y�����O��O􈗾Z��{a�G���x�y�����k{������,��\Z��]:�6{r1�f��<��g���j��.�#\~��pQO����۞�p����>�ũ_�#\��;����\f�^�8/���dx�Tcݜ�U�.�s���g]�˝u��.w��κ�Y�;���˩�.w~)�Y�;���Q���_X���R��K~a��KΊ���qV��/e�%V��/e8��A�O�⽞���/����/e���>��]p          ,  x����J�@���)���f���S�j�Q�U
%�!����t����'����P�}��/U� 800�a��aL��]L��zԴ]��T��:&N/�q^�Dr0��^פ]��`�[̧2f���A���f�_�����{�k{ۆ�zJ-W>B��LʬL�UZ%R�T���;���6(�*A����� �QN�98�Q�����.��"�����K�\��Ûef`l:�{{�MXk����W���o����J@]h��?i'�|���
ъ�?$a�n��Y4�:�������M�a�;�     