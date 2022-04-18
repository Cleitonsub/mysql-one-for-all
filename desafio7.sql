SELECT art.artista, alb.album, COUNT(seg.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb
ON art.artista_id = alb.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS seg
ON alb.artista_id = seg.artista_id
GROUP BY art.artista, alb.album
ORDER BY seguidores DESC, art.artista, alb.album;
