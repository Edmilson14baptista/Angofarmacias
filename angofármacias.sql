CREATE DATABASE IF NOT EXISTS angofarmacias;

CREATE TABLE IF NOT EXISTS farmacia(
	idfarmacia int auto_increment primary key,
    nome varchar(125) not null,
    endereço varchar(125) not null,
    contacto int(9) not null,
    saldo_contabilistico int,
    saldo_disponivel int
);
create table IF NOT EXISTS funcionario(
	idFuncionario int auto_increment primary key,
    nome varchar(60) not null,
    endereço varchar(50) not null,
    contacto int(9) not null
);
create table tem(
    idFarmacia int,
	idFuncionario int,
    foreign key(idFarmacia) references farmacia (idFarmacia),
    foreign key(idFuncionario) references funcionario (idFuncionario)
);
create table IF NOT EXISTS compra(
	idCompra int auto_increment primary key,
    nomeProduto varchar(60) not null,
    quantidadeProduto int(50) not null,
    formaPagamento varchar(20),
    valorPago int(50) not null,
    troco int(50) not null,
    valorTotal int(50) not null
);
create table processa(
	idCompra int,
    idFuncionario int,
    foreign key(idCompra) references compra (idCompra),
    foreign key(idFuncionario) references funcionario (idFuncionario)
);
create table IF NOT EXISTS cliente(
    idCliente int auto_increment primary key,
    nome varchar(50) not null,
    contacto int(9) not null
);
create table solicita(
    idCompra int,
    idCliente int,
    foreign key(idCompra) references compra (idCompra),
    foreign key(idCliente) references cliente (idCliente)
);
create table IF NOT EXISTS produto(
    idProduto int auto_increment primary key,
    nome varchar(50) not null,
    tipo varchar(50) not null,
    preço int(100)
);
create table tem2(
    idProduto int,
    idCompra int,
    foreign key(idProduto) references produto (idProduto),
    foreign key(idCompra) references compra (idCompra)
);
create table IF NOT EXISTS stock(
    idStock int auto_increment primary key,
    nome varchar(50) not null,
    categoria varchar(50) not null,
    quantidade int(100)
);
create table tem3(
    idProduto int,
    idStock int,
    foreign key(idProduto) references produto (idProduto),
    foreign key(idStock) references stock (idStock)
);
create table IF NOT EXISTS fornecedor(
    idFornecedor int primary key,
    nome varchar(50) not null,
    NIF int(6) not null,
    endereço varchar(50) not null,
    contacto int(9) not null,
    produto varchar(250),
    categoria varchar(50)
);
create table tem4(
    idFornecedor int,
    idStock int,
    foreign key(idFornecedor) references fornecedor (idFornecedor),
    foreign key(idStock) references stock (idStock)
);