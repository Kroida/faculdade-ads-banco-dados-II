USE escola;

SELECT 
    alunos.nome_aluno, 
    cursos.nome_curso, 
    matriculas.nota_final
FROM matriculas
INNER JOIN alunos 
    ON alunos.id_aluno = matriculas.aluno_id
INNER JOIN cursos 
    ON cursos.id_curso = matriculas.curso_id
WHERE cursos.nome_curso like '%multi%'
	ORDER BY matriculas.nota_final DESC, alunos.nome_aluno ASC;