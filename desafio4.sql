SELECT DISTINCT usu.usuario,
  IF(YEAR(his.data_rep) >= 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.usuarios AS usu
LEFT JOIN SpotifyClone.historico_reps AS his
ON usu.usuario_id = his.usuario_id
AND YEAR(his.data_rep) >= 2021
ORDER BY usu.usuario;