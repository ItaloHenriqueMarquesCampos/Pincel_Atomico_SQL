SELECT
    c.curso,
    COUNT(*) AS quantidade_vendida
FROM
    curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
LEFT JOIN
    parceiros p ON c.parceiro_id = p.id
LEFT JOIN
    modalidades m ON c.id_modalidade = m.id_mod
WHERE
    c.datahora BETWEEN '2025-01-01 00:00:00'
                    AND '2025-11-30 23:59:59'
    # AND c.conclusao IS NULL
    AND c.nivel = 'Tecnólogo' or 'Graduação'
AND
(
    #m.modalidade = 'Ensino a Distância (EAD)'
    #OR
    #m.modalidade = 'Online'
    #OR
    m.modalidade = 'Presencial'
    #OR
    #m.modalidade = 'EaD Premium'
)

GROUP BY
    c.curso
ORDER BY
    quantidade_vendida DESC;

# | nivel de curso
# | Graduação
# | Disciplina Isolada
# | Segunda Graduação
# | Tecnólogo
# | Disciplinas Eletivas
# | Nivelamento
# | Curso Técnico
# | Ensino Médio (EJA)
# | Ensino Fundamental (EJA)
# | UN-IMPORT

# | modalidade existentes
# | Ensino a Distância (EAD)
# | Online
# | Presencial
# | EaD Premium

