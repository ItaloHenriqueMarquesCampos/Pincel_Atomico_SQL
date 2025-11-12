SELECT
    c.nome,
    c.tipo_ocorrencia,
    c.ocorrencia,
    c.data,
    ca.nivel,
    ca.curso,
    a.celular,
    a.telefone

FROM
    cancelados AS c
LEFT JOIN
    curso_aluno ca ON c.matricula = ca.matricula
LEFT JOIN
    alunos a ON ca.matricula = a.codigo

WHERE
    c.data BETWEEN '2025-01-01' AND '2025-10-01'

ORDER BY
    c.data DESC
