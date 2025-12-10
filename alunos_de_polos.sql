SELECT
    -- Dados do aluno
    a.nome,
    c.matricula AS id_aluno,
    c.ref_id AS id_matricula_aluno,
    c.nivel,
    c.curso,
    a.uf AS Estado_do_aluno,
    c.parceiro_id,
    c.polo,
    c.id_unidade

FROM curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
#LEFT JOIN parceiros p ON c.parceiro_id = p.id
LEFT JOIN
    unidades u ON c.id_unidade = u.id_unidade

WHERE
    #c.datahora BETWEEN '2025-01-01 00:00:00' AND '2025-12-31 23:59:00'

    #AND
    #c.id_unidade='309'


    #AND
    u.unidade='Belo Horizonte (Centro) - MG'

AND
    c.conclusao IS NULL

ORDER BY
    c.id_unidade
