SELECT
    c.matricula,
    c.ano_ingresso,
    c.datahora,
    c.conclusao,
    a.nome,
    a.cpf,
    c.curso,
    c.nivel AS modalidade,
    a.sexo,
    a.email,
    a.nascimento,
    a.end_lat,
    a.end_lng,
    a.cep_fin,
    a.cidade_fin,
    a.bairro_fin,
    a.uf_fin,
    a.endereco,
    a.numero,
    a.complemento,
    p.tipo AS tipo_de_parceiro,
    p.nome AS parceiro
    -- ROUND(SUM(f.valor), 2) AS total_pago_ate_parcela_6
FROM
    curso_aluno c
INNER JOIN
    alunos a ON c.matricula = a.codigo
INNER JOIN
    parceiros p ON c.parceiro_id = p.id
INNER JOIN
    financeiro f ON f.contrato = c.ref_id
WHERE
    f.status != 1 #Não contar com parcelas canceladas (Status 1)
    AND STR_TO_DATE(c.ano_ingresso, '%d/%m/%Y')
        BETWEEN STR_TO_DATE('01/01/2017', '%d/%m/%Y') AND STR_TO_DATE('30/10/2025', '%d/%m/%Y') #Período de alunos que se matricularam
    AND f.parcela BETWEEN 1 AND 6 #Contar somente até a 6° parcela

    #AND p.tipo = 'Equipe Interna'

    #AND c.parceiro_id = 26324

GROUP BY
    c.nome_fin, c.curso, c.nivel, p.tipo, p.nome;
