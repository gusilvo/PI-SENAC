-- Definição de UUIDs de exemplo
SET @UUID_PESSOA_FISICA = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11';
SET @UUID_PESSOA_JURIDICA = 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22';
SET @UUID_REPRESENTANTE = 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33';

-- Criptografia SHA-256 de exemplo para CPF e CNPJ
SET @HASH_CPF = 'e5e796e6d1c81d89b033d528f8f0418c35b376288647037325997d917f374182';
SET @HASH_CNPJ = 'f5e796e6d1c81d89b033d528f8f0418c35b376288647037325997d917f374182';

-- Inserindo Pessoa Representante (Pessoa Física)
INSERT INTO Pessoa (id_pessoa, nome, endereco, telefone)
VALUES (@UUID_REPRESENTANTE, 'Representante da Empresa', 'Rua Central, 50', '5555-5555');

-- Inserindo Pessoa Física (Professor/Aluno)
INSERT INTO Pessoa (id_pessoa, nome, endereco, telefone)
VALUES (@UUID_PESSOA_FISICA, 'João Silva', 'Rua das Flores, 123', '9999-9999');
INSERT INTO PessoaFisica (id_pessoa_fisica, cpf, dataNascimento)
VALUES (@UUID_PESSOA_FISICA, @HASH_CPF, '1990-01-01'); -- Usa o hash de exemplo

-- Inserindo Pessoa Jurídica
INSERT INTO Pessoa (id_pessoa, nome, endereco, telefone)
VALUES (@UUID_PESSOA_JURIDICA, 'Empresa de Verdade Ltda', 'Rua das Palmas, 321', '1234-9999');
INSERT INTO PessoaJuridica (id_pessoa_juridica, cnpj, razaoSocial, representante)
VALUES (@UUID_PESSOA_JURIDICA, @HASH_CNPJ, 'Empresa de Verdade Ltda', @UUID_REPRESENTANTE); -- Usa o hash e o UUID do representante

-- Inserindo Fornecedor (Herda da Pessoa Jurídica)
INSERT INTO Fornecedor (id_fornecedor, contatoComercial, servicoOferecido)
VALUES (@UUID_PESSOA_JURIDICA, 'comercial@empresa.com', 'Limpeza');

-- Inserindo Professor (Herda da Pessoa Física)
INSERT INTO Professor (id_professor, disciplina)
VALUES (@UUID_PESSOA_FISICA, 'Programação Orientada a Objetos');

-- Inserindo Aluno (Herda da Pessoa Física)
SET @UUID_ALUNO = 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44';
INSERT INTO Pessoa (id_pessoa, nome, endereco, telefone)
VALUES (@UUID_ALUNO, 'Carlos Novo Aluno', 'Av. Nova, 456', '7777-7777');
SET @HASH_CPF = 'e5e796e6d1c81d89b033d528f8f0418c35b376288647037325997d917f374432';
INSERT INTO PessoaFisica (id_pessoa_fisica, cpf, dataNascimento)
VALUES (@UUID_ALUNO, @HASH_CPF, '2000-05-05'); -- CPF do aluno seria outro hash!
INSERT INTO Aluno (id_aluno, matricula, curso)
VALUES (@UUID_ALUNO, 'MATRICULA_EXEMPLO', 'Curso Genérico');



-- EXEMPLOS DE RECUPERAÇÃO (SELECT)
SELECT p.nome, pf.cpf, pr.disciplina FROM Professor pr JOIN PessoaFisica pf ON pr.id_professor = pf.id_pessoa_fisica JOIN Pessoa p ON pr.id_professor = p.id_pessoa;
SELECT p.nome, a.matricula, a.curso FROM Aluno a JOIN PessoaFisica pf ON a.id_aluno = pf.id_pessoa_fisica JOIN Pessoa p ON a.id_aluno = p.id_pessoa;
SELECT pj.razaoSocial, f.servicoOferecido FROM Fornecedor f JOIN PessoaJuridica pj ON f.id_fornecedor = pj.id_pessoa_juridica;


-- EXEMPLOS DE ATUALIZAÇÃO (UPDATE)
UPDATE Professor SET disciplina = 'Nova Disciplina X' WHERE id_professor = @UUID_PESSOA_FISICA;
UPDATE Aluno SET curso = 'Novo Curso (Transferência)' WHERE matricula = 'MATRICULA_EXEMPLO';
UPDATE PessoaJuridica SET razaoSocial = 'Nova Razão Social' WHERE id_pessoa_juridica = @UUID_PESSOA_JURIDICA;

-- EXEMPLOS DE EXCLUSÃO (DELETE)
DELETE FROM Professor WHERE id_professor = @UUID_PESSOA_FISICA;
DELETE FROM Aluno WHERE matricula = 'MATRICULA_EXEMPLO';
DELETE FROM Fornecedor WHERE id_fornecedor = @UUID_PESSOA_JURIDICA;