SELECT
    -- Dados da matrícula
    p.tipo,
    p.nome,
    ROUND(SUM(f.valor), 2) AS total_pago_ate_parcela_6

FROM
    curso_aluno c

    -- Dados do aluno
    INNER JOIN alunos a
        ON c.matricula = a.codigo

    -- Dados do parceiro (opcional)
    LEFT JOIN parceiros p
        ON c.parceiro_id = p.id

    -- Modalidade do curso
    LEFT JOIN modalidades m
        ON c.id_modalidade = m.id_mod

    -- Relacionamento com turma (necessário para filtrar data final)
    LEFT JOIN turma_aluno tu
        ON c.matricula = tu.matricula

    LEFT JOIN turma t
        ON tu.id_turma = t.id_turma

-- Dados de cancelamento (se existirem)
LEFT JOIN cancelados ca
    ON c.ref_id = ca.id_curso_aluno


    -- Caso seja necessário futuramente
    INNER JOIN financeiro f ON f.contrato = c.ref_id

WHERE
-- Data final da turma
-- AND
t.fim > '2026-02-22 00:00:00'

AND
-- Período da matrícula
c.datahora BETWEEN '2025-09-01 00:00:00' AND '2026-02-28 23:59:00'
AND
p.tipo IN ('Digital', 'Polo')
AND
f.status != 1 -- Não contar com parcelas canceladas (Status 1)
-- AND
-- f.parcela BETWEEN 1 AND 6 #Contar somente até a 6° parcela
GROUP BY
p.Tipo,
p.nome
ORDER BY
total_pago_ate_parcela_6 DESC
