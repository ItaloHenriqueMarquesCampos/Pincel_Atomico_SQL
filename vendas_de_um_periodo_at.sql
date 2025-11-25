SELECT
    -- Dados do aluno
    c.nome_fin,
    c.curso,
    c.nivel,

    -- Dados de quem matriculou
    p.tipo,
    p.nome,
    a.telefone,
    a.celular,
    a.email

FROM curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
INNER JOIN
    parceiros p ON c.parceiro_id = p.id

WHERE
    c.datahora BETWEEN '2025-11-01 00:00:00' AND '2025-11-30 23:59:59'
