CREATE TABLE Cidade (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Pessoa (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Codigo_Cidade INT,
    FOREIGN KEY (Codigo_Cidade) REFERENCES Cidade(Codigo)
);

CREATE TABLE Escola (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100),
    Codigo_Diretor INT,
    FOREIGN KEY (Codigo_Diretor) REFERENCES Pessoa(Codigo)
);

-- Adicionar o resto
