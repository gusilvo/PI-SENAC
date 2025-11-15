-- DROP TABLES
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS PessoaJuridica;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS PessoaFisica;
DROP TABLE IF EXISTS Pessoa;

-- Tabela Base: Pessoa
CREATE TABLE Pessoa (
    id_pessoa CHAR(36) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

-- Tabela Base: PessoaFisica
CREATE TABLE PessoaFisica (
    id_pessoa_fisica CHAR(36) PRIMARY KEY,
    cpf VARCHAR(255) UNIQUE NOT NULL,
    dataNascimento DATE,
    FOREIGN KEY (id_pessoa_fisica) REFERENCES Pessoa(id_pessoa)
        ON DELETE CASCADE
);

-- Tabela Base: PessoaJuridica
CREATE TABLE PessoaJuridica (
    id_pessoa_juridica CHAR(36) PRIMARY KEY,
    cnpj VARCHAR(255) UNIQUE NOT NULL,
    razaoSocial VARCHAR(100),
    representante CHAR(36) NOT NULL,
    FOREIGN KEY (id_pessoa_juridica) REFERENCES Pessoa(id_pessoa)
        ON DELETE CASCADE,
    FOREIGN KEY (representante) REFERENCES Pessoa(id_pessoa)
);

-- Tabela Concreta: Professor
CREATE TABLE Professor (
    id_professor CHAR(36) PRIMARY KEY,
    disciplina VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES PessoaFisica(id_pessoa_fisica) ON DELETE CASCADE
);

-- Tabela Concreta: Aluno
CREATE TABLE Aluno (
    id_aluno CHAR(36) PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    curso VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES PessoaFisica(id_pessoa_fisica) ON DELETE CASCADE
);

-- Tabela Concreta: Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor CHAR(36) PRIMARY KEY,
    contatoComercial VARCHAR(50) NOT NULL,
    servicoOferecido VARCHAR(50),
    FOREIGN KEY (id_fornecedor) REFERENCES PessoaJuridica(id_pessoa_juridica) ON DELETE CASCADE
);
