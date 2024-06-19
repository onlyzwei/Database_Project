USE escola;

INSERT INTO cidade (nome) VALUES
    ('São Paulo'),
    ('Rio de Janeiro'),
    ('Belo Horizonte'),
    ('Salvador'),
    ('Brasília');

INSERT INTO pessoa (nome, telefone, codigo_cidade) VALUES
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
    ('Pedro Santos', '(61) 9555-4444', 5), -- professor
    
    -- adicionados recentements nao organizados por questoes de dor de cabeca
	('Por do sol', '(21) 5432-3232', 2); -- Aluno 10

INSERT INTO professor (codigo, rg, cpf, titulacao) VALUES
    (5, '12345678-9', '987654321-00', 'Doutorado'), -- professor
    (4, '66666669-0', '696969694-21', 'Doutorado'), -- diretor
    (8, '12313456-1', '341241245-23', 'Mestrado'), -- diretor
    (9, '32314145-4', '312874543-99', 'Mestrado'); -- professor

INSERT INTO escola (nome, codigo_diretor, codigo_cidade) VALUES
    ('Escola RIO', 4, 2),
    ('Escola VIDA', 8, 1);

INSERT INTO disciplina (nome) VALUES
    ('Matemática'),
    ('Português'),
    ('História'),
    ('Geografia');

INSERT INTO turma (nome, codigo_escola) VALUES
    -- Escola RIO
    ('Turma 1A', 1),
    -- Escola VIDA
    ('Turma 1A', 2);

INSERT INTO aluno (codigo, matricula_aluno, data_nascimento, codigo_turma) VALUES
    -- Alunos Escola RIO
        -- turma 1A
    (3, 1001, '2010-03-24', 1),
    (6, 1002, '2010-04-24', 1),
    (10, 1003, '2010-05-24', 1),
    
    -- Alunos Escola VIDA
        -- turma 1A
    (1, 1003, '2010-09-10', 2),
    (7, 1004, '2010-01-24', 2);

INSERT INTO contato (nome, telefone, codigo_aluno) VALUES
    ('Pai Arthur Medeiros', '(11) 9999-7777', 6),
    ('Mãe Maria Souza', '(21) 9888-6666', 3),
    ('Pai João Silva', '(11) 3456-1234', 1),
    ('Mãe Carlos Oliveira', '(15) 3458-2345', 7);

INSERT INTO ministra (codigo_professor, codigo_disciplina) VALUES
    -- Ministra matemática
    (5, 1),
    (9, 1);

INSERT INTO dar_aula (codigo_professor, codigo_disciplina, codigo_turma) VALUES
    -- Da aula na ESCOLA RIO em TURMA 1A
    (5, 1, 1),
    -- Da aula na ESCOLA VIDA em TURMA 1A
    (9, 1, 2);
