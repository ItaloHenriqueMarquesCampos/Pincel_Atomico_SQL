SELECT DISTINCT
    a.nome,
    a.nascimento,
    a.telefone,
    a.celular,
    a.email,
    ca.ocorrencia,
    ca.tipo_ocorrencia,
    c.conclusao

FROM curso_aluno c
INNER JOIN alunos a
    ON c.matricula = a.codigo

LEFT JOIN unidades u
    ON c.id_unidade = u.id_unidade

LEFT JOIN cancelados ca
    ON c.matricula = ca.matricula

WHERE
    MONTH(STR_TO_DATE(a.nascimento, '%d/%m/%Y')) = 4

AND
    (c.conclusao IS NOT NULL AND c.conclusao != '')

AND
    ca.tipo_ocorrencia IS NULL;
