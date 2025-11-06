SELECT
    i.codigo,
    i.id_unidade,
    i.id_matricula,
    i.nome,
    i.vestibular_polo,
    u.id_unidade,
    u.unidade,
    u.polo_unidade,
    u.razao_social,
    u.cod_mec,
    u.cnpj,
    u.nome_comercial,
    c.curso,
    c.polo,
    c.id_unidade,
    c.parceiro_id,
    p.nome,
    p.cpf

FROM
    inscricoes i
LEFT JOIN
        unidades u ON i.id_unidade = u.id_unidade
LEFT JOIN
        curso_aluno c ON c.matricula = i.codigo
LEFT JOIN
        parceiros p ON c.parceiro_id = p.id
WHERE
        u.unidade = 'Viçosa - AL'
    OR
        u.unidade = 'Viçosa - MG'
    OR
        u.unidade = 'Viçosa-MG'
