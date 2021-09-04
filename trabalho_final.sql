create table caracteristicas (
	id serial not null primary key,
	nome varchar(255)
);

create table produtos (
	id serial not null primary Key,
	nome varchar(200) not null,
	preco decimal not null
);

create table conjunto_caracteristicas (
	valor varchar(255) not null,
	fk_caracteristicas integer not null,
	fk_produtos integer not null,
	constraint  caracteristicas_conjuntoCaracteristicas foreign key (fk_caracteristicas) references caracteristicas(id),
	constraint produtos_conjuntoCaracteristicas foreign key (fk_produtos) references produtos(id)
);

create table pedidos (
	id serial not null primary key,
	dataPedido timestamp,
	situacao varchar(20),
	fk_clientes integer not null
);

create table itensPedidos (
	fk_produtos integer not null,
	fk_pedidos integer not null,
	quantidade integer,
	preco decimal,
	constraint produtos_itensPedidos foreign key (fk_produtos) references produtos(id),
	constraint pedidos_itensPedidos foreign key (fk_pedidos) references pedidos(id)
);

create table clientes (
	id serial not null primary key,
	nome varchar(200),
	sexo varchar(1),
	dataNascimento date,
	logradouro varchar(255),
	numero varchar(10),
	complemento varchar(255),
	bairro varchar(255)
);

alter table pedidos add constraint clientes_pedidos foreign key (fk_clientes) references clientes(id);

create table contatos (
	id serial not null primary key,
	tipo varchar(10),
	descricao varchar(255),
	fk_clientes integer not null,
	constraint clientes_contatos foreign key (fk_clientes) references clientes(id)
);

\dt

insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Felipe', 'M', '1999-01-09', 'Rua A', 109, 'Casa A', 'Jardim Curitiba');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Davi', 'M', '1987-07-14', 'Rua B', 327, 'Casa B', 'Setor Bueno');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Giovanna', 'F', '1995-05-27', 'Rua C', 104, 'Casa C', 'Setor Oeste');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Theo', 'M', '1993-11-01', 'Rua D', 583, 'Casa D', 'Setor Jardim Goiás');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Isabella', 'F', '1975-08-17', 'Rua E', 561, 'Casa E', 'Setor Serrinha');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Murilo', 'M', '1986-03-28', 'Rua F', 835, 'Casa F', 'Setor Central');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Melissa', 'F', '1971-12-04', 'Rua G', 659, 'Casa G', 'Setor Jardim America');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Lucca', 'M', '1989-12-04', 'Rua H', 381, 'Casa H', 'Setor Eldorado');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Rebeca', 'F', '2000-12-04', 'Rua I', 267, 'Casa I', 'Setor Oeste');
insert into clientes (nome, sexo, dataNascimento, logradouro, numero, complemento, bairro) values ('Beto', 'M', '1994-12-04', 'Rua J', 926, 'Casa J', 'Setor Serrinha');

select * from clientes;

insert into contatos (tipo, descricao, fk_clientes) values ('Telefone', '(62) 9 9101-4322', 1);
insert into contatos (tipo, descricao, fk_clientes) values ('E-mail', 'davi@gmail.com', 2);
insert into contatos (tipo, descricao, fk_clientes) values ('Instagram', '@giovanna', 3);
insert into contatos (tipo, descricao, fk_clientes) values ('E-mail', 'theo@gmail.com', 4);
insert into contatos (tipo, descricao, fk_clientes) values ('Telefone', '(62) 9 9357-0954', 5);
insert into contatos (tipo, descricao, fk_clientes) values ('Telefone', '(62) 9 8573-3927', 6);
insert into contatos (tipo, descricao, fk_clientes) values ('Instagram', '@melissa', 7);
insert into contatos (tipo, descricao, fk_clientes) values ('E-mail', 'lucca@gmail.com', 8);
insert into contatos (tipo, descricao, fk_clientes) values ('Instagram', '@rebeca', 9);
insert into contatos (tipo, descricao, fk_clientes) values ('Telefone', '(62) 9 2977-7930', 10);

select * from contatos;

insert into produtos (nome, preco) values ('Relogio Technos Masculino Perfomance BJ3814AB/1P', 569);
insert into produtos (nome, preco) values ('Relogio Smartwatch Technos Masculino Connect Sports TSPORTSAA/8P', 999);
insert into produtos (nome, preco) values ('Relogio Orient Masculino Sport MBSS1196APASX', 259);
insert into produtos (nome, preco) values ('Relogio Orient Masculino MGSS1199P2KX', 339);
insert into produtos (nome, preco) values ('Relogio Seculus Masculino R28305GN02', 129);
insert into produtos (nome, preco) values ('Relogio Dumont Masculino DU2035MNS/K3K', 149);
insert into produtos (nome, preco) values ('Relogio Champion Masculino CA31266P', 339);
insert into produtos (nome, preco) values ('Relogio Curren Masculino 10586', 119);
insert into produtos (nome, preco) values ('Relogio Armani Exchange Masculino AX2084/1PI', 899);
insert into produtos (nome, preco) values ('Relogio Citizen Masculino TZ20831W', 599);

select * from produtos;

insert into caracteristicas(nome) values ('Technos');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('prata');
insert into caracteristicas(nome) values ('alarme, cronometro digital');
insert into caracteristicas(nome) values ('10ATM');

insert into caracteristicas(nome) values ('Technos');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('preto');
insert into caracteristicas(nome) values ('calendario, cronometro digital');
insert into caracteristicas(nome) values ('nao tem');

insert into caracteristicas(nome) values ('Orient');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('prata');
insert into caracteristicas(nome) values ('calendario');
insert into caracteristicas(nome) values ('5ATM');

insert into caracteristicas(nome) values ('Orient');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('dourado');
insert into caracteristicas(nome) values ('calendario');
insert into caracteristicas(nome) values ('5ATM');

insert into caracteristicas(nome) values ('Seculus');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('preto');
insert into caracteristicas(nome) values ('calendario');
insert into caracteristicas(nome) values ('3ATM');

insert into caracteristicas(nome) values ('Doumont');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('prata');
insert into caracteristicas(nome) values ('5ATM');

insert into caracteristicas(nome) values ('Champion');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('bicolor');
insert into caracteristicas(nome) values ('calendario');
insert into caracteristicas(nome) values ('5ATM');

insert into caracteristicas(nome) values ('Curren');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('preto');
insert into caracteristicas(nome) values ('3ATM');

insert into caracteristicas(nome) values ('Armani Exchange');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('prata');
insert into caracteristicas(nome) values ('calendario, cronometro digital');
insert into caracteristicas(nome) values ('5ATM');

insert into caracteristicas(nome) values ('Citizen');
insert into caracteristicas(nome) values ('masculino');
insert into caracteristicas(nome) values ('prata');
insert into caracteristicas(nome) values ('calendario, iluminacao noturna');
insert into caracteristicas(nome) values ('10ATM');

select * from caracteristicas;

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 1);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 1);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 1);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 1);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 1);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 2);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 2);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 2);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 2);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 2);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 3);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 3);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 3);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 3);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 3);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 4);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 4);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 4);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 4);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 4);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 5);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 5);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 5);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 5);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 5);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 6);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 6);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 6);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 6);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 7);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 7);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 7);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 7);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 7);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 8);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 8);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 8);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 8);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 9);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 9);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 9);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 9);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 9);

insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Marca', 1, 10);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Genero', 2, 10);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Cor', 3, 10);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Funcoes', 4, 10);
insert into conjunto_caracteristicas(valor, fk_caracteristicas, fk_produtos) values ('Nível de Resistência a Agua', 5, 10);

select * from conjunto_caracteristicas;

insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 1);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 2);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 3);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 4);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 5);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 6);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 7);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 8);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 9);
insert into pedidos(dataPedido, situacao, fk_clientes) values (now(), 'Aberta', 10);

select * from pedidos;

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (4, 1, 2, 399);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (3, 1, 2, 518);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 1, 2, 1.138);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 1, 2, 238);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (7, 2, 1, 339);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (2, 2, 1, 999);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (5, 2, 1, 129);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (9, 3, 12, 10.788);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (10, 3, 12, 7.188);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (5, 4, 1, 129);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 5, 4, 2.276);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (3, 5, 4, 1.039);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (5, 5, 4, 516);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 5, 4, 476);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (9, 5, 4, 2.396);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 6, 10, 5.690);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (3, 6, 10, 2590);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 6, 10, 1.190);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 7, 1, 119);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 8, 4, 2.276);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 9, 7, 3.983);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (2, 9, 4, 3.996);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (4, 9, 7, 2.373);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (5, 9, 4, 516);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 9, 7, 2.373);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (9, 9, 7, 6.293);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (10, 9, 7, 4.193);

insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (1, 10, 10, 5.690);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (2, 10, 10, 9.990);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (3, 10, 10, 2.590);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (5, 10, 10, 1.290);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (6, 10, 10, 1.490);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (7, 10, 10, 3.390);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (8, 10, 10, 1.990);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (9, 10, 10, 8.990);
insert into itensPedidos(fk_produtos, fk_pedidos, quantidade, preco) values (10, 10, 10, 5.990);

select * from itensPedidos;

/* 
		Pegar todas as caracteristicas de todos os produtos. 
*/
\d conjunto_caracteristicas

select   produtos.nome as Produtos, 
			caracteristicas.nome as Caracteristicas
from conjunto_caracteristicas, produtos, caracteristicas
where conjunto_caracteristicas.fk_produtos = produtos.id
and conjunto_caracteristicas.fk_caracteristicas = caracteristicas.id;

/*
		Pegar todas as caracteristicas e o valor de todos os produtos
*/
\d conjunto_caracteristicas

select   produtos.nome as Produtos,
			valor,
			caracteristicas.nome as Caracteristicas
from conjunto_caracteristicas, produtos, caracteristicas
where conjunto_caracteristicas.fk_produtos = produtos.id
and conjunto_caracteristicas.fk_caracteristicas = caracteristicas.id;

/*
		Pegar todas as caracteristicas de um produto
*/
\d conjunto_caracteristicas

select produtos.nome as Produtos, 
		  caracteristicas.nome as Caracteristicas
from conjunto_caracteristicas, produtos, caracteristicas
where conjunto_caracteristicas.fk_produtos = produtos.id
and conjunto_caracteristicas.fk_caracteristicas = caracteristicas.id
and produtos.nome = 'Relogio Technos Masculino Perfomance BJ3814AB/1P';

select produtos.nome as Produtos,
		  valor as valor,
		  caracteristicas.nome as caracteristicas
from conjunto_caracteristicas, produtos, caracteristicas
where conjunto_caracteristicas.fk_produtos = produtos.id
and conjunto_caracteristicas.fk_caracteristicas = caracteristicas.id
and produtos.id = 1;

/*
		Qual é a quantidade de cada um dos produtos que um determinado cliente comprou?
*/
\d itenspedidos

select quantidade, 
		  produtos.nome as produtos, 
		  clientes.nome as clientes
from itenspedidos, produtos, clientes
where itensPedidos.fk_produtos = produtos.id
and itensPedidos.fk_pedidos = clientes.id
and clientes.id = 1;

/*
		Qual é a quantidade de cada um dos produtos que todos os clientes compraram?
*/
\d itenspedidos

select quantidade, 
		  produtos.nome as produtos, 
		  clientes.nome as clientes
from itenspedidos, produtos, clientes
where itensPedidos.fk_produtos = produtos.id
and itensPedidos.fk_pedidos = clientes.id;

