CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE Cidade (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Pessoa (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Codigo_Cidade INT NOT NULL,
    FOREIGN KEY (Codigo_Cidade) REFERENCES Cidade(Codigo)
);

CREATE TABLE Professor (
    Codigo INT PRIMARY KEY,
    RG VARCHAR(20) NOT NULL,
    CPF VARCHAR(20) NOT NULL,
    Titulacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (Codigo) REFERENCES Pessoa(Codigo)
);

CREATE TABLE Escola (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Codigo_Diretor INT NOT NULL,
    Codigo_Cidade INT NOT NULL,
    FOREIGN KEY (Codigo_Diretor) REFERENCES Professor(Codigo),
    FOREIGN KEY (Codigo_Cidade) REFERENCES Cidade(Codigo)
);

CREATE TABLE Disciplina (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Turma (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Codigo_Escola INT NOT NULL,
    FOREIGN KEY (Codigo_Escola) REFERENCES Escola(Codigo)
);

CREATE TABLE Aluno (
    Codigo INT PRIMARY KEY,
    Matricula_Aluno INT NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Codigo_Turma INT NOT NULL,
    FOREIGN KEY (Codigo) REFERENCES Pessoa(Codigo),
    FOREIGN KEY (Codigo_Turma) REFERENCES Turma(Codigo)
);

CREATE TABLE Contato (
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Codigo_Aluno INT NOT NULL,
    PRIMARY KEY (Nome, Codigo_Aluno),
    FOREIGN KEY (Codigo_Aluno) REFERENCES Aluno(Codigo)
);

CREATE TABLE Ministra (
    Codigo_Professor INT NOT NULL,
    Codigo_Disciplina INT NOT NULL,
    PRIMARY KEY (Codigo_Professor, Codigo_Disciplina),
    FOREIGN KEY (Codigo_Professor) REFERENCES Professor(Codigo),
    FOREIGN KEY (Codigo_Disciplina) REFERENCES Disciplina(Codigo)
);

CREATE TABLE Dar_Aula (
    Codigo_Professor INT NOT NULL,
    Codigo_Disciplina INT NOT NULL,
    Codigo_Turma INT NOT NULL,
    PRIMARY KEY (Codigo_Professor, Codigo_Disciplina, Codigo_Turma),
    FOREIGN KEY (Codigo_Professor, Codigo_Disciplina) REFERENCES Ministra(Codigo_Professor, Codigo_Disciplina),
    FOREIGN KEY (Codigo_Turma) REFERENCES Turma(Codigo)
);
