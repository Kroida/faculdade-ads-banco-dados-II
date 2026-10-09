create database `geografia`;
use `geografia`;

create table `regioes` (
	`id_regiao` int primary key auto_increment,
    `regiao` varchar(50) not null,
    `data_criada` timestamp default current_timestamp,
    `data_editada` timestamp default current_timestamp on update current_timestamp
);

insert into `regioes` (`regiao`)
	values 
		('Nordeste'),
        ('Sul'),
        ('Sudeste'),
        ('Centro Oeste');

update `regioes`
	set `regiao` = 'Centro-Oeste'
    where `id_regiao` = 5;
    
create table `estados` (
	`id_estado` int primary key auto_increment,
    `estado` varchar(255) not null,
    `sigla` varchar(2) not null,
    `regiao_id` int not null,
    `data_criada` timestamp default current_timestamp,
    `data_editada` timestamp default current_timestamp on update current_timestamp,
    
    constraint `fk_estados_regioes`
		foreign key (`regiao_id`)
		references `regioes` (`id_regiao`)
);

INSERT INTO `estados` (`estado`, `sigla`, `regiao_id`) VALUES
	-- Região Norte (ID 1)
	('Acre', 'AC', 1),
	('Amapá', 'AP', 1),
	('Amazonas', 'AM', 1),
	('Pará', 'PA', 1),
	('Rondônia', 'RO', 1),
	('Roraima', 'RR', 1),
	('Tocantins', 'TO', 1),

	-- Região Nordeste (ID 2)
	('Alagoas', 'AL', 2),
	('Bahia', 'BA', 2),
	('Ceará', 'CE', 2),
	('Maranhão', 'MA', 2),
	('Paraíba', 'PB', 2),
	('Pernambuco', 'PE', 2),
	('Piauí', 'PI', 2),
	('Rio Grande do Norte', 'RN', 2),
	('Sergipe', 'SE', 2),

	-- Região Sul (ID 3)
	('Paraná', 'PR', 3),
	('Rio Grande do Sul', 'RS', 3),
	('Santa Catarina', 'SC', 3),

	-- Região Sudeste (ID 4)
	('Espírito Santo', 'ES', 4),
	('Minas Gerais', 'MG', 4),
	('Rio de Janeiro', 'RJ', 4),
	('São Paulo', 'SP', 4),

	-- Região Centro-Oeste (ID 5)
	('Distrito Federal', 'DF', 5),
	('Goiás', 'GO', 5),
	('Mato Grosso', 'MT', 5),
	('Mato Grosso do Sul', 'MS', 5);

-- Veja que a tabela não será apagada por conta do laço por meio da FK
alter table `estados`
	drop column `regiao_id`;

select `estado`, `sigla`, `regiao` from `estados`
left join `regioes`
	on `estados`.`regiao_id` = `regioes`.`id_regiao`;

select * from `regioes`;
select * from `estados`;