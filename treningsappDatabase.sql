CREATE TABLE bruker(
    bruker_id int PRIMARY KEY AUTO_INCREMENT
    navn varchar(100) not NULL
    email varchar(100) not NULL   
    alder int not NULL 
)

CREATE TABLE Grupper(
    gruppe_id int PRIMARY KEY AUTO_INCREMENT
    gruppe_navn VARCHAR (100) not NULL
    laget_av int FOREIGN KEY
    gruppe_kode VARCHAR (100) not NULL
    laget_klokke TIME not NULL
)

CREATE TABLE GruppeMedlemmer(
    bruker_id int FOREIGN KEY
    gruppe_id int FOREIGN KEY
    medlem_siden DATE not NULL
)

CREATE TABLE Treningsøkter(
    trening_type_id int PRIMARY KEY
    gruppe_id int FOREIGN KEY
    navn VARCHAR(100)
    froklaring VARCHAR(200)
)

CREATE TABLE Treningslogg (
    logg_id INT PRIMARY KEY AUTO_INCREMENT,
    bruker_id INT NOT NULL,
    gruppe_id INT NOT NULL,
    trening_type_id INT NOT NULL,
    varighet_minutter INT NOT NULL,
    dato DATE NOT NULL,
    notater TEXT,
    FOREIGN KEY (bruker_id) REFERENCES Bruker(bruker_id),
    FOREIGN KEY (gruppe_id) REFERENCES Grupper(gruppe_id),
    FOREIGN KEY (trening_type_id) REFERENCES Treningsokter(trening_type_id)
);

