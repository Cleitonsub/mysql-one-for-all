SELECT DISTINCT can.cancao, COUNT(his.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_reps AS his
ON can.cancao_id = his.cancao_id
GROUP BY can.cancao
HAVING reproducoes >= 2
LIMIT 2;