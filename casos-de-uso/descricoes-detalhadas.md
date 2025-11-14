# Cenários de Caso de Uso

## Cadastro de Pessoa Física

### Atores

-   Secretária 

### Objetivo
Cadastrar pessoas físicas no sistema com CPF válido e dados completos.

### Fluxo Principal (Cenário Principal)

1.  A secretária acessa a funcionalidade "Cadastrar Pessoa Física".
2.  O sistema exibe o formulário de cadastro.
3.  A secretária preenche os dados pessoais (nome, endereço, CPF, etc.).
4.  O sistema realiza a validação do CPF (<include>).
5.  Se o CPF for válido, o sistema verifica se já existe uma pessoa
    cadastrada com esse CPF.
6.  Se não existir, o sistema realiza o salvamento dos dados (`<include>`).
7.  O sistema exibe uma mensagem de sucesso e retorna à tela inicial de
    cadastro.
    
### Cenário Alternativo 1 --- CPF inválido

-   4a. O CPF informado é inválido (formato incorreto ou dígito verificador errado).
-   4b. O sistema exibe mensagem de erro: "CPF inválido. Verifique e tente novamente."
-   O fluxo retorna ao passo 3.

### Cenário Alternativo 2 --- CPF já cadastrado

-   Passo 5a: O CPF já está presente no banco de dados.
-   Passo 5b: O sistema exibe a mensagem: "CPF já cadastrado no sistema."
-   O sistema sugere edição ou visualização do cadastro existente.
-   O fluxo termina sem novo cadastro.

### Pré-condições
-   A secretária está autenticada no sistema.
-   A conexão com o banco de dados está ativa.

### Pós-condições
-   Uma nova Pessoa Física foi cadastrada com sucesso.
-   Os dados estão armazenados no banco e disponíveis para outras funcionalidades.

## Cadastro de Pessoa Jurídica

### Atores

-   Fornecedor 

### Objetivo
Realizar cadastro de fornecedor no sistema com CNPJ válido e dados completos.

### Fluxo Principal

1.   O fornecedor acessa a funcionalidade "Cadastrar Pessoa Jurídica".
2.   O sistema exibe o formulário de cadastro.
3.   O fornecedor preenche os dados pessoais (razão social, endereço, CPNJ, etc.).
4.   O sistema realiza a validação do CPNJ (<<include>>).
5.   Se o CNPJ for válido, o sistema verifica se já existe uma empresa.
6.   Se não existir, o sistema realiza o salvamento dos dados (<<include>>).
7.   O sistema exibe uma mensagem de sucesso e retorna à tela inicial de cadastro.

### Cenário Alternativo 1 --- CNPJ inválido

-   Passo 4a: O CNPJ informado é inválido (formato incorreto ou dígito verificador errado).
-   Passo 4b: O sistema exibe mensagem de erro: "CNPJ inválido. Verifique e tente novamente."
-   O fluxo volta para o passo 3.

### Cenário Alternativo 2 --- CNPJ já cadastrado
-   Passo 5a: O CNPJ já está presente no banco de dados.
-   Passo 5b: O sistema exibe a mensagem: "CNPJ já cadastrado no sistema."
-   O sistema sugere edição ou visualização do cadastro existente.
-   O fluxo termina sem novo cadastro.

### Pré-condições
-   O segurança não deve ter um cadastro pré-existente no sistema.
-   O sistema deve estar online e funcional.

### Pós-condições
-   Uma nova entrada para a Pessoa Jurídica é criada no banco de dados.
-   A Pessoa Jurídica pode fazer login no sistema e acessar as funcionalidades ao seu perfil.
-   O e-mail de confirmação é enviado.

## Cadastro de Professores

### Atores

-   Secretário 

### Objetivo
Cadastrar professor no sistema com CPF válido e dados completos. 

### Fluxo Principal

1.  A secretária acessa a funcionalidade "Cadastrar Professor".
2.  O sistema exibe o formulário de cadastro.
3.  O secretário preenche os dados pessoais (nome, endereço, CPF, etc.).
4.  O secretário seleciona a disciplina.
5.  O sistema realiza a validação dos dados (<<include>>).
6.  Se o CPF for válido, o sistema verifica se já existe uma pessoa cadastrada com esse CPF.
7.  Se a disciplina for válida, o sistema verifica se já existe um professor cadastro na disciplina.
8.  Se não existir, o sistema realiza o salvamento dos dados (<<include>>).
9.  O sistema exibe uma mensagem de sucesso e retorna à tela inicial de cadastro.

### Cenário Alternativo 1 --- CPF inválido

-   Passo 4a: O CPF informado é inválido (formato incorreto ou dígito verificador errado).
-   Passo 4b: O sistema exibe mensagem de erro: "CPF inválido. Verifique e tente novamente."
-   O fluxo volta para o passo 3.

### Cenário Alternativo 2 --- Professor já cadastrado
-   Passo 5a: Já existe um professor vinculado a disciplina.
-   Passo 5b: O sistema exibe a mensagem: "A disciplina já possui um professor vinculado".
-   O sistema sugere edição ou visualização do cadastro existente.
-   O fluxo termina sem novo cadastro, ou com a deleção do outro e a inclusão do novo.

### Pré-condições
-   Todo o sistema está ativo e acessível.
-   O Secretário está cadastrado.

### Pós-condições
-   Um novo Professor foi cadastrado com sucesso e vinculado a uma disciplina.
-   O professor consegue acessar funcionalidades exclusivas da função.

## Cadastro de Fornecedores

### Atores

-   Gestor de Compras 

### Objetivo 
Cadastrar um fornecedor no sistema com CPF válido e dados completos.

### Fluxo Principal

1.   O gestor de compras acessa a funcionalidade "Cadastrar Fornecedor".
2.   O sistema exibe o formulário de cadastro.
3.   O gestor de compras preenche os dados do fornecedor (razão social, CNPJ, etc.).
4.   O sistema realiza a validação do CNPJ (<<include>>).
5.   Se o CNPJ for válido, o sistema verifica se já existe um fornecedor cadastrado com esse CNPJ.
6.   Se não existir, o sistema realiza o salvamento dos dados (<<include>>).
7.   O sistema exibe uma mensagem de sucesso e retorna à tela inicial de cadastro.

### Alternativo 1 --- CNPJ inválido

-   Passo 4a: O CNPJ informado é inválido (formato incorreto ou dígito verificador errado).
-   Passo 4b: O sistema exibe mensagem de erro: "CPF inválido. Verifique e tente novamente."
-   O fluxo volta para o passo 3.

### Alternativo 2 --- Fornecedor já cadastrado
-   Passo 5a: O CNPJ já está presente no banco de dados.
-   Passo 5b: O sistema exibe a mensagem: "Fornecedor já cadastrado no sistema."
-   O sistema sugere edição ou visualização do cadastro existente.
-   O fluxo termina sem novo cadastro, ou com a deleção do outro e a inclusão do novo.

### Pré-condições
-   O gestor de compras está autenticado no sistema.
-   A conexão com o banco de dados está ativa.

### Pós-condições
-   Um novo Fornecedor foi cadastrado com sucesso.
-   Os dados estão armazenados no banco e disponíveis para outras funcionalidades.

## Cadastro de Alunos

### Atores

-   Aluno 

### Objetivo 
Permitir que o aluno realize seu cadastro inicial no sistema universitário.

### Fluxo Principal

1.   O aluno acessa o portal e seleciona a opção “Criar Conta / Cadastrar Aluno”.
2.   O aluno preenche os campos obrigatórios (nome, CPF, data de nascimento, curso desejado, e-mail, senha).
3.   O sistema valida os dados fornecidos (<<include>>).
4.   Se o CPF for válido, o sistema verifica se já existe um aluno cadastrado com esse CPF.
5.   Se não existir, o sistema realiza o salvamento de dados (<<include>>).
6.   O sistema gera um número de matrícula e confirma o cadastro. 

### Alternativo 1 --- CPF inválido

-   Passo 4a: O CPF informado é inválido (formato incorreto ou dígito verificador errado).
-   Passo 4b: O sistema exibe mensagem de erro: "CPF inválido. Verifique e tente novamente."
-   O fluxo volta para o passo 3.

### Alternativo 2 --- Já cadastrado
-   Passo 4a: Já existe um aluno vinculado à instituição.
-   Passo 4b: O sistema exibe a mensagem: "Este aluno já possui cadastro no sistema.”
-   O sistema sugere um direcionamento para a página de Recuperação de Conta.

### Pré-condições
-   O aluno deve ter acesso ao portal da universidade.
-   O aluno deve possuir documentos obrigatórios (CPF, RG, e-mail válido etc.).

### Pós-condições
-   O aluno passa a estar cadastrado no sistema e pode realizar login com as credenciais criadas.
