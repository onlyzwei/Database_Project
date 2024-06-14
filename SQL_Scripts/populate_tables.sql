USE escola;

INSERT INTO Cidade (Nome) VALUES
    ('São Paulo'),
    ('Rio de Janeiro'),
    ('Belo Horizonte'),
    ('Salvador'),
    ('Brasília');

INSERT INTO Pessoa (Nome, Telefone, Codigo_Cidade) VALUES
	-- SP
    ('João Silva', '(11) 9999-8888', 1), -- Aluno
    ('Paula Costa', '(11) 9444-3333', 1),
    -- RJ
    ('Maria Souza', '(21) 9888-7777', 2), -- Aluno
    ('Valonguinho da Silva', '(21) 97172-1095', 2), -- diretor
    ('Fernando Almeida', '(21) 9333-2222', 2),  -- professor
    ('Arthur Medeiros', '(21) 6969-2424', 2), -- Aluno
    -- MG
    ('Carlos Oliveira', '(31) 9777-6666', 3), -- Aluno
    -- BA
    ('Ana Pereira', '(71) 9666-5555', 4), -- diretora
    -- DF
    ('Pedro Santos', '(61) 9555-4444', 5); -- professor

INSERT INTO Professor (Codigo, RG, CPF, Titulacao) VALUES
    (5, '12345678-9', '987654321-00', 'Doutorado'), -- professor
    (4, '66666669-0', '696969694-21', 'Doutorado'), -- diretor
    (8, '12313456-1', '341241245-23', 'Mestrado'), -- diretor
    (9, '32314145-4', '312874543-99', 'Mestrado'); -- professor

INSERT INTO Escola (Nome, Codigo_Diretor, Codigo_Cidade) VALUES
    ('Escola RIO', 4, 2),
    ('Escola VIDA', 8, 1);

INSERT INTO Disciplina (Nome) VALUES
    ('Matemática'),
    ('Português'),
    ('História'),
    ('Geografia');

INSERT INTO Turma (Nome, Codigo_Escola) VALUES
    -- Escola RIO
    ('Turma 1A', 1),
    -- Escola VIDA
    ('Turma 1A', 2);

INSERT INTO Aluno (Codigo, Matricula_Aluno, Data_Nascimento, Codigo_Turma) VALUES
    -- Alunos Escola RIO
        -- turma 1A
    (3, 1001, '2010-03-24', 1),
    (6, 1002, '2010-04-24', 1),
    -- Alunos Escola VIDA
        -- turma 1A
    (1, 1003, '2010-09-10', 2),
    (7, 1004, '2010-01-24', 2);

INSERT INTO Contato (Nome, Telefone, Codigo_Aluno) VALUES
    ('Pai Arthur Medeiros', '(11) 9999-7777', 6),
    ('Mãe Maria Souza', '(21) 9888-6666', 3),
    ('Pai João Silva', '(11) 3456-1234', 1),
    ('Mãe Carlos Oliveira', '(15) 3458-2345', 7);

INSERT INTO Ministra (Codigo_Professor, Codigo_Disciplina) VALUES
    -- Ministra matemática
    (5, 1),
    (9, 1);

INSERT INTO Dar_Aula (Codigo_Professor, Codigo_Disciplina, Codigo_Turma) VALUES
    -- Da aula na ESCOLA RIO em TURMA 1A
    (5, 1, 1),
    -- Da aula na ESCOLA VIDA em TURMA 1A
    (9, 1, 2);
