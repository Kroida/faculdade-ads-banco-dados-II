use escola;

select cursos.nome_curso, truncate(avg(matriculas.nota_final), 2) as media_notas
from matriculas
inner join cursos on matriculas.curso_id = cursos.id_curso
group by cursos.nome_curso
having avg(matriculas.nota_final) > 7;