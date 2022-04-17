SELECT usu.usuario, COUNT(his.usuario_id) AS qtde_musicas_ouvidas,
ROUND(SUM(can.duracao_seg) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS usu
INNER JOIN SpotifyClone.historico_reps AS his
ON usu.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.cancoes AS can
ON his.cancao_id = can.cancao_id
GROUP BY usu.usuario;