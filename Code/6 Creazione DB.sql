--6 Creazione 
--[WP2]
drop table if exists KPI_Codice_sconto; 
drop table if exists KPI_streaming; 
drop table if exists KPI_link_affiliato; 
drop table if exists codice_sconto; 
drop table if exists campagna;
drop table if exists dati_lavorativi_creator; 
drop table if exists tag; 
drop table if exists analisi_codice_sconto; 
drop table if exists analisi_link_affiliato;
drop table if exists link_affiliato; 
drop table if exists analisi_streaming; 
drop table if exists streaming_con_sponsorizzazione;
drop table if exists disposizione_codice_sconto; 
drop table if exists descrizione; 
drop table if exists contratto; 
drop table if exists email; 
drop table if exists dati_anagrafici_creator; 

-----------------------------------

Create table KPI_Codice_sconto(
	nome varchar(23),
	descrizione varchar(255) unique not null,
	formula varchar(100) unique null,

	primary key (nome),

	check(nome='Number of Uses' or nome='Campaign Number of Uses')
);
-----------------------------------

Create table KPI_link_affiliato(
	nome varchar(15),
	descrizione varchar(255) unique not null,
	formula varchar(100) unique null,

	primary key (nome),

	check(nome='Click Number' or nome='Conversion Rate')
);
-----------------------------------

Create table KPI_streaming(
	nome varchar(30),
	descrizione varchar(255) unique not null,
	formula varchar(100) unique null,

	primary key (nome),

	check(nome='Impression Totale' or nome='Impression in diretta' or nome='Impression in differita' 
			or nome='Missed Impression' or nome='View-Through Rate' or nome='Click-Through Rate' 
			or nome ='Independent Click-Through Rate' or nome='Brand Exposure Time'
		 )
);
-----------------------------------

Create table analisi_codice_sconto(
	KPI_codice_sconto varchar(23), 
	codice_sconto_codice_alfanumerico varchar(20),
	codice_sconto_data_inizio_validita date,
	valore integer not null,

	primary key(KPI_codice_sconto,
				codice_sconto_codice_alfanumerico,
				codice_sconto_data_inizio_validita
				),

	check(valore >= 0) --i kpi di codice sconto non possono mai assumere valori negativi	
);	
-----------------------------------

Create table analisi_link_affiliato(
	KPI_link_affiliato varchar(15),
	link_affiliato varchar(50),
	valore decimal(10,2) not null, --da prevedere un trigger che a seconda del campo name decide i possibili intervalli di valori-- 

	primary key(KPI_link_affiliato,
				link_affiliato
				),

	check(valore >= 0)
);	
------------------------------------

Create table analisi_streaming(
	KPI_streaming varchar(30),
	streaming_con_sponsorizzazione varchar(20),
	valore decimal(10,2) not null,

	primary key(KPI_streaming,
				streaming_con_sponsorizzazione
				),

	check(valore >= 0)
);
------------------------------------

Create table codice_sconto(
	codice_alfanumerico varchar(20),
	data_inizio_validita date,
	valore_sconto decimal(3,2) not null,
	data_di_scadenza date null,

	primary key(Codice_alfanumerico,
				Data_inizio_validita
				),

	check (valore_sconto<=1 and valore_sconto>=0), --non può esserci uno sconto più grande di 1 (espresso in deciamli)
	check (LENGTH(codice_alfanumerico)>=3)
);
-----------------------------------

Create table link_affiliato(
	url varchar(50),
	streaming_con_sponsorizzazione varchar(20) not null,
	contratto_campagna varchar(20) not null,
	contratto_dati_lavorativi_creator varchar(20) not null,
	data_di_scadenza date not null,

	primary key (url),
	unique (streaming_con_sponsorizzazione)	
);
-----------------------------------

Create table streaming_con_sponsorizzazione(
	id_streaming varchar(20),
	titolo varchar(50) not null,
	durata integer not null,
	numero_di_spettatori integer not null,
	lingua_utilizzata varchar(20) not null,
	dati_lavorativi_creator varchar(20) not null,
	data_inizio_trasmissione date not null,
	ora_inizio_trasmissione time not null,

	primary key (id_streaming),
	check(durata>0),
	check(numero_di_spettatori>=0)
	
);	
----------------------------------


Create table disposizione_codice_sconto(
	streaming_con_sponsorizzazione varchar(20),
	codice_sconto_codice_alfanumerico varchar(20) not null,
	codice_sconto_data_inizio_validita date not null,

	primary key (streaming_con_sponsorizzazione)
	
);	
-----------------------------------


Create table campagna(
	denominazione varchar(20),
	tema_della_campagna varchar(20) not null,
	data_di_inizio date not null,
	data_di_fine date not null,
	ID_responsabile_azienda char(16) not null,
	budget integer not null,

	primary key (denominazione),
	unique(tema_della_campagna,
			data_di_inizio
			),

	check (data_di_inizio<(data_di_fine-10)),
	check (budget>0), --sicuramente non negativo
	check (LENGTH(ID_responsabile_azienda)=16)
);
----------------------------------


Create table contratto(
	campagna varchar(20) not null,
	dati_lavorativi_creator varchar(20) not null,
	codice_sconto_codice_alfanumerico varchar(20) not null,
	codice_sconto_data_inizio_validita date not null,
	data_inizio_validita date not null,
	data_scadenza date not null,
	nss smallint not null default 0,
	bet_contrattuale numeric(4,2) not null,
	numero_iscritti integer not null,

	primary key(campagna, 
				dati_lavorativi_creator
				),

	check (data_inizio_validita<(data_scadenza-10)),
	check (nss>=0),
	check (bet_contrattuale>0),
	check (numero_iscritti>0)
	
	
);
-----------------------------------

Create table dati_lavorativi_creator(
	nome_del_canale varchar(20),
	rapporto_col_creator numeric(1,0) null,

	primary key(nome_del_canale),

	check (rapporto_col_creator>=0 or rapporto_col_creator<=5)
);
------------------------------------

Create table email(
	indirizzo varchar(30),
	dati_lavorativi_creator varchar(20) not null,

	primary key (indirizzo)
	
);	
------------------------------------


create table dati_anagrafici_creator(
	dati_lavorativi_creator varchar(20),
	nome varchar(20) not null,
	cognome varchar(20) not null,
	data_di_nascita date not null,
	lingua_madre varchar(20) not null,

	primary key(dati_lavorativi_creator)
	
);
---------------------------------------------


Create table descrizione(
	tag varchar(20),
	streaming_con_sponsorizzazione varchar(20),
	primary key(tag,
				streaming_con_sponsorizzazione
				)
		
);
----------------------------------------------

Create table tag(
	nome varchar(20),

	primary key(nome)
);


--INTEGRITÁ REFERENZIALE

alter table analisi_codice_sconto
		add foreign key(KPI_codice_sconto) references KPI_Codice_sconto(nome) 
			on update cascade on delete no action, --impediamo di eliminare un kpi se la base dati contiene ancora dei valori inerenti ad esso
		add foreign key(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita) references codice_sconto(codice_alfanumerico,data_inizio_validita)
			 on update cascade on delete cascade; --eliminando il buono sconto vengono eliminati anche i dati ad esso associato


alter table analisi_link_affiliato
		add foreign key (KPI_link_affiliato) references KPI_link_affiliato(nome) 
			on update cascade on delete no action, --stessa logica precendente 
		add foreign key(link_affiliato) references link_affiliato(url)
			 on update cascade on delete cascade; --stessa logica precendente


alter table analisi_streaming
		add foreign key (KPI_streaming) references KPI_streaming(nome) 
			on update cascade on delete no action, --stessa logica precendente 
		add foreign key(streaming_con_sponsorizzazione) references streaming_con_sponsorizzazione(id_streaming)
			 on update cascade on delete cascade; --stessa logica precendente



alter table link_affiliato
		add foreign key(streaming_con_sponsorizzazione) references streaming_con_sponsorizzazione(id_streaming) 
			on update cascade on delete cascade, --se elimino lo streaming elimino anche il link ad esso associato
		add foreign key(contratto_campagna, contratto_dati_lavorativi_creator) references contratto(campagna,dati_lavorativi_creator) 
			on update cascade on delete no action; --non posso eliminare un contratto se ho ancora memorizzato i link ad esso associati


alter table streaming_con_sponsorizzazione 
		add foreign key (dati_lavorativi_creator) references dati_lavorativi_creator(nome_del_canale) 
			on update cascade on delete no action, --non posso eliminare un creator che ha ancora streaming allocate nella base dati
		add foreign key (id_streaming) references disposizione_codice_sconto(streaming_con_sponsorizzazione) 
			on update cascade on delete no action
				deferrable initially deferred; --ciclo di referenziazione disposizione_codice_sconto



alter table disposizione_codice_sconto 
		add foreign key(codice_sconto_codice_alfanumerico, codice_sconto_data_inizio_validita) references codice_sconto(codice_alfanumerico,data_inizio_validita)
			on update cascade on delete no action, --non posso eliminare un codice sconto se è stato utilizzato in una streaming allocata nella base dati
		add foreign key(streaming_con_sponsorizzazione) references streaming_con_sponsorizzazione(id_streaming) 
			on update cascade on delete cascade
				deferrable initially deferred; --ciclo di referenziazione streaming_con_sponsorizzazione


alter table contratto 
		add foreign key(codice_sconto_codice_alfanumerico,codice_sconto_data_inizio_validita) references codice_sconto(codice_alfanumerico,data_inizio_validita)
			on update cascade on delete no action,  --non si può eliminare un codice sconto che fa rifermento a un contratto esistente
		add foreign key (campagna) references campagna(denominazione) 
			on update cascade on delete cascade,  --se elimino la campagna elimino anche i contratti associati
		add foreign key (dati_lavorativi_creator) references dati_lavorativi_creator(nome_del_canale)
			 on update cascade on delete cascade; --se elimino i dati lavorativi di un creator elimino anche i sui contratti associati


alter table email
		add foreign key (dati_lavorativi_creator) references dati_lavorativi_creator(nome_del_canale) 
			on update cascade on delete cascade; --se elimino il creator elimino anche le sue mail


alter table dati_anagrafici_creator
		add foreign key (dati_lavorativi_creator) references dati_lavorativi_creator(nome_del_canale) 
			on update cascade on delete  cascade; -- se elimino il creator elimino anche i suoi dati anagrafici


alter table descrizione
		add foreign key(tag) references tag(nome) 
			on update cascade on delete cascade,-- se viene eliminato il tag viene eliminata l'associazione
		add foreign key(streaming_con_sponsorizzazione) references streaming_con_sponsorizzazione(id_streaming) 
			on update cascade on delete cascade; --se viene eliminata la streaming viene eliminata l'associazione