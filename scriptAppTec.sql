create database AppTec;

use AppTec;

CREATE TABLE Usuario (
    idUsuario int identity(1,1) PRIMARY KEY,
    nomeUsuario VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    dataNasc DATE NOT NULL,
    tipoUsuario VARCHAR(20) NOT NULL,
    usuario VARCHAR(10) UNIQUE NOT NULL,
    emailUsuario VARCHAR(100) NOT NULL,
    senhaUsuario VARCHAR(255) NOT NULL,
    bairro VARCHAR(15) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100)
);

CREATE TABLE Barbeiro (
    idBarbeiro  int identity(1,1) PRIMARY KEY,
    idUsuario int foreign key references Usuario(idUsuario)
);

CREATE TABLE Cliente (
    idCliente int identity(1,1) PRIMARY KEY,
    idUsuarioCli int foreign key references Usuario(idUsuario)
);

CREATE TABLE Barbearia (
    idBarbearia int identity(1,1) PRIMARY KEY,
    proprietario int foreign key references Barbeiro(idBarbeiro) NOT NULL,
    nomeBarbearia VARCHAR(20) NOT NULL,
    bairro VARCHAR(15) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100)
);

CREATE TABLE contratoBarbeiro (
    idContratoBarbeiro int identity(1,1) PRIMARY KEY,
    idBarbeiro int foreign key references Barbeiro(idBarbeiro) NOT NULL,
    idBarbearia int foreign key references Barbearia(idBarbearia) NOT NULL
);

CREATE TABLE servicoBarbeiro (
    idServico int identity(1,1) PRIMARY KEY,
    idBarbeiro int foreign key references Barbeiro(idBarbeiro) NOT NULL,
    nomeServico VARCHAR(50) NOT NULL,
    foto VARCHAR(255),
    valor FLOAT NOT NULL
);

CREATE TABLE Repositorio (
    idRepositorio int identity(1,1) PRIMARY KEY,
    idBarbeiro int foreign key references  Barbeiro(idBarbeiro) NOT NULL
);

CREATE TABLE Post (
    idPost int identity(1,1) PRIMARY KEY,
    idRepositorio int foreign key references Repositorio(idRepositorio) NOT NULL,
    imagemUrl VARCHAR(255),
    vidioUrl VARCHAR(255),
    descricaoPost VARCHAR(200),
    dataPost DATE NOT NULL
);

CREATE TABLE Loja (
    idLoja int identity(1,1) PRIMARY KEY,
    idBarbearia int foreign key references Barbearia(idBarbearia) NOT NULL
);

CREATE TABLE Produto (
    idProduto int identity(1,1) PRIMARY KEY,
    nomeProduto VARCHAR(50) NOT NULL,
    precoUnitario FLOAT NOT NULL,
    quantProduto INT,
    descricaoProduto VARCHAR(100)
);

CREATE TABLE ProdutoLoja (
    idProdutoLoja int identity(1,1) PRIMARY KEY,
    idLoja int foreign key references Loja(idLoja) NOT NULL,
    idProduto int foreign key references Produto(idProduto) NOT NULL
);

CREATE TABLE Venda (
    idVenda int identity(1,1) PRIMARY KEY,
    idCliente int foreign key references Cliente(idCliente) not null,
    dataVenda DATE NOT NULL,
    horaVenda TIME NOT NULL
);

CREATE TABLE ProdutoVenda (
    idProdutoVenda int identity(1,1) PRIMARY KEY,
    idProduto int foreign key references Produto(idProduto) NOT NULL,
    idVenda int foreign key references Venda(idVenda) NOT NULL
);

CREATE TABLE Agendamento (
    idAgendamento int identity(1,1) PRIMARY KEY,
    idCliente int foreign key references Cliente(idCliente) NOT NULL,
    dataAgen DATE NOT NULL,
    valorTotal FLOAT NOT NULL
);

CREATE TABLE ServicoAgendamento (
    idServicoAgen int identity(1,1) PRIMARY KEY,
    idServico int foreign key references servicoBarbeiro(idServico) NOT NULL,
    idAgendamento int foreign key references Agendamento(idAgendamento) NOT NULL,
    dataServicoAgend DATE NOT NULL,
    horaServico TIME NOT NULL,
    valorServico FLOAT NOT NULL,
    avaliacao VARCHAR(200)
);
