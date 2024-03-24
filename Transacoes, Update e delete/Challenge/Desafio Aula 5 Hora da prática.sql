--1

SELECT * 
FROM clientes 
WHERE nome = 'Maria Silva'

--2
SELECT id, idcliente 
FROM pedidos
WHERE status = 'Entregue'


--3
SELECT * 
FROM produtos
WHERE preco > 10 and preco < 15

--4
SELECT nome, cargo 
FROM colaboradores
WHERE datacontratacao BETWEEN '2022-01-01' AND '2022-06-31';


--5
SELECT nome
FROM clientes
WHERE id = (
SELECT idcliente
                FROM pedidos
            ORDER BY datahorapedido asc
               LIMIT 1);

--6
SELECT nome
FROM produtos
WHERE id NOT IN (
SELECT idProduto
            FROM ItensPedido);

--7
SELECT c.nome
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id = p.idCliente
WHERE p.datahorapedido 
BETWEEN '2023-01-01' AND '2023-01-31';

--8
SELECT p.nome
FROM produtos AS p
INNER JOIN itensPedido AS ip 
ON p.id = IP.idProduto
GROUP BY p.nome
HAVING COUNT(ip.idPedido) < 15;

--9
SELECT p.nome, ip.idpedido
FROM produtos AS p
INNER JOIN itensPedido AS ip ON P.id = IP.idProduto
INNER JOIN pedidos AS pd ON ip.idPedido = pd.id
INNER JOIN clientes AS c ON pd.idCliente = C.id
WHERE c.nome IN ('Pedro Alves', 'Ana Rodrigues');

--10
SELECT p.idCliente, c.nome, SUM(ip.quantidade * ip.precounitario) as Valortotal 
FROM clientes c 
INNER JOIN pedidos p ON c.id = p.idcliente 
INNER JOIN itensPedido ip ON p.id = ip.idpedido 
GROUP BY p.idCliente 
ORDER BY Valortotal DESC 
LIMIT 1;
