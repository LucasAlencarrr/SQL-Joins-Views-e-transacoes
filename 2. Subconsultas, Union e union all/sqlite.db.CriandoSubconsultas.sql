SELECT nome, telefone 
FROM clientes 
WHERE ID = (
  SELECT idcliente 
  FROM pedidos 
  WHERE datahorapedido = '2023-01-02 08:15:00')


SELECT idcliente FROM pedidos WHERE strftime('%m', datahorapedido) = '01'

SELECT nome 
FROM clientes 
WHERE id in (
  SELECT idcliente 
  FROM pedidos 
  WHERE strftime('%m', datahorapedido) = '01')
  
  
  SELECT AVG(preco) FROM produtos
  
  SELECT nome, preco 
  from produtos
  GROUP BY nome, preco
  having preco > (
    SELECT AVG(preco)
    from produtos)
