CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE Cidade (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Pessoa (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    codigo_cidade INT NOT NULL,
    FOREIGN KEY (codigo_cidade) REFERENCES Cidade(codigo)
);

CREATE TABLE Professor (
    codigo INT PRIMARY KEY,
    rg VARCHAR(20) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    titulacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (codigo) REFERENCES Pessoa(codigo)
);

CREATE TABLE Escola (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    codigo_diretor INT NOT NULL,
    codigo_cidade INT NOT NULL,
    FOREIGN KEY (codigo_diretor) REFERENCES Professor(codigo),
    FOREIGN KEY (codigo_cidade) REFERENCES Cidade(codigo)
);

CREATE TABLE Disciplina (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Turma (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    codigo_escola INT NOT NULL,
    FOREIGN KEY (codigo_escola) REFERENCES Escola(codigo)
);

CREATE TABLE Aluno (
    codigo INT PRIMARY KEY,
    matricula_aluno INT NOT NULL,
    data_nascimento DATE NOT NULL,
    codigo_turma INT NOT NULL,
    FOREIGN KEY (codigo) REFERENCES Pessoa(codigo),
    FOREIGN KEY (codigo_turma) REFERENCES Turma(codigo)
);

CREATE TABLE Contato (
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    codigo_aluno INT NOT NULL,
    PRIMARY KEY (nome, codigo_aluno),
    FOREIGN KEY (codigo_aluno) REFERENCES Aluno(codigo)
);

CREATE TABLE Ministra (
    codigo_professor INT NOT NULL,
    codigo_disciplina INT NOT NULL,
    PRIMARY KEY (codigo_professor, codigo_disciplina),
    FOREIGN KEY (codigo_professor) REFERENCES Professor(codigo),
    FOREIGN KEY (codigo_disciplina) REFERENCES Disciplina(codigo)
);

CREATE TABLE Dar_Aula (
    codigo_professor INT NOT NULL,
    codigo_disciplina INT NOT NULL,
    codigo_turma INT NOT NULL,
    PRIMARY KEY (codigo_professor, codigo_disciplina, codigo_turma),
    FOREIGN KEY (codigo_professor, codigo_disciplina) REFERENCES Ministra(codigo_professor, codigo_disciplina),
    FOREIGN KEY (codigo_turma) REFERENCES Turma(codigo)
);
