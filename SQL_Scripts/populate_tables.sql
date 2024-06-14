USE escola;

INSERT INTO Cidade (Nome) VALUES
    ('São Paulo'),
    ('Rio de Janeiro'),
    ('Belo Horizonte'),
    ('Salvador'),
    ('Brasília');

INSERT INTO Pessoa (Nome, Telefone, Codigo_Cidade) VALUES
    ('João Silva', '(11) 9999-8888', 1),
    ('Maria Souza', '(21) 9888-7777', 2),
    ('Carlos Oliveira', '(31) 9777-6666', 3),
    ('Ana Pereira', '(71) 9666-5555', 4),
    ('Pedro Santos', '(61) 9555-4444', 5),
    ('Paula Costa', '(11) 9444-3333', 1),
    ('Fernando Almeida', '(21) 9333-2222', 2);

INSERT INTO Professor (Codigo, RG, CPF, Titulacao) VALUES
    (1, '12345678-9', '987654321-00', 'Doutorado'),
    (2, '23456789-0', '876543210-11', 'Mestrado'),
    (3, '34567890-1', '765432109-22', 'Especialização');

INSERT INTO Escola (Nome, Codigo_Diretor, Codigo_Cidade) VALUES
    ('Escola A', 1, 1),
    ('Escola B', 2, 2),
    ('Escola C', 3, 3);

INSERT INTO Disciplina (Nome) VALUES
    ('Matemática'),
    ('Português'),
    ('História'),
    ('Geografia');

INSERT INTO Turma (Nome, Codigo_Escola) VALUES
    ('Turma 1A', 1),
    ('Turma 2B', 2),
    ('Turma 3C', 3),
    ('Turma 1A', 1),
    ('Turma 2B', 2),
    ('Turma 3C', 3);

INSERT INTO Aluno (Codigo, Matricula_Aluno, Data_Nascimento, Codigo_Turma) VALUES
    (1, 1001, '2000-01-01', 1),
    (2, 1002, '2000-02-02', 2),
    (3, 1003, '2000-03-03', 3),
    (4, 1004, '2000-04-04', 1),
    (5, 1005, '2000-05-05', 2),
    (6, 1006, '2000-06-06', 3);

INSERT INTO Contato (Nome, Telefone, Codigo_Aluno) VALUES
    ('Pai João', '(11) 9999-7777', 1),
    ('Mãe Maria', '(21) 9888-6666', 2),
    ('Pai Carlos', '(31) 9777-5555', 3),
    ('Mãe Ana', '(71) 9666-4444', 4),
    ('Pai Pedro', '(61) 9555-3333', 5),
    ('Mãe Paula', '(11) 9444-2222', 6);

INSERT INTO Ministra (Codigo_Professor, Codigo_Disciplina) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (1, 4),
    (2, 1),
    (3, 2);

INSERT INTO Dar_Aula (Codigo_Professor, Codigo_Disciplina, Codigo_Turma) VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (1, 4, 1),
    (2, 1, 2),
    (3, 2, 3);
