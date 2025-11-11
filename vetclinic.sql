CREATE DATABASE VETCLINIC;

CREATE TABLE Tutor (
    id_tutor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(200),
    email VARCHAR(100)
);

CREATE TABLE Animal (
    id_animal SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    sexo CHAR(1),
    id_tutor INT,
    FOREIGN KEY (id_tutor) REFERENCES Tutor(id_tutor)
);

CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    tipo_acesso VARCHAR(20) NOT NULL CHECK (tipo_acesso IN ('veterinario', 'assistente', 'administrador'))
);

CREATE TABLE Consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_animal INT,
    data_hora TIMESTAMP NOT NULL,
    observacoes TEXT,
    id_veterinario INT,
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
    FOREIGN KEY (id_veterinario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Vacina (
    id_vacina SERIAL PRIMARY KEY,
    tipo_vacina VARCHAR(100),
    data_aplicacao DATE,
    id_animal INT,
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
);

INSERT INTO Tutor (nome, telefone, endereco, email) VALUES 
('Vitor Costa', '48988090098', 'Rua A, 666', 'Vitor_c@email.com'),
('João Gentil', '48976894093', 'Rua B, 696', 'joao_g@email.com'),
('Eric Vistochi', '4892038419', 'Rua C, 423', 'Eric_v@email.com');

INSERT INTO Animal (nome, especie, raca, idade, sexo, id_tutor) VALUES
('Cadu', 'Cachorro', 'Salsicha', 1, 'M', 1),
('Fred', 'Cachorro', 'yorkshine', 3, 'M', 2),
('Kia', 'Gato', 'Branca', 3, 'F', 3);

INSERT INTO Usuario (nome_usuario, senha, tipo_acesso) VALUES
('veterinario1', 'senha_hash_1', 'veterinario'),
('assistente1', 'senha_hash_2', 'assistente'),
('admin1', 'senha_hash_3', 'administrador');