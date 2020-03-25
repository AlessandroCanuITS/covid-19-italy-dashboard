ALTER DATABASE postgres SET timezone TO 'Europe/Rome';

set timezone TO 'Europe/Rome';

CREATE TABLE "dati-regioni"
(
    data timestamp,
    stato character varying,
    codice_regione character varying,
    denominazione_regione character varying,
    lat float,
    long float,
    ricoverati_con_sintomi integer,
    terapia_intensiva integer,
    totale_ospedalizzati integer,
    isolamento_domiciliare integer,
    totale_attualmente_positivi integer,
    nuovi_attualmente_positivi integer,
    dimessi_guariti integer,
    deceduti integer,
    totale_casi integer,
    tamponi integer,
    note_it,
    note_en
)



TABLESPACE pg_default;

ALTER TABLE "dati-regioni"
    OWNER to postgres;


COPY "dati-regioni" FROM PROGRAM 'curl "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv"' WITH (FORMAT csv, DELIMITER ',', HEADER true);
