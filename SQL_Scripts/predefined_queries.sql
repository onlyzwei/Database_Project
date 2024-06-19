-- 1) Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade onde a escola está localizada.

SELECT 
    e.nome AS nome_escola,
    c.nome AS cidade_escola
FROM 
    escola e
JOIN 
    cidade c ON e.codigo_cidade = c.codigo
WHERE NOT EXISTS ( -- verificar se há uma linha que a condição é verdadeira, se houver retorna false
    SELECT 
        1 -- Select 1 é apenas uma forma eficiente de ocupar uma linha
    FROM 
        turma t
    JOIN 
        aluno a ON t.codigo = a.codigo_turma
    JOIN 
        pessoa p ON a.codigo = p.codigo
    WHERE 
        t.codigo_escola = e.codigo and
        p.codigo_cidade != e.codigo_cidade
);


-- 2) Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.

SELECT p.nome, a.matricula_aluno

FROM aluno a

JOIN pessoa p ON a.codigo = p.codigo
LEFT JOIN contato c ON a.codigo = c.codigo_aluno
WHERE c.codigo_aluno IS NULL;


-- 7) Listar por escola o número de turmas e o número de professores que ministram alguma 
--    disciplina para turmas da escola em questão.

SELECT 
    e.nome AS nome_escola,
    COUNT(DISTINCT t.codigo) AS numero_turmas,
    COUNT(DISTINCT da.codigo_professor) AS numero_professores
    
FROM 
    escola e
    
LEFT JOIN 
    turma t ON e.codigo = t.codigo_escola -- dado uma turma em uma escola
LEFT JOIN 
    dar_aula da ON t.codigo = da.codigo_turma --
GROUP BY 
    e.codigo, e.nome;
    
    
-- 8) Listar por escola a razão entre o número de alunos da escola e o número de professores
--    que ministram alguma disciplina na escola em questão.

SELECT 
    e.nome AS nome_escola,
    -- COALESCE(COUNT(DISTINCT a.codigo), 0) AS numero_alunos,
    -- COALESCE(COUNT(DISTINCT da.codigo_professor), 0) AS numero_professores,
    COALESCE(COUNT(DISTINCT a.codigo) / NULLIF(COUNT(DISTINCT da.codigo_professor), 0), 0) AS razao_alunos_professores
FROM 
    escola e
LEFT JOIN 
    turma t ON e.codigo = t.codigo_escola
LEFT JOIN 
    aluno a ON t.codigo = a.codigo_turma
LEFT JOIN 
    dar_aula da ON t.codigo = da.codigo_turma
GROUP BY 
    e.codigo, e.nome;
