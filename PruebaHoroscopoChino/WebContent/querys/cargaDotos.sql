--CREACION TABLAS USUARIO Y HOROSCOPO
CREATE TABLE USUARIO (
    ID NUMBER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR2(80) NOT NULL,
    APELLIDO VARCHAR2(80) NOT NULL,
    EMAIL VARCHAR(80),
    FECHA_NACIMIENTO DATE,
    NOMBRE_USUARIO VARCHAR2(80),
    CONTRASENA VARCHAR2(80),
    IS_ADMIN NUMBER 
);

CREATE TABLE HOROSCOPO(
    COD_ANIMAL VARCHAR2(8) PRIMARY KEY NOT NULL,
    NOM_ANIMAL VARCHAR2(30),
    DESC_ANIMAL VARCHAR2(800)
);

CREATE TABLE ANIO_ANIMAL(
    ANIO NUMBER PRIMARY KEY NOT NULL,
    COD_ANIMAL_H VARCHAR2(8) NOT NULL,
    FOREIGN KEY (COD_ANIMAL_H) REFERENCES HOROSCOPO(COD_ANIMAL)
);

-- SEUCENCIA PARA EL ID DE LA TABLA USUARIO
CREATE SEQUENCE SEC_USUARIO_HOROSCOPO
 START WITH     1
 INCREMENT BY   1;

-- INSERT DE USUARIO ADMIN
INSERT INTO USUARIO VALUES(SEC_USUARIO_HOROSCOPO.NEXTVAL,'Admin','Admin','Admin@testAdmin.com','03-03-1998','admin','admin',1);
INSERT INTO USUARIO VALUES(SEC_USUARIO_HOROSCOPO.NEXTVAL,'Germán','Pinto','german.pinto@test.com','12-08-1985','gpinto','1234',0);

--INSERT DE HOROSCOPOS
--COD_ANIMAL,DESC_ANIMAL
INSERT INTO HOROSCOPO VALUES('RATA01','rata','Los nacidos bajo el signo de la Rata son persona sabias a las que les gusta rodearse de familiares y amigos, a quienes ayudan en sus quehaceres y problemas diarios. Buenas trabajadoras, ahorradores y buenos administradores de su economía.');
INSERT INTO HOROSCOPO VALUES('BUEY01','buey','Los búfalos o bueyes son animales pacientes y tranquilos, que irradian mucho cariño y amor e infunden respeto. Grandes trabajadores, se sienten a gusto rodeados del orden y la limpieza y logran el éxito gracias a su esfuerzo. Para ellos lo más importante es la familia, aunque son celosos con su pareja. Aman el arte y la música. No les gusta discutir, aunque sí que le obedezcan.');
INSERT INTO HOROSCOPO VALUES('TIGR01','tigre','Las personas de este signo son muy pasionales y llenas de energía. No pasan desapercibidas, son aventureros, independientes, ingeniosos, impulsivos y les gusta la diversión. Son amigos para toda la vida, aunque les gusta ser el líder del grupo. En el mundo de las relaciones de pareja se muestran el más fuerte, sexy y seductor, aunque de comportamiento excesivo.');
INSERT INTO HOROSCOPO VALUES('CONE01','conejo','Los que nacen en el Año del Conejo reúnen extraordinarias cualidades humanas: son prudentes, inteligentes, afables, discretos, previsores, atentos y benevolentes. Por eso, el signo del conejo es ampliamente aceptado por la gente.
De carácter moderado e indulgente, amante de la paz y la concordia, el conejo odia la guerra y la violencia. Le gusta la vida tranquila, la ternura y la armonía.');
INSERT INTO HOROSCOPO VALUES('DRAG01','dragón','Símbolo del Emperador en China, el dragón es imaginativo, magnánimo, emprendedor, afortunado y poderoso. Está lleno de fuerza y vitalidad. Es un verdadero acumulador de energía y si le enojas, se enfurecerá de tal manera que perderá los estribos. Será difícil calmarle, pues no cree ni a nadie ni en nadie. Suelen dar buenos consejos y son afortunados tanto en el dinero como en el amor. Son muy sentimentales y se enamoran locamente.');
INSERT INTO HOROSCOPO VALUES('SERP01','serpiente','Las personas Serpientes son astutas, saben lo que quieren y cómo conseguirlo. Su conversación es elegante y fluida. Son intensos y prudentes a la vez. Son celosas y posesivas con su familia pero leales. Les gusta mimar a sus amigos y esperan de ellos una actitud recíproca. Si se sienten desdeñados o fracasan en sus tentativas, pueden estar enfadados durante horas, aunque son buenas para mantener la calma y parecer tranquilas en situaciones difíciles.');
INSERT INTO HOROSCOPO VALUES('CABA01','caballo','Populares, optimistas, llenos de alegría, aventureros, elocuentes, impacientes, emprendedores, entusiastas con la vida, grandes amantes y amigos. Su gran pasión es el dinero y los viajes. Les gusta conocer gente nueva, distintas culturas, hablar idiomas y son el alma de las fiestas. Su atractivo físico y su belleza hace que les sea fácil encontrar el amor: trampa en la que caen sin remedio.');
INSERT INTO HOROSCOPO VALUES('CABR01','cabra','La cabra es creativa, artística, positiva, elegante, femenina, afable, compasiva, llorona, sensible, soñadora, orgullosa y triste. No persiguen la riqueza material y prefieren vivir de sus ensoñaciones. Aman la familia, los niños, el hogar y estar en contacto con la naturaleza. Son muy trabajadoras, aunque no les gusta la presión ni de una fecha límite, ni de un jefe.');
INSERT INTO HOROSCOPO VALUES('MONO01','mono','Animal más parecido al ser humano, es ingenioso, divertido, simpático, de mente rápida y despierta, comprador, persuasivo, sociable, capaces de resolver cualquier problema por difícil que sea con soltura. Sus relaciones amorosas y con los amigos suelen ser conflictivas, pues no soporta que no lo valoren. Gozan de buena salud, aunque sus excesos en las fiestas, alcohol y drogas podrían pasarle factura.');
INSERT INTO HOROSCOPO VALUES('GALL01','gallo','Atractivo y seductor, con talento y apreciado. Son meticulosos, eficientes, ordenados, buenos conversadores, observadores, egoístas, usureros, pragmáticos y muy familiares. En el amor son románticos, obstinados y luchan por el control de su pareja. Suelen destacar como relaciones públicas o como artistas. No prestan demasiada atención a su salud.');
INSERT INTO HOROSCOPO VALUES('PERR01','perro','El perro es un ser dedicado al trabajo, honesto, confiable, diligente, con un gran sentido de la justicia y la lealtad. Cautiva a todos con su personalidad excitante, su buen humor y su gran capacidad para escuchar los problemas de los demás y dar buenos consejos. En el amor son fieles y leales, aunque muy celoso cuando su pareja no está en casa. Los nervios son su mayor problema de salud.');
INSERT INTO HOROSCOPO VALUES('CERD01','cerdo','Es un animal sincero, honesto, confiado, educado, cariñoso, servicial, valiente, decidido, con gran fuerza de voluntad, sin grandes pretensiones ni vanidad, con los pies en la tierra. Son muy agradables y tienen gusto y modales impecables. En el amor son sensuales, apasionado y pacientes, pero hasta un punto. Son muy trabajadores, aunque la falta de atracción por el deporte y la apatía harán que su físico se resienta y engorde en exceso.');

-- INSERT DE AÑOS ASOCIADOS AL ANIMAL
--ANIO,COD_ANIMAL_H,FECHA_INI,FECHA_FIN
INSERT INTO ANIO_ANIMAL VALUES('1936','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('1948','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('1960','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('1972','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('1984','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('1996','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('2008','RATA01');
INSERT INTO ANIO_ANIMAL VALUES('2020','RATA01');

INSERT INTO ANIO_ANIMAL VALUES('1937','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('1949','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('1961','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('1973','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('1985','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('1997','BUEY01');
INSERT INTO ANIO_ANIMAL VALUES('2009','BUEY01');

INSERT INTO ANIO_ANIMAL VALUES('1938','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('1950','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('1962','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('1974','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('1986','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('1998','TIGR01');
INSERT INTO ANIO_ANIMAL VALUES('2010','TIGR01');

INSERT INTO ANIO_ANIMAL VALUES('1939','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('1951','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('1963','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('1975','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('1987','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('1999','CONE01');
INSERT INTO ANIO_ANIMAL VALUES('2011','CONE01');

INSERT INTO ANIO_ANIMAL VALUES('1940','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('1952','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('1964','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('1976','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('1988','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('2000','DRAG01');
INSERT INTO ANIO_ANIMAL VALUES('2012','DRAG01');

INSERT INTO ANIO_ANIMAL VALUES('1941','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('1953','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('1965','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('1977','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('1989','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('2001','SERP01');
INSERT INTO ANIO_ANIMAL VALUES('2013','SERP01');

INSERT INTO ANIO_ANIMAL VALUES('1942','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('1954','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('1966','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('1978','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('1990','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('2002','CABA01');
INSERT INTO ANIO_ANIMAL VALUES('2014','CABA01');

INSERT INTO ANIO_ANIMAL VALUES('1943','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('1955','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('1967','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('1979','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('1991','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('2003','CABR01');
INSERT INTO ANIO_ANIMAL VALUES('2015','CABR01');

INSERT INTO ANIO_ANIMAL VALUES('1944','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('1956','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('1968','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('1980','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('1992','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('2004','MONO01');
INSERT INTO ANIO_ANIMAL VALUES('2016','MONO01');

INSERT INTO ANIO_ANIMAL VALUES('1945','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('1957','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('1969','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('1981','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('1993','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('2005','GALL01');
INSERT INTO ANIO_ANIMAL VALUES('2017','GALL01');

INSERT INTO ANIO_ANIMAL VALUES('1946','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('1958','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('1970','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('1982','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('1994','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('2006','PERR01');
INSERT INTO ANIO_ANIMAL VALUES('2018','PERR01');

INSERT INTO ANIO_ANIMAL VALUES('1947','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('1959','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('1971','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('1983','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('1995','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('2007','CERD01');
INSERT INTO ANIO_ANIMAL VALUES('2019','CERD01');

