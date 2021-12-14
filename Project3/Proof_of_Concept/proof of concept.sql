
CREATE SEQUENCE adresse_id_adresse_seq_1_1;

CREATE TABLE Adresse (
                ID_Adresse INTEGER NOT NULL DEFAULT nextval('adresse_id_adresse_seq_1_1'),
                CodeDp VARCHAR(3) NOT NULL,
                Com VARCHAR(45) NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (ID_Adresse)
);
COMMENT ON COLUMN Adresse.CodeDp IS 'Code departement';
COMMENT ON COLUMN Adresse.Com IS 'Commune';


ALTER SEQUENCE adresse_id_adresse_seq_1_1 OWNED BY Adresse.ID_Adresse;

CREATE SEQUENCE bien_id_bien_seq;

CREATE TABLE Bien (
                ID_Bien INTEGER NOT NULL DEFAULT nextval('bien_id_bien_seq'),
                ID_Adresse INTEGER NOT NULL,
                TypeL VARCHAR(12) NOT NULL,
                NbrePP SMALLINT NOT NULL,
                SurfC NUMERIC NOT NULL,
                CONSTRAINT bien_pk PRIMARY KEY (ID_Bien)
);
COMMENT ON COLUMN Bien.TypeL IS 'Type local';
COMMENT ON COLUMN Bien.NbrePP IS 'Nombre pieces principales';
COMMENT ON COLUMN Bien.SurfC IS 'Surface Carez';


ALTER SEQUENCE bien_id_bien_seq OWNED BY Bien.ID_Bien;

CREATE SEQUENCE transaction_id_transaction_seq;

CREATE TABLE Transaction (
                ID_Transaction INTEGER NOT NULL DEFAULT nextval('transaction_id_transaction_seq'),
                ID_Bien INTEGER NOT NULL,
                Date DATE NOT NULL,
                NatureMut VARCHAR(8) NOT NULL,
                Val NUMERIC NOT NULL,
                CONSTRAINT transaction_pk PRIMARY KEY (ID_Transaction)
);
COMMENT ON COLUMN Transaction.Date IS 'Date mutation';
COMMENT ON COLUMN Transaction.NatureMut IS 'Nature mutation';
COMMENT ON COLUMN Transaction.Val IS 'Valeur fonciere';


ALTER SEQUENCE transaction_id_transaction_seq OWNED BY Transaction.ID_Transaction;

ALTER TABLE Bien ADD CONSTRAINT adresse_bien_fk
FOREIGN KEY (ID_Adresse)
REFERENCES Adresse (ID_Adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Transaction ADD CONSTRAINT bien_transaction_fk
FOREIGN KEY (ID_Bien)
REFERENCES Bien (ID_Bien)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
