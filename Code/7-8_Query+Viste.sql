--7 Query SQL
--[WP3]
--7.1 Query con operatore di aggregazione e join: Info Codici sconto scaduti, disposti almeno due volte
SELECT C.campagna AS "Campagna di appartenenza",
	CS.codice_alfanumerico  AS "Codice del codice sconto", 
    CS.data_inizio_validita AS "Inizio validità codice", 
    CS.data_di_scadenza AS "Data scadenza codice",
    ACS.KPI_Codice_sconto AS "KPI",
    ACS.valore AS "Valore KPI",
    COUNT(DISTINCT DC.Streaming_con_sponsorizzazione) AS "Numero streaming"
FROM codice_sconto AS CS
    JOIN disposizione_codice_sconto AS DC 
    ON CS.codice_alfanumerico = DC.codice_sconto_codice_alfanumerico
    AND CS.data_inizio_validita = DC.codice_sconto_data_inizio_validita
        JOIN analisi_codice_sconto AS ACS
        ON CS.codice_alfanumerico = ACS.codice_sconto_codice_alfanumerico
        AND CS.data_inizio_validita = ACS.codice_sconto_data_inizio_validita
            JOIN contratto AS C
            ON CS.codice_alfanumerico = C.codice_sconto_codice_alfanumerico
            AND CS.data_inizio_validita = C.codice_sconto_data_inizio_validita
WHERE CS.data_di_scadenza is not null --già scaduti
GROUP BY CS.codice_alfanumerico, CS.data_inizio_validita,  ACS.KPI_Codice_sconto, ACS.valore, C.campagna
HAVING(COUNT(DISTINCT DC.Streaming_con_sponsorizzazione)>=2)     --almeno in due streaming
ORDER BY "Codice del codice sconto", "Data scadenza codice", "Numero streaming"  DESC;


--7.2 Query nidificata complessa: Creator con relativo contratto e numero di streaming di campagne con durata maggiore di 26 settimane
SELECT DLC.nome_del_canale AS "Creator", 
    CO.campagna AS "Campagna", 
	DLC.rapporto_col_creator AS "Valutazione creator", 
    (SELECT count(*)  AS "Numero streaming"
        FROM dati_lavorativi_creator AS DLCC
            JOIN streaming_con_sponsorizzazione AS SS
            ON DLCC.nome_del_canale=SS.dati_lavorativi_creator
                JOIN link_affiliato AS LA
                ON SS.id_streaming=LA.streaming_con_sponsorizzazione
                    JOIN campagna AS CA
                    ON LA.contratto_campagna =CA.denominazione
        WHERE (DLCC.nome_del_canale=DLC.nome_del_canale) 
        AND CO.campagna = CA.denominazione  --cioè le campagne ottenute dalla 
	 									    --query annidata della where
    )
FROM dati_lavorativi_creator AS DLC     
    JOIN contratto AS CO
    ON DLC.nome_del_canale = CO.dati_lavorativi_creator
WHERE CO.campagna = any(
    SELECT CA.denominazione 
    FROM campagna as CA
    WHERE (CA.data_di_fine-CA.data_di_inizio)>= 182)   --cambiare la durata della campanga  
    AND DLC.rapporto_col_creator >=4  --cambiare il rapporto minimo
ORDER BY CO.campagna,DLC.nome_del_canale,DLC.rapporto_col_creator DESC


--7.3 Query insiemistica: Elenco di Link nelle campagne con doppio filtro per il nome
     SELECT url AS "Url",
	streaming_con_sponsorizzazione AS "Streaming",
	contratto_campagna AS "Contratto",
	contratto_dati_lavorativi_creator AS "Creator",
	data_di_scadenza AS "Data scadenza link"
    FROM link_affiliato 
    WHERE link_affiliato.contratto_campagna ILIKE '%c%' --carattere modificabile 
EXCEPT
    SELECT *
    FROM link_affiliato AS LA
    WHERE LA.contratto_campagna ILIKE '%p%' --carattere modificabile 
ORDER BY "Data scadenza link" DESC
LIMIT 20



--7.4 Eventuali Altre query

    --7.4.1 Query con join, nidificata ed insiemistica: Stampa valori KPI di campagne recenti
      SELECT 'Codice sconto' AS "Tipo",
            ACS.KPI_Codice_sconto AS "KPI", 
            ACS.codice_sconto_codice_alfanumerico AS "ID", 
            ACS.codice_sconto_data_inizio_validita AS "Data inizio validità codice sconto", 
            ACS.valore AS "Valore"
        FROM analisi_codice_sconto AS ACS
        WHERE EXISTS (SELECT 1
                        FROM codice_sconto AS CS
                            JOIN contratto AS CO
                            on CS.codice_alfanumerico= CO.codice_sconto_codice_alfanumerico
                            AND CS.data_inizio_validita= CO.codice_sconto_data_inizio_validita
                                JOIN campagna AS CA
                                on CO.campagna= CA.denominazione
                        WHERE (((current_date - CA.data_di_fine) <315) --durata della campagna
					  	AND ACS.codice_sconto_codice_alfanumerico=CS.codice_alfanumerico
						AND ACS.codice_sconto_data_inizio_validita=CS.data_inizio_validita)
                        )
    UNION
        SELECT 'Link',kpi_link_affiliato,link_affiliato,NULL,valore
        FROM analisi_link_affiliato AS ALA
        WHERE EXISTS(SELECT 1
                    FROM link_affiliato AS LA
                        JOIN campagna as CA
                        on LA.contratto_campagna = CA.denominazione
                        WHERE (((current_date - CA.data_di_fine) <315) --durata della campagna
                        AND ALA.link_affiliato=LA.url)
                    )
    UNION
        SELECT 'Streaming', kpi_streaming, streaming_con_sponsorizzazione, NULL,valore
        FROM analisi_streaming AS ASS
        WHERE EXISTS(SELECT 1
                    FROM streaming_con_sponsorizzazione AS SS 
                        JOIN link_affiliato AS LA
                        on SS.id_streaming=LA.streaming_con_sponsorizzazione
                            JOIN campagna as CA
                        	on LA.contratto_campagna = CA.denominazione
                            WHERE (((current_date - CA.data_di_fine) <315) --durata della campagna
                            AND ASS.streaming_con_sponsorizzazione=SS.id_streaming) 
                        )
    ORDER BY "Tipo", "KPI", "ID", "Valore" DESC

-------------------------------------------------------------------------------------------------
--8 Viste 
--[WP4]

--8.1 Vista Dati Creator
CREATE OR REPLACE VIEW DatiCreator AS
SELECT DLC.Nome_del_canale AS "Canale",
	E.indirizzo AS "Indirizzo",
	coalesce(DAC.nome,'non registrato') AS "Nome",
	coalesce(DAC.cognome,'non registrato') AS "Cognome",
	coalesce(DAC.lingua_madre,'non registrata') AS "Lingua",
	DAC.Data_di_nascita AS "Compleanno",
	DLC.rapporto_col_creator AS "Rapporto"	
FROM dati_lavorativi_creator AS DLC
	JOIN email AS E
	ON DLC.nome_del_canale = E.dati_lavorativi_creator
		LEFT JOIN dati_anagrafici_creator AS DAC
		on DLC.nome_del_canale = DAC.dati_lavorativi_creator
ORDER BY "Rapporto"	DESC

--8.1.1 Query con Vista: Compleanni
SELECT DC."Canale",
	DC."Indirizzo",
	DC."Nome",
	DC."Cognome",
	DC."Compleanno",
	DC."Rapporto",
	DC."Lingua",
	C.nss AS "Numero di streaming"
FROM DatiCreator AS DC
	JOIN Contratto AS C
	ON DC."Canale"=C.dati_lavorativi_creator
WHERE ( (TO_CHAR("Compleanno", 'MM-DD')>TO_CHAR(C.data_inizio_validita , 'MM-DD')
	   and TO_CHAR("Compleanno", 'MM-DD')<TO_CHAR(C.data_scadenza , 'MM-DD')
	  ) and (DC."Rapporto">1) ) --la condizione is not null è implicitamente soddisfatta
ORDER BY DC."Rapporto", (TO_CHAR("Compleanno", 'MM-DD')>TO_CHAR(C.data_inizio_validita , 'MM-DD')
	   and TO_CHAR("Compleanno", 'MM-DD')<TO_CHAR(C.data_scadenza , 'MM-DD') )



--8.2 Vista Controllo Valore Sconti
CREATE OR REPLACE VIEW ControlloValoreSconti AS
SELECT DISTINCT CO.campagna AS "Campagna", 
CO.codice_sconto_codice_alfanumerico AS "Codice", 
CO.codice_sconto_data_inizio_validita AS "Inizio validità",
CS.valore_sconto AS "Sconto"
FROM codice_sconto AS CS
	JOIN contratto AS CO
	ON CO.codice_sconto_codice_alfanumerico = CS.codice_alfanumerico
	AND CO.codice_sconto_data_inizio_validita = CS.data_inizio_validita
ORDER BY "Campagna"

-- 8.2.1 Query con Vista: Filtro Data Scadenza e valore sconto
SELECT DISTINCT  "Campagna", 
CS.data_di_scadenza, 
CS.codice_alfanumerico, 
"Sconto"
FROM ControlloValoreSconti AS CVS
JOIN contratto AS CO ON CVS."Codice" = CO.codice_sconto_codice_alfanumerico
JOIN codice_sconto AS CS ON CVS."Codice" = CS.codice_alfanumerico
WHERE CS.data_di_scadenza BETWEEN '2022-01-01' AND '2022-12-31' -- Filtra per data di scadenza compresa tra il 1° gennaio 2022 e il 31 dicembre 2022
  AND "Sconto" > 0.15 -- Filtra per valore di sconto superiore a 0.10

 
