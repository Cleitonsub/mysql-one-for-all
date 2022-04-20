SELECT can.cancao AS nome, COUNT(usu.plano_id) AS reproducoes
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_reps AS his
ON can.cancao_id = his.cancao_id
INNER JOIN SpotifyClone.usuarios AS usu
ON usu.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.planos AS pla
ON pla.plano_id = usu.plano_id
WHERE usu.plano_id = 1
OR usu.plano_id = 4
GROUP BY can.cancao
ORDER BY can.cancao;
