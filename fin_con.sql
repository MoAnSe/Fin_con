PGDMP     #    	                w           fin_con    11.2    11.2     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public       postgres    false    201   �                   0    16652    usr 
   TABLE DATA               S   COPY public.usr (id, email, gender, last_visit, locale, name, userpic) FROM stdin;
    public       postgres    false    198   �2       +           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 41, true);
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
       public       postgres    false    201    200    2719            $      x������ � �            x������ � �            x������ � �      "   �   x�-���0E��_ٮ�:�����EhP|?��s�p������C�2@��s5�H�ɫ�OJ� "�^FO�=�\�ܑ��%�ӏ"2�td��ϯ���[{ޏ��㼬���8�[^�xz�v ᴿ{8��)C+�      #      x��[ٮ$�q}V��ܗ� �E6�1`�$�2`h���}N���v���ۂ���[�2�dD���T��S������3����~ȥYS��~v���?��w�����������_���?������O����N�U���6�lK4!���
��B�t���(�g�>��9&��MV���Wh�a|��41֝�jT���^�2�t�ނ��.$���2V��)�n�ʠ|�����e�|qֱ3�U]NN����kp�O/x4�W�F�z@�\�����x���ˈ�*�r���<~G���N�U�JZG��+��#���L��]˱���Z�؈ H��_!��@�:�g��#�<�fީv�L�-4P�TG���g=��μ�_:�!��;3�~��r�@�Ԙ��lã�E��c��g�S������2GG�x6a߶UۭU#@��d�^��C��U3)X�Z��z������5م1F�Tw�c�FRW�Bݍ�:;̟T�K�G�C,���k{��۶򗒮FלK:Wee�L �9Nb�6{�r���Ƙ�����.�񰹐J�������V�C��G��]���aA�g�v�`��ŧ��UޭK���`e?�	O�`wҽ�9F�ZA%�|�ٕ�i41���ֻ������Ә��ʗ��^��be-�&�����=2V�#���,���1����>ܧ�V��t��6ŨkZ�TdX��ؑf�����Vǵ��gnQ,s9́h����Tq�qX�k��.������Z\	�:S�	� ���5��x���hs�ـ���<�_<i,?,`ca{��{g�l�d�;x����o���Z�'�	���!�9� �|�~	�aG"m���M6�h�l��j7c*���&W`C1{�w�b*��{X묅���+��)��l��=qZ��l��Y�:�]���?k!#'W-�'r�xT;"���DT�D��hl/�(�m��|��)����V,�]=S���ǘA�>�����|����Qc!I\7˸n�}nEu��H��91�؛�\3/؞��Z�.��7��۵����!V�Ź��ǀXo�m-!ϵG{Bw��(�w����k�6�W���NY��_��H9�q]=�K�H�m-���8h���T�Z���@5$� �9L��r*X��~D�9(���WXl�ļ5�'ſ�x}���{�yuD��-1����'?�k,L�STVwi�2}s�${���
sթ��T��D_q= ~$V���UǄ�U�r6���jB�k青麒��l�NK���HF"�y�#�\����b͆l��5�PL��j���m�e۟�'L��aN ��l{tUY%s%�$���p�a�}R���/��㑌ϗo���U�Z�Il�d����D�������1��F�7���(��8`�w�Q��w]W?e7���}�_��� �5_4be$�s��gjrQ����MwQTn�(����i'�� ����!>;�[X���'|�!Ϻu��ZU�Xf|�z̿=�g��r�_W��\G&���& ,K<��fV���rw���J���O��V��W�M9<Nb&O-��Y50޾���0ˋ�ÚD7V�b����5��z�c��� ��p
�J��òx�_�s]�uL�f"�z�<�r=#�G܌��q�p�]r��a�/!fg��/�K�?-�t·(R�W�\Q8��E,D��2��c���|۟�ˊV�Yܵ��rw�BK��y�T�^��,Sk]�q�Y�َxU�;�&���T�Xפ�ڽ�{��%&C� o,X�5RK��n!�\��h/��L�M*)�E�(�۲��q46�1����t�3KV�H��Y��ܕ|�qi��T�7 ��*��F�{��y��v\�����|�U���
�.��+�r"U�h��5����Yw?9<}�/���*�'M���zMq�c�����%���i��W��?Z�i��m����ߟ�l~��k���/��������)�:�AF*c�9�	�Z�z�1_:u�T�MnP�ٸd���7�c�z���ގ
��۹��n��v4nSw�yq�����^����15v�5�K��'0�F��2���\�ČTa4���:ʈ��
�� ���&{��(�����w;C�C��\�����=���P`�k�VhnU�����U�jȘu��G���_-�{���l�FL��?�2����-f7aFB�������_���!�N:������}rp�H�YCv�~�>i��f?62q��������Y��[�'��	����o=?���E��1����u'\���N7��3���p�  ��d+.yY�b-:
(ʬ�[�A`�ģ�@Oj�a�
.�"(4���T��x��KiJ�+Ӱ5�F.�ݱ�n ץ�|��Q����,2���@��n�K�c���܈��"�	�𼇔��|!��I'��)�����>#Q�_�y�/�y���=w�a�|q]�_���^��b�PP�`���t��ɉ�0��M*+���2"�(֋vT���ɇ���m�3��^�]��o�=bM�u,�7�\B��u�"+�����D��q@}�<�2�{��L������㩩�-��g�(nZ�o��"���+@�$0����<�;%V`]">!u�n�4�x�f'ϱw��?2BXD�^zT����@b����D�L���e
�Oj�>�A����_}~tߌ��X3h'_��ld�8�R#��w��3q� �O�z���;@�GyКZ���%�vFz��^�)�dG����_]=8f��e�Z|k�?�.��x�:.�WXev��w�DB��/�����}��d2��> �}n�_˘�u�u]�W}�n��w-^�]JڱJ�F�`��j�/˾����G�7O�գH� E֊��j�UFl��)��"�b#;֐8�!���%�e&��`��O�Ԃ�f]/	bu�� 6��܌���"�φ�x���SL�xC/��U�Cc;��ci�q��<���H�_v� �A��>#�# fa���*=�&�go����lq�Op��/�	�b|Ƃ��	 ����5;�1�3��)���c���5Pi�;���ZfP�X����	��	���^,EX���(��-���X"3�� �qd-u��0C �H���B�^���GK�)��uϓ �u����6��h�):�l���V�{�ȠM�&h���I �`m6Ռ\BJ��T�zU�݌:G� �NI+�M9�O�-�2�l�u����X�F�f��V!��0�:T�W��첦+?�
#dV��:ʚ�H�`G�Q2-s�?J��޿�umZ��ݰ�%Q���_�?��i���C=�P�h��'�ħO���UB��i�Z9�����H>Ժ3��W4i9�8�=W�ī4ܺ'��U�<HEA2����F�e��ԫ+��8��3$��3�M�3ג�d����ً��g߶jʉґ��[�^GY���u{�i��ܨ����2�����.q1'�*���t�/�h'���^ֽE�̼f؎<*��Q���R���Ck3�*��]S�k;*f����y	k-c�8<��O;��)���r��3�6B�\m�z�x;y��!σ�5���-���T�Z�5ا+�O��{꺯}�Z���+��T�χ�\�N��̐�=�d���v��Jk�o=�-޴�Xz���U�Cg��s�lY&���w9�:���]�ч�y>?�J{ЀE�Fg��z��i�U��4��؋uX���}�o��+��Mg���lF5<���S�x&o�)�E0�"�>�Y�׹�w���	x�M�g�W:�IL������
���+�΀T����&�>I43m1��Q�8Uʓ���*� �^ϙ&�h6��S�O��o
t��EG�>-�K��	N�j5�%���F���O����IK/{;�*��]<��;�WRaW���.�,��j{�߂��IO��Ӈ��:M�����k����*IL���W�
{(!F&q����i��JD/Z�D]��ln���!.J�<����ջB�K��+���L�l�5�%c�Le�;/��K�Mp"���ǻ�7{6!�GdX��v9Э�HV �  }>C�*�A�Z#>]���XOI�/Љ���ŸǏaK�x�nQӼ�N:����׺W��1K���ǙFvx����&>k=�|��ai��{n#/��;���,q��]P��}^���w���ͱ�'=b0��:ecra���m9Z��٫�{?�(g�Ŋ_���x@�ѓ
�>>����P��:*n��/����y'��漫�5�Ǝ��ԛ.~�7ר��S���;�u����ԛ���[���~mu�.�+�^�i�IKNo��U�E��kw�Ղ8#[{����m:��ɾiO�wuκ~�qn����Vٮ�#�`^8���3<����g��m�1Z�XU"��)Yg}2�XM���K�;[���R}'.�F��ت�];�;�]��.xh�yoTK,˷����Svy/*t�;��ߟdq��Ü����{���[���ymg�tz���w�WS7;���=_�}�O=�&�~���S��Ԯ���0.J���슨��9E��`���<�����?}��?ּ#z          )  x���AJ�@����@'�2���U�,j�Q�U
%�!����t�����r�1�B�0��qS�?<�? �K� ����q�PZ�2[ᨛ�
W���C�7	k:nx���C0�T��<�7���ͮa���~[�_�͵^,;�]�)N�J��Z&e��N�Ʊv�ℝ��J_�o��|��<8�h9��ހa�=ʧ��/Y<]3zoe/�uw|�H- �z�F�v�j�)�_��z�TDY�Y�W�Ceu�����#����\��X�[ӵ8��wIp6�q֋�E��ɛ`˲> �^��     