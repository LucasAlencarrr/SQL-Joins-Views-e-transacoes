SELECT nome, rua, bairro, cidade, estado, cep from colaboradores
UNION ALL
SELECT nome, rua, bairro, cidade, estado, cep from fornecedores

SELECT * FROM colaboradores WHERE rua = 'Rua das flores - 210'

