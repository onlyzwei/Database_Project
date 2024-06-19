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