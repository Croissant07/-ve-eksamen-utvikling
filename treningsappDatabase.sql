CREATE TABLE Bruker (
    bruker_id INT PRIMARY KEY AUTO_INCREMENT,
    navn VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    alder INT NOT NULL
);

CREATE TABLE Grupper (
    gruppe_id INT PRIMARY KEY AUTO_INCREMENT,
    gruppe_navn VARCHAR(100) NOT NULL,
    laget_av INT NOT NULL,
    gruppe_kode VARCHAR(100) NOT NULL,
    laget_klokke TIME NOT NULL,
    FOREIGN KEY (laget_av) REFERENCES Bruker(bruker_id)
);

CREATE TABLE GruppeMedlemmer (
    bruker_id INT NOT NULL,
    gruppe_id INT NOT NULL,
    medlem_siden DATE NOT NULL,
    PRIMARY KEY (bruker_id, gruppe_id),
    FOREIGN KEY (bruker_id) REFERENCES Bruker(bruker_id),
    FOREIGN KEY (gruppe_id) REFERENCES Grupper(gruppe_id)
);

CREATE TABLE Treningsokter (
    trening_type_id INT PRIMARY KEY AUTO_INCREMENT,
    gruppe_id INT NOT NULL,
    navn VARCHAR(100),
    froklaring VARCHAR(200),
    FOREIGN KEY (gruppe_id) REFERENCES Grupper(gruppe_id)
);

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
