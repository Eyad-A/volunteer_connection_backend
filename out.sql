PGDMP     2    0                y        	   volunteer    13.2    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    28324 	   volunteer    DATABASE     m   CREATE DATABASE volunteer WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE volunteer;
                malsh    false            �            1259    28325 	   companies    TABLE     �  CREATE TABLE public.companies (
    company_handle character varying(25) NOT NULL,
    password text NOT NULL,
    company_name text NOT NULL,
    state text NOT NULL,
    num_employees integer,
    short_description text NOT NULL,
    long_description text NOT NULL,
    website_url text NOT NULL,
    logo_url text,
    main_image_url text,
    looking_for text NOT NULL,
    role text DEFAULT 'company'::text,
    CONSTRAINT companies_num_employees_check CHECK ((num_employees > 0))
);
    DROP TABLE public.companies;
       public         heap    malsh    false            �            1259    28345    connections    TABLE     �   CREATE TABLE public.connections (
    username character varying(25) NOT NULL,
    company_handle character varying(25) NOT NULL
);
    DROP TABLE public.connections;
       public         heap    malsh    false            �            1259    28335    users    TABLE     E  CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    skill text NOT NULL,
    role text DEFAULT 'user'::text,
    CONSTRAINT users_email_check CHECK (("position"(email, '@'::text) > 1))
);
    DROP TABLE public.users;
       public         heap    malsh    false            �          0    28325 	   companies 
   TABLE DATA           �   COPY public.companies (company_handle, password, company_name, state, num_employees, short_description, long_description, website_url, logo_url, main_image_url, looking_for, role) FROM stdin;
    public          malsh    false    200   �       �          0    28345    connections 
   TABLE DATA           ?   COPY public.connections (username, company_handle) FROM stdin;
    public          malsh    false    202   �       �          0    28335    users 
   TABLE DATA           ^   COPY public.users (username, password, first_name, last_name, email, skill, role) FROM stdin;
    public          malsh    false    201   �       /           2606    28334    companies companies_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_handle);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            malsh    false    200            3           2606    28349    connections connections_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (username, company_handle);
 F   ALTER TABLE ONLY public.connections DROP CONSTRAINT connections_pkey;
       public            malsh    false    202    202            1           2606    28344    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            malsh    false    201            5           2606    28355 +   connections connections_company_handle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_company_handle_fkey FOREIGN KEY (company_handle) REFERENCES public.companies(company_handle) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.connections DROP CONSTRAINT connections_company_handle_fkey;
       public          malsh    false    2863    200    202            4           2606    28350 %   connections connections_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.connections DROP CONSTRAINT connections_username_fkey;
       public          malsh    false    202    2865    201            �   �  x��Z�v9]���n6��6~ά�؍�����*SU%��J�R���sC���4g��o���Pč7B9�e77O���U{�=�3����Cv)���m�o���B�V����᮶F��g'��3i�Um�*�Z.p�/d�U׻f��b��%NLj�V��Z��U�K#�+{�&�v�e�1k���-y��FW�w��_�[�[����+XԺ�k<���J򏮷�^8��Y��M�z���w�w�i3Q���Ze��6��ⵚ9zυ�;�����ڴ�H�����,�����q�z�\���U�8f�''�j�	=�#����7���у�RZ%���������v���i����kp[>��T3s���d�����ֺvv�������z�Ͽ.K�	�t+j~9��;��pY'ڛG�{�8*_-ة0�n�:i�L��P�]��lsg����S�v�n�5�ao��i��a��v/��H'�/��ễZHcR���E_uxxp�p���9�0x��E/���Oe��#M��۱%[.�	^0�#�4n���R ԀU��S,�����\ �mz�_��%�W�+�	+��ݾFE��EIF ��$��^J��ԁQ�1iqC�~7FN?�����{1����j����#a���U��-�՜��0��]�ٯ�+��ד[v�Z]O{��M#Z��șnٮ'�!�� �e����	D)B�R�JTM�<�
�"�@&=/�A�q�����>�ޙ!�\ �t#��/\�9��rY��%��7)1�����|J�;4��n�@���uϒ��p�5��?��-.(�3)�t7�P-D�(`'���`045���G����z�/_>�.�9�Z�+3���zP�3u���|�fk���`Ǣid��%p��k���I���=6x?���j
�F������@���5f�S9C�:�{��H��躚un窾>1��.���:;T��u-\�^HmfJ���&B0�{z���
��-�+�ע��W�5�㊷�Es<2H�!��2�
ҥ�ZP��m=>����	c7�A�&S�b������j��,RK̔�����U����`(��$�6��$��JTɨ�fF,T%�"����[��A"�h��}�{�QIW��!}��C��R��
��.� � ��ڙj�Ѵi:vڔ��^me�.D;զz|h�ł����a�]�ya�E5��q�_[����9f�����s����B�Az���ֿ�{�;Y??�`O��P]�?�J~�ﵹf��O��I@�\�P�h��L�$�
d��"���_pi� $R+�N��b�<Q7{$
͈�&Ʊ���1H�#`] DV�
WS�(+�HeH�ը �Tϵ)s/�g���ƣ�r�d>����G�|s��tthX�� A��7 ���~a�0�"�=Q2���/S�*�O3�m�wT�lUC�.���h�9�W5|Xߩ~�EM])���Q���pD�S^!\�;DXE��� ���Q���DI��ԖǴ��3w�t�sU�#٫Y;"dX1a���������|YAb���Ƽ4�$+�ݍ=�}�AQX>T�?�rg��(?�!�ֲwo%jPT*E�̓T�%�Y���)H�����i��Ϥ��DŇ�?/>,1���\P�÷�F���'����{�{����m�BWQ���3s�����JMW�
C��*+ �E�N@��5!B���\�Ʃ��i��
����[�.�b�փjI��Ҥ��2_��QώHM#-^��uA�8�v)e?4]\]Ո�V_�<����>!w��x옔Z��P+�kê�����ơ���3�`�M�s�y+Uۓ	���56%Q�a�3B���s�+J�8�欮��iB袓���_��#Cg�!�DO{9yu~�|�rr:�a��{|� �#�Y���z��&��ml���˫9�O����0�XM�Xw#j��IF�C
{ �ڐڎ��@|���w��֍�K5��6?���D����Y;a��A쐓�"�|Ż�̈}@҇Yi��m��oejW�)]tF��� �e�	��AT=����)І���Rc�/�|�>��_�ܾ�����aɕT�h�8��*�<+���]gT��U��O�w*MYe]z�=#ٛ6&Hd��ӱ�˳���Eğ�r��Q�Rc��-C�"�W�$M���0Z������$���qap�O׸��k,�DQ�}�g<�A)	u�_�?�2�$�CːI6�5�w�|��NT��"�<��+�U$� �

l.��s&��.\|�F�&>]Y(�;Lc��)�-�?�\��ϓ�o�sc���x��>��~1uÞC�B����;�co;�P(CC�$�GI�ah���H�;��������&U	\xP�a���� g��ؚ$3>yi�~X?�|i+�^(�]���R��,�_��Po��)�k!�����]��ǅ�J{�/�`Z��>&8��(v�z�aw��-S{K�f�F8���lg�	�E�)a��IT߰��6t��4��Ǭ�R"�h���A9��FN���h;<]I3���|�
I�s�&�3�;�X�Ƃ�O ����\��uAHePe��f��(�v< [�v�*�{Gۼ4k|=�"���ܛ��Ӈ˷ۊ��v���q�w���w��f�?�xؠ��WQ�/P�P�.<c�zk���Bm�ް������f���@n���?��V��^� Y{%�9�Ͳw�7�}����!M�|�(�Hp��G\"Ͱ#C?�Ry��,�����B�"|B���=|3�����Q%z܇=[2S�n����}�^�􈞪౨����=+��Hik�KJ�����lo1�'�'�&��UL���3�k���=����n-س�T{[pе6��R�y	rw��.��!���a������(wV���͏Ȉo�Y
3aW[/v��J�l���F����u�~]���V_��{,���gA��c:�>�a��;���M���M�؊$@�↩�I|aC��K�^����;��	pA�'���[�����=�B@��o?�@Q��_��x{��S?�L <�^� �{�vk��$�Җ ��N>����1t��ة�5O'�@v����>��|�}�n<U)�^������� ��7�w R����;�g��b_KCk�Š��ⳬM�o�Wgp͞���J��6_�/<��.}��CljN�����sv��T��%�Y���\�k�^_�b��6��Yw��+Ver{���Q^�n�34��(�oio@,�5���DK^��Q[{���i�q      �      x������ � �      �   �  x��T�v�:\w��/����@��`N��y����Yr$_��&yo�RWս�PU�$� 헅��s�8�ª��w�@������&[���ґ=AQ�r��S�d4�\|�o���nI��<@�k�]Z�����rwb�kq��i�d�Y�B��1��@z����I.�tޢ����l.U.}v�s��p���tf ��0��D���^KT��z�JMd�$���,��>�n����t�5���0.s����vݑQ&��B�NɄ��U��iz#��!���EC�m����7&'SM\��!F�e�K��o/_Y6�;K)��g���IO9y�MJ5�P���3B���0!5����������y�9Z��Tc�R��V���*rW����{�g���JI���b�`=� Kx�X����f�1��?�s1���k�VWK�̒������)#{�x��<��w�$8&YER#�_���/n�R�I�V��WƮ�Q�|Æ���1y�+��y.�%��Eqj�+�p��gg���W�1�w��Q'3S9_.��T#��w����;��0Z������F�sx2��Ha`����5ĢnP��Β쨶+*��,���G&��t�ܵ����#��q��&�[K�Ya��]�̎4��*�_Ⳙ�"�ݽi���)�o�$���Rcڐ2EWpn1^�L�%�?v�����=J�S:S���o^�H��&�g!���q��,�	9>�����V����C�y�;z����ɨa8�B���Aj6�F����������ܔ����NO͋J����̚w���q�A�j�Hl��k�Y!^��/?��0�I�ct ��������s��;���ݚh��X]9�@��yR���������c��	NNN��V6a     