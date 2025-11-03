SELECT
    -- Dados do aluno
    c.datahora AS data_da_matricula,
    f.data_pagto AS data_do_pagamento,
    f.valor_pagto AS valor_pago,
    f.parcela,
    c.parcelas AS total_parcelas,
    c.nome_fin AS nome,
    c.curso,
    c.nivel AS modalidade,
    c.email_fin,
    c.tel_fin AS telefone,

    -- Dados de quem matriculou
    p.tipo AS tipo_de_parceiro,
    p.nome AS parceiro

FROM
    curso_aluno c
INNER JOIN
    parceiros p ON c.parceiro_id = p.id
INNER JOIN
    financeiro f ON f.contrato = c.ref_id

WHERE
    f.parcela = 1                          -- Pagou a 1ª parcela (taxa de matrícula)
    AND f.data_pagto IS NOT NULL           -- A 1ª parcela foi paga
    AND f.status = 0                       -- Boleto ativo (não cancelado)
    AND f.descricao NOT LIKE '%Mensalidade 1/1%'  -- Exclui cursos de parcela única
    AND f.documento_fiscal != 'NEG#263132' -- Exclui alunos em negociação
    AND c.tel_fin IS NOT NULL AND c.tel_fin != '' -- Apenas contatos válidos
    AND c.datahora > '2017-01-01 00:00:00'        -- A partir de 2017
    AND f.data_pagto < (CURRENT_DATE - INTERVAL 60 DAY) -- Pagamento há +60 dias

    -- Verifica se não há pagamento das demais parcelas
    AND NOT EXISTS (
        SELECT 1
        FROM financeiro f2
        WHERE f2.contrato = f.contrato
          AND f2.parcela > 2                -- Das parcelas 2 em diante
          AND f2.data_pagto IS NOT NULL     -- Já foram pagas
    )

ORDER BY
    f.data_pagto;
