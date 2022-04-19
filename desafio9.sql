SELECT COUNT(his.usuario_id)
FROM SpotifyClone.historico_reps AS his
INNER JOIN SpotifyClone.usuarios AS usu
ON his.usuario_id = usu.usuario_id
WHERE usu.usuario = 'Bill';
