create database hospital;

use hospital;

create table medico(
    CRM int not null,
    NOME varchar(255),
    TELEFONE_CELULAR varchar(255),
    ESPECIALIDADE varchar(255),
    ENDERECO varchar(255),
    primary key(CRM)
);

create table mae(
    COD_MAE int not null auto_increment,
    NOME varchar(255),
    ENDERECO varchar(255),
    DATA_NASCIMENTO date,
    IDENTIDADE varchar(255),
    primary key(COD_MAE)
);

create table bebe(
    COD_CRIANCA int not null auto_increment,
    NOME varchar(255),
    DATA_NASCIMENTO date,
    PESO float,
    ALTURA float,
    codMae int not null,
    crmMedico int not null,
	primary key(COD_CRIANCA),
    constraint fk_cod_mae foreign key(codMae)
    references mae(COD_MAE),
    constraint fk_crm_medico foreign key(crmMedico)
    references medico(CRM)
);

/*TABELA MEDICO*/

insert into medico(CRM, NOME, TELEFONE_CELULAR, ESPECIALIDADE, ENDERECO)
	value(12332, "João Alves Santos", "071-98767-6543", "Cirugiao", "Rua A");

insert into medico(CRM, NOME, TELEFONE_CELULAR, ESPECIALIDADE, ENDERECO)
	value(23345, "Maria Ana Souza Pires", "071-99765-4234", "Pediatra", "Rua B");
    
select * from medico;


/*TABELA MAE*/

insert into mae(NOME, ENDERECO, DATA_NASCIMENTO, IDENTIDADE)
	value("Fernanda Santos de Souza", "Rua 1", '1985:10:02', "33.101.904-8");

insert into mae(NOME, ENDERECO, DATA_NASCIMENTO, IDENTIDADE)
	value("Adriana Silva Castro", "Rua 2", '1999:07:18', "22.131.711-9");
    
update mae
	set NOME = "Mariana Silva Castro"
    where COD_MAE = 2;

delete from mae
	where COD_MAE = 4;
    
select * from mae;


/*TABELA BEBE*/

insert into bebe(NOME, DATA_NASCIMENTO, PESO, ALTURA, codMae, crmMedico)
	values("Enzo Silva Castro", '2023:10:01', 3.98, 0.45, 2, 12332);

insert into bebe(NOME, DATA_NASCIMENTO, PESO, ALTURA, codMae, crmMedico)
	value("Maria Helena Santos de Souza", '2023:09:30', 3.50, 0.54, 1, 12332);
    
alter table bebe
	add NOME_MAE varchar(255);  
    
update bebe
	set NOME_MAE = "Mariana Silva Castro"
    where COD_CRIANCA = 2;

select * from bebe;

