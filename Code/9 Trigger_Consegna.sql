-----------------------------------------------------------
-- Trigger Inizializzazione: checkKPI

CREATE OR REPLACE FUNCTION checkKPI() RETURNS TRIGGER AS $$
DECLARE
BEGIN
    IF(TG_ARGV[0] = 'streaming')THEN
        IF(NEW.kpi_streaming = 'Click-Through Rate' OR NEW.kpi_streaming = 'Independent Click-Through Rate')THEN
		
            IF(NEW.valore < 0.00 OR NEW.valore > 10.00)THEN
                RAISE EXCEPTION 'Valore non valido per il % della streaming %',NEW.kpi_streaming,NEW.streaming_con_sponsorizzazione;
            END IF;
			
        ELSIF(NEW.kpi_streaming = 'View-Through Rate')THEN
		
            IF(NEW.valore < 0.00 OR NEW.valore > 1.00)THEN
                RAISE EXCEPTION 'Valore non valido per il % della streaming %',NEW.kpi_streaming,NEW.streaming_con_sponsorizzazione;
            END IF;
			
        END IF;
		
    ELSIF(TG_ARGV[0] = 'link')THEN
	
        IF(NEW.kpi_link_affiliato = 'Conversion Rate')THEN
		
            IF(NEW.valore < 0.00 OR NEW.valore> 1.00)THEN
                RAISE EXCEPTION 'Valore non valido per il % del link %',NEW.kpi_link_affiliato, NEW.link_affiliato;
            END IF;
			
        END IF;
    END IF;
	
    RETURN NEW;

END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER checkKPIStreaming
BEFORE INSERT OR UPDATE OF valore ON analisi_streaming
FOR EACH ROW EXECUTE PROCEDURE checkKPI('streaming');

CREATE OR REPLACE TRIGGER checkKPILinkAffiliato
BEFORE INSERT OR UPDATE OF valore ON analisi_link_affiliato
FOR EACH ROW EXECUTE PROCEDURE checkKPI('link');

-----------------------------------------------------------
-- Trigger 1: checkContratto

CREATE OR REPLACE FUNCTION checkContratto() RETURNS TRIGGER AS $$
DECLARE
    dataFineCampagna date;
BEGIN

    SELECT data_di_fine INTO dataFineCampagna FROM campagna AS c WHERE c.denominazione LIKE NEW.campagna;
    IF(NEW.data_scadenza <= dataFineCampagna) THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'La data di fine campagna viene prima della data di scadenza contratto.';
    END IF;

END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER checkContratto
BEFORE INSERT OR UPDATE OF data_scadenza ON contratto
FOR EACH ROW EXECUTE PROCEDURE checkContratto();

-----------------------------------------------------------
-- Trigger 2: NSSHandler

CREATE OR REPLACE FUNCTION NSSHandler() RETURNS TRIGGER AS $$
BEGIN
    /*--Imposto un valore qualsiasi al valore NSS 
    in modo che da far scattare il trigger NSSUpdate 
    che si attiva al rilevamento delle modifiche nel campo NSS di contratto*/
    IF (NEW IS NOT NULL)THEN
        UPDATE contratto SET nss = 5 WHERE campagna = NEW.contratto_campagna AND dati_lavorativi_creator = NEW.contratto_dati_lavorativi_creator;
    ELSIF (OLD IS NOT NULL)THEN
        UPDATE contratto SET nss = 5 WHERE campagna = OLD.contratto_campagna AND dati_lavorativi_creator = OLD.contratto_dati_lavorativi_creator;
    END IF;
    RETURN NULL;

END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER NSSHandlerInsDel
AFTER INSERT OR DELETE ON link_affiliato --non si possono inserire link non affiliati a un contratto
FOR EACH ROW
EXECUTE PROCEDURE NSSHandler();

CREATE OR REPLACE TRIGGER NSSHandlerUp
AFTER  UPDATE ON link_affiliato
FOR EACH ROW
WHEN (OLD.contratto_campagna!=NEW.contratto_campagna or OLD.contratto_dati_lavorativi_creator!=NEW.contratto_campagna)
EXECUTE PROCEDURE NSSHandler();

-----------------------------------------------------------
-- Trigger 3: NSSUpdate

CREATE OR REPLACE FUNCTION NSSUpdate() RETURNS TRIGGER AS $$
DECLARE
BEGIN
    /*Conto le istanze di link affiliato e le salvo nel valore di NSS
    qualunque sia il valore inserito manualmente*/
    SELECT count(*) INTO NEW.nss 
    FROM link_affiliato
    WHERE contratto_campagna = NEW.campagna AND contratto_dati_lavorativi_creator = NEW.dati_lavorativi_creator;
    
    RETURN NEW;

END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER NSSUpdate
BEFORE INSERT OR UPDATE OF nss ON contratto
FOR EACH ROW
EXECUTE PROCEDURE NSSUpdate();