--6 Popolamento Database
--[WP2]

--Popolo i kpi
INSERT INTO kpi_codice_sconto(nome,descrizione,formula)
VALUES('Number of Uses','Numero di utilizzi del codice sconto', NULL);

INSERT INTO kpi_codice_sconto(nome,descrizione,formula)
VALUES ('Campaign Number of Uses','Numero di utilizzi del codice sconto durante il periodo della Campagnia', NULL);

INSERT INTO kpi_link_affiliato (nome,descrizione,formula)
VALUES ('Click Number','Il numero di click sul link affiliato',NULL);

INSERT INTO kpi_link_affiliato (nome,descrizione,formula)
VALUES ('Conversion Rate','Percentuale di utenti che dopo aver cliccato sul link affiliato hanno acquistare il servizio',NULL);

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Impression Totale','Numero di Impression totale (parametro utile per il calcolo delle Impression della campagna) dello streaming','Impression in diretta + Impression in differita');

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Impression in diretta','Numero di spettatori durante la sponsorizzazione in diretta',NULL);

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Impression in differita','Numero spettatori durante la sponsorizzazione in differita',NULL);

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Missed Impression','Indica il numero di spettatori che non hanno visualizzato la sponsorizzazione (spettatori totali-impression totale).  Può capitare ad esempio che uno spettatore inizia a visualizzare lo streaming  dopo che la sponsorizzazione sia già avvenuta','Spettatori totali - Impression totale');

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('View-Through Rate','Rapporto percentuale tra numero di Impression totali ed il numero di spettatori totali','Impression totale / Spettatori totali');

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Click-Through Rate','Misuriamo il rapporto percentuale tra Click al link affiliato (CN) e l’Impression totale','Click Number / Impression totale');

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Independent Click-Through Rate','Rapporto percentuale tra Click al link affiliato (CN) e Missed impression','Click Number / Missed Impression');

INSERT INTO kpi_streaming (nome,descrizione,formula)
VALUES ('Brand Exposure Time','Durata dell’intermezzo di sponsorizzazione, espresso in minuti',NULL);


--Popolo i tag
INSERT INTO tag(Nome)
VALUES('Musica');

INSERT INTO tag(Nome)
VALUES('Arte');

INSERT INTO tag(Nome)
VALUES('Musica Italiana');

INSERT INTO tag(Nome)
VALUES('Musica Giapponese');

INSERT INTO tag(Nome)
VALUES('Musica Inglese');

INSERT INTO tag(Nome)
VALUES('Rock');

INSERT INTO tag(Nome)
VALUES('POP');

INSERT INTO tag(Nome)
VALUES('Cubismo');

INSERT INTO tag(Nome)
VALUES('Rinascimento');

INSERT INTO tag(Nome)
VALUES('Arte Moderna');


--Popolo la Campagna 1 "Secondo Semestre"
INSERT INTO campagna (denominazione,tema_della_campagna,data_di_inizio,data_di_fine,ID_responsabile_azienda,budget)
VALUES ('Primo Semestre','Musica','2022-01-01','2022-07-01','AMBLOP01H07G976D','200');

--Popolo i codici sconto campagna 1
INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Pippo20','2021-12-25',0.20,NULL);

INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Paperino20','2021-12-25',0.20,'2022-06-15');

INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Pluto20','2021-12-27',0.20,'2022-07-15');

--Popolo i dati lavorativi campagna 1
INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('Ankaa',5);
INSERT INTO dati_anagrafici_creator(dati_lavorativi_creator,nome,cognome,data_di_nascita,lingua_madre)
VALUES ('Ankaa','Adolfo','Balzano','2001-06-04','Italiano');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('ankaa@twitch.com','Ankaa');

INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('MrElectric',4);
INSERT INTO dati_anagrafici_creator(dati_lavorativi_creator,nome,cognome,data_di_nascita,lingua_madre)
VALUES ('MrElectric','Christian','Conato','2001-10-08','Italiano');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('mrelectric@twitch.com','MrElectric');

INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('Coylaser',2);
INSERT INTO dati_anagrafici_creator(dati_lavorativi_creator,nome,cognome,data_di_nascita,lingua_madre)
VALUES ('Coylaser','Tommaso','Boccia','2001-05-31','Italiano');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('coylaser@twitch.com','Coylaser');

INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('Guardiano Notturno',3);
INSERT INTO dati_anagrafici_creator(dati_lavorativi_creator,nome,cognome,data_di_nascita,lingua_madre)
VALUES ('Guardiano Notturno','Nunzio','Del Gaudio','2001-08-01','Italiano');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('n.delgaudio5@studenti.unisa.it','Guardiano Notturno');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('ilnotturno@twitch.com','Guardiano Notturno');

--Popolo i contratti campagna 1
INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Pippo20','2021-12-25','2021-12-31','2022-04-05',3,1,'Primo Semestre','Ankaa','100000');

INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Paperino20','2021-12-25','2022-02-05','2022-06-01',2,1,'Primo Semestre','MrElectric','2760');

INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Paperino20','2021-12-25','2022-02-07','2022-06-15',1,5,'Primo Semestre','Coylaser','100');

INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Pluto20','2021-12-27','2022-02-12','2022-07-01',2,1,'Primo Semestre','Guardiano Notturno','3');

--Popolo le streaming campagna 1 (streamer Ankaa)
BEGIN TRANSACTION;

    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('3ioeh98ru','QUEEN TALK',150,3000,'Italiano','Ankaa','2022-02-05','22:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('3ioeh98ru','Pippo20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Inglese','3ioeh98ru');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rock','3ioeh98ru');


    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('1uigerb83','ACDC TALK',120,2000,'Italiano','Ankaa','2022-02-27','17:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('1uigerb83','Pippo20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Inglese','1uigerb83');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rock','1uigerb83');


    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('19eh8927','ARTIC MONKEYS TALK',130,4500,'Italiano','Ankaa','2022-03-10','22:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('19eh8927','Pippo20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Inglese','19eh8927');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rock','19eh8927');

COMMIT;

--Popolo le streaming campagna 1 (streamer MrElectric)
BEGIN TRANSACTION;

    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('a8f6098f6','Chiacchiere su Vasco Rossi',200,100,'Italiano','MrElectric','2022-02-10','22:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('a8f6098f6','Paperino20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Italiana','a8f6098f6');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('POP','a8f6098f6');


    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('3h2h3p2o3','Chiacchiere su Blanco',230,200,'Italiano','MrElectric','2022-03-17','17:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('3h2h3p2o3','Paperino20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Italiana','3h2h3p2o3');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('POP','3h2h3p2o3');

COMMIT;

--Popolo le streaming campagna 1 (streamer Coylaser)
BEGIN TRANSACTION;

    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('b4i4b3i4','Storia di Miyavi',200,100,'Italiano','Coylaser','2022-03-15','16:00:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('b4i4b3i4','Paperino20','2021-12-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Giapponese','b4i4b3i4');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rock','b4i4b3i4');

COMMIT;

--Popolo le streaming campagna 1 (streamer Guardiano Notturno)
BEGIN TRANSACTION;

    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('ui4b3uiph','Parliamo di Rihanna',200,100,'Italiano','Guardiano Notturno','2022-05-10','16:00:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('ui4b3uiph','Pluto20','2021-12-27');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Inglese','ui4b3uiph');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('POP','ui4b3uiph');

    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('o4hniou4n','Parliamo di Ed Sheeran',200,100,'Italiano','Guardiano Notturno','2022-06-15','13:00:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('o4hniou4n','Pluto20','2021-12-27');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Musica Inglese','o4hniou4n');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('POP','o4hniou4n');

COMMIT;

--Popolo i link affiliato Campagna 1
INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/3ioeh98ru','3ioeh98ru','Primo Semestre','Ankaa','2022-05-25');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/1uigerb83','1uigerb83','Primo Semestre','Ankaa','2022-05-26');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/19eh8927','19eh8927','Primo Semestre','Ankaa','2022-05-27');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/a8f6098f6','a8f6098f6','Primo Semestre','MrElectric','2022-05-30');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/3h2h3p2o3','3h2h3p2o3','Primo Semestre','MrElectric','2022-06-29');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/b4i4b3i4','b4i4b3i4','Primo Semestre','Coylaser','2022-06-29');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/ui4b3uiph','ui4b3uiph','Primo Semestre','Guardiano Notturno','2022-06-29');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/o4hniou4n','o4hniou4n','Primo Semestre','Guardiano Notturno','2022-06-29');

--Popolo le analisi dei codici sconto Campagna 1
INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Pippo20','2021-12-25',874);

INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Paperino20','2021-12-25',250);

INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Number of Uses','Paperino20','2021-12-25',538);

INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Number of Uses','Pluto20','2021-12-27',158);

INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Pluto20','2021-12-27',70);

--Popolo le analisi dei link affiliato Campagna 1
INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/3ioeh98ru',750);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/3ioeh98ru',0.5);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/1uigerb83',33);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/1uigerb83',0.02);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/19eh8927',150);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/19eh8927',0.65);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/a8f6098f6',102);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/a8f6098f6',0.05);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/3h2h3p2o3',77);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/3h2h3p2o3',0.06);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/b4i4b3i4',50);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/b4i4b3i4',0.43);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/ui4b3uiph',245);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/ui4b3uiph',0.03);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/o4hniou4n',80);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/o4hniou4n',0.09);

--Popolo le analisi delle streaming Campagna 1
--Stream 1 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','3ioeh98ru',2000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','3ioeh98ru',1500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','3ioeh98ru',500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','3ioeh98ru',1000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','3ioeh98ru',0.67);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','3ioeh98ru',0.38);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','3ioeh98ru',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','3ioeh98ru',2);

--Stream 2 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','1uigerb83',1500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','1uigerb83',1450);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','1uigerb83',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','1uigerb83',500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','1uigerb83',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','1uigerb83',0.02);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','1uigerb83',0.07);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','1uigerb83',2);

--Stream 3 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','19eh8927',3800);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','19eh8927',3000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','19eh8927',800);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','19eh8927',700);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','19eh8927',0.84);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','19eh8927',0.04);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','19eh8927',0.20);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','19eh8927',2);

--Stream 4 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','a8f6098f6',150);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','a8f6098f6',97);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','a8f6098f6',53);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','a8f6098f6',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','a8f6098f6',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','a8f6098f6',0.97);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','a8f6098f6',2.02);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','a8f6098f6',2);

--Stream 5 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','3h2h3p2o3',200);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','3h2h3p2o3',150);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','3h2h3p2o3',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','3h2h3p2o3',30);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','3h2h3p2o3',0.87);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','3h2h3p2o3',0.39);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','3h2h3p2o3',2.56);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','3h2h3p2o3',2);

--Stream 6 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','b4i4b3i4',70);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','b4i4b3i4',20);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','b4i4b3i4',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','b4i4b3i4',30);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','b4i4b3i4',0.35);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','b4i4b3i4',0.71);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','b4i4b3i4',1.67);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','b4i4b3i4',5);

--Stream 7 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','ui4b3uiph',150);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','ui4b3uiph',78);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','ui4b3uiph',72);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','ui4b3uiph',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','ui4b3uiph',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','ui4b3uiph',1.63);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','ui4b3uiph',4.90);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','ui4b3uiph',5);

--Stream 8 Campagna 1
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','o4hniou4n',180);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','o4hniou4n',80);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','o4hniou4n',100);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','o4hniou4n',20);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','o4hniou4n',0.90);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','o4hniou4n',0.44);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','o4hniou4n',4.00);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','o4hniou4n',3);


------------------------------------------------------------------------------------------------------------------------
--Popolo la Campagna 2 "Secondo Semestre"
INSERT INTO campagna (denominazione,tema_della_campagna,data_di_inizio,data_di_fine,ID_responsabile_azienda,budget)
VALUES ('Secondo Semestre','Arte','2022-07-01','2022-12-31','AMCLOP01F77G976H','500');

--Popolo i codici sconto campagna 2
INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Mario15','2022-06-25',0.15,NULL);

INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Paperino20','2022-07-25',0.15,NULL); 

INSERT INTO codice_sconto(codice_alfanumerico,data_inizio_validita,valore_sconto,data_di_scadenza)
VALUES ('Waluigi15','2022-06-27',0.15,'2023-02-15');

--Popolo i dati lavorativi campagna 2
INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('Giggino',1);
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('giggino@twitch.com','Giggino');

INSERT INTO dati_lavorativi_creator(nome_del_canale,rapporto_col_creator)
VALUES ('Sagirama',4);
INSERT INTO dati_anagrafici_creator(dati_lavorativi_creator,nome,cognome,data_di_nascita,lingua_madre)
VALUES ('Sagirama','Emanuela','Grimaldi','1998-09-05','Inglese');
INSERT INTO email(indirizzo,dati_lavorativi_creator)
VALUES ('sagirama@twitch.com','Sagirama');

--Popolo i contratti campagna 2
INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Mario15','2022-06-25','2022-07-01','2022-10-01',2,2,'Secondo Semestre','Giggino','10000');

INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Paperino20','2022-07-25','2022-08-08','2022-11-25',2,5,'Secondo Semestre','Ankaa','100000');

INSERT INTO contratto(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita, data_inizio_validita, data_scadenza,nss,bet_contrattuale,campagna,dati_lavorativi_creator,numero_iscritti)
VALUES('Waluigi15','2022-06-27','2022-09-20','2022-12-30',1,10,'Secondo Semestre','Sagirama','83200');

--Popolo le streaming campagna 2 (Streamer Giggino)
BEGIN TRANSACTION;
    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('i3hu23np','Bermejo',120,500,'Spagnolo','Giggino','2022-08-25','22:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('i3hu23np','Mario15','2022-06-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rinascimento','i3hu23np');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte','i3hu23np');


    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('67jn5kloo','Juhan Gomez',100,300,'Spagnolo','Giggino','2022-09-05','16:00:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('67jn5kloo','Mario15','2022-06-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Rinascimento','67jn5kloo');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte','67jn5kloo');

COMMIT;

--Popolo le streaming campagna 2 (Streamer Ankaa)
BEGIN TRANSACTION;
    
    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('24u9838io','Picasso a nudo',150,4000,'Italiano','Ankaa','2022-08-10','22:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('24u9838io','Paperino20','2022-07-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Cubismo','24u9838io');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte','24u9838io');

    
    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('ui3hiu23','Braque a nudo',100,1000,'Italiano','Ankaa','2022-10-08','17:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('ui3hiu23','Paperino20','2022-07-25');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Cubismo','ui3hiu23');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte','ui3hiu23');

COMMIT;

--Popolo le streaming campagna 2 (Streamer Sagirama)
BEGIN TRANSACTION;
    INSERT INTO streaming_con_sponsorizzazione(id_streaming,Titolo,durata,numero_di_spettatori,lingua_utilizzata,dati_lavorativi_creator,data_inizio_trasmissione,ora_inizio_trasmissione)
    VALUES('l2jn5k2n','Monet Talk',180,5000,'Inglese','Sagirama','2022-11-11','10:30:00');

    INSERT INTO disposizione_codice_sconto(streaming_con_sponsorizzazione,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita)
    VALUES('l2jn5k2n','Waluigi15','2022-06-27');

    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte Moderna','l2jn5k2n');
    INSERT INTO descrizione(tag,streaming_con_sponsorizzazione)
    VALUES('Arte','l2jn5k2n');
COMMIT;

--Popolo i link affiliato Campagna 2
INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/i3hu23np','i3hu23np','Secondo Semestre','Giggino','2022-10-30');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/67jn5kloo','67jn5kloo','Secondo Semestre','Giggino','2022-10-30');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/24u9838io','24u9838io','Secondo Semestre','Ankaa','2022-11-30');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/ui3hiu23','ui3hiu23','Secondo Semestre','Ankaa','2022-11-30');

INSERT INTO link_affiliato(url,streaming_con_sponsorizzazione,contratto_campagna,contratto_dati_lavorativi_creator,data_di_scadenza)
VALUES('www.nordvpn.com/buy/l2jn5k2n','l2jn5k2n','Secondo Semestre','Sagirama','2022-12-30');

--Popolo le analisi dei codici sconto Campagna 2
INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Mario15','2022-06-25',80);


INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Paperino20','2022-07-25',1000);


INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Number of Uses','Waluigi15','2022-06-27',1000);

INSERT INTO analisi_codice_sconto(kpi_codice_sconto,codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita,valore)
VALUES ('Campaign Number of Uses','Waluigi15','2022-06-27',700);

--Popolo le analisi dei Link Affiliati Campagna 2
INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/i3hu23np',400);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/i3hu23np',0.50);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/67jn5kloo',100);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/67jn5kloo',0.10);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/24u9838io',800);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/24u9838io',0.30);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/ui3hiu23',500);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/ui3hiu23',0.20);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Click Number','www.nordvpn.com/buy/l2jn5k2n',3000);

INSERT INTO analisi_link_affiliato(kpi_link_affiliato,link_affiliato,valore)
VALUES('Conversion Rate','www.nordvpn.com/buy/l2jn5k2n',0.9);

--Popolo le analisi delle streaming Campagna 2
--Stream 1 Campagna 2
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','i3hu23np',420);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','i3hu23np',350);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','i3hu23np',70);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','i3hu23np',80);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','i3hu23np',0.80);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','i3hu23np',0.95);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','i3hu23np',5.00);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','i3hu23np',2);

--Stream 2 Campagna 2
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','67jn5kloo',250);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','67jn5kloo',200);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','67jn5kloo',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','67jn5kloo',50);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','67jn5kloo',0.83);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','67jn5kloo',0.40);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','67jn5kloo',2.00);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','67jn5kloo',2);

--Stream 3 Campagna 2
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','24u9838io',3000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','24u9838io',2500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','24u9838io',500);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','24u9838io',1000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','24u9838io',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','24u9838io',0.27);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','24u9838io',0.80);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','24u9838io',5);

--Stream 4 Campagna 2
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','ui3hiu23',600);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','ui3hiu23',400);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','ui3hiu23',200);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','ui3hiu23',400);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','ui3hiu23',0.65);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','ui3hiu23',0.83);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','ui3hiu23',1.25);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','ui3hiu23',5);

--Stream 5 Campagna 2
INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression Totale','l2jn5k2n',4000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in diretta','l2jn5k2n',3000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Impression in differita','l2jn5k2n',1000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Missed Impression','l2jn5k2n',1000);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('View-Through Rate','l2jn5k2n',0.80);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Click-Through Rate','l2jn5k2n',0.75);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Independent Click-Through Rate','l2jn5k2n', 3.00);

INSERT INTO analisi_streaming(kpi_streaming,streaming_con_sponsorizzazione,valore)
VALUES('Brand Exposure Time','l2jn5k2n',12);
