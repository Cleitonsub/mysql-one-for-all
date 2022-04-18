SELECT MIN(pla.valor_plano) AS faturamento_minimo,
  MAX(pla.valor_plano) AS faturamento_maximo,
  CAST(AVG(pla.valor_plano) AS DECIMAL(3,2)) AS faturamento_medio,
  SUM(pla.valor_plano) AS faturamento_total
FROM SpotifyClone.planos AS pla
INNER JOIN SpotifyClone.usuarios AS usu
ON pla.plano_id = usu.plano_id;

-- Função CAST(), pesquisado no google, link:
-- https://www.devmedia.com.br/forum/conversao-de-string-para-float-mysql/580816
