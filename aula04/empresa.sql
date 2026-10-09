create database empresa;
use empresa;

create table funcionarios(
	id_funcionario int primary key auto_increment,
    nome varchar(100) not null,
    funcao varchar(50) not null,
    valor_hora decimal(5,2) not null,
    horas_trabalhadas int not null
);

alter table funcionarios
	add column desconta_inss tinyint not null default 1,
    add column desconta_vt tinyint not null default 1,
    add column desconta_vr tinyint not null default 1;
    
INSERT INTO funcionarios (nome, funcao, valor_hora, horas_trabalhadas, desconta_inss, desconta_vt, desconta_vr) VALUES
	('Carlos Silva', 'Desenvolvedor Junior', 35.00, 160, 1, 1, 1),
	('Ana Souza', 'Analista de Sistemas', 50.00, 150, 1, 0, 1),
	('Marcos Santos', 'Suporte Técnico', 20.00, 180, 1, 1, 0),
	('Juliana Alves', 'Designer UX', 45.00, 160, 1, 0, 0),
	('Roberto Costa', 'Desenvolvedor Pleno', 55.00, 160, 1, 1, 1),
	('Fernanda Lima', 'Desenvolvedora Front-end', 40.00, 160, 1, 0, 1),
	('Ricardo Gomes', 'Administrador de Banco de Dados', 60.00, 160, 1, 1, 1),
	('Patrícia Ribeiro', 'Analista de RH', 30.00, 160, 1, 1, 0),
	('Lucas Martins', 'Desenvolvedor Mobile', 50.00, 140, 1, 0, 0),
	('Camila Rocha', 'Gerente de Projetos', 80.00, 160, 1, 1, 1),
	('Gabriel Pereira', 'Estagiário de TI', 15.00, 120, 0, 1, 1),
	('Letícia Carvalho', 'Analista de Testes', 35.00, 160, 1, 1, 1),
	('Thiago Ferreira', 'Engenheiro de Software', 70.00, 160, 1, 0, 1),
	('Amanda Barbosa', 'Especialista em Segurança', 75.00, 160, 1, 1, 0),
	('Felipe Cardoso', 'Analista de Infraestrutura', 45.00, 180, 1, 0, 0),
	('Mariana Dias', 'Scrum Master', 65.00, 160, 1, 1, 1),
	('Rafael Mendes', 'Desenvolvedor Back-end', 55.00, 160, 1, 0, 1),
	('Beatriz Nunes', 'Analista de Dados', 50.00, 160, 1, 1, 0),
	('Vitor Hugo', 'Arquiteto de Software', 90.00, 160, 1, 0, 0),
	('Larissa Pires', 'Product Owner', 85.00, 160, 1, 1, 1);

alter table funcionarios
	add column salario_bruto DECIMAL(7, 2),
    add column descontos DECIMAL(7, 2),
    add column salario_liquido DECIMAL(7, 2);

DELIMITER //

CREATE PROCEDURE ProcessarFolhaPagamentoAtualizada ()
BEGIN
	UPDATE funcionarios
		SET
			salario_bruto = valor_hora * horas_trabalhadas,
            descontos = (valor_hora * horas_trabalhadas * 0.11 * desconta_inss) +
						(valor_hora * horas_trabalhadas * 0.06 * desconta_vt) +
                        (valor_hora * horas_trabalhadas * 0.04 * desconta_vr),
			salario_liquido = (valor_hora * horas_trabalhadas) - (
                          (valor_hora * horas_trabalhadas * 0.11 * desconta_inss) + 
                          (valor_hora * horas_trabalhadas * 0.06 * desconta_vt) + 
                          (valor_hora * horas_trabalhadas * 0.04 * desconta_vr)
        )
	WHERE salario_bruto IS NULL;
END //

DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

call ProcessarFolhaPagamentoAtualizada ();

SET SQL_SAFE_UPDATES = 1;

select * from funcionarios;