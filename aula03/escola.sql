create database escola;
use escola;

create table alunos (
	id_aluno int primary key auto_increment,
    nome_aluno varchar(100) not null
);

create table cursos(
	id_curso int primary key auto_increment,
    nome_curso varchar(100) not null,
    area varchar(100) not null
);

INSERT INTO Alunos (nome_aluno) 
VALUES
('Ana'), ('Bruno'), ('Carlos'), ('Daniela'), ('Eduardo'),
('Fernanda'), ('Gabriel'), ('Helena'), ('Igor'), ('Julia'),
('Kleber'), ('Laura'), ('Marcelo'), ('Natalia'), ('Otavio'),
('Paula'), ('Quintino'), ('Renata'), ('Samuel'), ('Tatiana'),
('Ulysses'), ('Vanessa'), ('Wagner'), ('Wilson'), ('Yuri'),
('Zelia'), ('Amanda'), ('Breno'), ('Camila'), ('Diogo');


insert into cursos (nome_curso, area)
values
	('Análise de Sistemas', 'T.I.'),
    ('Redes de Computadores', 'T.I.'),
    ('Design de Multimídia', 'Design'),
    ('Design de Moda', 'Design');
    
create table professores (
	id_professor int primary key auto_increment,
    nome_professor varchar(100) not null
);
	
insert into professores (nome_professor)
values
	('Adalto'), ('Debora'), ('Roberto');

create table matriculas (
	id_matricula int primary key auto_increment,
    aluno_id int not null,
    curso_id int not null,
    nota_final decimal (3,1) not null,
    foreign key (aluno_id) references alunos(id_aluno),
    foreign key (curso_id) references cursos(id_curso)
);

INSERT INTO Matriculas (aluno_id, curso_id, nota_final) 
VALUES
	(1, 1, 8.5), (1, 2, 9.0), (2, 1, 6.0), (3, 2, 5.5), (4, 3, 7.5),
	(5, 4, 8.0), (6, 1, 4.5), (7, 2, 6.5), (8, 3, 9.5), (9, 4, 7.0),
	(10, 1, 5.0), (11, 2, 8.0), (12, 3, 6.5), (13, 4, 9.0), (14, 1, 7.5),
	(15, 2, 5.0), (16, 3, 8.5), (17, 4, 6.0), (18, 1, 9.5), (19, 2, 7.0),
	(20, 3, 4.0), (21, 4, 8.5), (22, 1, 6.5), (23, 2, 9.0), (24, 3, 5.5),
	(25, 4, 7.5), (26, 1, 8.0), (27, 2, 6.0), (28, 3, 9.5), (29, 4, 4.5),
	(30, 1, 7.0), (2, 2, 8.0), (3, 1, 7.5), (4, 4, 9.0), (5, 1, 6.5),
	(6, 2, 5.5), (7, 3, 8.5), (8, 4, 7.0), (9, 1, 6.0), (10, 2, 9.5);