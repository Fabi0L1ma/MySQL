create database floricultura;

use floricultura;

create table cliente(
	RG integer not null,
    NOME varchar(255) not null,
    TELEFONE varchar(255),
    ENDERECO varchar(255),
    primary key(RG)
);

create table produto(
	COD_PROD int not null auto_increment,
    NOME_PROD varchar(255),
    TIPO_PROD varchar(255),
    VALOR_PROD float not null,
    QTD_ESTOQUE int not null,
    primary key(COD_PROD)
);

create table venda(
	COD_VENDA int not null auto_increment,
    COD_RG integer not null,
    ID_PRODUTO int not null,
    DATA_VENDA date not null,
    VALOR_VENDA float,
    QTD_VENDA int,
    primary key(COD_VENDA),
    constraint fk_cod_rg foreign key(COD_RG)
	references cliente(RG),
    constraint fk_id_produto foreign key(ID_PRODUTO)
    references produto(COD_PROD)
);

/* TABELA CLIENTE*/

insert into cliente(RG, NOME, TELEFONE, ENDERECO)
	value(129420311, "Beatriz Pereira Morais", "071-98768-4564", "Rua A");

insert into cliente(RG, NOME, TELEFONE, ENDERECO)
	value(115181295, "Luana Miranda Andrade", "071-99765-0987", "Rua B");
    
alter table cliente
	drop column ENDERECO;

alter table cliente
	add ENDERECO varchar(255);
    
update cliente
	set ENDERECO = "Rua A"
    where RG = 129420311;

update cliente
	set ENDERECO = "Rua B"
    where RG = 115181295;

delete from cliente
	where RG = 115181295; 
    
update cliente
	set ENDERECO = null
    where RG = 129420311;

select * from cliente;



/*TABELA PRODUTO*/

insert into produto(NOME_PROD, TIPO_PROD, VALOR_PROD, QTD_ESTOQUE)
	value("Rosa", "Planta", 16.50, 500);
    
insert into produto(NOME_PROD, TIPO_PROD, VALOR_PROD, QTD_ESTOQUE)
	value("Margarida", "Planta", 25.49, 246);
    
alter table produto
	drop QTD_ESTOQUE;
    
alter table produto
	add QTD_ESTOQUE int;
    
update produto
	set QTD_ESTOQUE = 500
    where COD_PROD = 1; 

update produto
	set QTD_ESTOQUE = 246
    where COD_PROD = 2;

delete from produto
	where COD_PROD = 1;
    
select * from produto;

/*TABELA VENDA*/







