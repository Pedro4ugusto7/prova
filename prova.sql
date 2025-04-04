create database prova;
use prova;

create table estudantes (
id int primary key auto_increment,
nome varchar(100) not null,
data_nascimento date not null,
cpf varchar(14) not null unique,
telefone varchar(12) not null,
email varchar(100) not null
);
create table professores (
id int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(14) not null,
email varchar(100) not null,
telefone varchar(12) not null,
especialidade varchar(100)
);
create table cursos (
id int primary key auto_increment,
nome varchar(100) not null,
tempo_conclusao int not null,
nivel varchar(100) not null,
mensalidade double not null,
modalidade varchar(100) not null,
turno varchar(100) not null
);
create table salas (
id int primary key auto_increment,
bloco varchar(20) not null,
numero int not null,
capacidade int not null,
tipo varchar(50)
);
create table disciplinas (
id int primary key auto_increment,
nome varchar(100) not null,
id_curso int not null,
id_professor int,
carga_horaria int not null,
foreign key (id_curso) references cursos(id),
foreign key (id_professor) references professores(id)
);
create table matriculas (
id int primary key auto_increment,
id_estudante int not null,
id_disciplina int not null,
ano int not null,
status_ varchar(20) not null,
foreign key (id_estudante) references estudantes(id),
foreign key (id_disciplina) references disciplinas(id)
);
create table notas (
id int primary key auto_increment,
id_matricula int not null unique,
nota1 decimal(5, 2),
nota2 decimal(5, 2),
notaf decimal(5, 2) not null,
foreign key (id_matricula) references matriculas(id)
);
create table turmas (
id int primary key auto_increment,
id_disciplina int not null,
id_sala int not null,
periodo int not null,
ano int not null,
horario varchar(50) not null,
foreign key (id_disciplina) references disciplinas(id),
foreign key (id_sala) references salas(id)
);

insert into estudantes (nome, data_nascimento, cpf, email, telefone) values
('Pedro Augusto de Freitas Santos', '2000-01-10','14913811010', 'pedro@gmail.com', '87911223344'),
('João Vitor Farias Lins', '1998-06-15','14913811019' ,'joao@gmail.com', '87911223344');

insert into professores (nome, cpf, email, telefone, especialidade) values
('talles','14913811010', 'talles@gmail.com', '87911223344', 'SQL'),
('Thiago','14913811010', 'thiago@gmail.com', '87922334455', 'Empreendedorismo');

insert into salas (bloco, numero, capacidade, tipo) values
('k', 3, 50 , 'laboratorio'),
('j', 2, 30, 'Departamento Medico');

insert into cursos (nome, tempo_conclusao, nivel, mensalidade, modalidade, turno) values
('Engenharia de Software', 3, 'Graduação', 260.48, 'Tecnologo', 'Noturno'),
('Medicina', 6,'Graduação', 1000, 'Bacharelado', 'Noturno');

insert into disciplinas (nome, id_curso, id_professor, carga_horaria) values
('Banco de Dados', 1, 1, 60),
('Anatomia', 2, 2, 60);

insert into matriculas (id_estudante, id_disciplina, ano, status_) values
(1, 1, 2025, 'Ativa'),
(2, 2, 2025, 'Ativa');

insert into notas (id_matricula, nota1,nota2,notaf) values
(1, 8.5,8.5,8.5),
(2, 9.0,9.0,9.0);

insert into turmas (id_disciplina, id_sala, periodo, ano, horario) values
(1, 1, 1, 2022, 'Quinta - 19:00 às 21:30'),
(2, 2, 2, 2021, 'Terça e Quinta - 19:30 às 22:00');

select * from professores inner join disciplinas on professores.id = disciplinas.id;
select * from estudantes inner join matriculas on estudantes.id = matriculas.id;
select * from matriculas inner join turmas on matriculas.id = turmas.id;
select * from disciplinas inner join turmas on disciplinas.id = turmas.id;
select * from estudantes inner join notas on estudantes.id = notas.id;
select * from cursos inner join estudantes on cursos.id = estudantes.id;
select * from turmas inner join salas on turmas.id = salas.id;
select * from cursos inner join disciplinas on cursos.id = disciplinas.id;

