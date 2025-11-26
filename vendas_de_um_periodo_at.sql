SELECT
    -- Dados do aluno
    a.nome,
    a.email,
    a.telefone,
    a.celular,
    c.nivel,
    c.curso,

    -- Dados de quem matriculou
    p.nome,
    p.tipo

FROM curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
LEFT JOIN
    parceiros p ON c.parceiro_id = p.id

WHERE
    c.datahora BETWEEN '2025-07-01 00:00:00' AND '2025-10-31 23:59:59'
