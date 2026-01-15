SELECT
    curso,
    COUNT(DISTINCT matricula) AS total_matriculas
FROM
    curso_aluno
WHERE
    id_modalidade = 1
    AND nivel = 'Graduação'
GROUP BY
    curso
ORDER BY
    total_matriculas DESC;
