CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE cidade (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE pessoa (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    codigo_cidade INT NOT NULL,
    FOREIGN KEY (codigo_cidade) REFERENCES cidade(codigo)
);

CREATE TABLE professor (
    codigo INT PRIMARY KEY,
    rg VARCHAR(20) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    titulacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (codigo) REFERENCES pessoa(codigo)
);

CREATE TABLE escola (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    codigo_diretor INT NOT NULL,
    codigo_cidade INT NOT NULL,
    FOREIGN KEY (codigo_diretor) REFERENCES professor(codigo),
    FOREIGN KEY (codigo_cidade) REFERENCES cidade(codigo)
);

CREATE TABLE disciplina (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE turma (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    codigo_escola INT NOT NULL,
    FOREIGN KEY (codigo_escola) REFERENCES escola(codigo)
);

CREATE TABLE aluno (
    codigo INT PRIMARY KEY,
    matricula_aluno INT NOT NULL,
    data_nascimento DATE NOT NULL,
    codigo_turma INT NOT NULL,
    FOREIGN KEY (codigo) REFERENCES pessoa(codigo),
    FOREIGN KEY (codigo_turma) REFERENCES turma(codigo)
);

CREATE TABLE contato (
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    codigo_aluno INT NOT NULL,
    PRIMARY KEY (nome, codigo_aluno),
    FOREIGN KEY (codigo_aluno) REFERENCES aluno(codigo)
);

CREATE TABLE ministra (
    codigo_professor INT NOT NULL,
    codigo_disciplina INT NOT NULL,
    PRIMARY KEY (codigo_professor, codigo_disciplina),
    FOREIGN KEY (codigo_professor) REFERENCES professor(codigo),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
);

CREATE TABLE dar_aula (
    codigo_professor INT NOT NULL,
    codigo_disciplina INT NOT NULL,
    codigo_turma INT NOT NULL,
    PRIMARY KEY (codigo_professor, codigo_disciplina, codigo_turma),
    FOREIGN KEY (codigo_professor, codigo_disciplina) REFERENCES ministra(codigo_professor, codigo_disciplina),
    FOREIGN KEY (codigo_turma) REFERENCES turma(codigo)
);
