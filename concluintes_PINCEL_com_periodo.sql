SELECT DISTINCT
    -- Dados do aluno
    a.nome,
    a.telefone,
    a.celular,
    c.nivel,
    c.curso,
    a.uf,
    c.conclusao

FROM curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
LEFT JOIN
    parceiros p ON c.parceiro_id = p.id

WHERE
    c.conclusao BETWEEN '2025-01-01' AND '2025-11-30'

AND c.nivel = 'Graduação'

#AND c.id_modalidade = 1

AND a.uf= 'df' OR a.uf='GO'
AND
( c.conclusao!=''
AND c.conclusao IS NOT NULL
AND c.conclusao!='0000-00-00')

ORDER BY
    c.conclusao
