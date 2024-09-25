/*Utilizando subquery na coluna, trazer as quantidades de
disciplina que cada aluno cursa;*/

select a.id_aluno, a.nome_aluno, 
(select count(distinct n.id_disciplina) 
from notas n where n.id_aluno = a.id_aluno) as quantidade_disciplinas
from aluno a;

/*Utilizando subquery como filtro, mostrar os alunos que não tem
nenhuma nota;*/

select a.id_aluno, a.nome_aluno 
from aluno a
where a.id_aluno not in 
(select n.id_aluno from Notas n);

/*Utilizando subquery como fonte de dados, trazer os alunos que
cursam menos de 2 disciplinas.*/

select a.id_aluno, a.nome_aluno
from aluno a
where (select count(distinct n.id_disciplina) 
from notas n where n.id_aluno = a.id_aluno) < 2;
