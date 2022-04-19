SELECT COUNT(his.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reps AS his
INNER JOIN SpotifyClone.usuarios AS usu
ON his.usuario_id = usu.usuario_id
WHERE usu.usuario = 'Bill';
