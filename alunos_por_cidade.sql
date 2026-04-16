SELECT
    a.nome,
    c.matricula AS id_aluno,
    c.ref_id AS id_matricula_aluno,
    c.nivel,
    c.curso,
    a.uf AS Estado_do_aluno,
    a.cidade AS Cidade_do_aluno,
    c.parceiro_id,
    c.polo,
    c.id_unidade

FROM curso_aluno c
INNER JOIN alunos a
    ON c.matricula = a.codigo

LEFT JOIN unidades u
    ON c.id_unidade = u.id_unidade

WHERE
    (
    LOWER(a.cidade) LIKE '%sinop%'
    OR LOWER(a.cidade) LIKE '%santa carmem%'
    OR LOWER(a.cidade) LIKE '%vera%'
    OR LOWER(a.cidade) LIKE '%claudia%'
    OR LOWER(a.cidade) LIKE '%sorriso%'
    OR LOWER(a.cidade) LIKE '%itauba%'
)

  AND
    a.uf = 'MT'

    AND c.conclusao IS NULL

ORDER BY c.ref_id;
